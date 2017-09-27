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
#import "AWSSignInProvider.h"
#import "AWSSignInManager.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, AWSSignInButtonStyle) {
    AWSSignInButtonStyleSmall,
    AWSSignInButtonStyleLarge
};

/**
 Protocol that defines the interface for a button view.
 Any button that confirms to this protocol should have a
 button style, signin provider and a delegate
 **/
@protocol AWSSignInButtonView<NSObject>

/**
 @property delegate
 @brief Set the delegate for the button view here
 **/
@property (nonatomic, weak) id<AWSSignInDelegate> delegate;

/**
 @property buttonStyle
 @brief Specify the style of the button : Small or Large
 **/
@property (nonatomic) AWSSignInButtonStyle buttonStyle;

/**
 @property signInProvider
 @brief Set the SignIn Provider for the button
 **/
- (void)setSignInProvider:(id<AWSSignInProvider>)signInProvider;

@end

NS_ASSUME_NONNULL_END
