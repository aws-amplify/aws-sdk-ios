/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#ifndef AWSiOSSDK_AWSServiceEnum_h
#define AWSiOSSDK_AWSServiceEnum_h

typedef NS_ENUM(NSInteger, AWSRegionType) {
    AWSRegionUnknown,
    AWSRegionUSEast1,
    AWSRegionUSWest1,
    AWSRegionUSWest2,
    AWSRegionEUWest1,
    AWSRegionEUCentral1,
    AWSRegionAPSoutheast1,
    AWSRegionAPNortheast1,
    AWSRegionAPSoutheast2,
    AWSRegionSAEast1,
    AWSRegionCNNorth1,
};

typedef NS_ENUM(NSInteger, AWSServiceType) {
    AWSServiceUnknown,
    AWSServiceAppStream,
    AWSServiceAutoScaling,
    AWSServiceCloudWatch,
    AWSServiceCognitoIdentityBroker,
    AWSServiceCognitoService,
    AWSServiceDynamoDB,
    AWSServiceEC2,
    AWSServiceElasticLoadBalancing,
    AWSServiceKinesis,
    AWSServiceS3,
    AWSServiceSES,
    AWSServiceSimpleDB,
    AWSServiceSNS,
    AWSServiceSQS,
    AWSServiceSTS,
    AWSServiceMobileAnalytics,
};

#endif
