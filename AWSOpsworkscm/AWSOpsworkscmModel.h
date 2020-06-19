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

FOUNDATION_EXPORT NSString *const AWSOpsworkscmErrorDomain;

typedef NS_ENUM(NSInteger, AWSOpsworkscmErrorType) {
    AWSOpsworkscmErrorUnknown,
    AWSOpsworkscmErrorInvalidNextToken,
    AWSOpsworkscmErrorInvalidState,
    AWSOpsworkscmErrorLimitExceeded,
    AWSOpsworkscmErrorResourceAlreadyExists,
    AWSOpsworkscmErrorResourceNotFound,
    AWSOpsworkscmErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSOpsworkscmBackupStatus) {
    AWSOpsworkscmBackupStatusUnknown,
    AWSOpsworkscmBackupStatusInProgress,
    AWSOpsworkscmBackupStatusOK,
    AWSOpsworkscmBackupStatusFailed,
    AWSOpsworkscmBackupStatusDeleting,
};

typedef NS_ENUM(NSInteger, AWSOpsworkscmBackupType) {
    AWSOpsworkscmBackupTypeUnknown,
    AWSOpsworkscmBackupTypeAutomated,
    AWSOpsworkscmBackupTypeManual,
};

typedef NS_ENUM(NSInteger, AWSOpsworkscmMaintenanceStatus) {
    AWSOpsworkscmMaintenanceStatusUnknown,
    AWSOpsworkscmMaintenanceStatusSuccess,
    AWSOpsworkscmMaintenanceStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSOpsworkscmNodeAssociationStatus) {
    AWSOpsworkscmNodeAssociationStatusUnknown,
    AWSOpsworkscmNodeAssociationStatusSuccess,
    AWSOpsworkscmNodeAssociationStatusFailed,
    AWSOpsworkscmNodeAssociationStatusInProgress,
};

typedef NS_ENUM(NSInteger, AWSOpsworkscmServerStatus) {
    AWSOpsworkscmServerStatusUnknown,
    AWSOpsworkscmServerStatusBackingUp,
    AWSOpsworkscmServerStatusConnectionLost,
    AWSOpsworkscmServerStatusCreating,
    AWSOpsworkscmServerStatusDeleting,
    AWSOpsworkscmServerStatusModifying,
    AWSOpsworkscmServerStatusFailed,
    AWSOpsworkscmServerStatusHealthy,
    AWSOpsworkscmServerStatusRunning,
    AWSOpsworkscmServerStatusRestoring,
    AWSOpsworkscmServerStatusSetup,
    AWSOpsworkscmServerStatusUnderMaintenance,
    AWSOpsworkscmServerStatusUnhealthy,
    AWSOpsworkscmServerStatusTerminated,
};

@class AWSOpsworkscmAccountAttribute;
@class AWSOpsworkscmAssociateNodeRequest;
@class AWSOpsworkscmAssociateNodeResponse;
@class AWSOpsworkscmBackup;
@class AWSOpsworkscmCreateBackupRequest;
@class AWSOpsworkscmCreateBackupResponse;
@class AWSOpsworkscmCreateServerRequest;
@class AWSOpsworkscmCreateServerResponse;
@class AWSOpsworkscmDeleteBackupRequest;
@class AWSOpsworkscmDeleteBackupResponse;
@class AWSOpsworkscmDeleteServerRequest;
@class AWSOpsworkscmDeleteServerResponse;
@class AWSOpsworkscmDescribeAccountAttributesRequest;
@class AWSOpsworkscmDescribeAccountAttributesResponse;
@class AWSOpsworkscmDescribeBackupsRequest;
@class AWSOpsworkscmDescribeBackupsResponse;
@class AWSOpsworkscmDescribeEventsRequest;
@class AWSOpsworkscmDescribeEventsResponse;
@class AWSOpsworkscmDescribeNodeAssociationStatusRequest;
@class AWSOpsworkscmDescribeNodeAssociationStatusResponse;
@class AWSOpsworkscmDescribeServersRequest;
@class AWSOpsworkscmDescribeServersResponse;
@class AWSOpsworkscmDisassociateNodeRequest;
@class AWSOpsworkscmDisassociateNodeResponse;
@class AWSOpsworkscmEngineAttribute;
@class AWSOpsworkscmExportServerEngineAttributeRequest;
@class AWSOpsworkscmExportServerEngineAttributeResponse;
@class AWSOpsworkscmListTagsForResourceRequest;
@class AWSOpsworkscmListTagsForResourceResponse;
@class AWSOpsworkscmRestoreServerRequest;
@class AWSOpsworkscmRestoreServerResponse;
@class AWSOpsworkscmServer;
@class AWSOpsworkscmServerEvent;
@class AWSOpsworkscmStartMaintenanceRequest;
@class AWSOpsworkscmStartMaintenanceResponse;
@class AWSOpsworkscmTag;
@class AWSOpsworkscmTagResourceRequest;
@class AWSOpsworkscmTagResourceResponse;
@class AWSOpsworkscmUntagResourceRequest;
@class AWSOpsworkscmUntagResourceResponse;
@class AWSOpsworkscmUpdateServerEngineAttributesRequest;
@class AWSOpsworkscmUpdateServerEngineAttributesResponse;
@class AWSOpsworkscmUpdateServerRequest;
@class AWSOpsworkscmUpdateServerResponse;

