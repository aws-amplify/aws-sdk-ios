//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSAuthUIHelper.h"

@implementation AWSAuthUIHelper

static id<AWSUIConfiguration> awsUIConfiguration;

+ (void) setUpFormShadowForView:(UIView *)view {
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOffset = CGSizeZero;
    view.layer.shadowOpacity = 0.25;
    view.layer.shadowRadius = 6;
    view.layer.cornerRadius = 10.0;
    view.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.7].CGColor;
    view.layer.borderWidth = 0.5;
    view.layer.masksToBounds = NO;
}

+ (UIColor *) getBackgroundColor:(id<AWSUIConfiguration>)config {
    if (config != nil && config.backgroundColor != nil) {
        return config.backgroundColor;
    } else if (@available(iOS 13.0, *)) {
        return [UIColor systemBackgroundColor];
    }
    // matches light systemBackgroundColor on iOS >= 13
    return [UIColor whiteColor];
}

+ (UIColor *) getSecondaryBackgroundColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor secondarySystemBackgroundColor];
    }
    // light grey (matches light secondarySystemBackgroundColor on iOS >= 13)
    return [UIColor colorWithRed:0.95 green:0.95 blue:0.97 alpha:1.0];
}

+ (void) applyPrimaryColorFromConfig:(id<AWSUIConfiguration>)config
                              toView:(UIView *) view {
    [self applyPrimaryColorFromConfig:config toView:view background:YES];
}

+ (void) applyPrimaryColorFromConfig:(id<AWSUIConfiguration>)config
                              toView:(UIView *) view
                          background:(BOOL) background {
    if (config.primaryColor) {
        if (background) {
            view.backgroundColor = config.primaryColor;
        } else {
            view.tintColor = config.primaryColor;
        }
    }
}

+ (UIFont *) getFont:(id<AWSUIConfiguration>)config {
    if (config != nil && config.font != nil) {
        return config.font;
    }
    return nil;
}

+ (BOOL) isBackgroundColorFullScreen:(id<AWSUIConfiguration>)config {
    if (config != nil) {
        return config.isBackgroundColorFullScreen;
    }
    return false;
}

/**
 Check if a `UIColor` is bright or dark. Based on http://www.w3.org/WAI/ER/WD-AERT/#color-contrast
*/
+ (BOOL) isDarkColor:(UIColor *) color {
    const CGFloat *componentColors = CGColorGetComponents(color.CGColor);
    CGFloat colorBrightness = (
                               (componentColors[0] * 299) +
                               (componentColors[1] * 587) +
                               (componentColors[2] * 114)
                              ) / 1000;
    return colorBrightness < 0.5;
}

+ (UIColor *) getTextColor:(id<AWSUIConfiguration>)config {
    if (@available(iOS 13.0, *)) {
        return [UIColor labelColor];
    } else if ([self isDarkColor:[self getBackgroundColor:config]]) {
        return [UIColor whiteColor];
    }
    return [UIColor darkTextColor];
}

+ (void) setAWSUIConfiguration:(id<AWSUIConfiguration>)config {
    awsUIConfiguration = config;
}

+ (id<AWSUIConfiguration>) getAWSUIConfiguration {
    return awsUIConfiguration;
}

@end
