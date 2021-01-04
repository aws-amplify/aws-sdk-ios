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
#if __has_include("AWSMobileClientXCF-Swift.h")
#import "AWSMobileClientXCF-Swift.h"
#else
#import <AWSMobileClientXCF/AWSMobileClientXCF-Swift.h>
#endif

#ifndef AWSMobileClientXCF_Mixed_Swift_h
#define AWSMobileClientXCF_Mixed_Swift_h


#endif /* AWSMobileClientXCF_Mixed_Swift_h */