/**
 <p>Stores account attributes. </p>
 */
@interface AWSOpsworkscmAccountAttribute : AWSModel


/**
 <p> The maximum allowed value. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximum;

/**
 <p> The attribute name. The following are supported attribute names. </p><ul><li><p><i>ServerLimit:</i> The number of current servers/maximum number of servers allowed. By default, you can have a maximum of 10 servers. </p></li><li><p><i>ManualBackupLimit:</i> The number of current manual backups/maximum number of backups allowed. By default, you can have a maximum of 50 manual backups saved. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The current usage, such as the current number of servers that are associated with the account. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable used;

@end

/**
 
 */
@interface AWSOpsworkscmAssociateNodeRequest : AWSRequest


/**
 <p>Engine attributes used for associating the node. </p><p class="title"><b>Attributes accepted in a AssociateNode request for Chef</b></p><ul><li><p><code>CHEF_ORGANIZATION</code>: The Chef organization with which the node is associated. By default only one organization named <code>default</code> can exist. </p></li><li><p><code>CHEF_NODE_PUBLIC_KEY</code>: A PEM-formatted public key. This key is required for the <code>chef-client</code> agent to access the Chef API. </p></li></ul><p class="title"><b>Attributes accepted in a AssociateNode request for Puppet</b></p><ul><li><p><code>PUPPET_NODE_CSR</code>: A PEM-formatted certificate-signing request (CSR) that is created by the node. </p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmEngineAttribute *> * _Nullable engineAttributes;

/**
 <p>The name of the node. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeName;

/**
 <p>The name of the server with which to associate the node. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmAssociateNodeResponse : AWSModel


/**
 <p>Contains a token which can be passed to the <code>DescribeNodeAssociationStatus</code> API call to get the status of the association request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeAssociationStatusToken;

@end

/**
 <p>Describes a single backup. </p>
 */
@interface AWSOpsworkscmBackup : AWSModel


/**
 <p>The ARN of the backup. </p>
 */
@property (nonatomic, strong) NSString * _Nullable backupArn;

/**
 <p> The generated ID of the backup. Example: <code>myServerName-yyyyMMddHHmmssSSS</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable backupId;

/**
 <p> The backup type. Valid values are <code>automated</code> or <code>manual</code>. </p>
 */
@property (nonatomic, assign) AWSOpsworkscmBackupType backupType;

/**
 <p> The time stamp when the backup was created in the database. Example: <code>2016-07-29T13:38:47.520Z</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p> A user-provided description for a manual backup. This field is empty for automated backups. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> The engine type that is obtained from the server when the backup is created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p> The engine model that is obtained from the server when the backup is created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineModel;

/**
 <p> The engine version that is obtained from the server when the backup is created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p> The EC2 instance profile ARN that is obtained from the server when the backup is created. Because this value is stored, you are not required to provide the InstanceProfileArn again if you restore a backup. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileArn;

/**
 <p> The instance type that is obtained from the server when the backup is created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p> The key pair that is obtained from the server when the backup is created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPair;

/**
 <p> The preferred backup period that is obtained from the server when the backup is created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p> The preferred maintenance period that is obtained from the server when the backup is created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p> This field is deprecated and is no longer used. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable s3DataSize;

/**
 <p> This field is deprecated and is no longer used. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3DataUrl;

/**
 <p> The Amazon S3 URL of the backup's log file. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3LogUrl;

/**
 <p> The security group IDs that are obtained from the server when the backup is created. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p> The name of the server from which the backup was made. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

/**
 <p> The service role ARN that is obtained from the server when the backup is created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p>The status of a backup while in progress. </p>
 */
@property (nonatomic, assign) AWSOpsworkscmBackupStatus status;

/**
 <p> An informational message about backup status. </p>
 */
@property (nonatomic, strong) NSString * _Nullable statusDescription;

/**
 <p> The subnet IDs that are obtained from the server when the backup is created. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p> The version of AWS OpsWorks CM-specific tools that is obtained from the server when the backup is created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable toolsVersion;

/**
 <p> The IAM user ARN of the requester for manual backups. This field is empty for automated backups. </p>
 */
@property (nonatomic, strong) NSString * _Nullable userArn;

@end

/**
 
 */
@interface AWSOpsworkscmCreateBackupRequest : AWSRequest


