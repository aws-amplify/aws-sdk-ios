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

FOUNDATION_EXPORT NSString *const AWSAWSCodeStarconnectionsErrorDomain;

typedef NS_ENUM(NSInteger, AWSAWSCodeStarconnectionsErrorType) {
    AWSAWSCodeStarconnectionsErrorUnknown,
    AWSAWSCodeStarconnectionsErrorLimitExceeded,
    AWSAWSCodeStarconnectionsErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSAWSCodeStarconnectionsConnectionStatus) {
    AWSAWSCodeStarconnectionsConnectionStatusUnknown,
    AWSAWSCodeStarconnectionsConnectionStatusPending,
    AWSAWSCodeStarconnectionsConnectionStatusAvailable,
    AWSAWSCodeStarconnectionsConnectionStatusError,
};

typedef NS_ENUM(NSInteger, AWSAWSCodeStarconnectionsProviderType) {
    AWSAWSCodeStarconnectionsProviderTypeUnknown,
    AWSAWSCodeStarconnectionsProviderTypeBitbucket,
};

@class AWSAWSCodeStarconnectionsConnection;
@class AWSAWSCodeStarconnectionsCreateConnectionInput;
@class AWSAWSCodeStarconnectionsCreateConnectionOutput;
@class AWSAWSCodeStarconnectionsDeleteConnectionInput;
@class AWSAWSCodeStarconnectionsDeleteConnectionOutput;
@class AWSAWSCodeStarconnectionsGetConnectionInput;
@class AWSAWSCodeStarconnectionsGetConnectionOutput;
@class AWSAWSCodeStarconnectionsListConnectionsInput;
@class AWSAWSCodeStarconnectionsListConnectionsOutput;
@class AWSAWSCodeStarconnectionsListTagsForResourceInput;
@class AWSAWSCodeStarconnectionsListTagsForResourceOutput;
@class AWSAWSCodeStarconnectionsTag;
@class AWSAWSCodeStarconnectionsTagResourceInput;
@class AWSAWSCodeStarconnectionsTagResourceOutput;
@class AWSAWSCodeStarconnectionsUntagResourceInput;
@class AWSAWSCodeStarconnectionsUntagResourceOutput;

/**
 <p>The AWS::CodeStarConnections::Connection resource can be used to connect external source providers with services like AWS CodePipeline.</p><p>Note: A connection created through CloudFormation is in `PENDING` status by default. You can make its status `AVAILABLE` by editing the connection in the CodePipeline console.</p>
 */
@interface AWSAWSCodeStarconnectionsConnection : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the connection. The ARN is used as the connection reference when the connection is shared between AWS services.</p><note><p>The ARN is never reused if the connection is deleted.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable connectionArn;

/**
 <p>The name of the connection. Connection names must be unique in an AWS user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionName;

/**
 <p>The current status of the connection. </p>
 */
@property (nonatomic, assign) AWSAWSCodeStarconnectionsConnectionStatus connectionStatus;

/**
 <p>The identifier of the external provider where your third-party code repository is configured. For Bitbucket, this is the account ID of the owner of the Bitbucket repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccountId;

/**
 <p>The name of the external provider where your third-party code repository is configured. Currently, the valid provider type is Bitbucket.</p>
 */
@property (nonatomic, assign) AWSAWSCodeStarconnectionsProviderType providerType;

@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsCreateConnectionInput : AWSRequest


/**
 <p>The name of the connection to be created. The name must be unique in the calling AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionName;

/**
 <p>The name of the external provider where your third-party code repository is configured. Currently, the valid provider type is Bitbucket.</p>
 */
@property (nonatomic, assign) AWSAWSCodeStarconnectionsProviderType providerType;

/**
 <p>The key-value pair to use when tagging the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSCodeStarconnectionsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsCreateConnectionOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the connection to be created. The ARN is used as the connection reference when the connection is shared between AWS services.</p><note><p>The ARN is never reused if the connection is deleted.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable connectionArn;

/**
 <p>Specifies the tags applied to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSCodeStarconnectionsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsDeleteConnectionInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the connection to be deleted.</p><note><p>The ARN is never reused if the connection is deleted.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable connectionArn;

@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsDeleteConnectionOutput : AWSModel


@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsGetConnectionInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of a connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionArn;

@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsGetConnectionOutput : AWSModel


/**
 <p>The connection details, such as status, owner, and provider type.</p>
 */
@property (nonatomic, strong) AWSAWSCodeStarconnectionsConnection * _Nullable connection;

@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsListConnectionsInput : AWSRequest


/**
 <p>The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token that was returned from the previous <code>ListConnections</code> call, which can be used to return the next set of connections in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Filters the list of connections to those associated with a specified provider, such as Bitbucket.</p>
 */
@property (nonatomic, assign) AWSAWSCodeStarconnectionsProviderType providerTypeFilter;

@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsListConnectionsOutput : AWSModel


/**
 <p>A list of connections and the details for each connection, such as status, owner, and provider type.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSCodeStarconnectionsConnection *> * _Nullable connections;

/**
 <p>A token that can be used in the next <code>ListConnections</code> call. To view all items in the list, continue to call this operation with each subsequent token until no more <code>nextToken</code> values are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsListTagsForResourceInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource for which you want to get information about tags, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsListTagsForResourceOutput : AWSModel


/**
 <p>A list of tag key and value pairs associated with the specified resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSCodeStarconnectionsTag *> * _Nullable tags;

@end

/**
 <p>A tag is a key-value pair that is used to manage the resource.</p><p>This tag is available for use by AWS services that support tags.</p>
 Required parameters: [Key, Value]
 */
@interface AWSAWSCodeStarconnectionsTag : AWSModel


/**
 <p>The tag's key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The tag's value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsTagResourceInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource to which you want to add or update tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags you want to modify or add to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSCodeStarconnectionsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsTagResourceOutput : AWSModel


@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsUntagResourceInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource to remove tags from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The list of keys for the tags to be removed from the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSAWSCodeStarconnectionsUntagResourceOutput : AWSModel


@end

NS_ASSUME_NONNULL_END
