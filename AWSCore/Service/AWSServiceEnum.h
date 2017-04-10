//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    AWSRegionUnknown NS_SWIFT_NAME(Unknown),
    /**
     *  US East (N. Virginia)
     */
    AWSRegionUSEast1 NS_SWIFT_NAME(USEast1),
    /**
     *  US East (Ohio)
     */
    AWSRegionUSEast2 NS_SWIFT_NAME(USEast2),
    /**
     *  US West (N. California)
     */
    AWSRegionUSWest1 NS_SWIFT_NAME(USWest1),
    /**
     *  US West (Oregon)
     */
    AWSRegionUSWest2 NS_SWIFT_NAME(USWest2),
    /**
     *  EU (Ireland)
     */
    AWSRegionEUWest1 NS_SWIFT_NAME(EUWest1),
    /**
     *  EU (London)
     */
    AWSRegionEUWest2 NS_SWIFT_NAME(EUWest2),
    /**
     *  EU (Frankfurt)
     */
    AWSRegionEUCentral1 NS_SWIFT_NAME(EUCentral1),
    /**
     *  Asia Pacific (Singapore)
     */
    AWSRegionAPSoutheast1 NS_SWIFT_NAME(APSoutheast1),
    /**
     *  Asia Pacific (Tokyo)
     */
    AWSRegionAPNortheast1 NS_SWIFT_NAME(APNortheast1),
    /**
     *  Asia Pacific (Seoul)
     */
    AWSRegionAPNortheast2 NS_SWIFT_NAME(APNortheast2),
    /**
     *  Asia Pacific (Sydney)
     */
    AWSRegionAPSoutheast2 NS_SWIFT_NAME(APSoutheast2),
    /**
     *  Asia Pacific (Mumbai)
     */
    AWSRegionAPSouth1 NS_SWIFT_NAME(APSouth1),
    /**
     *  South America (Sao Paulo)
     */
    AWSRegionSAEast1 NS_SWIFT_NAME(SAEast1),
    /**
     *  China (Beijing)
     */
    AWSRegionCNNorth1 NS_SWIFT_NAME(CNNorth1),
    /**
     *  Canada (Central)
     */
    AWSRegionCACentral1 NS_SWIFT_NAME(CACentral1),
    /**
     *  AWS GovCloud (US)
     */
    AWSRegionUSGovWest1 NS_SWIFT_NAME(USGovWest1),
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
    AWSServiceUnknown NS_SWIFT_NAME(Unknown),
    /**
     *  Amazon API Gateway
     */
    AWSServiceAPIGateway NS_SWIFT_NAME(APIGateway),
    /**
     *  Auto Scaling
     */
    AWSServiceAutoScaling NS_SWIFT_NAME(AutoScaling),
    /**
     *  Amazon CloudWatch
     */
    AWSServiceCloudWatch NS_SWIFT_NAME(CloudWatch),
    /**
     *  Amazon Cognito Identity
     */
    AWSServiceCognitoIdentity NS_SWIFT_NAME(CognitoIdentity),
    /**
     *  Amazon Cognito Identity Provider
     */
    AWSServiceCognitoIdentityProvider NS_SWIFT_NAME(CognitoIdentityProvider),
    /**
     *  Amazon Cognito Sync
     */
    AWSServiceCognitoSync NS_SWIFT_NAME(CognitoSync),
    /**
     *  Amazon DynamoDB
     */
    AWSServiceDynamoDB NS_SWIFT_NAME(DynamoDB),
    /**
     *  Amazon Elastic Compute Cloud (EC2)
     */
    AWSServiceEC2 NS_SWIFT_NAME(EC2),
    /**
     *  Elastic Load Balancing
     */
    AWSServiceElasticLoadBalancing NS_SWIFT_NAME(ElasticLoadBalancing),
    /**
     *  AWS IoT
     */
    AWSServiceIoT NS_SWIFT_NAME(IoT),
    /**
     *  AWS IoT Data
     */
    AWSServiceIoTData NS_SWIFT_NAME(IoTData),
    /**
     *  Amazon Kinesis Firehose
     */
    AWSServiceFirehose NS_SWIFT_NAME(Firehose),
    /**
     *  Amazon Kinesis
     */
    AWSServiceKinesis NS_SWIFT_NAME(Kinesis),
    /**
     *  AWS Key Management Service (KMS)
     */
    AWSServiceKMS NS_SWIFT_NAME(KMS),
    /**
     *  AWS Lambda
     */
    AWSServiceLambda NS_SWIFT_NAME(Lambda),
    /**
     *  Amazon Lex Runtime Service
     */
    AWSServiceLexRuntime NS_SWIFT_NAME(LexRuntime),
    /**
     *  Amazon Cloudwatch logs
     */
    AWSServiceLogs NS_SWIFT_NAME(Logs),
    /**
     *  Amazon Machine Learning
     */
    AWSServiceMachineLearning NS_SWIFT_NAME(MachineLearning),
    /**
     *  Amazon Mobile Analytics
     */
    AWSServiceMobileAnalytics NS_SWIFT_NAME(MobileAnalytics),
    /**
     *  Amazon Mobile Targeting
     */
    AWSServiceMobileTargeting NS_SWIFT_NAME(MobileTargeting),
    /**
     *  Amazon Polly
     */
    AWSServicePolly NS_SWIFT_NAME(Polly),
    /**
     *  Amazon Rekognition
     */
    AWSServiceRekognition NS_SWIFT_NAME(Rekognition),
    /**
     *  Amazon Simple Storage Service (S3)
     */
    AWSServiceS3 NS_SWIFT_NAME(S3),
    /**
     *  Amazon Simple Email Service (SES)
     */
    AWSServiceSES NS_SWIFT_NAME(SES),
    /**
     *  Amazon SimpleDB
     */
    AWSServiceSimpleDB NS_SWIFT_NAME(SimpleDB),
    /**
     *  Amazon Simple Notification Service (SNS)
     */
    AWSServiceSNS NS_SWIFT_NAME(SNS),
    /**
     *  Amazon Simple Queue Service (SQS)
     */
    AWSServiceSQS NS_SWIFT_NAME(SQS),
    /**
     *  AWS Security Token Service (STS)
     */
    AWSServiceSTS NS_SWIFT_NAME(STS),
};

#endif