/**
 <p> A user-defined description of the backup. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the server that you want to back up. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

/**
 <p>A map that contains tag keys and tag values to attach to an AWS OpsWorks-CM server backup.</p><ul><li><p>The key cannot be empty.</p></li><li><p>The key can be a maximum of 127 characters, and can contain only Unicode letters, numbers, or separators, or the following special characters: <code>+ - = . _ : /</code></p></li><li><p>The value can be a maximum 255 characters, and contain only Unicode letters, numbers, or separators, or the following special characters: <code>+ - = . _ : /</code></p></li><li><p>Leading and trailing white spaces are trimmed from both the key and value.</p></li><li><p>A maximum of 50 user-applied tags is allowed for tag-supported AWS OpsWorks-CM resources.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSOpsworkscmCreateBackupResponse : AWSModel


/**
 <p>Backup created by request.</p>
 */
@property (nonatomic, strong) AWSOpsworkscmBackup * _Nullable backup;

@end

/**
 
 */
@interface AWSOpsworkscmCreateServerRequest : AWSRequest


/**
 <p> Associate a public IP address with a server that you are launching. Valid values are <code>true</code> or <code>false</code>. The default value is <code>true</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable associatePublicIpAddress;

/**
 <p> If you specify this field, AWS OpsWorks CM creates the server by using the backup represented by BackupId. </p>
 */
@property (nonatomic, strong) NSString * _Nullable backupId;

