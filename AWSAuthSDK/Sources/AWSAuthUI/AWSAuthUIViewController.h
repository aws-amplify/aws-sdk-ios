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

#import <Foundation/Foundation.h>
#import "AWSAuthUIConfiguration.h"
#import <AWSAuthCore/AWSSignInProvider.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^AWSAuthUICompletionHandler)(id<AWSSignInProvider> signInProvider, NSError * _Nullable error);

@interface AWSAuthUIViewController : NSObject

/**
 Present the Auth UI View controller with the configuration passed in.
 If configuration is not passed in, defaults are used.
 
 @param     navigationController    The navigation controller of your app's current screen
 @param     configuration           The AWSAuthUIConfiguration object
 @param     completionHandler       The completion handler which is called when a user attempts a sign in
 **/
+ (void)presentViewControllerWithNavigationController:(UINavigationController *)navigationController
                                        configuration:(AWSAuthUIConfiguration *)configuration
                                    completionHandler:(AWSAuthUICompletionHandler)completionHandler;

NS_ASSUME_NONNULL_END

@end
