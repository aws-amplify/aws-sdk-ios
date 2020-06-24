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

#import "AWSCodecommitService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSCodecommitResources.h"

static NSString *const AWSInfoCodecommit = @"Codecommit";
NSString *const AWSCodecommitSDKVersion = @"2.13.5";


@interface AWSCodecommitResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSCodecommitResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ActorDoesNotExistException" : @(AWSCodecommitErrorActorDoesNotExist),
                            @"ApprovalRuleContentRequiredException" : @(AWSCodecommitErrorApprovalRuleContentRequired),
                            @"ApprovalRuleDoesNotExistException" : @(AWSCodecommitErrorApprovalRuleDoesNotExist),
                            @"ApprovalRuleNameAlreadyExistsException" : @(AWSCodecommitErrorApprovalRuleNameAlreadyExists),
                            @"ApprovalRuleNameRequiredException" : @(AWSCodecommitErrorApprovalRuleNameRequired),
                            @"ApprovalRuleTemplateContentRequiredException" : @(AWSCodecommitErrorApprovalRuleTemplateContentRequired),
                            @"ApprovalRuleTemplateDoesNotExistException" : @(AWSCodecommitErrorApprovalRuleTemplateDoesNotExist),
                            @"ApprovalRuleTemplateInUseException" : @(AWSCodecommitErrorApprovalRuleTemplateInUse),
                            @"ApprovalRuleTemplateNameAlreadyExistsException" : @(AWSCodecommitErrorApprovalRuleTemplateNameAlreadyExists),
                            @"ApprovalRuleTemplateNameRequiredException" : @(AWSCodecommitErrorApprovalRuleTemplateNameRequired),
                            @"ApprovalStateRequiredException" : @(AWSCodecommitErrorApprovalStateRequired),
                            @"AuthorDoesNotExistException" : @(AWSCodecommitErrorAuthorDoesNotExist),
                            @"BeforeCommitIdAndAfterCommitIdAreSameException" : @(AWSCodecommitErrorBeforeCommitIdAndAfterCommitIdAreSame),
                            @"BlobIdDoesNotExistException" : @(AWSCodecommitErrorBlobIdDoesNotExist),
                            @"BlobIdRequiredException" : @(AWSCodecommitErrorBlobIdRequired),
                            @"BranchDoesNotExistException" : @(AWSCodecommitErrorBranchDoesNotExist),
                            @"BranchNameExistsException" : @(AWSCodecommitErrorBranchNameExists),
                            @"BranchNameIsTagNameException" : @(AWSCodecommitErrorBranchNameIsTagName),
                            @"BranchNameRequiredException" : @(AWSCodecommitErrorBranchNameRequired),
                            @"CannotDeleteApprovalRuleFromTemplateException" : @(AWSCodecommitErrorCannotDeleteApprovalRuleFromTemplate),
                            @"CannotModifyApprovalRuleFromTemplateException" : @(AWSCodecommitErrorCannotModifyApprovalRuleFromTemplate),
                            @"ClientRequestTokenRequiredException" : @(AWSCodecommitErrorClientRequestTokenRequired),
                            @"CommentContentRequiredException" : @(AWSCodecommitErrorCommentContentRequired),
                            @"CommentContentSizeLimitExceededException" : @(AWSCodecommitErrorCommentContentSizeLimitExceeded),
                            @"CommentDeletedException" : @(AWSCodecommitErrorCommentDeleted),
                            @"CommentDoesNotExistException" : @(AWSCodecommitErrorCommentDoesNotExist),
                            @"CommentIdRequiredException" : @(AWSCodecommitErrorCommentIdRequired),
                            @"CommentNotCreatedByCallerException" : @(AWSCodecommitErrorCommentNotCreatedByCaller),
                            @"CommitDoesNotExistException" : @(AWSCodecommitErrorCommitDoesNotExist),
                            @"CommitIdDoesNotExistException" : @(AWSCodecommitErrorCommitIdDoesNotExist),
                            @"CommitIdRequiredException" : @(AWSCodecommitErrorCommitIdRequired),
                            @"CommitIdsLimitExceededException" : @(AWSCodecommitErrorCommitIdsLimitExceeded),
                            @"CommitIdsListRequiredException" : @(AWSCodecommitErrorCommitIdsListRequired),
                            @"CommitMessageLengthExceededException" : @(AWSCodecommitErrorCommitMessageLengthExceeded),
                            @"CommitRequiredException" : @(AWSCodecommitErrorCommitRequired),
                            @"ConcurrentReferenceUpdateException" : @(AWSCodecommitErrorConcurrentReferenceUpdate),
                            @"DefaultBranchCannotBeDeletedException" : @(AWSCodecommitErrorDefaultBranchCannotBeDeleted),
                            @"DirectoryNameConflictsWithFileNameException" : @(AWSCodecommitErrorDirectoryNameConflictsWithFileName),
                            @"EncryptionIntegrityChecksFailedException" : @(AWSCodecommitErrorEncryptionIntegrityChecksFailed),
                            @"EncryptionKeyAccessDeniedException" : @(AWSCodecommitErrorEncryptionKeyAccessDenied),
                            @"EncryptionKeyDisabledException" : @(AWSCodecommitErrorEncryptionKeyDisabled),
                            @"EncryptionKeyNotFoundException" : @(AWSCodecommitErrorEncryptionKeyNotFound),
                            @"EncryptionKeyUnavailableException" : @(AWSCodecommitErrorEncryptionKeyUnavailable),
                            @"FileContentAndSourceFileSpecifiedException" : @(AWSCodecommitErrorFileContentAndSourceFileSpecified),
                            @"FileContentRequiredException" : @(AWSCodecommitErrorFileContentRequired),
                            @"FileContentSizeLimitExceededException" : @(AWSCodecommitErrorFileContentSizeLimitExceeded),
                            @"FileDoesNotExistException" : @(AWSCodecommitErrorFileDoesNotExist),
                            @"FileEntryRequiredException" : @(AWSCodecommitErrorFileEntryRequired),
                            @"FileModeRequiredException" : @(AWSCodecommitErrorFileModeRequired),
                            @"FileNameConflictsWithDirectoryNameException" : @(AWSCodecommitErrorFileNameConflictsWithDirectoryName),
                            @"FilePathConflictsWithSubmodulePathException" : @(AWSCodecommitErrorFilePathConflictsWithSubmodulePath),
                            @"FileTooLargeException" : @(AWSCodecommitErrorFileTooLarge),
                            @"FolderContentSizeLimitExceededException" : @(AWSCodecommitErrorFolderContentSizeLimitExceeded),
                            @"FolderDoesNotExistException" : @(AWSCodecommitErrorFolderDoesNotExist),
                            @"IdempotencyParameterMismatchException" : @(AWSCodecommitErrorIdempotencyParameterMismatch),
                            @"InvalidActorArnException" : @(AWSCodecommitErrorInvalidActorArn),
                            @"InvalidApprovalRuleContentException" : @(AWSCodecommitErrorInvalidApprovalRuleContent),
                            @"InvalidApprovalRuleNameException" : @(AWSCodecommitErrorInvalidApprovalRuleName),
                            @"InvalidApprovalRuleTemplateContentException" : @(AWSCodecommitErrorInvalidApprovalRuleTemplateContent),
                            @"InvalidApprovalRuleTemplateDescriptionException" : @(AWSCodecommitErrorInvalidApprovalRuleTemplateDescription),
                            @"InvalidApprovalRuleTemplateNameException" : @(AWSCodecommitErrorInvalidApprovalRuleTemplateName),
                            @"InvalidApprovalStateException" : @(AWSCodecommitErrorInvalidApprovalState),
                            @"InvalidAuthorArnException" : @(AWSCodecommitErrorInvalidAuthorArn),
                            @"InvalidBlobIdException" : @(AWSCodecommitErrorInvalidBlobId),
                            @"InvalidBranchNameException" : @(AWSCodecommitErrorInvalidBranchName),
                            @"InvalidClientRequestTokenException" : @(AWSCodecommitErrorInvalidClientRequestToken),
                            @"InvalidCommentIdException" : @(AWSCodecommitErrorInvalidCommentId),
                            @"InvalidCommitException" : @(AWSCodecommitErrorInvalidCommit),
                            @"InvalidCommitIdException" : @(AWSCodecommitErrorInvalidCommitId),
                            @"InvalidConflictDetailLevelException" : @(AWSCodecommitErrorInvalidConflictDetailLevel),
                            @"InvalidConflictResolutionException" : @(AWSCodecommitErrorInvalidConflictResolution),
                            @"InvalidConflictResolutionStrategyException" : @(AWSCodecommitErrorInvalidConflictResolutionStrategy),
                            @"InvalidContinuationTokenException" : @(AWSCodecommitErrorInvalidContinuationToken),
                            @"InvalidDeletionParameterException" : @(AWSCodecommitErrorInvalidDeletionParameter),
                            @"InvalidDescriptionException" : @(AWSCodecommitErrorInvalidDescription),
                            @"InvalidDestinationCommitSpecifierException" : @(AWSCodecommitErrorInvalidDestinationCommitSpecifier),
                            @"InvalidEmailException" : @(AWSCodecommitErrorInvalidEmail),
                            @"InvalidFileLocationException" : @(AWSCodecommitErrorInvalidFileLocation),
                            @"InvalidFileModeException" : @(AWSCodecommitErrorInvalidFileMode),
                            @"InvalidFilePositionException" : @(AWSCodecommitErrorInvalidFilePosition),
                            @"InvalidMaxConflictFilesException" : @(AWSCodecommitErrorInvalidMaxConflictFiles),
                            @"InvalidMaxMergeHunksException" : @(AWSCodecommitErrorInvalidMaxMergeHunks),
                            @"InvalidMaxResultsException" : @(AWSCodecommitErrorInvalidMaxResults),
                            @"InvalidMergeOptionException" : @(AWSCodecommitErrorInvalidMergeOption),
                            @"InvalidOrderException" : @(AWSCodecommitErrorInvalidOrder),
                            @"InvalidOverrideStatusException" : @(AWSCodecommitErrorInvalidOverrideStatus),
                            @"InvalidParentCommitIdException" : @(AWSCodecommitErrorInvalidParentCommitId),
                            @"InvalidPathException" : @(AWSCodecommitErrorInvalidPath),
                            @"InvalidPullRequestEventTypeException" : @(AWSCodecommitErrorInvalidPullRequestEventType),
                            @"InvalidPullRequestIdException" : @(AWSCodecommitErrorInvalidPullRequestId),
                            @"InvalidPullRequestStatusException" : @(AWSCodecommitErrorInvalidPullRequestStatus),
                            @"InvalidPullRequestStatusUpdateException" : @(AWSCodecommitErrorInvalidPullRequestStatusUpdate),
                            @"InvalidReactionUserArnException" : @(AWSCodecommitErrorInvalidReactionUserArn),
                            @"InvalidReactionValueException" : @(AWSCodecommitErrorInvalidReactionValue),
                            @"InvalidReferenceNameException" : @(AWSCodecommitErrorInvalidReferenceName),
                            @"InvalidRelativeFileVersionEnumException" : @(AWSCodecommitErrorInvalidRelativeFileVersionEnum),
                            @"InvalidReplacementContentException" : @(AWSCodecommitErrorInvalidReplacementContent),
                            @"InvalidReplacementTypeException" : @(AWSCodecommitErrorInvalidReplacementType),
                            @"InvalidRepositoryDescriptionException" : @(AWSCodecommitErrorInvalidRepositoryDescription),
                            @"InvalidRepositoryNameException" : @(AWSCodecommitErrorInvalidRepositoryName),
                            @"InvalidRepositoryTriggerBranchNameException" : @(AWSCodecommitErrorInvalidRepositoryTriggerBranchName),
                            @"InvalidRepositoryTriggerCustomDataException" : @(AWSCodecommitErrorInvalidRepositoryTriggerCustomData),
                            @"InvalidRepositoryTriggerDestinationArnException" : @(AWSCodecommitErrorInvalidRepositoryTriggerDestinationArn),
                            @"InvalidRepositoryTriggerEventsException" : @(AWSCodecommitErrorInvalidRepositoryTriggerEvents),
                            @"InvalidRepositoryTriggerNameException" : @(AWSCodecommitErrorInvalidRepositoryTriggerName),
                            @"InvalidRepositoryTriggerRegionException" : @(AWSCodecommitErrorInvalidRepositoryTriggerRegion),
                            @"InvalidResourceArnException" : @(AWSCodecommitErrorInvalidResourceArn),
                            @"InvalidRevisionIdException" : @(AWSCodecommitErrorInvalidRevisionId),
                            @"InvalidRuleContentSha256Exception" : @(AWSCodecommitErrorInvalidRuleContentSha256),
                            @"InvalidSortByException" : @(AWSCodecommitErrorInvalidSortBy),
                            @"InvalidSourceCommitSpecifierException" : @(AWSCodecommitErrorInvalidSourceCommitSpecifier),
                            @"InvalidSystemTagUsageException" : @(AWSCodecommitErrorInvalidSystemTagUsage),
                            @"InvalidTagKeysListException" : @(AWSCodecommitErrorInvalidTagKeysList),
                            @"InvalidTagsMapException" : @(AWSCodecommitErrorInvalidTagsMap),
                            @"InvalidTargetException" : @(AWSCodecommitErrorInvalidTarget),
                            @"InvalidTargetBranchException" : @(AWSCodecommitErrorInvalidTargetBranch),
                            @"InvalidTargetsException" : @(AWSCodecommitErrorInvalidTargets),
                            @"InvalidTitleException" : @(AWSCodecommitErrorInvalidTitle),
                            @"ManualMergeRequiredException" : @(AWSCodecommitErrorManualMergeRequired),
                            @"MaximumBranchesExceededException" : @(AWSCodecommitErrorMaximumBranchesExceeded),
                            @"MaximumConflictResolutionEntriesExceededException" : @(AWSCodecommitErrorMaximumConflictResolutionEntriesExceeded),
                            @"MaximumFileContentToLoadExceededException" : @(AWSCodecommitErrorMaximumFileContentToLoadExceeded),
                            @"MaximumFileEntriesExceededException" : @(AWSCodecommitErrorMaximumFileEntriesExceeded),
                            @"MaximumItemsToCompareExceededException" : @(AWSCodecommitErrorMaximumItemsToCompareExceeded),
                            @"MaximumNumberOfApprovalsExceededException" : @(AWSCodecommitErrorMaximumNumberOfApprovalsExceeded),
                            @"MaximumOpenPullRequestsExceededException" : @(AWSCodecommitErrorMaximumOpenPullRequestsExceeded),
                            @"MaximumRepositoryNamesExceededException" : @(AWSCodecommitErrorMaximumRepositoryNamesExceeded),
                            @"MaximumRepositoryTriggersExceededException" : @(AWSCodecommitErrorMaximumRepositoryTriggersExceeded),
                            @"MaximumRuleTemplatesAssociatedWithRepositoryException" : @(AWSCodecommitErrorMaximumRuleTemplatesAssociatedWithRepository),
                            @"MergeOptionRequiredException" : @(AWSCodecommitErrorMergeOptionRequired),
                            @"MultipleConflictResolutionEntriesException" : @(AWSCodecommitErrorMultipleConflictResolutionEntries),
                            @"MultipleRepositoriesInPullRequestException" : @(AWSCodecommitErrorMultipleRepositoriesInPullRequest),
                            @"NameLengthExceededException" : @(AWSCodecommitErrorNameLengthExceeded),
                            @"NoChangeException" : @(AWSCodecommitErrorNoChange),
                            @"NumberOfRuleTemplatesExceededException" : @(AWSCodecommitErrorNumberOfRuleTemplatesExceeded),
                            @"NumberOfRulesExceededException" : @(AWSCodecommitErrorNumberOfRulesExceeded),
                            @"OverrideAlreadySetException" : @(AWSCodecommitErrorOverrideAlreadySet),
                            @"OverrideStatusRequiredException" : @(AWSCodecommitErrorOverrideStatusRequired),
                            @"ParentCommitDoesNotExistException" : @(AWSCodecommitErrorParentCommitDoesNotExist),
                            @"ParentCommitIdOutdatedException" : @(AWSCodecommitErrorParentCommitIdOutdated),
                            @"ParentCommitIdRequiredException" : @(AWSCodecommitErrorParentCommitIdRequired),
                            @"PathDoesNotExistException" : @(AWSCodecommitErrorPathDoesNotExist),
                            @"PathRequiredException" : @(AWSCodecommitErrorPathRequired),
                            @"PullRequestAlreadyClosedException" : @(AWSCodecommitErrorPullRequestAlreadyClosed),
                            @"PullRequestApprovalRulesNotSatisfiedException" : @(AWSCodecommitErrorPullRequestApprovalRulesNotSatisfied),
                            @"PullRequestCannotBeApprovedByAuthorException" : @(AWSCodecommitErrorPullRequestCannotBeApprovedByAuthor),
                            @"PullRequestDoesNotExistException" : @(AWSCodecommitErrorPullRequestDoesNotExist),
                            @"PullRequestIdRequiredException" : @(AWSCodecommitErrorPullRequestIdRequired),
                            @"PullRequestStatusRequiredException" : @(AWSCodecommitErrorPullRequestStatusRequired),
                            @"PutFileEntryConflictException" : @(AWSCodecommitErrorPutFileEntryConflict),
                            @"ReactionLimitExceededException" : @(AWSCodecommitErrorReactionLimitExceeded),
                            @"ReactionValueRequiredException" : @(AWSCodecommitErrorReactionValueRequired),
                            @"ReferenceDoesNotExistException" : @(AWSCodecommitErrorReferenceDoesNotExist),
                            @"ReferenceNameRequiredException" : @(AWSCodecommitErrorReferenceNameRequired),
                            @"ReferenceTypeNotSupportedException" : @(AWSCodecommitErrorReferenceTypeNotSupported),
                            @"ReplacementContentRequiredException" : @(AWSCodecommitErrorReplacementContentRequired),
                            @"ReplacementTypeRequiredException" : @(AWSCodecommitErrorReplacementTypeRequired),
                            @"RepositoryDoesNotExistException" : @(AWSCodecommitErrorRepositoryDoesNotExist),
                            @"RepositoryLimitExceededException" : @(AWSCodecommitErrorRepositoryLimitExceeded),
                            @"RepositoryNameExistsException" : @(AWSCodecommitErrorRepositoryNameExists),
                            @"RepositoryNameRequiredException" : @(AWSCodecommitErrorRepositoryNameRequired),
                            @"RepositoryNamesRequiredException" : @(AWSCodecommitErrorRepositoryNamesRequired),
                            @"RepositoryNotAssociatedWithPullRequestException" : @(AWSCodecommitErrorRepositoryNotAssociatedWithPullRequest),
                            @"RepositoryTriggerBranchNameListRequiredException" : @(AWSCodecommitErrorRepositoryTriggerBranchNameListRequired),
                            @"RepositoryTriggerDestinationArnRequiredException" : @(AWSCodecommitErrorRepositoryTriggerDestinationArnRequired),
                            @"RepositoryTriggerEventsListRequiredException" : @(AWSCodecommitErrorRepositoryTriggerEventsListRequired),
                            @"RepositoryTriggerNameRequiredException" : @(AWSCodecommitErrorRepositoryTriggerNameRequired),
                            @"RepositoryTriggersListRequiredException" : @(AWSCodecommitErrorRepositoryTriggersListRequired),
                            @"ResourceArnRequiredException" : @(AWSCodecommitErrorResourceArnRequired),
                            @"RestrictedSourceFileException" : @(AWSCodecommitErrorRestrictedSourceFile),
                            @"RevisionIdRequiredException" : @(AWSCodecommitErrorRevisionIdRequired),
                            @"RevisionNotCurrentException" : @(AWSCodecommitErrorRevisionNotCurrent),
                            @"SameFileContentException" : @(AWSCodecommitErrorSameFileContent),
                            @"SamePathRequestException" : @(AWSCodecommitErrorSamePathRequest),
                            @"SourceAndDestinationAreSameException" : @(AWSCodecommitErrorSourceAndDestinationAreSame),
                            @"SourceFileOrContentRequiredException" : @(AWSCodecommitErrorSourceFileOrContentRequired),
                            @"TagKeysListRequiredException" : @(AWSCodecommitErrorTagKeysListRequired),
                            @"TagPolicyException" : @(AWSCodecommitErrorTagPolicy),
                            @"TagsMapRequiredException" : @(AWSCodecommitErrorTagsMapRequired),
                            @"TargetRequiredException" : @(AWSCodecommitErrorTargetRequired),
                            @"TargetsRequiredException" : @(AWSCodecommitErrorTargetsRequired),
                            @"TipOfSourceReferenceIsDifferentException" : @(AWSCodecommitErrorTipOfSourceReferenceIsDifferent),
                            @"TipsDivergenceExceededException" : @(AWSCodecommitErrorTipsDivergenceExceeded),
                            @"TitleRequiredException" : @(AWSCodecommitErrorTitleRequired),
                            @"TooManyTagsException" : @(AWSCodecommitErrorTooManyTags),
                            };
}