/**
 <p> The number of automated backups that you want to keep. Whenever a new backup is created, AWS OpsWorks CM deletes the oldest backups if this number is exceeded. The default value is <code>1</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionCount;

/**
 <p>A PEM-formatted HTTPS certificate. The value can be be a single, self-signed certificate, or a certificate chain. If you specify a custom certificate, you must also specify values for <code>CustomDomain</code> and <code>CustomPrivateKey</code>. The following are requirements for the <code>CustomCertificate</code> value:</p><ul><li><p>You can provide either a self-signed, custom certificate, or the full certificate chain.</p></li><li><p>The certificate must be a valid X509 certificate, or a certificate chain in PEM format.</p></li><li><p>The certificate must be valid at the time of upload. A certificate can't be used before its validity period begins (the certificate's <code>NotBefore</code> date), or after it expires (the certificate's <code>NotAfter</code> date).</p></li><li><p>The certificate’s common name or subject alternative names (SANs), if present, must match the value of <code>CustomDomain</code>.</p></li><li><p>The certificate must match the value of <code>CustomPrivateKey</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable customCertificate;

/**
 <p>An optional public endpoint of a server, such as <code>https://aws.my-company.com</code>. To access the server, create a CNAME DNS record in your preferred DNS service that points the custom domain to the endpoint that is generated when the server is created (the value of the CreateServer Endpoint attribute). You cannot access the server by using the generated <code>Endpoint</code> value if the server is using a custom domain. If you specify a custom domain, you must also specify values for <code>CustomCertificate</code> and <code>CustomPrivateKey</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customDomain;

/**
 <p>A private key in PEM format for connecting to the server by using HTTPS. The private key must not be encrypted; it cannot be protected by a password or passphrase. If you specify a custom private key, you must also specify values for <code>CustomDomain</code> and <code>CustomCertificate</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customPrivateKey;

/**
 <p> Enable or disable scheduled backups. Valid values are <code>true</code> or <code>false</code>. The default value is <code>true</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableAutomatedBackup;

/**
 <p> The configuration management engine to use. Valid values include <code>ChefAutomate</code> and <code>Puppet</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>Optional engine attributes on a specified server. </p><p class="title"><b>Attributes accepted in a Chef createServer request:</b></p><ul><li><p><code>CHEF_AUTOMATE_PIVOTAL_KEY</code>: A base64-encoded RSA public key. The corresponding private key is required to access the Chef API. When no CHEF_AUTOMATE_PIVOTAL_KEY is set, a private key is generated and returned in the response. </p></li><li><p><code>CHEF_AUTOMATE_ADMIN_PASSWORD</code>: The password for the administrative user in the Chef Automate web-based dashboard. The password length is a minimum of eight characters, and a maximum of 32. The password can contain letters, numbers, and special characters (!/@#$%^&amp;+=_). The password must contain at least one lower case letter, one upper case letter, one number, and one special character. When no CHEF_AUTOMATE_ADMIN_PASSWORD is set, one is generated and returned in the response.</p></li></ul><p class="title"><b>Attributes accepted in a Puppet createServer request:</b></p><ul><li><p><code>PUPPET_ADMIN_PASSWORD</code>: To work with the Puppet Enterprise console, a password must use ASCII characters.</p></li><li><p><code>PUPPET_R10K_REMOTE</code>: The r10k remote is the URL of your control repository (for example, ssh://git@your.git-repo.com:user/control-repo.git). Specifying an r10k remote opens TCP port 8170.</p></li><li><p><code>PUPPET_R10K_PRIVATE_KEY</code>: If you are using a private Git repository, add PUPPET_R10K_PRIVATE_KEY to specify a PEM-encoded private SSH key.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmEngineAttribute *> * _Nullable engineAttributes;

/**
 <p> The engine model of the server. Valid values in this release include <code>Monolithic</code> for Puppet and <code>Single</code> for Chef. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineModel;

/**
 <p> The major release version of the engine that you want to use. For a Chef server, the valid value for EngineVersion is currently <code>2</code>. For a Puppet server, the valid value is <code>2017</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p> The ARN of the instance profile that your Amazon EC2 instances use. Although the AWS OpsWorks console typically creates the instance profile for you, if you are using API commands instead, run the service-role-creation.yaml AWS CloudFormation template, located at https://s3.amazonaws.com/opsworks-cm-us-east-1-prod-default-assets/misc/opsworks-cm-roles.yaml. This template creates a CloudFormation stack that includes the instance profile you need. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileArn;

/**
 <p> The Amazon EC2 instance type to use. For example, <code>m5.large</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p> The Amazon EC2 key pair to set for the instance. This parameter is optional; if desired, you may specify this parameter to connect to your instances by using SSH. </p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPair;

/**
 <p> The start time for a one-hour period during which AWS OpsWorks CM backs up application-level data on your server if automated backups are enabled. Valid values must be specified in one of the following formats: </p><ul><li><p><code>HH:MM</code> for daily backups</p></li><li><p><code>DDD:HH:MM</code> for weekly backups</p></li></ul><p><code>MM</code> must be specified as <code>00</code>. The specified time is in coordinated universal time (UTC). The default value is a random, daily start time.</p><p><b>Example:</b><code>08:00</code>, which represents a daily start time of 08:00 UTC.</p><p><b>Example:</b><code>Mon:08:00</code>, which represents a start time of every Monday at 08:00 UTC. (8:00 a.m.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p> The start time for a one-hour period each week during which AWS OpsWorks CM performs maintenance on the instance. Valid values must be specified in the following format: <code>DDD:HH:MM</code>. <code>MM</code> must be specified as <code>00</code>. The specified time is in coordinated universal time (UTC). The default value is a random one-hour period on Tuesday, Wednesday, or Friday. See <code>TimeWindowDefinition</code> for more information. </p><p><b>Example:</b><code>Mon:08:00</code>, which represents a start time of every Monday at 08:00 UTC. (8:00 a.m.) </p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p> A list of security group IDs to attach to the Amazon EC2 instance. If you add this parameter, the specified security groups must be within the VPC that is specified by <code>SubnetIds</code>. </p><p> If you do not specify this parameter, AWS OpsWorks CM creates one new security group that uses TCP ports 22 and 443, open to 0.0.0.0/0 (everyone). </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p> The name of the server. The server name must be unique within your AWS account, within each region. Server names must start with a letter; then letters, numbers, or hyphens (-) are allowed, up to a maximum of 40 characters. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

/**
 <p> The service role that the AWS OpsWorks CM service backend uses to work with your account. Although the AWS OpsWorks management console typically creates the service role for you, if you are using the AWS CLI or API commands, run the service-role-creation.yaml AWS CloudFormation template, located at https://s3.amazonaws.com/opsworks-cm-us-east-1-prod-default-assets/misc/opsworks-cm-roles.yaml. This template creates a CloudFormation stack that includes the service role and instance profile that you need. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p> The IDs of subnets in which to launch the server EC2 instance. </p><p> Amazon EC2-Classic customers: This field is required. All servers must run within a VPC. The VPC must have "Auto Assign Public IP" enabled. </p><p> EC2-VPC customers: This field is optional. If you do not specify subnet IDs, your EC2 instances are created in a default subnet that is selected by Amazon EC2. If you specify subnet IDs, the VPC must have "Auto Assign Public IP" enabled. </p><p>For more information about supported Amazon EC2 platforms, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported Platforms</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>A map that contains tag keys and tag values to attach to an AWS OpsWorks for Chef Automate or AWS OpsWorks for Puppet Enterprise server.</p><ul><li><p>The key cannot be empty.</p></li><li><p>The key can be a maximum of 127 characters, and can contain only Unicode letters, numbers, or separators, or the following special characters: <code>+ - = . _ : / @</code></p></li><li><p>The value can be a maximum 255 characters, and contain only Unicode letters, numbers, or separators, or the following special characters: <code>+ - = . _ : / @</code></p></li><li><p>Leading and trailing white spaces are trimmed from both the key and value.</p></li><li><p>A maximum of 50 user-applied tags is allowed for any AWS OpsWorks-CM server.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSOpsworkscmCreateServerResponse : AWSModel


/**
 <p>The server that is created by the request. </p>
 */
