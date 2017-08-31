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
#import <UIKit/UIKit.h>
#import <AWSUserPoolsSignIn/AWSUserPoolsSignIn.h>
#import <AWSAuthCore/AWSUIConfiguration.h>


NS_ASSUME_NONNULL_BEGIN

@interface AWSUserPoolsUIOperations : NSObject

/**
 Initialize UserPools with AuthUIConfiguration
 @param configuration AWSUIConfiguration
 **/
-(id)initWithAuthUIConfiguration:(id<AWSUIConfiguration>)configuration;

/**
 Perform UserPools Login with username, password, completionhandler
 and the navigation controller of the application
 @param     userName            Username
 @param     password            Password
 @param     navController       NavigationController of the application's ViewController
 @param     completionHandler   Callback to the application's ViewController
 **/
-(void)loginWithUserName:(NSString *)userName
                password:(NSString *)password
    navigationController:(UINavigationController *)navController
       completionHandler:(void (^)(id _Nullable result, NSError * _Nullable error))completionHandler;


/**
 Push SignUp ViewController from NavigationController
 @param     navController       NavigationController of the application's ViewController
 **/
-(void)pushSignUpVCFromNavigationController:(UINavigationController *)navController;

/**
 Push ForgotPassword ViewController from NavigationController
 @param     navController       NavigationController of the application's ViewController
 **/
-(void)pushForgotPasswordVCFromNavigationController:(UINavigationController *)navController;

@end

NS_ASSUME_NONNULL_END
