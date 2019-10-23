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

@protocol AWSUIConfiguration <NSObject>

/**
 @property logoImage
 @brief The logo to be used on the Auth UI Screen.
 **/
@property (nonatomic, nullable) UIImage *logoImage;

/**
 @property backgroundColor
 @brief The background color of the auth screens.
 **/
@property (nonatomic, nullable) UIColor *backgroundColor;

/**
 @property secondaryBackgroundColor
 @brief The secondary background color. It's applied to the bottom panel
 of the auth screens.
 */
@property (nonatomic, nullable) UIColor *secondaryBackgroundColor;

/**
 @property primaryColor
 @brief The view primary color used for highlighted elements (button background, links).
 */
@property (nonatomic, nullable) UIColor *primaryColor;

/**
 @property fullScreenBackgroundColor
 @brief Gets the backgorund color of the sign in screen configured by the user for the whole screen.
 **/
@property (nonatomic) BOOL isBackgroundColorFullScreen;

/**
 @property font
 @brief Font for the text in the SignInView and all its subviews.
 **/
@property (nonatomic, nullable) UIFont *font;

@end