@property (nonatomic, strong) AWSOpsworkscmServer * _Nullable server;

@end

/**
 
 */
@interface AWSOpsworkscmDeleteBackupRequest : AWSRequest


/**
 <p>The ID of the backup to delete. Run the DescribeBackups command to get a list of backup IDs. Backup IDs are in the format <code>ServerName-yyyyMMddHHmmssSSS</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable backupId;

@end

/**
 
 */
@interface AWSOpsworkscmDeleteBackupResponse : AWSModel


@end

/**
 
 */
@interface AWSOpsworkscmDeleteServerRequest : AWSRequest


/**
 <p>The ID of the server to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmDeleteServerResponse : AWSModel


@end

/**
 
 */
@interface AWSOpsworkscmDescribeAccountAttributesRequest : AWSRequest


@end

/**
 
 */
@interface AWSOpsworkscmDescribeAccountAttributesResponse : AWSModel


/**
 <p> The attributes that are currently set for the account. </p>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmAccountAttribute *> * _Nullable attributes;

@end

/**
 
 */
@interface AWSOpsworkscmDescribeBackupsRequest : AWSRequest


/**
 <p>Describes a single backup. </p>
 */
@property (nonatomic, strong) NSString * _Nullable backupId;

/**
 <p>This is not currently implemented for <code>DescribeBackups</code> requests.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>This is not currently implemented for <code>DescribeBackups</code> requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Returns backups for the server with the specified ServerName. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmDescribeBackupsResponse : AWSModel


/**
 <p>Contains the response to a <code>DescribeBackups</code> request. </p>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmBackup *> * _Nullable backups;

/**
 <p>This is not currently implemented for <code>DescribeBackups</code> requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOpsworkscmDescribeEventsRequest : AWSRequest


/**
 <p>To receive a paginated response, use this parameter to specify the maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>NextToken is a string that is returned in some command responses. It indicates that not all entries have been returned, and that you must run at least one more request to get remaining items. To get remaining results, call <code>DescribeEvents</code> again, and assign the token from the previous results as the value of the <code>nextToken</code> parameter. If there are no more results, the response object's <code>nextToken</code> parameter value is <code>null</code>. Setting a <code>nextToken</code> value that was not returned in your previous results causes an <code>InvalidNextTokenException</code> to occur. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the server for which you want to view events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmDescribeEventsResponse : AWSModel


/**
 <p>NextToken is a string that is returned in some command responses. It indicates that not all entries have been returned, and that you must run at least one more request to get remaining items. To get remaining results, call <code>DescribeEvents</code> again, and assign the token from the previous results as the value of the <code>nextToken</code> parameter. If there are no more results, the response object's <code>nextToken</code> parameter value is <code>null</code>. Setting a <code>nextToken</code> value that was not returned in your previous results causes an <code>InvalidNextTokenException</code> to occur. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Contains the response to a <code>DescribeEvents</code> request. </p>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmServerEvent *> * _Nullable serverEvents;

@end

/**
 
 */
@interface AWSOpsworkscmDescribeNodeAssociationStatusRequest : AWSRequest


/**
 <p>The token returned in either the AssociateNodeResponse or the DisassociateNodeResponse. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeAssociationStatusToken;

/**
 <p>The name of the server from which to disassociate the node. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmDescribeNodeAssociationStatusResponse : AWSModel


/**
 <p>Attributes specific to the node association. In Puppet, the attibute PUPPET_NODE_CERT contains the signed certificate (the result of the CSR). </p>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmEngineAttribute *> * _Nullable engineAttributes;

/**
 <p>The status of the association or disassociation request. </p><p class="title"><b>Possible values:</b></p><ul><li><p><code>SUCCESS</code>: The association or disassociation succeeded. </p></li><li><p><code>FAILED</code>: The association or disassociation failed. </p></li><li><p><code>IN_PROGRESS</code>: The association or disassociation is still in progress. </p></li></ul>
 */
@property (nonatomic, assign) AWSOpsworkscmNodeAssociationStatus nodeAssociationStatus;

@end

/**
 
 */
@interface AWSOpsworkscmDescribeServersRequest : AWSRequest


/**
 <p>This is not currently implemented for <code>DescribeServers</code> requests. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>This is not currently implemented for <code>DescribeServers</code> requests. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Describes the server with the specified ServerName.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmDescribeServersResponse : AWSModel


/**
 <p>This is not currently implemented for <code>DescribeServers</code> requests. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Contains the response to a <code>DescribeServers</code> request.</p><p><i>For Chef Automate servers:</i> If <code>DescribeServersResponse$Servers$EngineAttributes</code> includes CHEF_MAJOR_UPGRADE_AVAILABLE, you can upgrade the Chef Automate server to Chef Automate 2. To be eligible for upgrade, a server running Chef Automate 1 must have had at least one successful maintenance run after November 1, 2019.</p><p><i>For Puppet Server:</i><code>DescribeServersResponse$Servers$EngineAttributes</code> contains PUPPET_API_CA_CERT. This is the PEM-encoded CA certificate that is used by the Puppet API over TCP port number 8140. The CA certificate is also used to sign node certificates.</p>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmServer *> * _Nullable servers;

@end

/**
 
 */
