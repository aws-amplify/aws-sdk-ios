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
#import <AWSCore/AWSCore.h>
#import "AWSCodecommitModel.h"
#import "AWSCodecommitResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSCodecommit
FOUNDATION_EXPORT NSString *const AWSCodecommitSDKVersion;

/**
 <fullname>AWS CodeCommit</fullname><p>This is the <i>AWS CodeCommit API Reference</i>. This reference provides descriptions of the operations and data types for AWS CodeCommit API along with usage examples.</p><p>You can use the AWS CodeCommit API to work with the following objects:</p><p>Repositories, by calling the following:</p><ul><li><p><a>BatchGetRepositories</a>, which returns information about one or more repositories associated with your AWS account.</p></li><li><p><a>CreateRepository</a>, which creates an AWS CodeCommit repository.</p></li><li><p><a>DeleteRepository</a>, which deletes an AWS CodeCommit repository.</p></li><li><p><a>GetRepository</a>, which returns information about a specified repository.</p></li><li><p><a>ListRepositories</a>, which lists all AWS CodeCommit repositories associated with your AWS account.</p></li><li><p><a>UpdateRepositoryDescription</a>, which sets or updates the description of the repository.</p></li><li><p><a>UpdateRepositoryName</a>, which changes the name of the repository. If you change the name of a repository, no other users of that repository can access it until you send them the new HTTPS or SSH URL to use.</p></li></ul><p>Branches, by calling the following:</p><ul><li><p><a>CreateBranch</a>, which creates a branch in a specified repository.</p></li><li><p><a>DeleteBranch</a>, which deletes the specified branch in a repository unless it is the default branch.</p></li><li><p><a>GetBranch</a>, which returns information about a specified branch.</p></li><li><p><a>ListBranches</a>, which lists all branches for a specified repository.</p></li><li><p><a>UpdateDefaultBranch</a>, which changes the default branch for a repository.</p></li></ul><p>Files, by calling the following:</p><ul><li><p><a>DeleteFile</a>, which deletes the content of a specified file from a specified branch.</p></li><li><p><a>GetBlob</a>, which returns the base-64 encoded content of an individual Git blob object in a repository.</p></li><li><p><a>GetFile</a>, which returns the base-64 encoded content of a specified file.</p></li><li><p><a>GetFolder</a>, which returns the contents of a specified folder or directory.</p></li><li><p><a>PutFile</a>, which adds or modifies a single file in a specified repository and branch.</p></li></ul><p>Commits, by calling the following:</p><ul><li><p><a>BatchGetCommits</a>, which returns information about one or more commits in a repository.</p></li><li><p><a>CreateCommit</a>, which creates a commit for changes to a repository.</p></li><li><p><a>GetCommit</a>, which returns information about a commit, including commit messages and author and committer information.</p></li><li><p><a>GetDifferences</a>, which returns information about the differences in a valid commit specifier (such as a branch, tag, HEAD, commit ID, or other fully qualified reference).</p></li></ul><p>Merges, by calling the following:</p><ul><li><p><a>BatchDescribeMergeConflicts</a>, which returns information about conflicts in a merge between commits in a repository.</p></li><li><p><a>CreateUnreferencedMergeCommit</a>, which creates an unreferenced commit between two branches or commits for the purpose of comparing them and identifying any potential conflicts.</p></li><li><p><a>DescribeMergeConflicts</a>, which returns information about merge conflicts between the base, source, and destination versions of a file in a potential merge.</p></li><li><p><a>GetMergeCommit</a>, which returns information about the merge between a source and destination commit. </p></li><li><p><a>GetMergeConflicts</a>, which returns information about merge conflicts between the source and destination branch in a pull request.</p></li><li><p><a>GetMergeOptions</a>, which returns information about the available merge options between two branches or commit specifiers.</p></li><li><p><a>MergeBranchesByFastForward</a>, which merges two branches using the fast-forward merge option.</p></li><li><p><a>MergeBranchesBySquash</a>, which merges two branches using the squash merge option.</p></li><li><p><a>MergeBranchesByThreeWay</a>, which merges two branches using the three-way merge option.</p></li></ul><p>Pull requests, by calling the following:</p><ul><li><p><a>CreatePullRequest</a>, which creates a pull request in a specified repository.</p></li><li><p><a>CreatePullRequestApprovalRule</a>, which creates an approval rule for a specified pull request.</p></li><li><p><a>DeletePullRequestApprovalRule</a>, which deletes an approval rule for a specified pull request.</p></li><li><p><a>DescribePullRequestEvents</a>, which returns information about one or more pull request events.</p></li><li><p><a>EvaluatePullRequestApprovalRules</a>, which evaluates whether a pull request has met all the conditions specified in its associated approval rules.</p></li><li><p><a>GetCommentsForPullRequest</a>, which returns information about comments on a specified pull request.</p></li><li><p><a>GetPullRequest</a>, which returns information about a specified pull request.</p></li><li><p><a>GetPullRequestApprovalStates</a>, which returns information about the approval states for a specified pull request.</p></li><li><p><a>GetPullRequestOverrideState</a>, which returns information about whether approval rules have been set aside (overriden) for a pull request, and if so, the Amazon Resource Name (ARN) of the user or identity that overrode the rules and their requirements for the pull request.</p></li><li><p><a>ListPullRequests</a>, which lists all pull requests for a repository.</p></li><li><p><a>MergePullRequestByFastForward</a>, which merges the source destination branch of a pull request into the specified destination branch for that pull request using the fast-forward merge option.</p></li><li><p><a>MergePullRequestBySquash</a>, which merges the source destination branch of a pull request into the specified destination branch for that pull request using the squash merge option.</p></li><li><p><a>MergePullRequestByThreeWay</a>. which merges the source destination branch of a pull request into the specified destination branch for that pull request using the three-way merge option.</p></li><li><p><a>OverridePullRequestApprovalRules</a>, which sets aside all approval rule requirements for a pull request.</p></li><li><p><a>PostCommentForPullRequest</a>, which posts a comment to a pull request at the specified line, file, or request.</p></li><li><p><a>UpdatePullRequestApprovalRuleContent</a>, which updates the structure of an approval rule for a pull request.</p></li><li><p><a>UpdatePullRequestApprovalState</a>, which updates the state of an approval on a pull request.</p></li><li><p><a>UpdatePullRequestDescription</a>, which updates the description of a pull request.</p></li><li><p><a>UpdatePullRequestStatus</a>, which updates the status of a pull request.</p></li><li><p><a>UpdatePullRequestTitle</a>, which updates the title of a pull request.</p></li></ul><p>Approval rule templates, by calling the following:</p><ul><li><p><a>AssociateApprovalRuleTemplateWithRepository</a>, which associates a template with a specified repository. After the template is associated with a repository, AWS CodeCommit creates approval rules that match the template conditions on every pull request created in the specified repository.</p></li><li><p><a>BatchAssociateApprovalRuleTemplateWithRepositories</a>, which associates a template with one or more specified repositories. After the template is associated with a repository, AWS CodeCommit creates approval rules that match the template conditions on every pull request created in the specified repositories.</p></li><li><p><a>BatchDisassociateApprovalRuleTemplateFromRepositories</a>, which removes the association between a template and specified repositories so that approval rules based on the template are not automatically created when pull requests are created in those repositories.</p></li><li><p><a>CreateApprovalRuleTemplate</a>, which creates a template for approval rules that can then be associated with one or more repositories in your AWS account.</p></li><li><p><a>DeleteApprovalRuleTemplate</a>, which deletes the specified template. It does not remove approval rules on pull requests already created with the template.</p></li><li><p><a>DisassociateApprovalRuleTemplateFromRepository</a>, which removes the association between a template and a repository so that approval rules based on the template are not automatically created when pull requests are created in the specified repository.</p></li><li><p><a>GetApprovalRuleTemplate</a>, which returns information about an approval rule template.</p></li><li><p><a>ListApprovalRuleTemplates</a>, which lists all approval rule templates in the AWS Region in your AWS account.</p></li><li><p><a>ListAssociatedApprovalRuleTemplatesForRepository</a>, which lists all approval rule templates that are associated with a specified repository.</p></li><li><p><a>ListRepositoriesForApprovalRuleTemplate</a>, which lists all repositories associated with the specified approval rule template.</p></li><li><p><a>UpdateApprovalRuleTemplateDescription</a>, which updates the description of an approval rule template.</p></li><li><p><a>UpdateApprovalRuleTemplateName</a>, which updates the name of an approval rule template.</p></li><li><p><a>UpdateApprovalRuleTemplateContent</a>, which updates the content of an approval rule template.</p></li></ul><p>Comments in a repository, by calling the following:</p><ul><li><p><a>DeleteCommentContent</a>, which deletes the content of a comment on a commit in a repository.</p></li><li><p><a>GetComment</a>, which returns information about a comment on a commit.</p></li><li><p><a>GetCommentReactions</a>, which returns information about emoji reactions to comments.</p></li><li><p><a>GetCommentsForComparedCommit</a>, which returns information about comments on the comparison between two commit specifiers in a repository.</p></li><li><p><a>PostCommentForComparedCommit</a>, which creates a comment on the comparison between two commit specifiers in a repository.</p></li><li><p><a>PostCommentReply</a>, which creates a reply to a comment.</p></li><li><p><a>PutCommentReaction</a>, which creates or updates an emoji reaction to a comment.</p></li><li><p><a>UpdateComment</a>, which updates the content of a comment on a commit in a repository.</p></li></ul><p>Tags used to tag resources in AWS CodeCommit (not Git tags), by calling the following:</p><ul><li><p><a>ListTagsForResource</a>, which gets information about AWS tags for a specified Amazon Resource Name (ARN) in AWS CodeCommit.</p></li><li><p><a>TagResource</a>, which adds or updates tags for a resource in AWS CodeCommit.</p></li><li><p><a>UntagResource</a>, which removes tags for a resource in AWS CodeCommit.</p></li></ul><p>Triggers, by calling the following:</p><ul><li><p><a>GetRepositoryTriggers</a>, which returns information about triggers configured for a repository.</p></li><li><p><a>PutRepositoryTriggers</a>, which replaces all triggers for a repository and can be used to create or delete triggers.</p></li><li><p><a>TestRepositoryTriggers</a>, which tests the functionality of a repository trigger by sending data to the trigger target.</p></li></ul><p>For information about how to use AWS CodeCommit, see the <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit User Guide</a>.</p>
 */
@interface AWSCodecommit : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let Codecommit = AWSCodecommit.default()

 *Objective-C*

     AWSCodecommit *Codecommit = [AWSCodecommit defaultCodecommit];

 @return The default service client.
 */