#pragma mark -

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response
                originalRequest:(NSURLRequest *)originalRequest
                 currentRequest:(NSURLRequest *)currentRequest
                           data:(id)data
                          error:(NSError *__autoreleasing *)error {
    id responseObject = [super responseObjectForResponse:response
                                         originalRequest:originalRequest
                                          currentRequest:currentRequest
                                                    data:data
                                                   error:error];
    if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
    	if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
	        if ([errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSCodecommitErrorDomain
	                                             code:[[errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]] integerValue]
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        } else if ([[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSCognitoIdentityErrorDomain
	                                             code:AWSCognitoIdentityErrorUnknown
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        }
    	}
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSCodecommitErrorDomain
                                     code:AWSCodecommitErrorUnknown
                                 userInfo:nil];
    }

    if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
        if (self.outputClass) {
            responseObject = [AWSMTLJSONAdapter modelOfClass:self.outputClass
                                          fromJSONDictionary:responseObject
                                                       error:error];
        }
    }
	
    return responseObject;
}

@end

@interface AWSCodecommitRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCodecommitRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSCodecommit()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSCodecommit

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSCodecommitSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSCodecommit versions need to match. Check your SDK installation. AWSCore: %@ AWSCodecommit: %@", AWSiOSSDKVersion, AWSCodecommitSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultCodecommit {
    static AWSCodecommit *_defaultCodecommit = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoCodecommit];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `awsconfiguration.json`, `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }
        _defaultCodecommit = [[AWSCodecommit alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultCodecommit;
}

+ (void)registerCodecommitWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSCodecommit alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)CodecommitForKey:(NSString *)key {
    @synchronized(self) {
        AWSCodecommit *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoCodecommit
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSCodecommit registerCodecommitWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeCodecommitForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCodecommit` or `+ CodecommitForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceCodecommit
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceCodecommit];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSCodecommitRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/x-amz-json-1.1"}; 
		
        _networking = [[AWSNetworking alloc] initWithConfiguration:_configuration];
    }
    
    return self;
}

- (AWSTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AWSHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    
    @autoreleasepool {
        if (!request) {
            request = [AWSRequest new];
        }

        AWSNetworkingRequest *networkingRequest = request.internalRequest;
        if (request) {
            networkingRequest.parameters = [[AWSMTLJSONAdapter JSONDictionaryFromModel:request] aws_removeNullValues];
        } else {
            networkingRequest.parameters = @{};
        }

		NSMutableDictionary *headers = [NSMutableDictionary new];
        headers[@"X-Amz-Target"] = [NSString stringWithFormat:@"%@.%@", targetPrefix, operationName];
        networkingRequest.headers = headers;
        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSCodecommitResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSCodecommitResponseSerializer alloc] initWithJSONDefinition:[[AWSCodecommitResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)associateApprovalRuleTemplateWithRepository:(AWSCodecommitAssociateApprovalRuleTemplateWithRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"AssociateApprovalRuleTemplateWithRepository"
                   outputClass:nil];
}

- (void)associateApprovalRuleTemplateWithRepository:(AWSCodecommitAssociateApprovalRuleTemplateWithRepositoryInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateApprovalRuleTemplateWithRepository:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput *> *)batchAssociateApprovalRuleTemplateWithRepositories:(AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"BatchAssociateApprovalRuleTemplateWithRepositories"
                   outputClass:[AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput class]];
}

- (void)batchAssociateApprovalRuleTemplateWithRepositories:(AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesInput *)request
     completionHandler:(void (^)(AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput *response, NSError *error))completionHandler {
    [[self batchAssociateApprovalRuleTemplateWithRepositories:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput *> * _Nonnull task) {
        AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitBatchDescribeMergeConflictsOutput *> *)batchDescribeMergeConflicts:(AWSCodecommitBatchDescribeMergeConflictsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"BatchDescribeMergeConflicts"
                   outputClass:[AWSCodecommitBatchDescribeMergeConflictsOutput class]];
}

- (void)batchDescribeMergeConflicts:(AWSCodecommitBatchDescribeMergeConflictsInput *)request
     completionHandler:(void (^)(AWSCodecommitBatchDescribeMergeConflictsOutput *response, NSError *error))completionHandler {
    [[self batchDescribeMergeConflicts:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitBatchDescribeMergeConflictsOutput *> * _Nonnull task) {
        AWSCodecommitBatchDescribeMergeConflictsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput *> *)batchDisassociateApprovalRuleTemplateFromRepositories:(AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"BatchDisassociateApprovalRuleTemplateFromRepositories"
                   outputClass:[AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput class]];
}

- (void)batchDisassociateApprovalRuleTemplateFromRepositories:(AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesInput *)request
     completionHandler:(void (^)(AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput *response, NSError *error))completionHandler {
    [[self batchDisassociateApprovalRuleTemplateFromRepositories:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput *> * _Nonnull task) {
        AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitBatchGetCommitsOutput *> *)batchGetCommits:(AWSCodecommitBatchGetCommitsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"BatchGetCommits"
                   outputClass:[AWSCodecommitBatchGetCommitsOutput class]];
}

- (void)batchGetCommits:(AWSCodecommitBatchGetCommitsInput *)request
     completionHandler:(void (^)(AWSCodecommitBatchGetCommitsOutput *response, NSError *error))completionHandler {
    [[self batchGetCommits:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitBatchGetCommitsOutput *> * _Nonnull task) {
        AWSCodecommitBatchGetCommitsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitBatchGetRepositoriesOutput *> *)batchGetRepositories:(AWSCodecommitBatchGetRepositoriesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"BatchGetRepositories"
                   outputClass:[AWSCodecommitBatchGetRepositoriesOutput class]];
}

- (void)batchGetRepositories:(AWSCodecommitBatchGetRepositoriesInput *)request
     completionHandler:(void (^)(AWSCodecommitBatchGetRepositoriesOutput *response, NSError *error))completionHandler {
    [[self batchGetRepositories:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitBatchGetRepositoriesOutput *> * _Nonnull task) {
        AWSCodecommitBatchGetRepositoriesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitCreateApprovalRuleTemplateOutput *> *)createApprovalRuleTemplate:(AWSCodecommitCreateApprovalRuleTemplateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"CreateApprovalRuleTemplate"
                   outputClass:[AWSCodecommitCreateApprovalRuleTemplateOutput class]];
}

- (void)createApprovalRuleTemplate:(AWSCodecommitCreateApprovalRuleTemplateInput *)request
     completionHandler:(void (^)(AWSCodecommitCreateApprovalRuleTemplateOutput *response, NSError *error))completionHandler {
    [[self createApprovalRuleTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitCreateApprovalRuleTemplateOutput *> * _Nonnull task) {
        AWSCodecommitCreateApprovalRuleTemplateOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createBranch:(AWSCodecommitCreateBranchInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"CreateBranch"
                   outputClass:nil];
}

- (void)createBranch:(AWSCodecommitCreateBranchInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createBranch:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitCreateCommitOutput *> *)createCommit:(AWSCodecommitCreateCommitInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"CreateCommit"
                   outputClass:[AWSCodecommitCreateCommitOutput class]];
}

- (void)createCommit:(AWSCodecommitCreateCommitInput *)request
     completionHandler:(void (^)(AWSCodecommitCreateCommitOutput *response, NSError *error))completionHandler {
    [[self createCommit:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitCreateCommitOutput *> * _Nonnull task) {
        AWSCodecommitCreateCommitOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitCreatePullRequestOutput *> *)createPullRequest:(AWSCodecommitCreatePullRequestInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"CreatePullRequest"
                   outputClass:[AWSCodecommitCreatePullRequestOutput class]];
}

- (void)createPullRequest:(AWSCodecommitCreatePullRequestInput *)request
     completionHandler:(void (^)(AWSCodecommitCreatePullRequestOutput *response, NSError *error))completionHandler {
    [[self createPullRequest:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitCreatePullRequestOutput *> * _Nonnull task) {
        AWSCodecommitCreatePullRequestOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitCreatePullRequestApprovalRuleOutput *> *)createPullRequestApprovalRule:(AWSCodecommitCreatePullRequestApprovalRuleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"CreatePullRequestApprovalRule"
                   outputClass:[AWSCodecommitCreatePullRequestApprovalRuleOutput class]];
}

- (void)createPullRequestApprovalRule:(AWSCodecommitCreatePullRequestApprovalRuleInput *)request
     completionHandler:(void (^)(AWSCodecommitCreatePullRequestApprovalRuleOutput *response, NSError *error))completionHandler {
    [[self createPullRequestApprovalRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitCreatePullRequestApprovalRuleOutput *> * _Nonnull task) {
        AWSCodecommitCreatePullRequestApprovalRuleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitCreateRepositoryOutput *> *)createRepository:(AWSCodecommitCreateRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"CreateRepository"
                   outputClass:[AWSCodecommitCreateRepositoryOutput class]];
}

- (void)createRepository:(AWSCodecommitCreateRepositoryInput *)request
     completionHandler:(void (^)(AWSCodecommitCreateRepositoryOutput *response, NSError *error))completionHandler {
    [[self createRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitCreateRepositoryOutput *> * _Nonnull task) {
        AWSCodecommitCreateRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitCreateUnreferencedMergeCommitOutput *> *)createUnreferencedMergeCommit:(AWSCodecommitCreateUnreferencedMergeCommitInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"CreateUnreferencedMergeCommit"
                   outputClass:[AWSCodecommitCreateUnreferencedMergeCommitOutput class]];
}

- (void)createUnreferencedMergeCommit:(AWSCodecommitCreateUnreferencedMergeCommitInput *)request
     completionHandler:(void (^)(AWSCodecommitCreateUnreferencedMergeCommitOutput *response, NSError *error))completionHandler {
    [[self createUnreferencedMergeCommit:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitCreateUnreferencedMergeCommitOutput *> * _Nonnull task) {
        AWSCodecommitCreateUnreferencedMergeCommitOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitDeleteApprovalRuleTemplateOutput *> *)deleteApprovalRuleTemplate:(AWSCodecommitDeleteApprovalRuleTemplateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"DeleteApprovalRuleTemplate"
                   outputClass:[AWSCodecommitDeleteApprovalRuleTemplateOutput class]];
}

- (void)deleteApprovalRuleTemplate:(AWSCodecommitDeleteApprovalRuleTemplateInput *)request
     completionHandler:(void (^)(AWSCodecommitDeleteApprovalRuleTemplateOutput *response, NSError *error))completionHandler {
    [[self deleteApprovalRuleTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitDeleteApprovalRuleTemplateOutput *> * _Nonnull task) {
        AWSCodecommitDeleteApprovalRuleTemplateOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitDeleteBranchOutput *> *)deleteBranch:(AWSCodecommitDeleteBranchInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"DeleteBranch"
                   outputClass:[AWSCodecommitDeleteBranchOutput class]];
}

- (void)deleteBranch:(AWSCodecommitDeleteBranchInput *)request
     completionHandler:(void (^)(AWSCodecommitDeleteBranchOutput *response, NSError *error))completionHandler {
    [[self deleteBranch:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitDeleteBranchOutput *> * _Nonnull task) {
        AWSCodecommitDeleteBranchOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitDeleteCommentContentOutput *> *)deleteCommentContent:(AWSCodecommitDeleteCommentContentInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"DeleteCommentContent"
                   outputClass:[AWSCodecommitDeleteCommentContentOutput class]];
}

- (void)deleteCommentContent:(AWSCodecommitDeleteCommentContentInput *)request
     completionHandler:(void (^)(AWSCodecommitDeleteCommentContentOutput *response, NSError *error))completionHandler {
    [[self deleteCommentContent:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitDeleteCommentContentOutput *> * _Nonnull task) {
        AWSCodecommitDeleteCommentContentOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitDeleteFileOutput *> *)deleteFile:(AWSCodecommitDeleteFileInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"DeleteFile"
                   outputClass:[AWSCodecommitDeleteFileOutput class]];
}

- (void)deleteFile:(AWSCodecommitDeleteFileInput *)request
     completionHandler:(void (^)(AWSCodecommitDeleteFileOutput *response, NSError *error))completionHandler {
    [[self deleteFile:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitDeleteFileOutput *> * _Nonnull task) {
        AWSCodecommitDeleteFileOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitDeletePullRequestApprovalRuleOutput *> *)deletePullRequestApprovalRule:(AWSCodecommitDeletePullRequestApprovalRuleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"DeletePullRequestApprovalRule"
                   outputClass:[AWSCodecommitDeletePullRequestApprovalRuleOutput class]];
}

- (void)deletePullRequestApprovalRule:(AWSCodecommitDeletePullRequestApprovalRuleInput *)request
     completionHandler:(void (^)(AWSCodecommitDeletePullRequestApprovalRuleOutput *response, NSError *error))completionHandler {
    [[self deletePullRequestApprovalRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitDeletePullRequestApprovalRuleOutput *> * _Nonnull task) {
        AWSCodecommitDeletePullRequestApprovalRuleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitDeleteRepositoryOutput *> *)deleteRepository:(AWSCodecommitDeleteRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"DeleteRepository"
                   outputClass:[AWSCodecommitDeleteRepositoryOutput class]];
}

- (void)deleteRepository:(AWSCodecommitDeleteRepositoryInput *)request
     completionHandler:(void (^)(AWSCodecommitDeleteRepositoryOutput *response, NSError *error))completionHandler {
    [[self deleteRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitDeleteRepositoryOutput *> * _Nonnull task) {
        AWSCodecommitDeleteRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitDescribeMergeConflictsOutput *> *)describeMergeConflicts:(AWSCodecommitDescribeMergeConflictsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"DescribeMergeConflicts"
                   outputClass:[AWSCodecommitDescribeMergeConflictsOutput class]];
}

- (void)describeMergeConflicts:(AWSCodecommitDescribeMergeConflictsInput *)request
     completionHandler:(void (^)(AWSCodecommitDescribeMergeConflictsOutput *response, NSError *error))completionHandler {
    [[self describeMergeConflicts:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitDescribeMergeConflictsOutput *> * _Nonnull task) {
        AWSCodecommitDescribeMergeConflictsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitDescribePullRequestEventsOutput *> *)describePullRequestEvents:(AWSCodecommitDescribePullRequestEventsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"DescribePullRequestEvents"
                   outputClass:[AWSCodecommitDescribePullRequestEventsOutput class]];
}

- (void)describePullRequestEvents:(AWSCodecommitDescribePullRequestEventsInput *)request
     completionHandler:(void (^)(AWSCodecommitDescribePullRequestEventsOutput *response, NSError *error))completionHandler {
    [[self describePullRequestEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitDescribePullRequestEventsOutput *> * _Nonnull task) {
        AWSCodecommitDescribePullRequestEventsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateApprovalRuleTemplateFromRepository:(AWSCodecommitDisassociateApprovalRuleTemplateFromRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"DisassociateApprovalRuleTemplateFromRepository"
                   outputClass:nil];
}

- (void)disassociateApprovalRuleTemplateFromRepository:(AWSCodecommitDisassociateApprovalRuleTemplateFromRepositoryInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateApprovalRuleTemplateFromRepository:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitEvaluatePullRequestApprovalRulesOutput *> *)evaluatePullRequestApprovalRules:(AWSCodecommitEvaluatePullRequestApprovalRulesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"EvaluatePullRequestApprovalRules"
                   outputClass:[AWSCodecommitEvaluatePullRequestApprovalRulesOutput class]];
}

- (void)evaluatePullRequestApprovalRules:(AWSCodecommitEvaluatePullRequestApprovalRulesInput *)request
     completionHandler:(void (^)(AWSCodecommitEvaluatePullRequestApprovalRulesOutput *response, NSError *error))completionHandler {
    [[self evaluatePullRequestApprovalRules:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitEvaluatePullRequestApprovalRulesOutput *> * _Nonnull task) {
        AWSCodecommitEvaluatePullRequestApprovalRulesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetApprovalRuleTemplateOutput *> *)getApprovalRuleTemplate:(AWSCodecommitGetApprovalRuleTemplateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetApprovalRuleTemplate"
                   outputClass:[AWSCodecommitGetApprovalRuleTemplateOutput class]];
}

- (void)getApprovalRuleTemplate:(AWSCodecommitGetApprovalRuleTemplateInput *)request
     completionHandler:(void (^)(AWSCodecommitGetApprovalRuleTemplateOutput *response, NSError *error))completionHandler {
    [[self getApprovalRuleTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetApprovalRuleTemplateOutput *> * _Nonnull task) {
        AWSCodecommitGetApprovalRuleTemplateOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetBlobOutput *> *)getBlob:(AWSCodecommitGetBlobInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetBlob"
                   outputClass:[AWSCodecommitGetBlobOutput class]];
}

- (void)getBlob:(AWSCodecommitGetBlobInput *)request
     completionHandler:(void (^)(AWSCodecommitGetBlobOutput *response, NSError *error))completionHandler {
    [[self getBlob:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetBlobOutput *> * _Nonnull task) {
        AWSCodecommitGetBlobOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetBranchOutput *> *)getBranch:(AWSCodecommitGetBranchInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetBranch"
                   outputClass:[AWSCodecommitGetBranchOutput class]];
}

- (void)getBranch:(AWSCodecommitGetBranchInput *)request
     completionHandler:(void (^)(AWSCodecommitGetBranchOutput *response, NSError *error))completionHandler {
    [[self getBranch:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetBranchOutput *> * _Nonnull task) {
        AWSCodecommitGetBranchOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetCommentOutput *> *)getComment:(AWSCodecommitGetCommentInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetComment"
                   outputClass:[AWSCodecommitGetCommentOutput class]];
}

- (void)getComment:(AWSCodecommitGetCommentInput *)request
     completionHandler:(void (^)(AWSCodecommitGetCommentOutput *response, NSError *error))completionHandler {
    [[self getComment:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetCommentOutput *> * _Nonnull task) {
        AWSCodecommitGetCommentOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetCommentReactionsOutput *> *)getCommentReactions:(AWSCodecommitGetCommentReactionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetCommentReactions"
                   outputClass:[AWSCodecommitGetCommentReactionsOutput class]];
}

- (void)getCommentReactions:(AWSCodecommitGetCommentReactionsInput *)request
     completionHandler:(void (^)(AWSCodecommitGetCommentReactionsOutput *response, NSError *error))completionHandler {
    [[self getCommentReactions:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetCommentReactionsOutput *> * _Nonnull task) {
        AWSCodecommitGetCommentReactionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetCommentsForComparedCommitOutput *> *)getCommentsForComparedCommit:(AWSCodecommitGetCommentsForComparedCommitInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetCommentsForComparedCommit"
                   outputClass:[AWSCodecommitGetCommentsForComparedCommitOutput class]];
}

- (void)getCommentsForComparedCommit:(AWSCodecommitGetCommentsForComparedCommitInput *)request
     completionHandler:(void (^)(AWSCodecommitGetCommentsForComparedCommitOutput *response, NSError *error))completionHandler {
    [[self getCommentsForComparedCommit:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetCommentsForComparedCommitOutput *> * _Nonnull task) {
        AWSCodecommitGetCommentsForComparedCommitOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetCommentsForPullRequestOutput *> *)getCommentsForPullRequest:(AWSCodecommitGetCommentsForPullRequestInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetCommentsForPullRequest"
                   outputClass:[AWSCodecommitGetCommentsForPullRequestOutput class]];
}

- (void)getCommentsForPullRequest:(AWSCodecommitGetCommentsForPullRequestInput *)request
     completionHandler:(void (^)(AWSCodecommitGetCommentsForPullRequestOutput *response, NSError *error))completionHandler {
    [[self getCommentsForPullRequest:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetCommentsForPullRequestOutput *> * _Nonnull task) {
        AWSCodecommitGetCommentsForPullRequestOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetCommitOutput *> *)getCommit:(AWSCodecommitGetCommitInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetCommit"
                   outputClass:[AWSCodecommitGetCommitOutput class]];
}

- (void)getCommit:(AWSCodecommitGetCommitInput *)request
     completionHandler:(void (^)(AWSCodecommitGetCommitOutput *response, NSError *error))completionHandler {
    [[self getCommit:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetCommitOutput *> * _Nonnull task) {
        AWSCodecommitGetCommitOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetDifferencesOutput *> *)getDifferences:(AWSCodecommitGetDifferencesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetDifferences"
                   outputClass:[AWSCodecommitGetDifferencesOutput class]];
}

- (void)getDifferences:(AWSCodecommitGetDifferencesInput *)request
     completionHandler:(void (^)(AWSCodecommitGetDifferencesOutput *response, NSError *error))completionHandler {
    [[self getDifferences:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetDifferencesOutput *> * _Nonnull task) {
        AWSCodecommitGetDifferencesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetFileOutput *> *)getFile:(AWSCodecommitGetFileInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetFile"
                   outputClass:[AWSCodecommitGetFileOutput class]];
}

- (void)getFile:(AWSCodecommitGetFileInput *)request
     completionHandler:(void (^)(AWSCodecommitGetFileOutput *response, NSError *error))completionHandler {
    [[self getFile:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetFileOutput *> * _Nonnull task) {
        AWSCodecommitGetFileOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetFolderOutput *> *)getFolder:(AWSCodecommitGetFolderInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetFolder"
                   outputClass:[AWSCodecommitGetFolderOutput class]];
}

- (void)getFolder:(AWSCodecommitGetFolderInput *)request
     completionHandler:(void (^)(AWSCodecommitGetFolderOutput *response, NSError *error))completionHandler {
    [[self getFolder:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetFolderOutput *> * _Nonnull task) {
        AWSCodecommitGetFolderOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetMergeCommitOutput *> *)getMergeCommit:(AWSCodecommitGetMergeCommitInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetMergeCommit"
                   outputClass:[AWSCodecommitGetMergeCommitOutput class]];
}

- (void)getMergeCommit:(AWSCodecommitGetMergeCommitInput *)request
     completionHandler:(void (^)(AWSCodecommitGetMergeCommitOutput *response, NSError *error))completionHandler {
    [[self getMergeCommit:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetMergeCommitOutput *> * _Nonnull task) {
        AWSCodecommitGetMergeCommitOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetMergeConflictsOutput *> *)getMergeConflicts:(AWSCodecommitGetMergeConflictsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetMergeConflicts"
                   outputClass:[AWSCodecommitGetMergeConflictsOutput class]];
}

- (void)getMergeConflicts:(AWSCodecommitGetMergeConflictsInput *)request
     completionHandler:(void (^)(AWSCodecommitGetMergeConflictsOutput *response, NSError *error))completionHandler {
    [[self getMergeConflicts:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetMergeConflictsOutput *> * _Nonnull task) {
        AWSCodecommitGetMergeConflictsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetMergeOptionsOutput *> *)getMergeOptions:(AWSCodecommitGetMergeOptionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetMergeOptions"
                   outputClass:[AWSCodecommitGetMergeOptionsOutput class]];
}

- (void)getMergeOptions:(AWSCodecommitGetMergeOptionsInput *)request
     completionHandler:(void (^)(AWSCodecommitGetMergeOptionsOutput *response, NSError *error))completionHandler {
    [[self getMergeOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetMergeOptionsOutput *> * _Nonnull task) {
        AWSCodecommitGetMergeOptionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetPullRequestOutput *> *)getPullRequest:(AWSCodecommitGetPullRequestInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetPullRequest"
                   outputClass:[AWSCodecommitGetPullRequestOutput class]];
}

- (void)getPullRequest:(AWSCodecommitGetPullRequestInput *)request
     completionHandler:(void (^)(AWSCodecommitGetPullRequestOutput *response, NSError *error))completionHandler {
    [[self getPullRequest:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetPullRequestOutput *> * _Nonnull task) {
        AWSCodecommitGetPullRequestOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetPullRequestApprovalStatesOutput *> *)getPullRequestApprovalStates:(AWSCodecommitGetPullRequestApprovalStatesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetPullRequestApprovalStates"
                   outputClass:[AWSCodecommitGetPullRequestApprovalStatesOutput class]];
}

- (void)getPullRequestApprovalStates:(AWSCodecommitGetPullRequestApprovalStatesInput *)request
     completionHandler:(void (^)(AWSCodecommitGetPullRequestApprovalStatesOutput *response, NSError *error))completionHandler {
    [[self getPullRequestApprovalStates:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetPullRequestApprovalStatesOutput *> * _Nonnull task) {
        AWSCodecommitGetPullRequestApprovalStatesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetPullRequestOverrideStateOutput *> *)getPullRequestOverrideState:(AWSCodecommitGetPullRequestOverrideStateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetPullRequestOverrideState"
                   outputClass:[AWSCodecommitGetPullRequestOverrideStateOutput class]];
}

- (void)getPullRequestOverrideState:(AWSCodecommitGetPullRequestOverrideStateInput *)request
     completionHandler:(void (^)(AWSCodecommitGetPullRequestOverrideStateOutput *response, NSError *error))completionHandler {
    [[self getPullRequestOverrideState:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetPullRequestOverrideStateOutput *> * _Nonnull task) {
        AWSCodecommitGetPullRequestOverrideStateOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetRepositoryOutput *> *)getRepository:(AWSCodecommitGetRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetRepository"
                   outputClass:[AWSCodecommitGetRepositoryOutput class]];
}

- (void)getRepository:(AWSCodecommitGetRepositoryInput *)request
     completionHandler:(void (^)(AWSCodecommitGetRepositoryOutput *response, NSError *error))completionHandler {
    [[self getRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetRepositoryOutput *> * _Nonnull task) {
        AWSCodecommitGetRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitGetRepositoryTriggersOutput *> *)getRepositoryTriggers:(AWSCodecommitGetRepositoryTriggersInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"GetRepositoryTriggers"
                   outputClass:[AWSCodecommitGetRepositoryTriggersOutput class]];
}

- (void)getRepositoryTriggers:(AWSCodecommitGetRepositoryTriggersInput *)request
     completionHandler:(void (^)(AWSCodecommitGetRepositoryTriggersOutput *response, NSError *error))completionHandler {
    [[self getRepositoryTriggers:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitGetRepositoryTriggersOutput *> * _Nonnull task) {
        AWSCodecommitGetRepositoryTriggersOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitListApprovalRuleTemplatesOutput *> *)listApprovalRuleTemplates:(AWSCodecommitListApprovalRuleTemplatesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"ListApprovalRuleTemplates"
                   outputClass:[AWSCodecommitListApprovalRuleTemplatesOutput class]];
}

- (void)listApprovalRuleTemplates:(AWSCodecommitListApprovalRuleTemplatesInput *)request
     completionHandler:(void (^)(AWSCodecommitListApprovalRuleTemplatesOutput *response, NSError *error))completionHandler {
    [[self listApprovalRuleTemplates:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitListApprovalRuleTemplatesOutput *> * _Nonnull task) {
        AWSCodecommitListApprovalRuleTemplatesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput *> *)listAssociatedApprovalRuleTemplatesForRepository:(AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"ListAssociatedApprovalRuleTemplatesForRepository"
                   outputClass:[AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput class]];
}

- (void)listAssociatedApprovalRuleTemplatesForRepository:(AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryInput *)request
     completionHandler:(void (^)(AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput *response, NSError *error))completionHandler {
    [[self listAssociatedApprovalRuleTemplatesForRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput *> * _Nonnull task) {
        AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitListBranchesOutput *> *)listBranches:(AWSCodecommitListBranchesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"ListBranches"
                   outputClass:[AWSCodecommitListBranchesOutput class]];
}

- (void)listBranches:(AWSCodecommitListBranchesInput *)request
     completionHandler:(void (^)(AWSCodecommitListBranchesOutput *response, NSError *error))completionHandler {
    [[self listBranches:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitListBranchesOutput *> * _Nonnull task) {
        AWSCodecommitListBranchesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitListPullRequestsOutput *> *)listPullRequests:(AWSCodecommitListPullRequestsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"ListPullRequests"
                   outputClass:[AWSCodecommitListPullRequestsOutput class]];
}

- (void)listPullRequests:(AWSCodecommitListPullRequestsInput *)request
     completionHandler:(void (^)(AWSCodecommitListPullRequestsOutput *response, NSError *error))completionHandler {
    [[self listPullRequests:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitListPullRequestsOutput *> * _Nonnull task) {
        AWSCodecommitListPullRequestsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitListRepositoriesOutput *> *)listRepositories:(AWSCodecommitListRepositoriesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"ListRepositories"
                   outputClass:[AWSCodecommitListRepositoriesOutput class]];
}

- (void)listRepositories:(AWSCodecommitListRepositoriesInput *)request
     completionHandler:(void (^)(AWSCodecommitListRepositoriesOutput *response, NSError *error))completionHandler {
    [[self listRepositories:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitListRepositoriesOutput *> * _Nonnull task) {
        AWSCodecommitListRepositoriesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput *> *)listRepositoriesForApprovalRuleTemplate:(AWSCodecommitListRepositoriesForApprovalRuleTemplateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"ListRepositoriesForApprovalRuleTemplate"
                   outputClass:[AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput class]];
}

- (void)listRepositoriesForApprovalRuleTemplate:(AWSCodecommitListRepositoriesForApprovalRuleTemplateInput *)request
     completionHandler:(void (^)(AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput *response, NSError *error))completionHandler {
    [[self listRepositoriesForApprovalRuleTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput *> * _Nonnull task) {
        AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitListTagsForResourceOutput *> *)listTagsForResource:(AWSCodecommitListTagsForResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSCodecommitListTagsForResourceOutput class]];
}

- (void)listTagsForResource:(AWSCodecommitListTagsForResourceInput *)request
     completionHandler:(void (^)(AWSCodecommitListTagsForResourceOutput *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitListTagsForResourceOutput *> * _Nonnull task) {
        AWSCodecommitListTagsForResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitMergeBranchesByFastForwardOutput *> *)mergeBranchesByFastForward:(AWSCodecommitMergeBranchesByFastForwardInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"MergeBranchesByFastForward"
                   outputClass:[AWSCodecommitMergeBranchesByFastForwardOutput class]];
}

- (void)mergeBranchesByFastForward:(AWSCodecommitMergeBranchesByFastForwardInput *)request
     completionHandler:(void (^)(AWSCodecommitMergeBranchesByFastForwardOutput *response, NSError *error))completionHandler {
    [[self mergeBranchesByFastForward:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitMergeBranchesByFastForwardOutput *> * _Nonnull task) {
        AWSCodecommitMergeBranchesByFastForwardOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitMergeBranchesBySquashOutput *> *)mergeBranchesBySquash:(AWSCodecommitMergeBranchesBySquashInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"MergeBranchesBySquash"
                   outputClass:[AWSCodecommitMergeBranchesBySquashOutput class]];
}

- (void)mergeBranchesBySquash:(AWSCodecommitMergeBranchesBySquashInput *)request
     completionHandler:(void (^)(AWSCodecommitMergeBranchesBySquashOutput *response, NSError *error))completionHandler {
    [[self mergeBranchesBySquash:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitMergeBranchesBySquashOutput *> * _Nonnull task) {
        AWSCodecommitMergeBranchesBySquashOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitMergeBranchesByThreeWayOutput *> *)mergeBranchesByThreeWay:(AWSCodecommitMergeBranchesByThreeWayInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"MergeBranchesByThreeWay"
                   outputClass:[AWSCodecommitMergeBranchesByThreeWayOutput class]];
}

- (void)mergeBranchesByThreeWay:(AWSCodecommitMergeBranchesByThreeWayInput *)request
     completionHandler:(void (^)(AWSCodecommitMergeBranchesByThreeWayOutput *response, NSError *error))completionHandler {
    [[self mergeBranchesByThreeWay:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitMergeBranchesByThreeWayOutput *> * _Nonnull task) {
        AWSCodecommitMergeBranchesByThreeWayOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitMergePullRequestByFastForwardOutput *> *)mergePullRequestByFastForward:(AWSCodecommitMergePullRequestByFastForwardInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"MergePullRequestByFastForward"
                   outputClass:[AWSCodecommitMergePullRequestByFastForwardOutput class]];
}

- (void)mergePullRequestByFastForward:(AWSCodecommitMergePullRequestByFastForwardInput *)request
     completionHandler:(void (^)(AWSCodecommitMergePullRequestByFastForwardOutput *response, NSError *error))completionHandler {
    [[self mergePullRequestByFastForward:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitMergePullRequestByFastForwardOutput *> * _Nonnull task) {
        AWSCodecommitMergePullRequestByFastForwardOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitMergePullRequestBySquashOutput *> *)mergePullRequestBySquash:(AWSCodecommitMergePullRequestBySquashInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"MergePullRequestBySquash"
                   outputClass:[AWSCodecommitMergePullRequestBySquashOutput class]];
}

- (void)mergePullRequestBySquash:(AWSCodecommitMergePullRequestBySquashInput *)request
     completionHandler:(void (^)(AWSCodecommitMergePullRequestBySquashOutput *response, NSError *error))completionHandler {
    [[self mergePullRequestBySquash:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitMergePullRequestBySquashOutput *> * _Nonnull task) {
        AWSCodecommitMergePullRequestBySquashOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitMergePullRequestByThreeWayOutput *> *)mergePullRequestByThreeWay:(AWSCodecommitMergePullRequestByThreeWayInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"MergePullRequestByThreeWay"
                   outputClass:[AWSCodecommitMergePullRequestByThreeWayOutput class]];
}

- (void)mergePullRequestByThreeWay:(AWSCodecommitMergePullRequestByThreeWayInput *)request
     completionHandler:(void (^)(AWSCodecommitMergePullRequestByThreeWayOutput *response, NSError *error))completionHandler {
    [[self mergePullRequestByThreeWay:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitMergePullRequestByThreeWayOutput *> * _Nonnull task) {
        AWSCodecommitMergePullRequestByThreeWayOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)overridePullRequestApprovalRules:(AWSCodecommitOverridePullRequestApprovalRulesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"OverridePullRequestApprovalRules"
                   outputClass:nil];
}

- (void)overridePullRequestApprovalRules:(AWSCodecommitOverridePullRequestApprovalRulesInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self overridePullRequestApprovalRules:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitPostCommentForComparedCommitOutput *> *)postCommentForComparedCommit:(AWSCodecommitPostCommentForComparedCommitInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"PostCommentForComparedCommit"
                   outputClass:[AWSCodecommitPostCommentForComparedCommitOutput class]];
}

- (void)postCommentForComparedCommit:(AWSCodecommitPostCommentForComparedCommitInput *)request
     completionHandler:(void (^)(AWSCodecommitPostCommentForComparedCommitOutput *response, NSError *error))completionHandler {
    [[self postCommentForComparedCommit:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitPostCommentForComparedCommitOutput *> * _Nonnull task) {
        AWSCodecommitPostCommentForComparedCommitOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitPostCommentForPullRequestOutput *> *)postCommentForPullRequest:(AWSCodecommitPostCommentForPullRequestInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"PostCommentForPullRequest"
                   outputClass:[AWSCodecommitPostCommentForPullRequestOutput class]];
}

- (void)postCommentForPullRequest:(AWSCodecommitPostCommentForPullRequestInput *)request
     completionHandler:(void (^)(AWSCodecommitPostCommentForPullRequestOutput *response, NSError *error))completionHandler {
    [[self postCommentForPullRequest:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitPostCommentForPullRequestOutput *> * _Nonnull task) {
        AWSCodecommitPostCommentForPullRequestOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitPostCommentReplyOutput *> *)postCommentReply:(AWSCodecommitPostCommentReplyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"PostCommentReply"
                   outputClass:[AWSCodecommitPostCommentReplyOutput class]];
}

- (void)postCommentReply:(AWSCodecommitPostCommentReplyInput *)request
     completionHandler:(void (^)(AWSCodecommitPostCommentReplyOutput *response, NSError *error))completionHandler {
    [[self postCommentReply:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitPostCommentReplyOutput *> * _Nonnull task) {
        AWSCodecommitPostCommentReplyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putCommentReaction:(AWSCodecommitPutCommentReactionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"PutCommentReaction"
                   outputClass:nil];
}

- (void)putCommentReaction:(AWSCodecommitPutCommentReactionInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putCommentReaction:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitPutFileOutput *> *)putFile:(AWSCodecommitPutFileInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"PutFile"
                   outputClass:[AWSCodecommitPutFileOutput class]];
}

- (void)putFile:(AWSCodecommitPutFileInput *)request
     completionHandler:(void (^)(AWSCodecommitPutFileOutput *response, NSError *error))completionHandler {
    [[self putFile:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitPutFileOutput *> * _Nonnull task) {
        AWSCodecommitPutFileOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitPutRepositoryTriggersOutput *> *)putRepositoryTriggers:(AWSCodecommitPutRepositoryTriggersInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"PutRepositoryTriggers"
                   outputClass:[AWSCodecommitPutRepositoryTriggersOutput class]];
}

- (void)putRepositoryTriggers:(AWSCodecommitPutRepositoryTriggersInput *)request
     completionHandler:(void (^)(AWSCodecommitPutRepositoryTriggersOutput *response, NSError *error))completionHandler {
    [[self putRepositoryTriggers:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitPutRepositoryTriggersOutput *> * _Nonnull task) {
        AWSCodecommitPutRepositoryTriggersOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSCodecommitTagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSCodecommitTagResourceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitTestRepositoryTriggersOutput *> *)testRepositoryTriggers:(AWSCodecommitTestRepositoryTriggersInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"TestRepositoryTriggers"
                   outputClass:[AWSCodecommitTestRepositoryTriggersOutput class]];
}

- (void)testRepositoryTriggers:(AWSCodecommitTestRepositoryTriggersInput *)request
     completionHandler:(void (^)(AWSCodecommitTestRepositoryTriggersOutput *response, NSError *error))completionHandler {
    [[self testRepositoryTriggers:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitTestRepositoryTriggersOutput *> * _Nonnull task) {
        AWSCodecommitTestRepositoryTriggersOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSCodecommitUntagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSCodecommitUntagResourceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitUpdateApprovalRuleTemplateContentOutput *> *)updateApprovalRuleTemplateContent:(AWSCodecommitUpdateApprovalRuleTemplateContentInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UpdateApprovalRuleTemplateContent"
                   outputClass:[AWSCodecommitUpdateApprovalRuleTemplateContentOutput class]];
}

- (void)updateApprovalRuleTemplateContent:(AWSCodecommitUpdateApprovalRuleTemplateContentInput *)request
     completionHandler:(void (^)(AWSCodecommitUpdateApprovalRuleTemplateContentOutput *response, NSError *error))completionHandler {
    [[self updateApprovalRuleTemplateContent:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitUpdateApprovalRuleTemplateContentOutput *> * _Nonnull task) {
        AWSCodecommitUpdateApprovalRuleTemplateContentOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput *> *)updateApprovalRuleTemplateDescription:(AWSCodecommitUpdateApprovalRuleTemplateDescriptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UpdateApprovalRuleTemplateDescription"
                   outputClass:[AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput class]];
}

- (void)updateApprovalRuleTemplateDescription:(AWSCodecommitUpdateApprovalRuleTemplateDescriptionInput *)request
     completionHandler:(void (^)(AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput *response, NSError *error))completionHandler {
    [[self updateApprovalRuleTemplateDescription:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput *> * _Nonnull task) {
        AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitUpdateApprovalRuleTemplateNameOutput *> *)updateApprovalRuleTemplateName:(AWSCodecommitUpdateApprovalRuleTemplateNameInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UpdateApprovalRuleTemplateName"
                   outputClass:[AWSCodecommitUpdateApprovalRuleTemplateNameOutput class]];
}

- (void)updateApprovalRuleTemplateName:(AWSCodecommitUpdateApprovalRuleTemplateNameInput *)request
     completionHandler:(void (^)(AWSCodecommitUpdateApprovalRuleTemplateNameOutput *response, NSError *error))completionHandler {
    [[self updateApprovalRuleTemplateName:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitUpdateApprovalRuleTemplateNameOutput *> * _Nonnull task) {
        AWSCodecommitUpdateApprovalRuleTemplateNameOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitUpdateCommentOutput *> *)updateComment:(AWSCodecommitUpdateCommentInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UpdateComment"
                   outputClass:[AWSCodecommitUpdateCommentOutput class]];
}

- (void)updateComment:(AWSCodecommitUpdateCommentInput *)request
     completionHandler:(void (^)(AWSCodecommitUpdateCommentOutput *response, NSError *error))completionHandler {
    [[self updateComment:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitUpdateCommentOutput *> * _Nonnull task) {
        AWSCodecommitUpdateCommentOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateDefaultBranch:(AWSCodecommitUpdateDefaultBranchInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UpdateDefaultBranch"
                   outputClass:nil];
}

- (void)updateDefaultBranch:(AWSCodecommitUpdateDefaultBranchInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateDefaultBranch:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitUpdatePullRequestApprovalRuleContentOutput *> *)updatePullRequestApprovalRuleContent:(AWSCodecommitUpdatePullRequestApprovalRuleContentInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UpdatePullRequestApprovalRuleContent"
                   outputClass:[AWSCodecommitUpdatePullRequestApprovalRuleContentOutput class]];
}

- (void)updatePullRequestApprovalRuleContent:(AWSCodecommitUpdatePullRequestApprovalRuleContentInput *)request
     completionHandler:(void (^)(AWSCodecommitUpdatePullRequestApprovalRuleContentOutput *response, NSError *error))completionHandler {
    [[self updatePullRequestApprovalRuleContent:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitUpdatePullRequestApprovalRuleContentOutput *> * _Nonnull task) {
        AWSCodecommitUpdatePullRequestApprovalRuleContentOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updatePullRequestApprovalState:(AWSCodecommitUpdatePullRequestApprovalStateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UpdatePullRequestApprovalState"
                   outputClass:nil];
}

- (void)updatePullRequestApprovalState:(AWSCodecommitUpdatePullRequestApprovalStateInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updatePullRequestApprovalState:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitUpdatePullRequestDescriptionOutput *> *)updatePullRequestDescription:(AWSCodecommitUpdatePullRequestDescriptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UpdatePullRequestDescription"
                   outputClass:[AWSCodecommitUpdatePullRequestDescriptionOutput class]];
}

- (void)updatePullRequestDescription:(AWSCodecommitUpdatePullRequestDescriptionInput *)request
     completionHandler:(void (^)(AWSCodecommitUpdatePullRequestDescriptionOutput *response, NSError *error))completionHandler {
    [[self updatePullRequestDescription:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitUpdatePullRequestDescriptionOutput *> * _Nonnull task) {
        AWSCodecommitUpdatePullRequestDescriptionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitUpdatePullRequestStatusOutput *> *)updatePullRequestStatus:(AWSCodecommitUpdatePullRequestStatusInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UpdatePullRequestStatus"
                   outputClass:[AWSCodecommitUpdatePullRequestStatusOutput class]];
}

- (void)updatePullRequestStatus:(AWSCodecommitUpdatePullRequestStatusInput *)request
     completionHandler:(void (^)(AWSCodecommitUpdatePullRequestStatusOutput *response, NSError *error))completionHandler {
    [[self updatePullRequestStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitUpdatePullRequestStatusOutput *> * _Nonnull task) {
        AWSCodecommitUpdatePullRequestStatusOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodecommitUpdatePullRequestTitleOutput *> *)updatePullRequestTitle:(AWSCodecommitUpdatePullRequestTitleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UpdatePullRequestTitle"
                   outputClass:[AWSCodecommitUpdatePullRequestTitleOutput class]];
}

- (void)updatePullRequestTitle:(AWSCodecommitUpdatePullRequestTitleInput *)request
     completionHandler:(void (^)(AWSCodecommitUpdatePullRequestTitleOutput *response, NSError *error))completionHandler {
    [[self updatePullRequestTitle:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodecommitUpdatePullRequestTitleOutput *> * _Nonnull task) {
        AWSCodecommitUpdatePullRequestTitleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateRepositoryDescription:(AWSCodecommitUpdateRepositoryDescriptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UpdateRepositoryDescription"
                   outputClass:nil];
}

- (void)updateRepositoryDescription:(AWSCodecommitUpdateRepositoryDescriptionInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateRepositoryDescription:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateRepositoryName:(AWSCodecommitUpdateRepositoryNameInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeCommit_20150413"
                 operationName:@"UpdateRepositoryName"
                   outputClass:nil];
}

- (void)updateRepositoryName:(AWSCodecommitUpdateRepositoryNameInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateRepositoryName:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
