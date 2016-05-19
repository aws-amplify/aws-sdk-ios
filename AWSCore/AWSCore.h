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

#import <UIKit/UIKit.h>

//! Project version number for AWSCore.
FOUNDATION_EXPORT double AWSCoreVersionNumber;

//! Project version string for AWSCore.
FOUNDATION_EXPORT const unsigned char AWSCoreVersionString[];

#import "AWSServiceEnum.h"
#import "AWSService.h"
#import "AWSCredentialsProvider.h"
#import "AWSIdentityProvider.h"
#import "AWSModel.h"
#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSLogging.h"
#import "AWSClientContext.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSSerialization.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLSessionManager.h"
#import "AWSSignature.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSValidation.h"
#import "AWSInfo.h"

#import "AWSBolts.h"
#import "AWSGZIP.h"
#import "AWSFMDB.h"
#import "AWSKSReachability.h"
#import "AWSTMCache.h"
#import "AWSUICKeyChainStore.h"

#import "AWSSTS.h"
#import "AWSCognitoIdentity.h"
