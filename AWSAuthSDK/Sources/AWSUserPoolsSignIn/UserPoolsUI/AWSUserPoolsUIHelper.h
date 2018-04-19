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
#import <AWSAuthCore/AWSUIConfiguration.h>

NS_ASSUME_NONNULL_BEGIN

@interface AWSUserPoolsUIHelper : NSObject

/**
 Set up shadow around specified view
 
 @param view The view for which form shadow is to be set
 **/
+ (void) setUpFormShadowForView:(UIView *)view;

/**
 Get background color set in the config or
 return the default background color
 
 @param config The object conforming to `AWSUIConfiguration` protocol
 @return backgroundColor
 **/
+ (UIColor *) getBackgroundColor:(id<AWSUIConfiguration>)config;

/**
 Retrieve the font set in the config or return nil
 
 @param config The object conforming to `AWSUIConfiguration` protocol
 @return font
 **/
+ (UIFont *) getFont:(id<AWSUIConfiguration>)config;

/**
 Retrieve the flag that says if the background color has to be applied full screen or not.
 
 @param config The object conforming to `AWSUIConfiguration` protocol
 @return isFullScreenBackgroundColorEnabled
 **/
+ (BOOL) isBackgroundColorFullScreen:(id<AWSUIConfiguration>)config;

/**
 Set the AWSAuthUIConfiguration object.
 
 @param config The config object from which backgroundColor,
               isFullScreenBackgroundColorEnabled and font are extracted.
 **/
+ (void) setAWSUIConfiguration:(id<AWSUIConfiguration>)config;

/**
 Retrieve the AWSAuthUIConfiguration object.
 
 @return AWSAuthUIConfiguration
 **/
+ (id<AWSUIConfiguration>) getAWSUIConfiguration;

@end

NS_ASSUME_NONNULL_END