@interface AWSOpsworkscmDisassociateNodeRequest : AWSRequest


/**
 <p>Engine attributes that are used for disassociating the node. No attributes are required for Puppet. </p><p class="title"><b>Attributes required in a DisassociateNode request for Chef</b></p><ul><li><p><code>CHEF_ORGANIZATION</code>: The Chef organization with which the node was associated. By default only one organization named <code>default</code> can exist. </p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmEngineAttribute *> * _Nullable engineAttributes;

/**
 <p>The name of the client node. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeName;

/**
 <p>The name of the server from which to disassociate the node. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmDisassociateNodeResponse : AWSModel


/**
 <p>Contains a token which can be passed to the <code>DescribeNodeAssociationStatus</code> API call to get the status of the disassociation request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeAssociationStatusToken;

@end

/**
 <p>A name and value pair that is specific to the engine of the server. </p>
 */
@interface AWSOpsworkscmEngineAttribute : AWSModel


/**
 <p>The name of the engine attribute. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of the engine attribute. </p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSOpsworkscmExportServerEngineAttributeRequest : AWSRequest


/**
 <p>The name of the export attribute. Currently, the supported export attribute is <code>Userdata</code>. This exports a user data script that includes parameters and values provided in the <code>InputAttributes</code> list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportAttributeName;

/**
 <p>The list of engine attributes. The list type is <code>EngineAttribute</code>. An <code>EngineAttribute</code> list item is a pair that includes an attribute name and its value. For the <code>Userdata</code> ExportAttributeName, the following are supported engine attribute names.</p><ul><li><p><b>RunList</b> In Chef, a list of roles or recipes that are run in the specified order. In Puppet, this parameter is ignored.</p></li><li><p><b>OrganizationName</b> In Chef, an organization name. AWS OpsWorks for Chef Automate always creates the organization <code>default</code>. In Puppet, this parameter is ignored.</p></li><li><p><b>NodeEnvironment</b> In Chef, a node environment (for example, development, staging, or one-box). In Puppet, this parameter is ignored.</p></li><li><p><b>NodeClientVersion</b> In Chef, the version of the Chef engine (three numbers separated by dots, such as 13.8.5). If this attribute is empty, OpsWorks for Chef Automate uses the most current version. In Puppet, this parameter is ignored.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmEngineAttribute *> * _Nullable inputAttributes;

/**
 <p>The name of the server from which you are exporting the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmExportServerEngineAttributeResponse : AWSModel


/**
 <p>The requested engine attribute pair with attribute name and value.</p>
 */
@property (nonatomic, strong) AWSOpsworkscmEngineAttribute * _Nullable engineAttribute;

/**
 <p>The server name used in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmListTagsForResourceRequest : AWSRequest


/**
 <p>To receive a paginated response, use this parameter to specify the maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>NextToken is a string that is returned in some command responses. It indicates that not all entries have been returned, and that you must run at least one more request to get remaining items. To get remaining results, call <code>ListTagsForResource</code> again, and assign the token from the previous results as the value of the <code>nextToken</code> parameter. If there are no more results, the response object's <code>nextToken</code> parameter value is <code>null</code>. Setting a <code>nextToken</code> value that was not returned in your previous results causes an <code>InvalidNextTokenException</code> to occur.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Number (ARN) of an AWS OpsWorks for Chef Automate or AWS OpsWorks for Puppet Enterprise server for which you want to show applied tags. For example, <code>arn:aws:opsworks-cm:us-west-2:123456789012:server/test-owcm-server/EXAMPLE-66b0-4196-8274-d1a2bEXAMPLE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSOpsworkscmListTagsForResourceResponse : AWSModel


/**
 <p>A token that you can use as the value of <code>NextToken</code> in subsequent calls to the API to show more results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Tags that have been applied to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSOpsworkscmRestoreServerRequest : AWSRequest


/**
 <p> The ID of the backup that you want to use to restore a server. </p>
 */
@property (nonatomic, strong) NSString * _Nullable backupId;

/**
 <p> The type of instance to restore. Valid values must be specified in the following format: <code>^([cm][34]|t2).*</code> For example, <code>m5.large</code>. Valid values are <code>m5.large</code>, <code>r5.xlarge</code>, and <code>r5.2xlarge</code>. If you do not specify this parameter, RestoreServer uses the instance type from the specified backup. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p> The name of the key pair to set on the new EC2 instance. This can be helpful if the administrator no longer has the SSH key. </p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPair;

/**
 <p> The name of the server that you want to restore. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmRestoreServerResponse : AWSModel


@end

/**
 <p>Describes a configuration management server. </p>
 */