+ (instancetype)defaultCodecommit;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCodecommit.register(with: configuration!, forKey: "USWest2Codecommit")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:@"USWest2Codecommit"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Codecommit = AWSCodecommit(forKey: "USWest2Codecommit")

 *Objective-C*

     AWSCodecommit *Codecommit = [AWSCodecommit CodecommitForKey:@"USWest2Codecommit"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerCodecommitWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerCodecommitWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCodecommit.register(with: configuration!, forKey: "USWest2Codecommit")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:@"USWest2Codecommit"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Codecommit = AWSCodecommit(forKey: "USWest2Codecommit")

 *Objective-C*

     AWSCodecommit *Codecommit = [AWSCodecommit CodecommitForKey:@"USWest2Codecommit"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)CodecommitForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeCodecommitForKey:(NSString *)key;

/**
 <p>Creates an association between an approval rule template and a specified repository. Then, the next time a pull request is created in the repository where the destination reference (if specified) matches the destination reference (branch) for the pull request, an approval rule that matches the template conditions is automatically created for that pull request. If no destination references are specified in the template, an approval rule that matches the template contents is created for all pull requests in that repository.</p>
 
 @param request A container for the necessary parameters to execute the AssociateApprovalRuleTemplateWithRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorMaximumRuleTemplatesAssociatedWithRepository`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitAssociateApprovalRuleTemplateWithRepositoryInput
 */
- (AWSTask *)associateApprovalRuleTemplateWithRepository:(AWSCodecommitAssociateApprovalRuleTemplateWithRepositoryInput *)request;

/**
 <p>Creates an association between an approval rule template and a specified repository. Then, the next time a pull request is created in the repository where the destination reference (if specified) matches the destination reference (branch) for the pull request, an approval rule that matches the template conditions is automatically created for that pull request. If no destination references are specified in the template, an approval rule that matches the template contents is created for all pull requests in that repository.</p>
 
 @param request A container for the necessary parameters to execute the AssociateApprovalRuleTemplateWithRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorMaximumRuleTemplatesAssociatedWithRepository`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitAssociateApprovalRuleTemplateWithRepositoryInput
 */
- (void)associateApprovalRuleTemplateWithRepository:(AWSCodecommitAssociateApprovalRuleTemplateWithRepositoryInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates an association between an approval rule template and one or more specified repositories. </p>
 
 @param request A container for the necessary parameters to execute the BatchAssociateApprovalRuleTemplateWithRepositories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorRepositoryNamesRequired`, `AWSCodecommitErrorMaximumRepositoryNamesExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesInput
 @see AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput
 */
- (AWSTask<AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput *> *)batchAssociateApprovalRuleTemplateWithRepositories:(AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesInput *)request;

/**
 <p>Creates an association between an approval rule template and one or more specified repositories. </p>
 
 @param request A container for the necessary parameters to execute the BatchAssociateApprovalRuleTemplateWithRepositories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorRepositoryNamesRequired`, `AWSCodecommitErrorMaximumRepositoryNamesExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesInput
 @see AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput
 */
- (void)batchAssociateApprovalRuleTemplateWithRepositories:(AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about one or more merge conflicts in the attempted merge of two commit specifiers using the squash or three-way merge strategy.</p>
 
 @param request A container for the necessary parameters to execute the BatchDescribeMergeConflicts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitBatchDescribeMergeConflictsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorMergeOptionRequired`, `AWSCodecommitErrorInvalidMergeOption`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorInvalidMaxConflictFiles`, `AWSCodecommitErrorInvalidMaxMergeHunks`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitBatchDescribeMergeConflictsInput
 @see AWSCodecommitBatchDescribeMergeConflictsOutput
 */
- (AWSTask<AWSCodecommitBatchDescribeMergeConflictsOutput *> *)batchDescribeMergeConflicts:(AWSCodecommitBatchDescribeMergeConflictsInput *)request;

/**
 <p>Returns information about one or more merge conflicts in the attempted merge of two commit specifiers using the squash or three-way merge strategy.</p>
 
 @param request A container for the necessary parameters to execute the BatchDescribeMergeConflicts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorMergeOptionRequired`, `AWSCodecommitErrorInvalidMergeOption`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorInvalidMaxConflictFiles`, `AWSCodecommitErrorInvalidMaxMergeHunks`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitBatchDescribeMergeConflictsInput
 @see AWSCodecommitBatchDescribeMergeConflictsOutput
 */
- (void)batchDescribeMergeConflicts:(AWSCodecommitBatchDescribeMergeConflictsInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitBatchDescribeMergeConflictsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the association between an approval rule template and one or more specified repositories. </p>
 
 @param request A container for the necessary parameters to execute the BatchDisassociateApprovalRuleTemplateFromRepositories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorRepositoryNamesRequired`, `AWSCodecommitErrorMaximumRepositoryNamesExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesInput
 @see AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput
 */
- (AWSTask<AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput *> *)batchDisassociateApprovalRuleTemplateFromRepositories:(AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesInput *)request;

/**
 <p>Removes the association between an approval rule template and one or more specified repositories. </p>
 
 @param request A container for the necessary parameters to execute the BatchDisassociateApprovalRuleTemplateFromRepositories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorRepositoryNamesRequired`, `AWSCodecommitErrorMaximumRepositoryNamesExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesInput
 @see AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput
 */
- (void)batchDisassociateApprovalRuleTemplateFromRepositories:(AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the contents of one or more commits in a repository.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetCommits service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitBatchGetCommitsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorCommitIdsListRequired`, `AWSCodecommitErrorCommitIdsLimitExceeded`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitBatchGetCommitsInput
 @see AWSCodecommitBatchGetCommitsOutput
 */
- (AWSTask<AWSCodecommitBatchGetCommitsOutput *> *)batchGetCommits:(AWSCodecommitBatchGetCommitsInput *)request;

/**
 <p>Returns information about the contents of one or more commits in a repository.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetCommits service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorCommitIdsListRequired`, `AWSCodecommitErrorCommitIdsLimitExceeded`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitBatchGetCommitsInput
 @see AWSCodecommitBatchGetCommitsOutput
 */
- (void)batchGetCommits:(AWSCodecommitBatchGetCommitsInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitBatchGetCommitsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about one or more repositories.</p><note><p>The description field for a repository accepts all HTML characters and all valid Unicode characters. Applications that do not HTML-encode the description and display it in a webpage can expose users to potentially malicious code. Make sure that you HTML-encode the description field in any application that uses this API to display the repository description on a webpage.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchGetRepositories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitBatchGetRepositoriesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNamesRequired`, `AWSCodecommitErrorMaximumRepositoryNamesExceeded`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitBatchGetRepositoriesInput
 @see AWSCodecommitBatchGetRepositoriesOutput
 */
- (AWSTask<AWSCodecommitBatchGetRepositoriesOutput *> *)batchGetRepositories:(AWSCodecommitBatchGetRepositoriesInput *)request;

/**
 <p>Returns information about one or more repositories.</p><note><p>The description field for a repository accepts all HTML characters and all valid Unicode characters. Applications that do not HTML-encode the description and display it in a webpage can expose users to potentially malicious code. Make sure that you HTML-encode the description field in any application that uses this API to display the repository description on a webpage.</p></note>
 
 @param request A container for the necessary parameters to execute the BatchGetRepositories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNamesRequired`, `AWSCodecommitErrorMaximumRepositoryNamesExceeded`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitBatchGetRepositoriesInput
 @see AWSCodecommitBatchGetRepositoriesOutput
 */
- (void)batchGetRepositories:(AWSCodecommitBatchGetRepositoriesInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitBatchGetRepositoriesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a template for approval rules that can then be associated with one or more repositories in your AWS account. When you associate a template with a repository, AWS CodeCommit creates an approval rule that matches the conditions of the template for all pull requests that meet the conditions of the template. For more information, see <a>AssociateApprovalRuleTemplateWithRepository</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateApprovalRuleTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitCreateApprovalRuleTemplateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateNameAlreadyExists`, `AWSCodecommitErrorApprovalRuleTemplateContentRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateContent`, `AWSCodecommitErrorInvalidApprovalRuleTemplateDescription`, `AWSCodecommitErrorNumberOfRuleTemplatesExceeded`.
 
 @see AWSCodecommitCreateApprovalRuleTemplateInput
 @see AWSCodecommitCreateApprovalRuleTemplateOutput
 */
- (AWSTask<AWSCodecommitCreateApprovalRuleTemplateOutput *> *)createApprovalRuleTemplate:(AWSCodecommitCreateApprovalRuleTemplateInput *)request;

/**
 <p>Creates a template for approval rules that can then be associated with one or more repositories in your AWS account. When you associate a template with a repository, AWS CodeCommit creates an approval rule that matches the conditions of the template for all pull requests that meet the conditions of the template. For more information, see <a>AssociateApprovalRuleTemplateWithRepository</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateApprovalRuleTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateNameAlreadyExists`, `AWSCodecommitErrorApprovalRuleTemplateContentRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateContent`, `AWSCodecommitErrorInvalidApprovalRuleTemplateDescription`, `AWSCodecommitErrorNumberOfRuleTemplatesExceeded`.
 
 @see AWSCodecommitCreateApprovalRuleTemplateInput
 @see AWSCodecommitCreateApprovalRuleTemplateOutput
 */
- (void)createApprovalRuleTemplate:(AWSCodecommitCreateApprovalRuleTemplateInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitCreateApprovalRuleTemplateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a branch in a repository and points the branch to a commit.</p><note><p>Calling the create branch operation does not set a repository's default branch. To do this, call the update default branch operation.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateBranch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorBranchNameExists`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorCommitIdRequired`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitCreateBranchInput
 */
- (AWSTask *)createBranch:(AWSCodecommitCreateBranchInput *)request;

/**
 <p>Creates a branch in a repository and points the branch to a commit.</p><note><p>Calling the create branch operation does not set a repository's default branch. To do this, call the update default branch operation.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateBranch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorBranchNameExists`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorCommitIdRequired`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitCreateBranchInput
 */
- (void)createBranch:(AWSCodecommitCreateBranchInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a commit for a repository on the tip of a specified branch.</p>
 
 @param request A container for the necessary parameters to execute the CreateCommit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitCreateCommitOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorParentCommitIdRequired`, `AWSCodecommitErrorInvalidParentCommitId`, `AWSCodecommitErrorParentCommitDoesNotExist`, `AWSCodecommitErrorParentCommitIdOutdated`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorBranchNameIsTagName`, `AWSCodecommitErrorFileEntryRequired`, `AWSCodecommitErrorMaximumFileEntriesExceeded`, `AWSCodecommitErrorPutFileEntryConflict`, `AWSCodecommitErrorSourceFileOrContentRequired`, `AWSCodecommitErrorFileContentAndSourceFileSpecified`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorSamePathRequest`, `AWSCodecommitErrorFileDoesNotExist`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorInvalidDeletionParameter`, `AWSCodecommitErrorRestrictedSourceFile`, `AWSCodecommitErrorFileModeRequired`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorNoChange`, `AWSCodecommitErrorFileNameConflictsWithDirectoryName`, `AWSCodecommitErrorDirectoryNameConflictsWithFileName`, `AWSCodecommitErrorFilePathConflictsWithSubmodulePath`.
 
 @see AWSCodecommitCreateCommitInput
 @see AWSCodecommitCreateCommitOutput
 */
- (AWSTask<AWSCodecommitCreateCommitOutput *> *)createCommit:(AWSCodecommitCreateCommitInput *)request;

/**
 <p>Creates a commit for a repository on the tip of a specified branch.</p>
 
 @param request A container for the necessary parameters to execute the CreateCommit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorParentCommitIdRequired`, `AWSCodecommitErrorInvalidParentCommitId`, `AWSCodecommitErrorParentCommitDoesNotExist`, `AWSCodecommitErrorParentCommitIdOutdated`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorBranchNameIsTagName`, `AWSCodecommitErrorFileEntryRequired`, `AWSCodecommitErrorMaximumFileEntriesExceeded`, `AWSCodecommitErrorPutFileEntryConflict`, `AWSCodecommitErrorSourceFileOrContentRequired`, `AWSCodecommitErrorFileContentAndSourceFileSpecified`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorSamePathRequest`, `AWSCodecommitErrorFileDoesNotExist`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorInvalidDeletionParameter`, `AWSCodecommitErrorRestrictedSourceFile`, `AWSCodecommitErrorFileModeRequired`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorNoChange`, `AWSCodecommitErrorFileNameConflictsWithDirectoryName`, `AWSCodecommitErrorDirectoryNameConflictsWithFileName`, `AWSCodecommitErrorFilePathConflictsWithSubmodulePath`.
 
 @see AWSCodecommitCreateCommitInput
 @see AWSCodecommitCreateCommitOutput
 */
- (void)createCommit:(AWSCodecommitCreateCommitInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitCreateCommitOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a pull request in the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the CreatePullRequest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitCreatePullRequestOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorClientRequestTokenRequired`, `AWSCodecommitErrorInvalidClientRequestToken`, `AWSCodecommitErrorIdempotencyParameterMismatch`, `AWSCodecommitErrorReferenceNameRequired`, `AWSCodecommitErrorInvalidReferenceName`, `AWSCodecommitErrorReferenceDoesNotExist`, `AWSCodecommitErrorReferenceTypeNotSupported`, `AWSCodecommitErrorTitleRequired`, `AWSCodecommitErrorInvalidTitle`, `AWSCodecommitErrorInvalidDescription`, `AWSCodecommitErrorTargetsRequired`, `AWSCodecommitErrorInvalidTargets`, `AWSCodecommitErrorTargetRequired`, `AWSCodecommitErrorInvalidTarget`, `AWSCodecommitErrorMultipleRepositoriesInPullRequest`, `AWSCodecommitErrorMaximumOpenPullRequestsExceeded`, `AWSCodecommitErrorSourceAndDestinationAreSame`.
 
 @see AWSCodecommitCreatePullRequestInput
 @see AWSCodecommitCreatePullRequestOutput
 */
- (AWSTask<AWSCodecommitCreatePullRequestOutput *> *)createPullRequest:(AWSCodecommitCreatePullRequestInput *)request;

/**
 <p>Creates a pull request in the specified repository.</p>
 
 @param request A container for the necessary parameters to execute the CreatePullRequest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorClientRequestTokenRequired`, `AWSCodecommitErrorInvalidClientRequestToken`, `AWSCodecommitErrorIdempotencyParameterMismatch`, `AWSCodecommitErrorReferenceNameRequired`, `AWSCodecommitErrorInvalidReferenceName`, `AWSCodecommitErrorReferenceDoesNotExist`, `AWSCodecommitErrorReferenceTypeNotSupported`, `AWSCodecommitErrorTitleRequired`, `AWSCodecommitErrorInvalidTitle`, `AWSCodecommitErrorInvalidDescription`, `AWSCodecommitErrorTargetsRequired`, `AWSCodecommitErrorInvalidTargets`, `AWSCodecommitErrorTargetRequired`, `AWSCodecommitErrorInvalidTarget`, `AWSCodecommitErrorMultipleRepositoriesInPullRequest`, `AWSCodecommitErrorMaximumOpenPullRequestsExceeded`, `AWSCodecommitErrorSourceAndDestinationAreSame`.
 
 @see AWSCodecommitCreatePullRequestInput
 @see AWSCodecommitCreatePullRequestOutput
 */
- (void)createPullRequest:(AWSCodecommitCreatePullRequestInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitCreatePullRequestOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an approval rule for a pull request.</p>
 
 @param request A container for the necessary parameters to execute the CreatePullRequestApprovalRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitCreatePullRequestApprovalRuleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleName`, `AWSCodecommitErrorApprovalRuleNameAlreadyExists`, `AWSCodecommitErrorApprovalRuleContentRequired`, `AWSCodecommitErrorInvalidApprovalRuleContent`, `AWSCodecommitErrorNumberOfRulesExceeded`, `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitCreatePullRequestApprovalRuleInput
 @see AWSCodecommitCreatePullRequestApprovalRuleOutput
 */
- (AWSTask<AWSCodecommitCreatePullRequestApprovalRuleOutput *> *)createPullRequestApprovalRule:(AWSCodecommitCreatePullRequestApprovalRuleInput *)request;

/**
 <p>Creates an approval rule for a pull request.</p>
 
 @param request A container for the necessary parameters to execute the CreatePullRequestApprovalRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleName`, `AWSCodecommitErrorApprovalRuleNameAlreadyExists`, `AWSCodecommitErrorApprovalRuleContentRequired`, `AWSCodecommitErrorInvalidApprovalRuleContent`, `AWSCodecommitErrorNumberOfRulesExceeded`, `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitCreatePullRequestApprovalRuleInput
 @see AWSCodecommitCreatePullRequestApprovalRuleOutput
 */
- (void)createPullRequestApprovalRule:(AWSCodecommitCreatePullRequestApprovalRuleInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitCreatePullRequestApprovalRuleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new, empty repository.</p>
 
 @param request A container for the necessary parameters to execute the CreateRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitCreateRepositoryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameExists`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorInvalidRepositoryDescription`, `AWSCodecommitErrorRepositoryLimitExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorInvalidTagsMap`, `AWSCodecommitErrorTooManyTags`, `AWSCodecommitErrorInvalidSystemTagUsage`, `AWSCodecommitErrorTagPolicy`.
 
 @see AWSCodecommitCreateRepositoryInput
 @see AWSCodecommitCreateRepositoryOutput
 */
- (AWSTask<AWSCodecommitCreateRepositoryOutput *> *)createRepository:(AWSCodecommitCreateRepositoryInput *)request;

/**
 <p>Creates a new, empty repository.</p>
 
 @param request A container for the necessary parameters to execute the CreateRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameExists`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorInvalidRepositoryDescription`, `AWSCodecommitErrorRepositoryLimitExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorInvalidTagsMap`, `AWSCodecommitErrorTooManyTags`, `AWSCodecommitErrorInvalidSystemTagUsage`, `AWSCodecommitErrorTagPolicy`.
 
 @see AWSCodecommitCreateRepositoryInput
 @see AWSCodecommitCreateRepositoryOutput
 */
- (void)createRepository:(AWSCodecommitCreateRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitCreateRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an unreferenced commit that represents the result of merging two branches using a specified merge strategy. This can help you determine the outcome of a potential merge. This API cannot be used with the fast-forward merge strategy because that strategy does not create a merge commit.</p><note><p>This unreferenced merge commit can only be accessed using the GetCommit API or through git commands such as git fetch. To retrieve this commit, you must specify its commit ID or otherwise reference it.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateUnreferencedMergeCommit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitCreateUnreferencedMergeCommitOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorMergeOptionRequired`, `AWSCodecommitErrorInvalidMergeOption`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorInvalidConflictResolution`, `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorMaximumConflictResolutionEntriesExceeded`, `AWSCodecommitErrorMultipleConflictResolutionEntries`, `AWSCodecommitErrorReplacementTypeRequired`, `AWSCodecommitErrorInvalidReplacementType`, `AWSCodecommitErrorReplacementContentRequired`, `AWSCodecommitErrorInvalidReplacementContent`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorFileModeRequired`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitCreateUnreferencedMergeCommitInput
 @see AWSCodecommitCreateUnreferencedMergeCommitOutput
 */
- (AWSTask<AWSCodecommitCreateUnreferencedMergeCommitOutput *> *)createUnreferencedMergeCommit:(AWSCodecommitCreateUnreferencedMergeCommitInput *)request;

/**
 <p>Creates an unreferenced commit that represents the result of merging two branches using a specified merge strategy. This can help you determine the outcome of a potential merge. This API cannot be used with the fast-forward merge strategy because that strategy does not create a merge commit.</p><note><p>This unreferenced merge commit can only be accessed using the GetCommit API or through git commands such as git fetch. To retrieve this commit, you must specify its commit ID or otherwise reference it.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateUnreferencedMergeCommit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorMergeOptionRequired`, `AWSCodecommitErrorInvalidMergeOption`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorInvalidConflictResolution`, `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorMaximumConflictResolutionEntriesExceeded`, `AWSCodecommitErrorMultipleConflictResolutionEntries`, `AWSCodecommitErrorReplacementTypeRequired`, `AWSCodecommitErrorInvalidReplacementType`, `AWSCodecommitErrorReplacementContentRequired`, `AWSCodecommitErrorInvalidReplacementContent`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorFileModeRequired`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitCreateUnreferencedMergeCommitInput
 @see AWSCodecommitCreateUnreferencedMergeCommitOutput
 */
- (void)createUnreferencedMergeCommit:(AWSCodecommitCreateUnreferencedMergeCommitInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitCreateUnreferencedMergeCommitOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified approval rule template. Deleting a template does not remove approval rules on pull requests already created with the template.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApprovalRuleTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitDeleteApprovalRuleTemplateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateInUse`.
 
 @see AWSCodecommitDeleteApprovalRuleTemplateInput
 @see AWSCodecommitDeleteApprovalRuleTemplateOutput
 */
- (AWSTask<AWSCodecommitDeleteApprovalRuleTemplateOutput *> *)deleteApprovalRuleTemplate:(AWSCodecommitDeleteApprovalRuleTemplateInput *)request;

/**
 <p>Deletes a specified approval rule template. Deleting a template does not remove approval rules on pull requests already created with the template.</p>
 
 @param request A container for the necessary parameters to execute the DeleteApprovalRuleTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateInUse`.
 
 @see AWSCodecommitDeleteApprovalRuleTemplateInput
 @see AWSCodecommitDeleteApprovalRuleTemplateOutput
 */
- (void)deleteApprovalRuleTemplate:(AWSCodecommitDeleteApprovalRuleTemplateInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitDeleteApprovalRuleTemplateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a branch from a repository, unless that branch is the default branch for the repository. </p>
 
 @param request A container for the necessary parameters to execute the DeleteBranch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitDeleteBranchOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorDefaultBranchCannotBeDeleted`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDeleteBranchInput
 @see AWSCodecommitDeleteBranchOutput
 */
- (AWSTask<AWSCodecommitDeleteBranchOutput *> *)deleteBranch:(AWSCodecommitDeleteBranchInput *)request;

/**
 <p>Deletes a branch from a repository, unless that branch is the default branch for the repository. </p>
 
 @param request A container for the necessary parameters to execute the DeleteBranch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorDefaultBranchCannotBeDeleted`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDeleteBranchInput
 @see AWSCodecommitDeleteBranchOutput
 */
- (void)deleteBranch:(AWSCodecommitDeleteBranchInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitDeleteBranchOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the content of a comment made on a change, file, or commit in a repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCommentContent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitDeleteCommentContentOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorCommentDoesNotExist`, `AWSCodecommitErrorCommentIdRequired`, `AWSCodecommitErrorInvalidCommentId`, `AWSCodecommitErrorCommentDeleted`.
 
 @see AWSCodecommitDeleteCommentContentInput
 @see AWSCodecommitDeleteCommentContentOutput
 */
- (AWSTask<AWSCodecommitDeleteCommentContentOutput *> *)deleteCommentContent:(AWSCodecommitDeleteCommentContentInput *)request;

/**
 <p>Deletes the content of a comment made on a change, file, or commit in a repository.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCommentContent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorCommentDoesNotExist`, `AWSCodecommitErrorCommentIdRequired`, `AWSCodecommitErrorInvalidCommentId`, `AWSCodecommitErrorCommentDeleted`.
 
 @see AWSCodecommitDeleteCommentContentInput
 @see AWSCodecommitDeleteCommentContentOutput
 */
- (void)deleteCommentContent:(AWSCodecommitDeleteCommentContentInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitDeleteCommentContentOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a specified file from a specified branch. A commit is created on the branch that contains the revision. The file still exists in the commits earlier to the commit that contains the deletion.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitDeleteFileOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorParentCommitIdRequired`, `AWSCodecommitErrorInvalidParentCommitId`, `AWSCodecommitErrorParentCommitDoesNotExist`, `AWSCodecommitErrorParentCommitIdOutdated`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFileDoesNotExist`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorBranchNameIsTagName`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDeleteFileInput
 @see AWSCodecommitDeleteFileOutput
 */
- (AWSTask<AWSCodecommitDeleteFileOutput *> *)deleteFile:(AWSCodecommitDeleteFileInput *)request;

/**
 <p>Deletes a specified file from a specified branch. A commit is created on the branch that contains the revision. The file still exists in the commits earlier to the commit that contains the deletion.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorParentCommitIdRequired`, `AWSCodecommitErrorInvalidParentCommitId`, `AWSCodecommitErrorParentCommitDoesNotExist`, `AWSCodecommitErrorParentCommitIdOutdated`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFileDoesNotExist`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorBranchNameIsTagName`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDeleteFileInput
 @see AWSCodecommitDeleteFileOutput
 */
- (void)deleteFile:(AWSCodecommitDeleteFileInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitDeleteFileOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an approval rule from a specified pull request. Approval rules can be deleted from a pull request only if the pull request is open, and if the approval rule was created specifically for a pull request and not generated from an approval rule template associated with the repository where the pull request was created. You cannot delete an approval rule from a merged or closed pull request.</p>
 
 @param request A container for the necessary parameters to execute the DeletePullRequestApprovalRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitDeletePullRequestApprovalRuleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorApprovalRuleNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleName`, `AWSCodecommitErrorCannotDeleteApprovalRuleFromTemplate`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDeletePullRequestApprovalRuleInput
 @see AWSCodecommitDeletePullRequestApprovalRuleOutput
 */
- (AWSTask<AWSCodecommitDeletePullRequestApprovalRuleOutput *> *)deletePullRequestApprovalRule:(AWSCodecommitDeletePullRequestApprovalRuleInput *)request;

/**
 <p>Deletes an approval rule from a specified pull request. Approval rules can be deleted from a pull request only if the pull request is open, and if the approval rule was created specifically for a pull request and not generated from an approval rule template associated with the repository where the pull request was created. You cannot delete an approval rule from a merged or closed pull request.</p>
 
 @param request A container for the necessary parameters to execute the DeletePullRequestApprovalRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorApprovalRuleNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleName`, `AWSCodecommitErrorCannotDeleteApprovalRuleFromTemplate`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDeletePullRequestApprovalRuleInput
 @see AWSCodecommitDeletePullRequestApprovalRuleOutput
 */
- (void)deletePullRequestApprovalRule:(AWSCodecommitDeletePullRequestApprovalRuleInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitDeletePullRequestApprovalRuleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a repository. If a specified repository was already deleted, a null repository ID is returned.</p><important><p>Deleting a repository also deletes all associated objects and metadata. After a repository is deleted, all future push calls to the deleted repository fail.</p></important>
 
 @param request A container for the necessary parameters to execute the DeleteRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitDeleteRepositoryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDeleteRepositoryInput
 @see AWSCodecommitDeleteRepositoryOutput
 */
- (AWSTask<AWSCodecommitDeleteRepositoryOutput *> *)deleteRepository:(AWSCodecommitDeleteRepositoryInput *)request;

/**
 <p>Deletes a repository. If a specified repository was already deleted, a null repository ID is returned.</p><important><p>Deleting a repository also deletes all associated objects and metadata. After a repository is deleted, all future push calls to the deleted repository fail.</p></important>
 
 @param request A container for the necessary parameters to execute the DeleteRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDeleteRepositoryInput
 @see AWSCodecommitDeleteRepositoryOutput
 */
- (void)deleteRepository:(AWSCodecommitDeleteRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitDeleteRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about one or more merge conflicts in the attempted merge of two commit specifiers using the squash or three-way merge strategy. If the merge option for the attempted merge is specified as FAST_FORWARD_MERGE, an exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMergeConflicts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitDescribeMergeConflictsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorMergeOptionRequired`, `AWSCodecommitErrorInvalidMergeOption`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFileDoesNotExist`, `AWSCodecommitErrorInvalidMaxMergeHunks`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDescribeMergeConflictsInput
 @see AWSCodecommitDescribeMergeConflictsOutput
 */
- (AWSTask<AWSCodecommitDescribeMergeConflictsOutput *> *)describeMergeConflicts:(AWSCodecommitDescribeMergeConflictsInput *)request;

/**
 <p>Returns information about one or more merge conflicts in the attempted merge of two commit specifiers using the squash or three-way merge strategy. If the merge option for the attempted merge is specified as FAST_FORWARD_MERGE, an exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMergeConflicts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorMergeOptionRequired`, `AWSCodecommitErrorInvalidMergeOption`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFileDoesNotExist`, `AWSCodecommitErrorInvalidMaxMergeHunks`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDescribeMergeConflictsInput
 @see AWSCodecommitDescribeMergeConflictsOutput
 */
- (void)describeMergeConflicts:(AWSCodecommitDescribeMergeConflictsInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitDescribeMergeConflictsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about one or more pull request events.</p>
 
 @param request A container for the necessary parameters to execute the DescribePullRequestEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitDescribePullRequestEventsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidPullRequestEventType`, `AWSCodecommitErrorInvalidActorArn`, `AWSCodecommitErrorActorDoesNotExist`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDescribePullRequestEventsInput
 @see AWSCodecommitDescribePullRequestEventsOutput
 */
- (AWSTask<AWSCodecommitDescribePullRequestEventsOutput *> *)describePullRequestEvents:(AWSCodecommitDescribePullRequestEventsInput *)request;

/**
 <p>Returns information about one or more pull request events.</p>
 
 @param request A container for the necessary parameters to execute the DescribePullRequestEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidPullRequestEventType`, `AWSCodecommitErrorInvalidActorArn`, `AWSCodecommitErrorActorDoesNotExist`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDescribePullRequestEventsInput
 @see AWSCodecommitDescribePullRequestEventsOutput
 */
- (void)describePullRequestEvents:(AWSCodecommitDescribePullRequestEventsInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitDescribePullRequestEventsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the association between a template and a repository so that approval rules based on the template are not automatically created when pull requests are created in the specified repository. This does not delete any approval rules previously created for pull requests through the template association.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateApprovalRuleTemplateFromRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDisassociateApprovalRuleTemplateFromRepositoryInput
 */
- (AWSTask *)disassociateApprovalRuleTemplateFromRepository:(AWSCodecommitDisassociateApprovalRuleTemplateFromRepositoryInput *)request;

/**
 <p>Removes the association between a template and a repository so that approval rules based on the template are not automatically created when pull requests are created in the specified repository. This does not delete any approval rules previously created for pull requests through the template association.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateApprovalRuleTemplateFromRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitDisassociateApprovalRuleTemplateFromRepositoryInput
 */
- (void)disassociateApprovalRuleTemplateFromRepository:(AWSCodecommitDisassociateApprovalRuleTemplateFromRepositoryInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Evaluates whether a pull request has met all the conditions specified in its associated approval rules.</p>
 
 @param request A container for the necessary parameters to execute the EvaluatePullRequestApprovalRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitEvaluatePullRequestApprovalRulesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidRevisionId`, `AWSCodecommitErrorRevisionIdRequired`, `AWSCodecommitErrorRevisionNotCurrent`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitEvaluatePullRequestApprovalRulesInput
 @see AWSCodecommitEvaluatePullRequestApprovalRulesOutput
 */
- (AWSTask<AWSCodecommitEvaluatePullRequestApprovalRulesOutput *> *)evaluatePullRequestApprovalRules:(AWSCodecommitEvaluatePullRequestApprovalRulesInput *)request;

/**
 <p>Evaluates whether a pull request has met all the conditions specified in its associated approval rules.</p>
 
 @param request A container for the necessary parameters to execute the EvaluatePullRequestApprovalRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidRevisionId`, `AWSCodecommitErrorRevisionIdRequired`, `AWSCodecommitErrorRevisionNotCurrent`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitEvaluatePullRequestApprovalRulesInput
 @see AWSCodecommitEvaluatePullRequestApprovalRulesOutput
 */
- (void)evaluatePullRequestApprovalRules:(AWSCodecommitEvaluatePullRequestApprovalRulesInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitEvaluatePullRequestApprovalRulesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specified approval rule template.</p>
 
 @param request A container for the necessary parameters to execute the GetApprovalRuleTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetApprovalRuleTemplateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`.
 
 @see AWSCodecommitGetApprovalRuleTemplateInput
 @see AWSCodecommitGetApprovalRuleTemplateOutput
 */
- (AWSTask<AWSCodecommitGetApprovalRuleTemplateOutput *> *)getApprovalRuleTemplate:(AWSCodecommitGetApprovalRuleTemplateInput *)request;

/**
 <p>Returns information about a specified approval rule template.</p>
 
 @param request A container for the necessary parameters to execute the GetApprovalRuleTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`.
 
 @see AWSCodecommitGetApprovalRuleTemplateInput
 @see AWSCodecommitGetApprovalRuleTemplateOutput
 */
- (void)getApprovalRuleTemplate:(AWSCodecommitGetApprovalRuleTemplateInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetApprovalRuleTemplateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the base-64 encoded content of an individual blob in a repository.</p>
 
 @param request A container for the necessary parameters to execute the GetBlob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetBlobOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorBlobIdRequired`, `AWSCodecommitErrorInvalidBlobId`, `AWSCodecommitErrorBlobIdDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorFileTooLarge`.
 
 @see AWSCodecommitGetBlobInput
 @see AWSCodecommitGetBlobOutput
 */
- (AWSTask<AWSCodecommitGetBlobOutput *> *)getBlob:(AWSCodecommitGetBlobInput *)request;

/**
 <p>Returns the base-64 encoded content of an individual blob in a repository.</p>
 
 @param request A container for the necessary parameters to execute the GetBlob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorBlobIdRequired`, `AWSCodecommitErrorInvalidBlobId`, `AWSCodecommitErrorBlobIdDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorFileTooLarge`.
 
 @see AWSCodecommitGetBlobInput
 @see AWSCodecommitGetBlobOutput
 */
- (void)getBlob:(AWSCodecommitGetBlobInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetBlobOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a repository branch, including its name and the last commit ID.</p>
 
 @param request A container for the necessary parameters to execute the GetBranch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetBranchOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetBranchInput
 @see AWSCodecommitGetBranchOutput
 */
- (AWSTask<AWSCodecommitGetBranchOutput *> *)getBranch:(AWSCodecommitGetBranchInput *)request;

/**
 <p>Returns information about a repository branch, including its name and the last commit ID.</p>
 
 @param request A container for the necessary parameters to execute the GetBranch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetBranchInput
 @see AWSCodecommitGetBranchOutput
 */
- (void)getBranch:(AWSCodecommitGetBranchInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetBranchOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the content of a comment made on a change, file, or commit in a repository. </p><note><p>Reaction counts might include numbers from user identities who were deleted after the reaction was made. For a count of reactions from active identities, use GetCommentReactions.</p></note>
 
 @param request A container for the necessary parameters to execute the GetComment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetCommentOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorCommentDoesNotExist`, `AWSCodecommitErrorCommentDeleted`, `AWSCodecommitErrorCommentIdRequired`, `AWSCodecommitErrorInvalidCommentId`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetCommentInput
 @see AWSCodecommitGetCommentOutput
 */
- (AWSTask<AWSCodecommitGetCommentOutput *> *)getComment:(AWSCodecommitGetCommentInput *)request;

/**
 <p>Returns the content of a comment made on a change, file, or commit in a repository. </p><note><p>Reaction counts might include numbers from user identities who were deleted after the reaction was made. For a count of reactions from active identities, use GetCommentReactions.</p></note>
 
 @param request A container for the necessary parameters to execute the GetComment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorCommentDoesNotExist`, `AWSCodecommitErrorCommentDeleted`, `AWSCodecommitErrorCommentIdRequired`, `AWSCodecommitErrorInvalidCommentId`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetCommentInput
 @see AWSCodecommitGetCommentOutput
 */
- (void)getComment:(AWSCodecommitGetCommentInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetCommentOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about reactions to a specified comment ID. Reactions from users who have been deleted will not be included in the count.</p>
 
 @param request A container for the necessary parameters to execute the GetCommentReactions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetCommentReactionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorCommentDoesNotExist`, `AWSCodecommitErrorCommentIdRequired`, `AWSCodecommitErrorInvalidCommentId`, `AWSCodecommitErrorInvalidReactionUserArn`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorCommentDeleted`.
 
 @see AWSCodecommitGetCommentReactionsInput
 @see AWSCodecommitGetCommentReactionsOutput
 */
- (AWSTask<AWSCodecommitGetCommentReactionsOutput *> *)getCommentReactions:(AWSCodecommitGetCommentReactionsInput *)request;

/**
 <p>Returns information about reactions to a specified comment ID. Reactions from users who have been deleted will not be included in the count.</p>
 
 @param request A container for the necessary parameters to execute the GetCommentReactions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorCommentDoesNotExist`, `AWSCodecommitErrorCommentIdRequired`, `AWSCodecommitErrorInvalidCommentId`, `AWSCodecommitErrorInvalidReactionUserArn`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorCommentDeleted`.
 
 @see AWSCodecommitGetCommentReactionsInput
 @see AWSCodecommitGetCommentReactionsOutput
 */
- (void)getCommentReactions:(AWSCodecommitGetCommentReactionsInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetCommentReactionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about comments made on the comparison between two commits.</p><note><p>Reaction counts might include numbers from user identities who were deleted after the reaction was made. For a count of reactions from active identities, use GetCommentReactions.</p></note>
 
 @param request A container for the necessary parameters to execute the GetCommentsForComparedCommit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetCommentsForComparedCommitOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorCommitIdRequired`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetCommentsForComparedCommitInput
 @see AWSCodecommitGetCommentsForComparedCommitOutput
 */
- (AWSTask<AWSCodecommitGetCommentsForComparedCommitOutput *> *)getCommentsForComparedCommit:(AWSCodecommitGetCommentsForComparedCommitInput *)request;

/**
 <p>Returns information about comments made on the comparison between two commits.</p><note><p>Reaction counts might include numbers from user identities who were deleted after the reaction was made. For a count of reactions from active identities, use GetCommentReactions.</p></note>
 
 @param request A container for the necessary parameters to execute the GetCommentsForComparedCommit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorCommitIdRequired`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetCommentsForComparedCommitInput
 @see AWSCodecommitGetCommentsForComparedCommitOutput
 */
- (void)getCommentsForComparedCommit:(AWSCodecommitGetCommentsForComparedCommitInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetCommentsForComparedCommitOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns comments made on a pull request.</p><note><p>Reaction counts might include numbers from user identities who were deleted after the reaction was made. For a count of reactions from active identities, use GetCommentReactions.</p></note>
 
 @param request A container for the necessary parameters to execute the GetCommentsForPullRequest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetCommentsForPullRequestOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorCommitIdRequired`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorRepositoryNotAssociatedWithPullRequest`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetCommentsForPullRequestInput
 @see AWSCodecommitGetCommentsForPullRequestOutput
 */
- (AWSTask<AWSCodecommitGetCommentsForPullRequestOutput *> *)getCommentsForPullRequest:(AWSCodecommitGetCommentsForPullRequestInput *)request;

/**
 <p>Returns comments made on a pull request.</p><note><p>Reaction counts might include numbers from user identities who were deleted after the reaction was made. For a count of reactions from active identities, use GetCommentReactions.</p></note>
 
 @param request A container for the necessary parameters to execute the GetCommentsForPullRequest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorCommitIdRequired`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorRepositoryNotAssociatedWithPullRequest`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetCommentsForPullRequestInput
 @see AWSCodecommitGetCommentsForPullRequestOutput
 */
- (void)getCommentsForPullRequest:(AWSCodecommitGetCommentsForPullRequestInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetCommentsForPullRequestOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a commit, including commit message and committer information.</p>
 
 @param request A container for the necessary parameters to execute the GetCommit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetCommitOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorCommitIdRequired`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorCommitIdDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetCommitInput
 @see AWSCodecommitGetCommitOutput
 */
- (AWSTask<AWSCodecommitGetCommitOutput *> *)getCommit:(AWSCodecommitGetCommitInput *)request;

/**
 <p>Returns information about a commit, including commit message and committer information.</p>
 
 @param request A container for the necessary parameters to execute the GetCommit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorCommitIdRequired`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorCommitIdDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetCommitInput
 @see AWSCodecommitGetCommitOutput
 */
- (void)getCommit:(AWSCodecommitGetCommitInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetCommitOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the differences in a valid commit specifier (such as a branch, tag, HEAD, commit ID, or other fully qualified reference). Results can be limited to a specified path.</p>
 
 @param request A container for the necessary parameters to execute the GetDifferences service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetDifferencesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorPathDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetDifferencesInput
 @see AWSCodecommitGetDifferencesOutput
 */
- (AWSTask<AWSCodecommitGetDifferencesOutput *> *)getDifferences:(AWSCodecommitGetDifferencesInput *)request;

/**
 <p>Returns information about the differences in a valid commit specifier (such as a branch, tag, HEAD, commit ID, or other fully qualified reference). Results can be limited to a specified path.</p>
 
 @param request A container for the necessary parameters to execute the GetDifferences service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorPathDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetDifferencesInput
 @see AWSCodecommitGetDifferencesOutput
 */
- (void)getDifferences:(AWSCodecommitGetDifferencesInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetDifferencesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the base-64 encoded contents of a specified file and its metadata.</p>
 
 @param request A container for the necessary parameters to execute the GetFile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetFileOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFileDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorFileTooLarge`.
 
 @see AWSCodecommitGetFileInput
 @see AWSCodecommitGetFileOutput
 */
- (AWSTask<AWSCodecommitGetFileOutput *> *)getFile:(AWSCodecommitGetFileInput *)request;

/**
 <p>Returns the base-64 encoded contents of a specified file and its metadata.</p>
 
 @param request A container for the necessary parameters to execute the GetFile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFileDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorFileTooLarge`.
 
 @see AWSCodecommitGetFileInput
 @see AWSCodecommitGetFileOutput
 */
- (void)getFile:(AWSCodecommitGetFileInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetFileOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the contents of a specified folder in a repository.</p>
 
 @param request A container for the necessary parameters to execute the GetFolder service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetFolderOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFolderDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetFolderInput
 @see AWSCodecommitGetFolderOutput
 */
- (AWSTask<AWSCodecommitGetFolderOutput *> *)getFolder:(AWSCodecommitGetFolderInput *)request;

/**
 <p>Returns the contents of a specified folder in a repository.</p>
 
 @param request A container for the necessary parameters to execute the GetFolder service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFolderDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetFolderInput
 @see AWSCodecommitGetFolderOutput
 */
- (void)getFolder:(AWSCodecommitGetFolderInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetFolderOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specified merge commit.</p>
 
 @param request A container for the necessary parameters to execute the GetMergeCommit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetMergeCommitOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetMergeCommitInput
 @see AWSCodecommitGetMergeCommitOutput
 */
- (AWSTask<AWSCodecommitGetMergeCommitOutput *> *)getMergeCommit:(AWSCodecommitGetMergeCommitInput *)request;

/**
 <p>Returns information about a specified merge commit.</p>
 
 @param request A container for the necessary parameters to execute the GetMergeCommit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetMergeCommitInput
 @see AWSCodecommitGetMergeCommitOutput
 */
- (void)getMergeCommit:(AWSCodecommitGetMergeCommitInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetMergeCommitOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about merge conflicts between the before and after commit IDs for a pull request in a repository.</p>
 
 @param request A container for the necessary parameters to execute the GetMergeConflicts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetMergeConflictsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorMergeOptionRequired`, `AWSCodecommitErrorInvalidMergeOption`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorInvalidMaxConflictFiles`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidDestinationCommitSpecifier`, `AWSCodecommitErrorInvalidSourceCommitSpecifier`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetMergeConflictsInput
 @see AWSCodecommitGetMergeConflictsOutput
 */
- (AWSTask<AWSCodecommitGetMergeConflictsOutput *> *)getMergeConflicts:(AWSCodecommitGetMergeConflictsInput *)request;

/**
 <p>Returns information about merge conflicts between the before and after commit IDs for a pull request in a repository.</p>
 
 @param request A container for the necessary parameters to execute the GetMergeConflicts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorMergeOptionRequired`, `AWSCodecommitErrorInvalidMergeOption`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorInvalidMaxConflictFiles`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidDestinationCommitSpecifier`, `AWSCodecommitErrorInvalidSourceCommitSpecifier`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetMergeConflictsInput
 @see AWSCodecommitGetMergeConflictsOutput
 */
- (void)getMergeConflicts:(AWSCodecommitGetMergeConflictsInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetMergeConflictsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the merge options available for merging two specified branches. For details about why a merge option is not available, use GetMergeConflicts or DescribeMergeConflicts.</p>
 
 @param request A container for the necessary parameters to execute the GetMergeOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetMergeOptionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetMergeOptionsInput
 @see AWSCodecommitGetMergeOptionsOutput
 */
- (AWSTask<AWSCodecommitGetMergeOptionsOutput *> *)getMergeOptions:(AWSCodecommitGetMergeOptionsInput *)request;

/**
 <p>Returns information about the merge options available for merging two specified branches. For details about why a merge option is not available, use GetMergeConflicts or DescribeMergeConflicts.</p>
 
 @param request A container for the necessary parameters to execute the GetMergeOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetMergeOptionsInput
 @see AWSCodecommitGetMergeOptionsOutput
 */
- (void)getMergeOptions:(AWSCodecommitGetMergeOptionsInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetMergeOptionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a pull request in a specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetPullRequest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetPullRequestOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetPullRequestInput
 @see AWSCodecommitGetPullRequestOutput
 */
- (AWSTask<AWSCodecommitGetPullRequestOutput *> *)getPullRequest:(AWSCodecommitGetPullRequestInput *)request;

/**
 <p>Gets information about a pull request in a specified repository.</p>
 
 @param request A container for the necessary parameters to execute the GetPullRequest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetPullRequestInput
 @see AWSCodecommitGetPullRequestOutput
 */
- (void)getPullRequest:(AWSCodecommitGetPullRequestInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetPullRequestOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the approval states for a specified pull request. Approval states only apply to pull requests that have one or more approval rules applied to them.</p>
 
 @param request A container for the necessary parameters to execute the GetPullRequestApprovalStates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetPullRequestApprovalStatesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidRevisionId`, `AWSCodecommitErrorRevisionIdRequired`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetPullRequestApprovalStatesInput
 @see AWSCodecommitGetPullRequestApprovalStatesOutput
 */
- (AWSTask<AWSCodecommitGetPullRequestApprovalStatesOutput *> *)getPullRequestApprovalStates:(AWSCodecommitGetPullRequestApprovalStatesInput *)request;

/**
 <p>Gets information about the approval states for a specified pull request. Approval states only apply to pull requests that have one or more approval rules applied to them.</p>
 
 @param request A container for the necessary parameters to execute the GetPullRequestApprovalStates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidRevisionId`, `AWSCodecommitErrorRevisionIdRequired`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetPullRequestApprovalStatesInput
 @see AWSCodecommitGetPullRequestApprovalStatesOutput
 */
- (void)getPullRequestApprovalStates:(AWSCodecommitGetPullRequestApprovalStatesInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetPullRequestApprovalStatesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about whether approval rules have been set aside (overridden) for a pull request, and if so, the Amazon Resource Name (ARN) of the user or identity that overrode the rules and their requirements for the pull request.</p>
 
 @param request A container for the necessary parameters to execute the GetPullRequestOverrideState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetPullRequestOverrideStateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidRevisionId`, `AWSCodecommitErrorRevisionIdRequired`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetPullRequestOverrideStateInput
 @see AWSCodecommitGetPullRequestOverrideStateOutput
 */
- (AWSTask<AWSCodecommitGetPullRequestOverrideStateOutput *> *)getPullRequestOverrideState:(AWSCodecommitGetPullRequestOverrideStateInput *)request;

/**
 <p>Returns information about whether approval rules have been set aside (overridden) for a pull request, and if so, the Amazon Resource Name (ARN) of the user or identity that overrode the rules and their requirements for the pull request.</p>
 
 @param request A container for the necessary parameters to execute the GetPullRequestOverrideState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidRevisionId`, `AWSCodecommitErrorRevisionIdRequired`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetPullRequestOverrideStateInput
 @see AWSCodecommitGetPullRequestOverrideStateOutput
 */
- (void)getPullRequestOverrideState:(AWSCodecommitGetPullRequestOverrideStateInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetPullRequestOverrideStateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a repository.</p><note><p>The description field for a repository accepts all HTML characters and all valid Unicode characters. Applications that do not HTML-encode the description and display it in a webpage can expose users to potentially malicious code. Make sure that you HTML-encode the description field in any application that uses this API to display the repository description on a webpage.</p></note>
 
 @param request A container for the necessary parameters to execute the GetRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetRepositoryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetRepositoryInput
 @see AWSCodecommitGetRepositoryOutput
 */
- (AWSTask<AWSCodecommitGetRepositoryOutput *> *)getRepository:(AWSCodecommitGetRepositoryInput *)request;

/**
 <p>Returns information about a repository.</p><note><p>The description field for a repository accepts all HTML characters and all valid Unicode characters. Applications that do not HTML-encode the description and display it in a webpage can expose users to potentially malicious code. Make sure that you HTML-encode the description field in any application that uses this API to display the repository description on a webpage.</p></note>
 
 @param request A container for the necessary parameters to execute the GetRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetRepositoryInput
 @see AWSCodecommitGetRepositoryOutput
 */
- (void)getRepository:(AWSCodecommitGetRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about triggers configured for a repository.</p>
 
 @param request A container for the necessary parameters to execute the GetRepositoryTriggers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitGetRepositoryTriggersOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetRepositoryTriggersInput
 @see AWSCodecommitGetRepositoryTriggersOutput
 */
- (AWSTask<AWSCodecommitGetRepositoryTriggersOutput *> *)getRepositoryTriggers:(AWSCodecommitGetRepositoryTriggersInput *)request;

/**
 <p>Gets information about triggers configured for a repository.</p>
 
 @param request A container for the necessary parameters to execute the GetRepositoryTriggers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitGetRepositoryTriggersInput
 @see AWSCodecommitGetRepositoryTriggersOutput
 */
- (void)getRepositoryTriggers:(AWSCodecommitGetRepositoryTriggersInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitGetRepositoryTriggersOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all approval rule templates in the specified AWS Region in your AWS account. If an AWS Region is not specified, the AWS Region where you are signed in is used.</p>
 
 @param request A container for the necessary parameters to execute the ListApprovalRuleTemplates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitListApprovalRuleTemplatesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`.
 
 @see AWSCodecommitListApprovalRuleTemplatesInput
 @see AWSCodecommitListApprovalRuleTemplatesOutput
 */
- (AWSTask<AWSCodecommitListApprovalRuleTemplatesOutput *> *)listApprovalRuleTemplates:(AWSCodecommitListApprovalRuleTemplatesInput *)request;

/**
 <p>Lists all approval rule templates in the specified AWS Region in your AWS account. If an AWS Region is not specified, the AWS Region where you are signed in is used.</p>
 
 @param request A container for the necessary parameters to execute the ListApprovalRuleTemplates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`.
 
 @see AWSCodecommitListApprovalRuleTemplatesInput
 @see AWSCodecommitListApprovalRuleTemplatesOutput
 */
- (void)listApprovalRuleTemplates:(AWSCodecommitListApprovalRuleTemplatesInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitListApprovalRuleTemplatesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all approval rule templates that are associated with a specified repository.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociatedApprovalRuleTemplatesForRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryInput
 @see AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput
 */
- (AWSTask<AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput *> *)listAssociatedApprovalRuleTemplatesForRepository:(AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryInput *)request;

/**
 <p>Lists all approval rule templates that are associated with a specified repository.</p>
 
 @param request A container for the necessary parameters to execute the ListAssociatedApprovalRuleTemplatesForRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryInput
 @see AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput
 */
- (void)listAssociatedApprovalRuleTemplatesForRepository:(AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about one or more branches in a repository.</p>
 
 @param request A container for the necessary parameters to execute the ListBranches service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitListBranchesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorInvalidContinuationToken`.
 
 @see AWSCodecommitListBranchesInput
 @see AWSCodecommitListBranchesOutput
 */
- (AWSTask<AWSCodecommitListBranchesOutput *> *)listBranches:(AWSCodecommitListBranchesInput *)request;

/**
 <p>Gets information about one or more branches in a repository.</p>
 
 @param request A container for the necessary parameters to execute the ListBranches service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorInvalidContinuationToken`.
 
 @see AWSCodecommitListBranchesInput
 @see AWSCodecommitListBranchesOutput
 */
- (void)listBranches:(AWSCodecommitListBranchesInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitListBranchesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of pull requests for a specified repository. The return list can be refined by pull request status or pull request author ARN.</p>
 
 @param request A container for the necessary parameters to execute the ListPullRequests service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitListPullRequestsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorInvalidPullRequestStatus`, `AWSCodecommitErrorInvalidAuthorArn`, `AWSCodecommitErrorAuthorDoesNotExist`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitListPullRequestsInput
 @see AWSCodecommitListPullRequestsOutput
 */
- (AWSTask<AWSCodecommitListPullRequestsOutput *> *)listPullRequests:(AWSCodecommitListPullRequestsInput *)request;

/**
 <p>Returns a list of pull requests for a specified repository. The return list can be refined by pull request status or pull request author ARN.</p>
 
 @param request A container for the necessary parameters to execute the ListPullRequests service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorInvalidPullRequestStatus`, `AWSCodecommitErrorInvalidAuthorArn`, `AWSCodecommitErrorAuthorDoesNotExist`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitListPullRequestsInput
 @see AWSCodecommitListPullRequestsOutput
 */
- (void)listPullRequests:(AWSCodecommitListPullRequestsInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitListPullRequestsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about one or more repositories.</p>
 
 @param request A container for the necessary parameters to execute the ListRepositories service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitListRepositoriesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorInvalidSortBy`, `AWSCodecommitErrorInvalidOrder`, `AWSCodecommitErrorInvalidContinuationToken`.
 
 @see AWSCodecommitListRepositoriesInput
 @see AWSCodecommitListRepositoriesOutput
 */
- (AWSTask<AWSCodecommitListRepositoriesOutput *> *)listRepositories:(AWSCodecommitListRepositoriesInput *)request;

/**
 <p>Gets information about one or more repositories.</p>
 
 @param request A container for the necessary parameters to execute the ListRepositories service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorInvalidSortBy`, `AWSCodecommitErrorInvalidOrder`, `AWSCodecommitErrorInvalidContinuationToken`.
 
 @see AWSCodecommitListRepositoriesInput
 @see AWSCodecommitListRepositoriesOutput
 */
- (void)listRepositories:(AWSCodecommitListRepositoriesInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitListRepositoriesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all repositories associated with the specified approval rule template.</p>
 
 @param request A container for the necessary parameters to execute the ListRepositoriesForApprovalRuleTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitListRepositoriesForApprovalRuleTemplateInput
 @see AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput
 */
- (AWSTask<AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput *> *)listRepositoriesForApprovalRuleTemplate:(AWSCodecommitListRepositoriesForApprovalRuleTemplateInput *)request;

/**
 <p>Lists all repositories associated with the specified approval rule template.</p>
 
 @param request A container for the necessary parameters to execute the ListRepositoriesForApprovalRuleTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorInvalidMaxResults`, `AWSCodecommitErrorInvalidContinuationToken`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitListRepositoriesForApprovalRuleTemplateInput
 @see AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput
 */
- (void)listRepositoriesForApprovalRuleTemplate:(AWSCodecommitListRepositoriesForApprovalRuleTemplateInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about AWS tags for a specified Amazon Resource Name (ARN) in AWS CodeCommit. For a list of valid resources in AWS CodeCommit, see <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats">CodeCommit Resources and Operations</a> in the<i> AWS CodeCommit User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitListTagsForResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorResourceArnRequired`, `AWSCodecommitErrorInvalidResourceArn`.
 
 @see AWSCodecommitListTagsForResourceInput
 @see AWSCodecommitListTagsForResourceOutput
 */
- (AWSTask<AWSCodecommitListTagsForResourceOutput *> *)listTagsForResource:(AWSCodecommitListTagsForResourceInput *)request;

/**
 <p>Gets information about AWS tags for a specified Amazon Resource Name (ARN) in AWS CodeCommit. For a list of valid resources in AWS CodeCommit, see <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats">CodeCommit Resources and Operations</a> in the<i> AWS CodeCommit User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorResourceArnRequired`, `AWSCodecommitErrorInvalidResourceArn`.
 
 @see AWSCodecommitListTagsForResourceInput
 @see AWSCodecommitListTagsForResourceOutput
 */
- (void)listTagsForResource:(AWSCodecommitListTagsForResourceInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitListTagsForResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Merges two branches using the fast-forward merge strategy.</p>
 
 @param request A container for the necessary parameters to execute the MergeBranchesByFastForward service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitMergeBranchesByFastForwardOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidTargetBranch`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorBranchNameIsTagName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitMergeBranchesByFastForwardInput
 @see AWSCodecommitMergeBranchesByFastForwardOutput
 */
- (AWSTask<AWSCodecommitMergeBranchesByFastForwardOutput *> *)mergeBranchesByFastForward:(AWSCodecommitMergeBranchesByFastForwardInput *)request;

/**
 <p>Merges two branches using the fast-forward merge strategy.</p>
 
 @param request A container for the necessary parameters to execute the MergeBranchesByFastForward service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidTargetBranch`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorBranchNameIsTagName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitMergeBranchesByFastForwardInput
 @see AWSCodecommitMergeBranchesByFastForwardOutput
 */
- (void)mergeBranchesByFastForward:(AWSCodecommitMergeBranchesByFastForwardInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitMergeBranchesByFastForwardOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Merges two branches using the squash merge strategy.</p>
 
 @param request A container for the necessary parameters to execute the MergeBranchesBySquash service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitMergeBranchesBySquashOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidTargetBranch`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorBranchNameIsTagName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorInvalidConflictResolution`, `AWSCodecommitErrorMaximumConflictResolutionEntriesExceeded`, `AWSCodecommitErrorMultipleConflictResolutionEntries`, `AWSCodecommitErrorReplacementTypeRequired`, `AWSCodecommitErrorInvalidReplacementType`, `AWSCodecommitErrorReplacementContentRequired`, `AWSCodecommitErrorInvalidReplacementContent`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorFileModeRequired`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitMergeBranchesBySquashInput
 @see AWSCodecommitMergeBranchesBySquashOutput
 */
- (AWSTask<AWSCodecommitMergeBranchesBySquashOutput *> *)mergeBranchesBySquash:(AWSCodecommitMergeBranchesBySquashInput *)request;

/**
 <p>Merges two branches using the squash merge strategy.</p>
 
 @param request A container for the necessary parameters to execute the MergeBranchesBySquash service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidTargetBranch`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorBranchNameIsTagName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorInvalidConflictResolution`, `AWSCodecommitErrorMaximumConflictResolutionEntriesExceeded`, `AWSCodecommitErrorMultipleConflictResolutionEntries`, `AWSCodecommitErrorReplacementTypeRequired`, `AWSCodecommitErrorInvalidReplacementType`, `AWSCodecommitErrorReplacementContentRequired`, `AWSCodecommitErrorInvalidReplacementContent`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorFileModeRequired`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitMergeBranchesBySquashInput
 @see AWSCodecommitMergeBranchesBySquashOutput
 */
- (void)mergeBranchesBySquash:(AWSCodecommitMergeBranchesBySquashInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitMergeBranchesBySquashOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Merges two specified branches using the three-way merge strategy.</p>
 
 @param request A container for the necessary parameters to execute the MergeBranchesByThreeWay service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitMergeBranchesByThreeWayOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidTargetBranch`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorBranchNameIsTagName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorInvalidConflictResolution`, `AWSCodecommitErrorMaximumConflictResolutionEntriesExceeded`, `AWSCodecommitErrorMultipleConflictResolutionEntries`, `AWSCodecommitErrorReplacementTypeRequired`, `AWSCodecommitErrorInvalidReplacementType`, `AWSCodecommitErrorReplacementContentRequired`, `AWSCodecommitErrorInvalidReplacementContent`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorFileModeRequired`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitMergeBranchesByThreeWayInput
 @see AWSCodecommitMergeBranchesByThreeWayOutput
 */
- (AWSTask<AWSCodecommitMergeBranchesByThreeWayOutput *> *)mergeBranchesByThreeWay:(AWSCodecommitMergeBranchesByThreeWayInput *)request;

/**
 <p>Merges two specified branches using the three-way merge strategy.</p>
 
 @param request A container for the necessary parameters to execute the MergeBranchesByThreeWay service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorCommitRequired`, `AWSCodecommitErrorInvalidCommit`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidTargetBranch`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorBranchNameIsTagName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorInvalidConflictResolution`, `AWSCodecommitErrorMaximumConflictResolutionEntriesExceeded`, `AWSCodecommitErrorMultipleConflictResolutionEntries`, `AWSCodecommitErrorReplacementTypeRequired`, `AWSCodecommitErrorInvalidReplacementType`, `AWSCodecommitErrorReplacementContentRequired`, `AWSCodecommitErrorInvalidReplacementContent`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorFileModeRequired`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitMergeBranchesByThreeWayInput
 @see AWSCodecommitMergeBranchesByThreeWayOutput
 */
- (void)mergeBranchesByThreeWay:(AWSCodecommitMergeBranchesByThreeWayInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitMergeBranchesByThreeWayOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attempts to merge the source commit of a pull request into the specified destination branch for that pull request at the specified commit using the fast-forward merge strategy. If the merge is successful, it closes the pull request.</p>
 
 @param request A container for the necessary parameters to execute the MergePullRequestByFastForward service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitMergePullRequestByFastForwardOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorTipOfSourceReferenceIsDifferent`, `AWSCodecommitErrorReferenceDoesNotExist`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorRepositoryNotAssociatedWithPullRequest`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorPullRequestApprovalRulesNotSatisfied`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitMergePullRequestByFastForwardInput
 @see AWSCodecommitMergePullRequestByFastForwardOutput
 */
- (AWSTask<AWSCodecommitMergePullRequestByFastForwardOutput *> *)mergePullRequestByFastForward:(AWSCodecommitMergePullRequestByFastForwardInput *)request;

/**
 <p>Attempts to merge the source commit of a pull request into the specified destination branch for that pull request at the specified commit using the fast-forward merge strategy. If the merge is successful, it closes the pull request.</p>
 
 @param request A container for the necessary parameters to execute the MergePullRequestByFastForward service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorTipOfSourceReferenceIsDifferent`, `AWSCodecommitErrorReferenceDoesNotExist`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorRepositoryNotAssociatedWithPullRequest`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorPullRequestApprovalRulesNotSatisfied`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitMergePullRequestByFastForwardInput
 @see AWSCodecommitMergePullRequestByFastForwardOutput
 */
- (void)mergePullRequestByFastForward:(AWSCodecommitMergePullRequestByFastForwardInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitMergePullRequestByFastForwardOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attempts to merge the source commit of a pull request into the specified destination branch for that pull request at the specified commit using the squash merge strategy. If the merge is successful, it closes the pull request.</p>
 
 @param request A container for the necessary parameters to execute the MergePullRequestBySquash service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitMergePullRequestBySquashOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorTipOfSourceReferenceIsDifferent`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorInvalidConflictResolution`, `AWSCodecommitErrorReplacementTypeRequired`, `AWSCodecommitErrorInvalidReplacementType`, `AWSCodecommitErrorMultipleConflictResolutionEntries`, `AWSCodecommitErrorReplacementContentRequired`, `AWSCodecommitErrorMaximumConflictResolutionEntriesExceeded`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorInvalidReplacementContent`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorRepositoryNotAssociatedWithPullRequest`, `AWSCodecommitErrorPullRequestApprovalRulesNotSatisfied`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitMergePullRequestBySquashInput
 @see AWSCodecommitMergePullRequestBySquashOutput
 */
- (AWSTask<AWSCodecommitMergePullRequestBySquashOutput *> *)mergePullRequestBySquash:(AWSCodecommitMergePullRequestBySquashInput *)request;

/**
 <p>Attempts to merge the source commit of a pull request into the specified destination branch for that pull request at the specified commit using the squash merge strategy. If the merge is successful, it closes the pull request.</p>
 
 @param request A container for the necessary parameters to execute the MergePullRequestBySquash service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorTipOfSourceReferenceIsDifferent`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorInvalidConflictResolution`, `AWSCodecommitErrorReplacementTypeRequired`, `AWSCodecommitErrorInvalidReplacementType`, `AWSCodecommitErrorMultipleConflictResolutionEntries`, `AWSCodecommitErrorReplacementContentRequired`, `AWSCodecommitErrorMaximumConflictResolutionEntriesExceeded`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorInvalidReplacementContent`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorRepositoryNotAssociatedWithPullRequest`, `AWSCodecommitErrorPullRequestApprovalRulesNotSatisfied`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitMergePullRequestBySquashInput
 @see AWSCodecommitMergePullRequestBySquashOutput
 */
- (void)mergePullRequestBySquash:(AWSCodecommitMergePullRequestBySquashInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitMergePullRequestBySquashOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attempts to merge the source commit of a pull request into the specified destination branch for that pull request at the specified commit using the three-way merge strategy. If the merge is successful, it closes the pull request.</p>
 
 @param request A container for the necessary parameters to execute the MergePullRequestByThreeWay service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitMergePullRequestByThreeWayOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorTipOfSourceReferenceIsDifferent`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorInvalidConflictResolution`, `AWSCodecommitErrorReplacementTypeRequired`, `AWSCodecommitErrorInvalidReplacementType`, `AWSCodecommitErrorMultipleConflictResolutionEntries`, `AWSCodecommitErrorReplacementContentRequired`, `AWSCodecommitErrorMaximumConflictResolutionEntriesExceeded`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorInvalidReplacementContent`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorRepositoryNotAssociatedWithPullRequest`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorPullRequestApprovalRulesNotSatisfied`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitMergePullRequestByThreeWayInput
 @see AWSCodecommitMergePullRequestByThreeWayOutput
 */
- (AWSTask<AWSCodecommitMergePullRequestByThreeWayOutput *> *)mergePullRequestByThreeWay:(AWSCodecommitMergePullRequestByThreeWayInput *)request;

/**
 <p>Attempts to merge the source commit of a pull request into the specified destination branch for that pull request at the specified commit using the three-way merge strategy. If the merge is successful, it closes the pull request.</p>
 
 @param request A container for the necessary parameters to execute the MergePullRequestByThreeWay service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorManualMergeRequired`, `AWSCodecommitErrorTipOfSourceReferenceIsDifferent`, `AWSCodecommitErrorTipsDivergenceExceeded`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorInvalidConflictDetailLevel`, `AWSCodecommitErrorInvalidConflictResolutionStrategy`, `AWSCodecommitErrorInvalidConflictResolution`, `AWSCodecommitErrorReplacementTypeRequired`, `AWSCodecommitErrorInvalidReplacementType`, `AWSCodecommitErrorMultipleConflictResolutionEntries`, `AWSCodecommitErrorReplacementContentRequired`, `AWSCodecommitErrorMaximumConflictResolutionEntriesExceeded`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorInvalidReplacementContent`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorMaximumFileContentToLoadExceeded`, `AWSCodecommitErrorMaximumItemsToCompareExceeded`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorRepositoryNotAssociatedWithPullRequest`, `AWSCodecommitErrorConcurrentReferenceUpdate`, `AWSCodecommitErrorPullRequestApprovalRulesNotSatisfied`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitMergePullRequestByThreeWayInput
 @see AWSCodecommitMergePullRequestByThreeWayOutput
 */
- (void)mergePullRequestByThreeWay:(AWSCodecommitMergePullRequestByThreeWayInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitMergePullRequestByThreeWayOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets aside (overrides) all approval rule requirements for a specified pull request.</p>
 
 @param request A container for the necessary parameters to execute the OverridePullRequestApprovalRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidRevisionId`, `AWSCodecommitErrorRevisionIdRequired`, `AWSCodecommitErrorInvalidOverrideStatus`, `AWSCodecommitErrorOverrideStatusRequired`, `AWSCodecommitErrorOverrideAlreadySet`, `AWSCodecommitErrorRevisionNotCurrent`, `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitOverridePullRequestApprovalRulesInput
 */
- (AWSTask *)overridePullRequestApprovalRules:(AWSCodecommitOverridePullRequestApprovalRulesInput *)request;

/**
 <p>Sets aside (overrides) all approval rule requirements for a specified pull request.</p>
 
 @param request A container for the necessary parameters to execute the OverridePullRequestApprovalRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidRevisionId`, `AWSCodecommitErrorRevisionIdRequired`, `AWSCodecommitErrorInvalidOverrideStatus`, `AWSCodecommitErrorOverrideStatusRequired`, `AWSCodecommitErrorOverrideAlreadySet`, `AWSCodecommitErrorRevisionNotCurrent`, `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitOverridePullRequestApprovalRulesInput
 */
- (void)overridePullRequestApprovalRules:(AWSCodecommitOverridePullRequestApprovalRulesInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Posts a comment on the comparison between two commits.</p>
 
 @param request A container for the necessary parameters to execute the PostCommentForComparedCommit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitPostCommentForComparedCommitOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorClientRequestTokenRequired`, `AWSCodecommitErrorInvalidClientRequestToken`, `AWSCodecommitErrorIdempotencyParameterMismatch`, `AWSCodecommitErrorCommentContentRequired`, `AWSCodecommitErrorCommentContentSizeLimitExceeded`, `AWSCodecommitErrorInvalidFileLocation`, `AWSCodecommitErrorInvalidRelativeFileVersionEnum`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidFilePosition`, `AWSCodecommitErrorCommitIdRequired`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorBeforeCommitIdAndAfterCommitIdAreSame`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorPathDoesNotExist`, `AWSCodecommitErrorPathRequired`.
 
 @see AWSCodecommitPostCommentForComparedCommitInput
 @see AWSCodecommitPostCommentForComparedCommitOutput
 */
- (AWSTask<AWSCodecommitPostCommentForComparedCommitOutput *> *)postCommentForComparedCommit:(AWSCodecommitPostCommentForComparedCommitInput *)request;

/**
 <p>Posts a comment on the comparison between two commits.</p>
 
 @param request A container for the necessary parameters to execute the PostCommentForComparedCommit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorClientRequestTokenRequired`, `AWSCodecommitErrorInvalidClientRequestToken`, `AWSCodecommitErrorIdempotencyParameterMismatch`, `AWSCodecommitErrorCommentContentRequired`, `AWSCodecommitErrorCommentContentSizeLimitExceeded`, `AWSCodecommitErrorInvalidFileLocation`, `AWSCodecommitErrorInvalidRelativeFileVersionEnum`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidFilePosition`, `AWSCodecommitErrorCommitIdRequired`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorBeforeCommitIdAndAfterCommitIdAreSame`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorPathDoesNotExist`, `AWSCodecommitErrorPathRequired`.
 
 @see AWSCodecommitPostCommentForComparedCommitInput
 @see AWSCodecommitPostCommentForComparedCommitOutput
 */
- (void)postCommentForComparedCommit:(AWSCodecommitPostCommentForComparedCommitInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitPostCommentForComparedCommitOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Posts a comment on a pull request.</p>
 
 @param request A container for the necessary parameters to execute the PostCommentForPullRequest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitPostCommentForPullRequestOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorRepositoryNotAssociatedWithPullRequest`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorClientRequestTokenRequired`, `AWSCodecommitErrorInvalidClientRequestToken`, `AWSCodecommitErrorIdempotencyParameterMismatch`, `AWSCodecommitErrorCommentContentRequired`, `AWSCodecommitErrorCommentContentSizeLimitExceeded`, `AWSCodecommitErrorInvalidFileLocation`, `AWSCodecommitErrorInvalidRelativeFileVersionEnum`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidFilePosition`, `AWSCodecommitErrorCommitIdRequired`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorBeforeCommitIdAndAfterCommitIdAreSame`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorPathDoesNotExist`, `AWSCodecommitErrorPathRequired`.
 
 @see AWSCodecommitPostCommentForPullRequestInput
 @see AWSCodecommitPostCommentForPullRequestOutput
 */
- (AWSTask<AWSCodecommitPostCommentForPullRequestOutput *> *)postCommentForPullRequest:(AWSCodecommitPostCommentForPullRequestInput *)request;

/**
 <p>Posts a comment on a pull request.</p>
 
 @param request A container for the necessary parameters to execute the PostCommentForPullRequest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorRepositoryNotAssociatedWithPullRequest`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorClientRequestTokenRequired`, `AWSCodecommitErrorInvalidClientRequestToken`, `AWSCodecommitErrorIdempotencyParameterMismatch`, `AWSCodecommitErrorCommentContentRequired`, `AWSCodecommitErrorCommentContentSizeLimitExceeded`, `AWSCodecommitErrorInvalidFileLocation`, `AWSCodecommitErrorInvalidRelativeFileVersionEnum`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidFilePosition`, `AWSCodecommitErrorCommitIdRequired`, `AWSCodecommitErrorInvalidCommitId`, `AWSCodecommitErrorBeforeCommitIdAndAfterCommitIdAreSame`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorCommitDoesNotExist`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorPathDoesNotExist`, `AWSCodecommitErrorPathRequired`.
 
 @see AWSCodecommitPostCommentForPullRequestInput
 @see AWSCodecommitPostCommentForPullRequestOutput
 */
- (void)postCommentForPullRequest:(AWSCodecommitPostCommentForPullRequestInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitPostCommentForPullRequestOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Posts a comment in reply to an existing comment on a comparison between commits or a pull request.</p>
 
 @param request A container for the necessary parameters to execute the PostCommentReply service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitPostCommentReplyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorClientRequestTokenRequired`, `AWSCodecommitErrorInvalidClientRequestToken`, `AWSCodecommitErrorIdempotencyParameterMismatch`, `AWSCodecommitErrorCommentContentRequired`, `AWSCodecommitErrorCommentContentSizeLimitExceeded`, `AWSCodecommitErrorCommentDoesNotExist`, `AWSCodecommitErrorCommentIdRequired`, `AWSCodecommitErrorInvalidCommentId`.
 
 @see AWSCodecommitPostCommentReplyInput
 @see AWSCodecommitPostCommentReplyOutput
 */
- (AWSTask<AWSCodecommitPostCommentReplyOutput *> *)postCommentReply:(AWSCodecommitPostCommentReplyInput *)request;

/**
 <p>Posts a comment in reply to an existing comment on a comparison between commits or a pull request.</p>
 
 @param request A container for the necessary parameters to execute the PostCommentReply service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorClientRequestTokenRequired`, `AWSCodecommitErrorInvalidClientRequestToken`, `AWSCodecommitErrorIdempotencyParameterMismatch`, `AWSCodecommitErrorCommentContentRequired`, `AWSCodecommitErrorCommentContentSizeLimitExceeded`, `AWSCodecommitErrorCommentDoesNotExist`, `AWSCodecommitErrorCommentIdRequired`, `AWSCodecommitErrorInvalidCommentId`.
 
 @see AWSCodecommitPostCommentReplyInput
 @see AWSCodecommitPostCommentReplyOutput
 */
- (void)postCommentReply:(AWSCodecommitPostCommentReplyInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitPostCommentReplyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or updates a reaction to a specified comment for the user whose identity is used to make the request. You can only add or update a reaction for yourself. You cannot add, modify, or delete a reaction for another user.</p>
 
 @param request A container for the necessary parameters to execute the PutCommentReaction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorCommentDoesNotExist`, `AWSCodecommitErrorCommentIdRequired`, `AWSCodecommitErrorInvalidCommentId`, `AWSCodecommitErrorInvalidReactionValue`, `AWSCodecommitErrorReactionValueRequired`, `AWSCodecommitErrorReactionLimitExceeded`, `AWSCodecommitErrorCommentDeleted`.
 
 @see AWSCodecommitPutCommentReactionInput
 */
- (AWSTask *)putCommentReaction:(AWSCodecommitPutCommentReactionInput *)request;

/**
 <p>Adds or updates a reaction to a specified comment for the user whose identity is used to make the request. You can only add or update a reaction for yourself. You cannot add, modify, or delete a reaction for another user.</p>
 
 @param request A container for the necessary parameters to execute the PutCommentReaction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorCommentDoesNotExist`, `AWSCodecommitErrorCommentIdRequired`, `AWSCodecommitErrorInvalidCommentId`, `AWSCodecommitErrorInvalidReactionValue`, `AWSCodecommitErrorReactionValueRequired`, `AWSCodecommitErrorReactionLimitExceeded`, `AWSCodecommitErrorCommentDeleted`.
 
 @see AWSCodecommitPutCommentReactionInput
 */
- (void)putCommentReaction:(AWSCodecommitPutCommentReactionInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds or updates a file in a branch in an AWS CodeCommit repository, and generates a commit for the addition in the specified branch.</p>
 
 @param request A container for the necessary parameters to execute the PutFile service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitPutFileOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorParentCommitIdRequired`, `AWSCodecommitErrorInvalidParentCommitId`, `AWSCodecommitErrorParentCommitDoesNotExist`, `AWSCodecommitErrorParentCommitIdOutdated`, `AWSCodecommitErrorFileContentRequired`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorBranchNameIsTagName`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorInvalidDeletionParameter`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorSameFileContent`, `AWSCodecommitErrorFileNameConflictsWithDirectoryName`, `AWSCodecommitErrorDirectoryNameConflictsWithFileName`, `AWSCodecommitErrorFilePathConflictsWithSubmodulePath`.
 
 @see AWSCodecommitPutFileInput
 @see AWSCodecommitPutFileOutput
 */
- (AWSTask<AWSCodecommitPutFileOutput *> *)putFile:(AWSCodecommitPutFileInput *)request;

/**
 <p>Adds or updates a file in a branch in an AWS CodeCommit repository, and generates a commit for the addition in the specified branch.</p>
 
 @param request A container for the necessary parameters to execute the PutFile service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorParentCommitIdRequired`, `AWSCodecommitErrorInvalidParentCommitId`, `AWSCodecommitErrorParentCommitDoesNotExist`, `AWSCodecommitErrorParentCommitIdOutdated`, `AWSCodecommitErrorFileContentRequired`, `AWSCodecommitErrorFileContentSizeLimitExceeded`, `AWSCodecommitErrorFolderContentSizeLimitExceeded`, `AWSCodecommitErrorPathRequired`, `AWSCodecommitErrorInvalidPath`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorBranchNameIsTagName`, `AWSCodecommitErrorInvalidFileMode`, `AWSCodecommitErrorNameLengthExceeded`, `AWSCodecommitErrorInvalidEmail`, `AWSCodecommitErrorCommitMessageLengthExceeded`, `AWSCodecommitErrorInvalidDeletionParameter`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`, `AWSCodecommitErrorSameFileContent`, `AWSCodecommitErrorFileNameConflictsWithDirectoryName`, `AWSCodecommitErrorDirectoryNameConflictsWithFileName`, `AWSCodecommitErrorFilePathConflictsWithSubmodulePath`.
 
 @see AWSCodecommitPutFileInput
 @see AWSCodecommitPutFileOutput
 */
- (void)putFile:(AWSCodecommitPutFileInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitPutFileOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Replaces all triggers for a repository. Used to create or delete triggers.</p>
 
 @param request A container for the necessary parameters to execute the PutRepositoryTriggers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitPutRepositoryTriggersOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryTriggersListRequired`, `AWSCodecommitErrorMaximumRepositoryTriggersExceeded`, `AWSCodecommitErrorInvalidRepositoryTriggerName`, `AWSCodecommitErrorInvalidRepositoryTriggerDestinationArn`, `AWSCodecommitErrorInvalidRepositoryTriggerRegion`, `AWSCodecommitErrorInvalidRepositoryTriggerCustomData`, `AWSCodecommitErrorMaximumBranchesExceeded`, `AWSCodecommitErrorInvalidRepositoryTriggerBranchName`, `AWSCodecommitErrorInvalidRepositoryTriggerEvents`, `AWSCodecommitErrorRepositoryTriggerNameRequired`, `AWSCodecommitErrorRepositoryTriggerDestinationArnRequired`, `AWSCodecommitErrorRepositoryTriggerBranchNameListRequired`, `AWSCodecommitErrorRepositoryTriggerEventsListRequired`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitPutRepositoryTriggersInput
 @see AWSCodecommitPutRepositoryTriggersOutput
 */
- (AWSTask<AWSCodecommitPutRepositoryTriggersOutput *> *)putRepositoryTriggers:(AWSCodecommitPutRepositoryTriggersInput *)request;

/**
 <p>Replaces all triggers for a repository. Used to create or delete triggers.</p>
 
 @param request A container for the necessary parameters to execute the PutRepositoryTriggers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryTriggersListRequired`, `AWSCodecommitErrorMaximumRepositoryTriggersExceeded`, `AWSCodecommitErrorInvalidRepositoryTriggerName`, `AWSCodecommitErrorInvalidRepositoryTriggerDestinationArn`, `AWSCodecommitErrorInvalidRepositoryTriggerRegion`, `AWSCodecommitErrorInvalidRepositoryTriggerCustomData`, `AWSCodecommitErrorMaximumBranchesExceeded`, `AWSCodecommitErrorInvalidRepositoryTriggerBranchName`, `AWSCodecommitErrorInvalidRepositoryTriggerEvents`, `AWSCodecommitErrorRepositoryTriggerNameRequired`, `AWSCodecommitErrorRepositoryTriggerDestinationArnRequired`, `AWSCodecommitErrorRepositoryTriggerBranchNameListRequired`, `AWSCodecommitErrorRepositoryTriggerEventsListRequired`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitPutRepositoryTriggersInput
 @see AWSCodecommitPutRepositoryTriggersOutput
 */
- (void)putRepositoryTriggers:(AWSCodecommitPutRepositoryTriggersInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitPutRepositoryTriggersOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or updates tags for a resource in AWS CodeCommit. For a list of valid resources in AWS CodeCommit, see <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats">CodeCommit Resources and Operations</a> in the <i>AWS CodeCommit User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorResourceArnRequired`, `AWSCodecommitErrorInvalidResourceArn`, `AWSCodecommitErrorTagsMapRequired`, `AWSCodecommitErrorInvalidTagsMap`, `AWSCodecommitErrorTooManyTags`, `AWSCodecommitErrorInvalidSystemTagUsage`, `AWSCodecommitErrorTagPolicy`.
 
 @see AWSCodecommitTagResourceInput
 */
- (AWSTask *)tagResource:(AWSCodecommitTagResourceInput *)request;

/**
 <p>Adds or updates tags for a resource in AWS CodeCommit. For a list of valid resources in AWS CodeCommit, see <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats">CodeCommit Resources and Operations</a> in the <i>AWS CodeCommit User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorResourceArnRequired`, `AWSCodecommitErrorInvalidResourceArn`, `AWSCodecommitErrorTagsMapRequired`, `AWSCodecommitErrorInvalidTagsMap`, `AWSCodecommitErrorTooManyTags`, `AWSCodecommitErrorInvalidSystemTagUsage`, `AWSCodecommitErrorTagPolicy`.
 
 @see AWSCodecommitTagResourceInput
 */
- (void)tagResource:(AWSCodecommitTagResourceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Tests the functionality of repository triggers by sending information to the trigger target. If real data is available in the repository, the test sends data from the last commit. If no data is available, sample data is generated.</p>
 
 @param request A container for the necessary parameters to execute the TestRepositoryTriggers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitTestRepositoryTriggersOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryTriggersListRequired`, `AWSCodecommitErrorMaximumRepositoryTriggersExceeded`, `AWSCodecommitErrorInvalidRepositoryTriggerName`, `AWSCodecommitErrorInvalidRepositoryTriggerDestinationArn`, `AWSCodecommitErrorInvalidRepositoryTriggerRegion`, `AWSCodecommitErrorInvalidRepositoryTriggerCustomData`, `AWSCodecommitErrorMaximumBranchesExceeded`, `AWSCodecommitErrorInvalidRepositoryTriggerBranchName`, `AWSCodecommitErrorInvalidRepositoryTriggerEvents`, `AWSCodecommitErrorRepositoryTriggerNameRequired`, `AWSCodecommitErrorRepositoryTriggerDestinationArnRequired`, `AWSCodecommitErrorRepositoryTriggerBranchNameListRequired`, `AWSCodecommitErrorRepositoryTriggerEventsListRequired`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitTestRepositoryTriggersInput
 @see AWSCodecommitTestRepositoryTriggersOutput
 */
- (AWSTask<AWSCodecommitTestRepositoryTriggersOutput *> *)testRepositoryTriggers:(AWSCodecommitTestRepositoryTriggersInput *)request;

/**
 <p>Tests the functionality of repository triggers by sending information to the trigger target. If real data is available in the repository, the test sends data from the last commit. If no data is available, sample data is generated.</p>
 
 @param request A container for the necessary parameters to execute the TestRepositoryTriggers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorRepositoryTriggersListRequired`, `AWSCodecommitErrorMaximumRepositoryTriggersExceeded`, `AWSCodecommitErrorInvalidRepositoryTriggerName`, `AWSCodecommitErrorInvalidRepositoryTriggerDestinationArn`, `AWSCodecommitErrorInvalidRepositoryTriggerRegion`, `AWSCodecommitErrorInvalidRepositoryTriggerCustomData`, `AWSCodecommitErrorMaximumBranchesExceeded`, `AWSCodecommitErrorInvalidRepositoryTriggerBranchName`, `AWSCodecommitErrorInvalidRepositoryTriggerEvents`, `AWSCodecommitErrorRepositoryTriggerNameRequired`, `AWSCodecommitErrorRepositoryTriggerDestinationArnRequired`, `AWSCodecommitErrorRepositoryTriggerBranchNameListRequired`, `AWSCodecommitErrorRepositoryTriggerEventsListRequired`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitTestRepositoryTriggersInput
 @see AWSCodecommitTestRepositoryTriggersOutput
 */
- (void)testRepositoryTriggers:(AWSCodecommitTestRepositoryTriggersInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitTestRepositoryTriggersOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags for a resource in AWS CodeCommit. For a list of valid resources in AWS CodeCommit, see <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats">CodeCommit Resources and Operations</a> in the <i>AWS CodeCommit User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorResourceArnRequired`, `AWSCodecommitErrorInvalidResourceArn`, `AWSCodecommitErrorTagKeysListRequired`, `AWSCodecommitErrorInvalidTagKeysList`, `AWSCodecommitErrorTooManyTags`, `AWSCodecommitErrorInvalidSystemTagUsage`, `AWSCodecommitErrorTagPolicy`.
 
 @see AWSCodecommitUntagResourceInput
 */
- (AWSTask *)untagResource:(AWSCodecommitUntagResourceInput *)request;

/**
 <p>Removes tags for a resource in AWS CodeCommit. For a list of valid resources in AWS CodeCommit, see <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats">CodeCommit Resources and Operations</a> in the <i>AWS CodeCommit User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorResourceArnRequired`, `AWSCodecommitErrorInvalidResourceArn`, `AWSCodecommitErrorTagKeysListRequired`, `AWSCodecommitErrorInvalidTagKeysList`, `AWSCodecommitErrorTooManyTags`, `AWSCodecommitErrorInvalidSystemTagUsage`, `AWSCodecommitErrorTagPolicy`.
 
 @see AWSCodecommitUntagResourceInput
 */
- (void)untagResource:(AWSCodecommitUntagResourceInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the content of an approval rule template. You can change the number of required approvals, the membership of the approval rule, and whether an approval pool is defined.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApprovalRuleTemplateContent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitUpdateApprovalRuleTemplateContentOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorInvalidApprovalRuleTemplateContent`, `AWSCodecommitErrorInvalidRuleContentSha256`, `AWSCodecommitErrorApprovalRuleTemplateContentRequired`.
 
 @see AWSCodecommitUpdateApprovalRuleTemplateContentInput
 @see AWSCodecommitUpdateApprovalRuleTemplateContentOutput
 */
- (AWSTask<AWSCodecommitUpdateApprovalRuleTemplateContentOutput *> *)updateApprovalRuleTemplateContent:(AWSCodecommitUpdateApprovalRuleTemplateContentInput *)request;

/**
 <p>Updates the content of an approval rule template. You can change the number of required approvals, the membership of the approval rule, and whether an approval pool is defined.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApprovalRuleTemplateContent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorInvalidApprovalRuleTemplateContent`, `AWSCodecommitErrorInvalidRuleContentSha256`, `AWSCodecommitErrorApprovalRuleTemplateContentRequired`.
 
 @see AWSCodecommitUpdateApprovalRuleTemplateContentInput
 @see AWSCodecommitUpdateApprovalRuleTemplateContentOutput
 */
- (void)updateApprovalRuleTemplateContent:(AWSCodecommitUpdateApprovalRuleTemplateContentInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitUpdateApprovalRuleTemplateContentOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the description for a specified approval rule template.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApprovalRuleTemplateDescription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorInvalidApprovalRuleTemplateDescription`.
 
 @see AWSCodecommitUpdateApprovalRuleTemplateDescriptionInput
 @see AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput
 */
- (AWSTask<AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput *> *)updateApprovalRuleTemplateDescription:(AWSCodecommitUpdateApprovalRuleTemplateDescriptionInput *)request;

/**
 <p>Updates the description for a specified approval rule template.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApprovalRuleTemplateDescription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorInvalidApprovalRuleTemplateDescription`.
 
 @see AWSCodecommitUpdateApprovalRuleTemplateDescriptionInput
 @see AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput
 */
- (void)updateApprovalRuleTemplateDescription:(AWSCodecommitUpdateApprovalRuleTemplateDescriptionInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the name of a specified approval rule template.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApprovalRuleTemplateName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitUpdateApprovalRuleTemplateNameOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorApprovalRuleTemplateNameAlreadyExists`.
 
 @see AWSCodecommitUpdateApprovalRuleTemplateNameInput
 @see AWSCodecommitUpdateApprovalRuleTemplateNameOutput
 */
- (AWSTask<AWSCodecommitUpdateApprovalRuleTemplateNameOutput *> *)updateApprovalRuleTemplateName:(AWSCodecommitUpdateApprovalRuleTemplateNameInput *)request;

/**
 <p>Updates the name of a specified approval rule template.</p>
 
 @param request A container for the necessary parameters to execute the UpdateApprovalRuleTemplateName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorInvalidApprovalRuleTemplateName`, `AWSCodecommitErrorApprovalRuleTemplateNameRequired`, `AWSCodecommitErrorApprovalRuleTemplateDoesNotExist`, `AWSCodecommitErrorApprovalRuleTemplateNameAlreadyExists`.
 
 @see AWSCodecommitUpdateApprovalRuleTemplateNameInput
 @see AWSCodecommitUpdateApprovalRuleTemplateNameOutput
 */
- (void)updateApprovalRuleTemplateName:(AWSCodecommitUpdateApprovalRuleTemplateNameInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitUpdateApprovalRuleTemplateNameOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Replaces the contents of a comment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateComment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitUpdateCommentOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorCommentContentRequired`, `AWSCodecommitErrorCommentContentSizeLimitExceeded`, `AWSCodecommitErrorCommentDoesNotExist`, `AWSCodecommitErrorCommentIdRequired`, `AWSCodecommitErrorInvalidCommentId`, `AWSCodecommitErrorCommentNotCreatedByCaller`, `AWSCodecommitErrorCommentDeleted`.
 
 @see AWSCodecommitUpdateCommentInput
 @see AWSCodecommitUpdateCommentOutput
 */
- (AWSTask<AWSCodecommitUpdateCommentOutput *> *)updateComment:(AWSCodecommitUpdateCommentInput *)request;

/**
 <p>Replaces the contents of a comment.</p>
 
 @param request A container for the necessary parameters to execute the UpdateComment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorCommentContentRequired`, `AWSCodecommitErrorCommentContentSizeLimitExceeded`, `AWSCodecommitErrorCommentDoesNotExist`, `AWSCodecommitErrorCommentIdRequired`, `AWSCodecommitErrorInvalidCommentId`, `AWSCodecommitErrorCommentNotCreatedByCaller`, `AWSCodecommitErrorCommentDeleted`.
 
 @see AWSCodecommitUpdateCommentInput
 @see AWSCodecommitUpdateCommentOutput
 */
- (void)updateComment:(AWSCodecommitUpdateCommentInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitUpdateCommentOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets or changes the default branch name for the specified repository.</p><note><p>If you use this operation to change the default branch name to the current default branch name, a success message is returned even though the default branch did not change.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateDefaultBranch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitUpdateDefaultBranchInput
 */
- (AWSTask *)updateDefaultBranch:(AWSCodecommitUpdateDefaultBranchInput *)request;

/**
 <p>Sets or changes the default branch name for the specified repository.</p><note><p>If you use this operation to change the default branch name to the current default branch name, a success message is returned even though the default branch did not change.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateDefaultBranch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorBranchNameRequired`, `AWSCodecommitErrorInvalidBranchName`, `AWSCodecommitErrorBranchDoesNotExist`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitUpdateDefaultBranchInput
 */
- (void)updateDefaultBranch:(AWSCodecommitUpdateDefaultBranchInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the structure of an approval rule created specifically for a pull request. For example, you can change the number of required approvers and the approval pool for approvers. </p>
 
 @param request A container for the necessary parameters to execute the UpdatePullRequestApprovalRuleContent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitUpdatePullRequestApprovalRuleContentOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorApprovalRuleNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleName`, `AWSCodecommitErrorApprovalRuleDoesNotExist`, `AWSCodecommitErrorInvalidRuleContentSha256`, `AWSCodecommitErrorApprovalRuleContentRequired`, `AWSCodecommitErrorInvalidApprovalRuleContent`, `AWSCodecommitErrorCannotModifyApprovalRuleFromTemplate`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitUpdatePullRequestApprovalRuleContentInput
 @see AWSCodecommitUpdatePullRequestApprovalRuleContentOutput
 */
- (AWSTask<AWSCodecommitUpdatePullRequestApprovalRuleContentOutput *> *)updatePullRequestApprovalRuleContent:(AWSCodecommitUpdatePullRequestApprovalRuleContentInput *)request;

/**
 <p>Updates the structure of an approval rule created specifically for a pull request. For example, you can change the number of required approvers and the approval pool for approvers. </p>
 
 @param request A container for the necessary parameters to execute the UpdatePullRequestApprovalRuleContent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorApprovalRuleNameRequired`, `AWSCodecommitErrorInvalidApprovalRuleName`, `AWSCodecommitErrorApprovalRuleDoesNotExist`, `AWSCodecommitErrorInvalidRuleContentSha256`, `AWSCodecommitErrorApprovalRuleContentRequired`, `AWSCodecommitErrorInvalidApprovalRuleContent`, `AWSCodecommitErrorCannotModifyApprovalRuleFromTemplate`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitUpdatePullRequestApprovalRuleContentInput
 @see AWSCodecommitUpdatePullRequestApprovalRuleContentOutput
 */
- (void)updatePullRequestApprovalRuleContent:(AWSCodecommitUpdatePullRequestApprovalRuleContentInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitUpdatePullRequestApprovalRuleContentOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the state of a user's approval on a pull request. The user is derived from the signed-in account when the request is made.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePullRequestApprovalState service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidRevisionId`, `AWSCodecommitErrorRevisionIdRequired`, `AWSCodecommitErrorInvalidApprovalState`, `AWSCodecommitErrorApprovalStateRequired`, `AWSCodecommitErrorPullRequestCannotBeApprovedByAuthor`, `AWSCodecommitErrorRevisionNotCurrent`, `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorMaximumNumberOfApprovalsExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitUpdatePullRequestApprovalStateInput
 */
- (AWSTask *)updatePullRequestApprovalState:(AWSCodecommitUpdatePullRequestApprovalStateInput *)request;

/**
 <p>Updates the state of a user's approval on a pull request. The user is derived from the signed-in account when the request is made.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePullRequestApprovalState service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidRevisionId`, `AWSCodecommitErrorRevisionIdRequired`, `AWSCodecommitErrorInvalidApprovalState`, `AWSCodecommitErrorApprovalStateRequired`, `AWSCodecommitErrorPullRequestCannotBeApprovedByAuthor`, `AWSCodecommitErrorRevisionNotCurrent`, `AWSCodecommitErrorPullRequestAlreadyClosed`, `AWSCodecommitErrorMaximumNumberOfApprovalsExceeded`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitUpdatePullRequestApprovalStateInput
 */
- (void)updatePullRequestApprovalState:(AWSCodecommitUpdatePullRequestApprovalStateInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Replaces the contents of the description of a pull request.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePullRequestDescription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitUpdatePullRequestDescriptionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidDescription`, `AWSCodecommitErrorPullRequestAlreadyClosed`.
 
 @see AWSCodecommitUpdatePullRequestDescriptionInput
 @see AWSCodecommitUpdatePullRequestDescriptionOutput
 */
- (AWSTask<AWSCodecommitUpdatePullRequestDescriptionOutput *> *)updatePullRequestDescription:(AWSCodecommitUpdatePullRequestDescriptionInput *)request;

/**
 <p>Replaces the contents of the description of a pull request.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePullRequestDescription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidDescription`, `AWSCodecommitErrorPullRequestAlreadyClosed`.
 
 @see AWSCodecommitUpdatePullRequestDescriptionInput
 @see AWSCodecommitUpdatePullRequestDescriptionOutput
 */
- (void)updatePullRequestDescription:(AWSCodecommitUpdatePullRequestDescriptionInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitUpdatePullRequestDescriptionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the status of a pull request. </p>
 
 @param request A container for the necessary parameters to execute the UpdatePullRequestStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitUpdatePullRequestStatusOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidPullRequestStatusUpdate`, `AWSCodecommitErrorInvalidPullRequestStatus`, `AWSCodecommitErrorPullRequestStatusRequired`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitUpdatePullRequestStatusInput
 @see AWSCodecommitUpdatePullRequestStatusOutput
 */
- (AWSTask<AWSCodecommitUpdatePullRequestStatusOutput *> *)updatePullRequestStatus:(AWSCodecommitUpdatePullRequestStatusInput *)request;

/**
 <p>Updates the status of a pull request. </p>
 
 @param request A container for the necessary parameters to execute the UpdatePullRequestStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorInvalidPullRequestStatusUpdate`, `AWSCodecommitErrorInvalidPullRequestStatus`, `AWSCodecommitErrorPullRequestStatusRequired`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitUpdatePullRequestStatusInput
 @see AWSCodecommitUpdatePullRequestStatusOutput
 */
- (void)updatePullRequestStatus:(AWSCodecommitUpdatePullRequestStatusInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitUpdatePullRequestStatusOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Replaces the title of a pull request.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePullRequestTitle service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodecommitUpdatePullRequestTitleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorTitleRequired`, `AWSCodecommitErrorInvalidTitle`, `AWSCodecommitErrorPullRequestAlreadyClosed`.
 
 @see AWSCodecommitUpdatePullRequestTitleInput
 @see AWSCodecommitUpdatePullRequestTitleOutput
 */
- (AWSTask<AWSCodecommitUpdatePullRequestTitleOutput *> *)updatePullRequestTitle:(AWSCodecommitUpdatePullRequestTitleInput *)request;

/**
 <p>Replaces the title of a pull request.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePullRequestTitle service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorPullRequestDoesNotExist`, `AWSCodecommitErrorInvalidPullRequestId`, `AWSCodecommitErrorPullRequestIdRequired`, `AWSCodecommitErrorTitleRequired`, `AWSCodecommitErrorInvalidTitle`, `AWSCodecommitErrorPullRequestAlreadyClosed`.
 
 @see AWSCodecommitUpdatePullRequestTitleInput
 @see AWSCodecommitUpdatePullRequestTitleOutput
 */
- (void)updatePullRequestTitle:(AWSCodecommitUpdatePullRequestTitleInput *)request completionHandler:(void (^ _Nullable)(AWSCodecommitUpdatePullRequestTitleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets or changes the comment or description for a repository.</p><note><p>The description field for a repository accepts all HTML characters and all valid Unicode characters. Applications that do not HTML-encode the description and display it in a webpage can expose users to potentially malicious code. Make sure that you HTML-encode the description field in any application that uses this API to display the repository description on a webpage.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateRepositoryDescription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorInvalidRepositoryDescription`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitUpdateRepositoryDescriptionInput
 */
- (AWSTask *)updateRepositoryDescription:(AWSCodecommitUpdateRepositoryDescriptionInput *)request;

/**
 <p>Sets or changes the comment or description for a repository.</p><note><p>The description field for a repository accepts all HTML characters and all valid Unicode characters. Applications that do not HTML-encode the description and display it in a webpage can expose users to potentially malicious code. Make sure that you HTML-encode the description field in any application that uses this API to display the repository description on a webpage.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateRepositoryDescription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorInvalidRepositoryName`, `AWSCodecommitErrorInvalidRepositoryDescription`, `AWSCodecommitErrorEncryptionIntegrityChecksFailed`, `AWSCodecommitErrorEncryptionKeyAccessDenied`, `AWSCodecommitErrorEncryptionKeyDisabled`, `AWSCodecommitErrorEncryptionKeyNotFound`, `AWSCodecommitErrorEncryptionKeyUnavailable`.
 
 @see AWSCodecommitUpdateRepositoryDescriptionInput
 */
- (void)updateRepositoryDescription:(AWSCodecommitUpdateRepositoryDescriptionInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Renames a repository. The repository name must be unique across the calling AWS account. Repository names are limited to 100 alphanumeric, dash, and underscore characters, and cannot include certain characters. The suffix .git is prohibited. For more information about the limits on repository names, see <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html">Limits</a> in the AWS CodeCommit User Guide.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRepositoryName service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorRepositoryNameExists`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`.
 
 @see AWSCodecommitUpdateRepositoryNameInput
 */
- (AWSTask *)updateRepositoryName:(AWSCodecommitUpdateRepositoryNameInput *)request;

/**
 <p>Renames a repository. The repository name must be unique across the calling AWS account. Repository names are limited to 100 alphanumeric, dash, and underscore characters, and cannot include certain characters. The suffix .git is prohibited. For more information about the limits on repository names, see <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html">Limits</a> in the AWS CodeCommit User Guide.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRepositoryName service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodecommitErrorDomain` domain and the following error code: `AWSCodecommitErrorRepositoryDoesNotExist`, `AWSCodecommitErrorRepositoryNameExists`, `AWSCodecommitErrorRepositoryNameRequired`, `AWSCodecommitErrorInvalidRepositoryName`.
 
 @see AWSCodecommitUpdateRepositoryNameInput
 */
- (void)updateRepositoryName:(AWSCodecommitUpdateRepositoryNameInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
