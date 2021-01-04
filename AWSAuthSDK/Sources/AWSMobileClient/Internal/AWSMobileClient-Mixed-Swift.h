//
// Copyright 2017-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

// #import this header file instead of <AWSMobileClient/AWSMobileClient-Swift.h>
// This workaround allows for this package to be compiled as a static lib
// or dynamic framework
// https://github.com/CocoaPods/CocoaPods/issues/7594
#if __has_include("AWSMobileClient-Swift.h")
#import "AWSMobileClient-Swift.h"
#else
#import <AWSMobileClient/AWSMobileClient-Swift.h>
#endif

#ifndef AWSMobileClient_Mixed_Swift_h
#define AWSMobileClient_Mixed_Swift_h


#endif /* AWSMobileClient_Mixed_Swift_h */
