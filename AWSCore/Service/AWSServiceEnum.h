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

#ifndef AWSiOSSDK_AWSServiceEnum_h
#define AWSiOSSDK_AWSServiceEnum_h

/**
 *  Enums for AWS regions.
 *
 *  For information about which regions are supported for each service, see the linked website:
 *  http://docs.aws.amazon.com/general/latest/gr/rande.html
 */
typedef NS_ENUM(NSInteger, AWSRegionType) {
    /**
     *  Unknown Region
     */
    AWSRegionUnknown,
    /**
     *  US East (N. Virginia)
     */
    AWSRegionUSEast1,
    /**
     *  US East (Ohio)
     */
    AWSRegionUSEast2,
    /**
     *  US West (N. California)
     */
    AWSRegionUSWest1,
    /**
     *  US West (Oregon)
     */
    AWSRegionUSWest2,
    /**
     *  EU (Ireland)
     */
    AWSRegionEUWest1,
    /**
     *  EU (London)
     */
    AWSRegionEUWest2,
    /**
     *  EU (Frankfurt)
     */
    AWSRegionEUCentral1,
    /**
     *  Asia Pacific (Singapore)
     */
    AWSRegionAPSoutheast1,
    /**
     *  Asia Pacific (Tokyo)
     */
    AWSRegionAPNortheast1,
    /**
     *  Asia Pacific (Seoul)
     */
    AWSRegionAPNortheast2,
    /**
     *  Asia Pacific (Sydney)
     */
    AWSRegionAPSoutheast2,
    /**
     *  Asia Pacific (Mumbai)
     */
    AWSRegionAPSouth1,
    /**
     *  South America (Sao Paulo)
     */
    AWSRegionSAEast1,
    /**
     *  China (Beijing)
     */
    AWSRegionCNNorth1,
    /**
     *  Canada (Central)
     */
    AWSRegionCACentral1,
    /**
     *  AWS GovCloud (US)
     */
    AWSRegionUSGovWest1,
};

/**
 *  Enums for AWS services.
 *
 *  For information about which regions are supported for each service, see the linked website:
 *  http://docs.aws.amazon.com/general/latest/gr/rande.html
 */
typedef NS_ENUM(NSInteger, AWSServiceType) {
    /**
     *  Unknown service
     */
    AWSServiceUnknown,
    /**
     *  Amazon API Gateway
     */
    AWSServiceAPIGateway,
    /**
     *  Auto Scaling
     */
    AWSServiceAutoScaling,
    /**
     *  Amazon CloudWatch
     */
    AWSServiceCloudWatch,
    /**
     *  Amazon Cognito Identity
     */
    AWSServiceCognitoIdentity,
    /**
     *  Amazon Cognito Identity Provider
     */
    AWSServiceCognitoIdentityProvider,
    /**
     *  Amazon Cognito Sync
     */
    AWSServiceCognitoSync,
    /**
     *  Amazon DynamoDB
     */
    AWSServiceDynamoDB,
    /**
     *  Amazon Elastic Compute Cloud (EC2)
     */
    AWSServiceEC2,
    /**
     *  Elastic Load Balancing
     */
    AWSServiceElasticLoadBalancing,
    /**
     *  AWS IoT
     */
    AWSServiceIoT,
    /**
     *  AWS IoT Data
     */
    AWSServiceIoTData,
    /**
     *  Amazon Kinesis Firehose
     */
    AWSServiceFirehose,
    /**
     *  Amazon Kinesis
     */
    AWSServiceKinesis,
    /**
     *  AWS Lambda
     */
    AWSServiceLambda,
    /**
     *  Amazon Lex Runtime Service
     */
    AWSServiceLexRuntime,
    /**
     *  Amazon Machine Learning
     */
    AWSServiceMachineLearning,
    /**
     *  Amazon Mobile Analytics
     */
    AWSServiceMobileAnalytics,
    /**
     *  Amazon Mobile Targeting
     */
    AWSServiceMobileTargeting,
    /**
     *  Amazon Polly
     */
    AWSServicePolly,
    /**
     *  Amazon Rekognition
     */
    AWSServiceRekognition,
    /**
     *  Amazon Simple Storage Service (S3)
     */
    AWSServiceS3,
    /**
     *  Amazon Simple Email Service (SES)
     */
    AWSServiceSES,
    /**
     *  Amazon SimpleDB
     */
    AWSServiceSimpleDB,
    /**
     *  Amazon Simple Notification Service (SNS)
     */
    AWSServiceSNS,
    /**
     *  Amazon Simple Queue Service (SQS)
     */
    AWSServiceSQS,
    /**
     *  AWS Security Token Service (STS)
     */
    AWSServiceSTS,
};

#endif