@interface AWSOpsworkscmServer : AWSModel


/**
 <p>Associate a public IP address with a server that you are launching. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable associatePublicIpAddress;

/**
 <p>The number of automated backups to keep. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionCount;

/**
 <p>The ARN of the CloudFormation stack that was used to create the server. </p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudFormationStackArn;

/**
 <p>Time stamp of server creation. Example <code>2016-07-29T13:38:47.520Z</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>An optional public endpoint of a server, such as <code>https://aws.my-company.com</code>. You cannot access the server by using the <code>Endpoint</code> value if the server has a <code>CustomDomain</code> specified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customDomain;

/**
 <p>Disables automated backups. The number of stored backups is dependent on the value of PreferredBackupCount. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableAutomatedBackup;

/**
 <p> A DNS name that can be used to access the engine. Example: <code>myserver-asdfghjkl.us-east-1.opsworks.io</code>. You cannot access the server by using the <code>Endpoint</code> value if the server has a <code>CustomDomain</code> specified. </p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The engine type of the server. Valid values in this release include <code>ChefAutomate</code> and <code>Puppet</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The response of a createServer() request returns the master credential to access the server in EngineAttributes. These credentials are not stored by AWS OpsWorks CM; they are returned only as part of the result of createServer(). </p><p class="title"><b>Attributes returned in a createServer response for Chef</b></p><ul><li><p><code>CHEF_AUTOMATE_PIVOTAL_KEY</code>: A base64-encoded RSA private key that is generated by AWS OpsWorks for Chef Automate. This private key is required to access the Chef API.</p></li><li><p><code>CHEF_STARTER_KIT</code>: A base64-encoded ZIP file. The ZIP file contains a Chef starter kit, which includes a README, a configuration file, and the required RSA private key. Save this file, unzip it, and then change to the directory where you've unzipped the file contents. From this directory, you can run Knife commands.</p></li></ul><p class="title"><b>Attributes returned in a createServer response for Puppet</b></p><ul><li><p><code>PUPPET_STARTER_KIT</code>: A base64-encoded ZIP file. The ZIP file contains a Puppet starter kit, including a README and a required private key. Save this file, unzip it, and then change to the directory where you've unzipped the file contents.</p></li><li><p><code>PUPPET_ADMIN_PASSWORD</code>: An administrator password that you can use to sign in to the Puppet Enterprise console after the server is online.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmEngineAttribute *> * _Nullable engineAttributes;

/**
 <p>The engine model of the server. Valid values in this release include <code>Monolithic</code> for Puppet and <code>Single</code> for Chef. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineModel;

/**
 <p>The engine version of the server. For a Chef server, the valid value for EngineVersion is currently <code>2</code>. For a Puppet server, the valid value is <code>2017</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The instance profile ARN of the server. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileArn;

/**
 <p> The instance type for the server, as specified in the CloudFormation stack. This might not be the same instance type that is shown in the EC2 console. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The key pair associated with the server. </p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPair;

/**
 <p>The status of the most recent server maintenance run. Shows <code>SUCCESS</code> or <code>FAILED</code>. </p>
 */
@property (nonatomic, assign) AWSOpsworkscmMaintenanceStatus maintenanceStatus;

/**
 <p>The preferred backup period specified for the server. </p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p>The preferred maintenance period specified for the server. </p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p> The security group IDs for the server, as specified in the CloudFormation stack. These might not be the same security groups that are shown in the EC2 console. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The ARN of the server. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverArn;

/**
 <p>The name of the server. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

/**
 <p>The service role ARN used to create the server. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p> The server's status. This field displays the states of actions in progress, such as creating, running, or backing up the server, as well as the server's health state. </p>
 */
@property (nonatomic, assign) AWSOpsworkscmServerStatus status;

/**
 <p> Depending on the server status, this field has either a human-readable message (such as a create or backup error), or an escaped block of JSON (used for health check results). </p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

/**
 <p> The subnet IDs specified in a CreateServer request. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 <p>An event that is related to the server, such as the start of maintenance or backup. </p>
 */
@interface AWSOpsworkscmServerEvent : AWSModel


