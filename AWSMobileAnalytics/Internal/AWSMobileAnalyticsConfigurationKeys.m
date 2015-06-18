/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSMobileAnalyticsConfigurationKeys.h"

NSString *const AWSKeySyncInterval                = @"syncInterval";
NSString *const AWSKeyLastConfigSync              = @"lastConfigSync";
NSString *const AWSKeyConfigHost                  = @"configEndpoint";
NSString *const AWSKeyProjectHost                 = @"projectEndpoint";
NSString *const AWSKeyEventRecorderHost           = @"eventRecorderEndpoint";
NSString *const AWSKeyConfigRequestTimeout        = @"configRequestTimeout";
NSString *const AWSKeyProjectRequestTimeout       = @"allocationRequestTimeout";
NSString *const AWSKeyEventRecorderRequestTimeout = @"eventRecorderRequestTimeout";
NSString *const AWSKeyConfigMaxRetries            = @"configRequestRetries";
NSString *const AWSKeyProjectMaxRetries           = @"allocationRequestRetries";
NSString *const AWSKeyEventRecorderMaxRetries     = @"eventRecorderRequestRetries";
NSString *const AWSKeyAllowWANEventDelivery       = @"allowWANEventDelivery";
NSString *const AWSKeyLogLevel                    = @"logLevel";
NSString *const AWSKeyIsAnalyticsEnabled          = @"isAnalyticsEnabled";

NSString *const AWSKeyMaxSubmissionSize           = @"maxSubmissionSize";
NSString *const AWSKeyMaxSubmissionsAllowed       = @"maxSubmissionAllowed";
NSString *const AWSKeyMaxStorageSize              = @"maxStorageSize";
NSString *const AWSKeyForceSubmissionWaitTime     = @"forceSubmissionWaitTime";
NSString *const AWSKeyBackgroundSubmissionWaitTime = @"backgroundSubmissionWaitTime";
NSString *const AWSKeyMaxPutOperations            = @"maxPutOperations";
NSString *const AWSKeySessionRestartDelay         = @"sessionRestartDelay";
NSString *const AWSKeySessionResumeDelay          = @"sessionResumeDelay";

 
 


int const AWSValueSyncInterval                = 60 * 60;
double    const AWSValueLastConfigSync              = 0;
NSString *const AWSValueConfigHost                  = @"https://test.com/1.0";
NSString *const AWSValueProjectHost                 = @"https://test.com/1.0";
NSString *const AWSValueEventRecorderHost           = @"http://mobileanalytics.amazonaws.com/2014-06-05";
int const AWSValueConfigRequestTimeout        = 3;
int const AWSValueProjectRequestTimeout       = 3;
int const AWSValueEventRecorderRequestTimeout = 10;
int const AWSValueConfigMaxRetries            = 2;
int const AWSValueProjectMaxRetries           = 2;
int const AWSValueEventRecorderMaxRetries     = 2;
BOOL      const AWSValueAllowWANEventDelivery       = YES;
NSString *const AWSValueLogLevel                  = @"ERROR";
BOOL      const AWSValueIsAnalyticsEnabled          = YES;

int const AWSValueMaxSubmissionSize           = 1024 * 100; // 100 KB
int const AWSValueMaxSubmissionsAllowed       = 3;
int const AWSValueMaxStorageSize              = 1024 * 1024 * 5; // 5 MB
double    const AWSValueForceSubmissionWaitTime     = 60; //default 60 sec
double    const AWSValueBackgroundSubmissionWaitTime = 0;
int const AWSValueMaxPutOperations            = 1000;
int const AWSValueSessionRestartDelay         = 30000;
int const AWSValueSessionResumeDelay          = 5000;

