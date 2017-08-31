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

#import "AWSFormTableCell.h"

@interface AWSFormTableCell()

@property (strong, nonatomic) NSString *placeHolder;
@property (nonatomic) InputType inputType;
@property (strong, nonatomic) NSString *staticText;

@end

@implementation AWSFormTableCell

- (instancetype)initWithPlaceHolder:(NSString *)placeHolder
                               type:(InputType)inputType {
    if (self = [super init]) {
        _placeHolder = placeHolder;
        _inputType = inputType;
    }
    return self;
}

- (instancetype)initWithPlaceHolder:(NSString *)placeHolder
                         staticText:(NSString *)staticText {
    if (self = [super init]) {
        _placeHolder = placeHolder;
        _staticText = staticText;
        _inputType = InputTypeStaticText;
    }
    return self;
    
}

@end
