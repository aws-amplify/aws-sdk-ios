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

#import "AWSFormTableDelegate.h"

@interface AWSFormTableDelegate()

@property (strong, atomic) NSMutableArray<AWSFormTableCell *> *cells;

@end

@implementation AWSFormTableDelegate

- (instancetype)init {
    if (self = [super init]) {
        _cells = [NSMutableArray new];
    }
    return self;
}

-(NSUInteger)numberOfCells {
    return self.cells.count;
}

-(void)addCell:(AWSFormTableCell *)cell {
    [self.cells addObject:cell];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:NO];
    AWSTableInputCell *currentCell = (AWSTableInputCell *)[tableView cellForRowAtIndexPath:indexPath];
    [currentCell onTap];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfCells;
}

- (void)showPassword:(UIButton *)button {
    UITextField *textField = (UITextField *)[button superview];
    if (textField.isSecureTextEntry) {
        textField.secureTextEntry = NO;
        [button setTitle:@"Hide" forState:UIControlStateNormal];
    } else {
        textField.secureTextEntry = YES;
        [button setTitle:@"Show" forState:UIControlStateNormal];
    }
}

- (void)setButtonFont:(UIButton *)button {
    if ([AWSAuthUIHelper getAWSUIConfiguration].font != nil) {
        button.titleLabel.font = [AWSAuthUIHelper getAWSUIConfiguration].font;
    } else {
        button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AWSTableInputCell *inputCell = (AWSTableInputCell *)[tableView dequeueReusableCellWithIdentifier:@"AWSFormTableCell"
                                                           forIndexPath:indexPath];
    AWSFormTableCell *formCell = self.cells[indexPath.row];
    
    inputCell.placeHolderLabel.text = formCell.placeHolder;
    inputCell.headerLabel.text = [formCell.placeHolder uppercaseString];
    inputCell.inputBox.autocorrectionType = UITextAutocorrectionTypeNo;
    inputCell.inputBox.spellCheckingType = UITextSpellCheckingTypeNo;
    
    if (formCell.inputType == InputTypePassword) {
        inputCell.inputBox.secureTextEntry = YES;
        UIButton *showButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
        [showButton setTitle:@"Show" forState:UIControlStateNormal];
        [showButton addTarget:self
                       action:@selector(showPassword:)
             forControlEvents:UIControlEventTouchUpInside];
        inputCell.inputBox.rightViewMode = UITextFieldViewModeAlways;
        inputCell.inputBox.rightView = showButton;
        [self setButtonFont:showButton];
        [showButton setTitleColor:[UIColor darkGrayColor]
                         forState:UIControlStateNormal];
    }
    if (formCell.inputType == InputTypeStaticText) {
        [inputCell showHeaderLabel:YES];
        inputCell.inputBox.text = formCell.staticText;
    }
    
    [inputCell setAWSTableInputCellFont];
    return inputCell;
}

- (NSString *)getValueForCell:(AWSFormTableCell *)cell
                 forTableView:(UITableView *)tableView {
    NSInteger position = (NSInteger)[self.cells indexOfObject:cell];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:position inSection:0];
    AWSTableInputCell *inputCell = (AWSTableInputCell *)[tableView cellForRowAtIndexPath:indexPath];
    return inputCell.inputBox.text;
    
}

- (AWSTableInputCell *)getAWSTableInputCell:(AWSFormTableCell *)cell
                         forTableView:(UITableView *)tableView {
    NSInteger position = (NSInteger)[self.cells indexOfObject:cell];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:position inSection:0];
    AWSTableInputCell *inputCell = (AWSTableInputCell *)[tableView cellForRowAtIndexPath:indexPath];
    return inputCell;
}

@end
