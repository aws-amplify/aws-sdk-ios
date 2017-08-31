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


NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, InputType) {
    /** text type enables generic text input **/
    InputTypeText,
    /** password type enables secure text input **/
    InputTypePassword,
    /** staticText hides place holder view and shows the input field by default **/
    InputTypeStaticText
};

/**
 High level construct to create a cell in the form requiring user input.
 */
@interface AWSFormTableCell : NSObject

/**
 @property placeHolder
 @brief The placeholder text that appears on an input field
 **/
@property (strong, nonatomic, readonly) NSString *placeHolder;

/**
 @property staticText
 @brief The type of input for the input field
 **/
@property (nonatomic, readonly) InputType inputType;

/**
 @property staticText
 @brief The default text in the input field
 **/
@property (strong, nonatomic, readonly) NSString *staticText;

/**
 Initializers for cell to be added
 @param     placeHolder     The PlaceHolder String
 @param     inputType       The type of the input
 */
- (instancetype)initWithPlaceHolder:(NSString *)placeHolder
                               type:(InputType)inputType;
/**
 Initializer for cells to be displayed with static text.
 @param     placeHolder     The PlaceHolder String
 @param     staticText      The StaticText String
 */
- (instancetype)initWithPlaceHolder:(NSString *)placeHolder
                         staticText:(NSString *)staticText;

@end

NS_ASSUME_NONNULL_END