/**
 <p>The time when the event occurred. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The Amazon S3 URL of the event's log file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logUrl;

/**
 <p>A human-readable informational or status message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The name of the server on or for which the event occurred. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmStartMaintenanceRequest : AWSRequest


/**
 <p>Engine attributes that are specific to the server on which you want to run maintenance.</p><p class="title"><b>Attributes accepted in a StartMaintenance request for Chef</b></p><ul><li><p><code>CHEF_MAJOR_UPGRADE</code>: If a Chef Automate server is eligible for upgrade to Chef Automate 2, add this engine attribute to a <code>StartMaintenance</code> request and set the value to <code>true</code> to upgrade the server to Chef Automate 2. For more information, see <a href="https://docs.aws.amazon.com/opsworks/latest/userguide/opscm-a2upgrade.html">Upgrade an AWS OpsWorks for Chef Automate Server to Chef Automate 2</a>. </p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmEngineAttribute *> * _Nullable engineAttributes;

/**
 <p>The name of the server on which to run maintenance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmStartMaintenanceResponse : AWSModel


/**
 <p>Contains the response to a <code>StartMaintenance</code> request. </p>
 */
@property (nonatomic, strong) AWSOpsworkscmServer * _Nullable server;

@end

/**
 <p>A map that contains tag keys and tag values to attach to an AWS OpsWorks for Chef Automate or AWS OpsWorks for Puppet Enterprise server. Leading and trailing white spaces are trimmed from both the key and value. A maximum of 50 user-applied tags is allowed for tag-supported AWS OpsWorks-CM resources.</p>
 Required parameters: [Key, Value]
 */
@interface AWSOpsworkscmTag : AWSModel


/**
 <p>A tag key, such as <code>Stage</code> or <code>Name</code>. A tag key cannot be empty. The key can be a maximum of 127 characters, and can contain only Unicode letters, numbers, or separators, or the following special characters: <code>+ - = . _ : /</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>An optional tag value, such as <code>Production</code> or <code>test-owcm-server</code>. The value can be a maximum of 255 characters, and contain only Unicode letters, numbers, or separators, or the following special characters: <code>+ - = . _ : /</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSOpsworkscmTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Number (ARN) of a resource to which you want to apply tags. For example, <code>arn:aws:opsworks-cm:us-west-2:123456789012:server/test-owcm-server/EXAMPLE-66b0-4196-8274-d1a2bEXAMPLE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A map that contains tag keys and tag values to attach to AWS OpsWorks-CM servers or backups.</p><ul><li><p>The key cannot be empty.</p></li><li><p>The key can be a maximum of 127 characters, and can contain only Unicode letters, numbers, or separators, or the following special characters: <code>+ - = . _ : /</code></p></li><li><p>The value can be a maximum 255 characters, and contain only Unicode letters, numbers, or separators, or the following special characters: <code>+ - = . _ : /</code></p></li><li><p>Leading and trailing white spaces are trimmed from both the key and value.</p></li><li><p>A maximum of 50 user-applied tags is allowed for any AWS OpsWorks-CM server or backup.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSOpsworkscmTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSOpsworkscmTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSOpsworkscmUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Number (ARN) of a resource from which you want to remove tags. For example, <code>arn:aws:opsworks-cm:us-west-2:123456789012:server/test-owcm-server/EXAMPLE-66b0-4196-8274-d1a2bEXAMPLE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The keys of tags that you want to remove.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSOpsworkscmUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSOpsworkscmUpdateServerEngineAttributesRequest : AWSRequest


/**
 <p>The name of the engine attribute to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The value to set for the attribute. </p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

/**
 <p>The name of the server to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmUpdateServerEngineAttributesResponse : AWSModel


/**
 <p>Contains the response to an <code>UpdateServerEngineAttributes</code> request. </p>
 */
@property (nonatomic, strong) AWSOpsworkscmServer * _Nullable server;

@end

/**
 
 */
@interface AWSOpsworkscmUpdateServerRequest : AWSRequest


/**
 <p>Sets the number of automated backups that you want to keep. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionCount;

/**
 <p>Setting DisableAutomatedBackup to <code>true</code> disables automated or scheduled backups. Automated backups are enabled by default. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableAutomatedBackup;

/**
 <p><code>DDD:HH:MM</code> (weekly start time) or <code>HH:MM</code> (daily start time). </p><p> Time windows always use coordinated universal time (UTC). Valid strings for day of week (<code>DDD</code>) are: <code>Mon</code>, <code>Tue</code>, <code>Wed</code>, <code>Thr</code>, <code>Fri</code>, <code>Sat</code>, or <code>Sun</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p><code>DDD:HH:MM</code> (weekly start time) or <code>HH:MM</code> (daily start time). </p><p> Time windows always use coordinated universal time (UTC). Valid strings for day of week (<code>DDD</code>) are: <code>Mon</code>, <code>Tue</code>, <code>Wed</code>, <code>Thr</code>, <code>Fri</code>, <code>Sat</code>, or <code>Sun</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>The name of the server to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

@end

/**
 
 */
@interface AWSOpsworkscmUpdateServerResponse : AWSModel


/**
 <p>Contains the response to a <code>UpdateServer</code> request. </p>
 */
@property (nonatomic, strong) AWSOpsworkscmServer * _Nullable server;

@end

NS_ASSUME_NONNULL_END
