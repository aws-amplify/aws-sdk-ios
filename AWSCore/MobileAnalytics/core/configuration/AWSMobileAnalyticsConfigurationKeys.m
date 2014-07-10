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

#import "AWSMobileAnalyticsConfigurationKeys.h"

NSString *const KeySyncInterval                = @"syncInterval";
NSString *const KeyLastConfigSync              = @"lastConfigSync";
NSString *const KeyConfigHost                  = @"configEndpoint";
NSString *const KeyProjectHost                 = @"projectEndpoint";
NSString *const KeyEventRecorderHost           = @"eventRecorderEndpoint";
NSString *const KeyConfigRequestTimeout        = @"configRequestTimeout";
NSString *const KeyProjectRequestTimeout       = @"allocationRequestTimeout";
NSString *const KeyEventRecorderRequestTimeout = @"eventRecorderRequestTimeout";
NSString *const KeyConfigMaxRetries            = @"configRequestRetries";
NSString *const KeyProjectMaxRetries           = @"allocationRequestRetries";
NSString *const KeyEventRecorderMaxRetries     = @"eventRecorderRequestRetries";
NSString *const KeyAllowWANEventDelivery       = @"allowWANEventDelivery";
NSString *const KeyLogLevel                    = @"logLevel";
NSString *const KeyIsAnalyticsEnabled          = @"isAnalyticsEnabled";

NSString *const KeyMaxSubmissionSize           = @"maxSubmissionSize";
NSString *const KeyMaxSubmissionsAllowed       = @"maxSubmissionAllowed";
NSString *const KeyMaxStorageSize              = @"maxStorageSize";
NSString *const KeyForceSubmissionWaitTime     = @"forceSubmissionWaitTime";
NSString *const KeyBackgroundSubmissionWaitTime = @"backgroundSubmissionWaitTime";
NSString *const KeyMaxPutOperations            = @"maxPutOperations";
NSString *const KeySessionRestartDelay         = @"sessionRestartDelay";
NSString *const KeySessionResumeDelay          = @"sessionResumeDelay";

 
 


int const ValueSyncInterval                = 60 * 60;
double    const ValueLastConfigSync              = 0;
NSString *const ValueConfigHost                  = @"https://test.com/1.0";
NSString *const ValueProjectHost                 = @"https://test.com/1.0";
NSString *const ValueEventRecorderHost           = @"http://mobileanalytics.amazonaws.com/2014-06-05";
int const ValueConfigRequestTimeout        = 3;
int const ValueProjectRequestTimeout       = 3;
int const ValueEventRecorderRequestTimeout = 10;
int const ValueConfigMaxRetries            = 2;
int const ValueProjectMaxRetries           = 2;
int const ValueEventRecorderMaxRetries     = 2;
BOOL      const ValueAllowWANEventDelivery       = YES;
NSString *const ValueVariationStorageLocation    = @"insights/appcache";
NSString *const ValueLogLevel                  = @"ERROR";
BOOL      const ValueIsAnalyticsEnabled          = YES;

int const ValueMaxSubmissionSize           = 1024 * 100; // 100 KB
int const ValueMaxSubmissionsAllowed       = 3;
int const ValueMaxStorageSize              = 1024 * 1024 * 5; // 5 MB
double    const ValueForceSubmissionWaitTime     = 60; //default 60 sec
double    const ValueBackgroundSubmissionWaitTime = 0;
int const ValueMaxPutOperations            = 1000;
int const ValueSessionRestartDelay         = 30000;
int const ValueSessionResumeDelay          = 5000;

