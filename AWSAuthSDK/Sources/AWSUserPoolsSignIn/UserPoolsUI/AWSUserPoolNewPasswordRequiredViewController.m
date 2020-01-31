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


#import "AWSUserPoolNewPasswordRequiredViewController.h"
#import "AWSFormTableCell.h"
#import "AWSFormTableDelegate.h"
#import "AWSAuthUIHelper.h"
#import <AWSAuthCore/AWSUIConfiguration.h>

@interface AWSUserPoolNewPasswordRequiredViewController ()

@property (nonatomic, strong) AWSTaskCompletionSource<AWSCognitoIdentityNewPasswordRequiredDetails *> *passRequiredCompletionSource;
@property (nonatomic, strong) AWSCognitoIdentityNewPasswordRequiredInput *passwordRequiredInput;
@property (nonatomic, strong) AWSFormTableCell *passwordRow;
@property (nonatomic, strong) AWSFormTableDelegate *tableDelegate;
@property (nonatomic, strong) NSError *errorOfCompletedTask;

@end

@implementation AWSUserPoolNewPasswordRequiredViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.phase == UITouchPhaseBegan) {
        [self.view endEditing:YES];
    }
    
    [super touchesBegan:touches withEvent:event];
}

- (void)viewDidDisappear:(BOOL)animated {
    if (self.errorOfCompletedTask) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = self.errorOfCompletedTask;
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:error.userInfo[@"__type"]
                                                                                     message:error.userInfo[@"message"]
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            if (self.navigationController.topViewController == self) {
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            } else {
                [self.navigationController.topViewController presentViewController:alertController animated:YES completion:^{
                    self.navigationItem.hidesBackButton = YES;
                    [self removeFromParentViewController];
                }];
            }
        });
    }
}

- (void)setUp {
    _passwordRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"New Password" type:InputTypePassword];
    _tableDelegate = [AWSFormTableDelegate new];
    [self.tableDelegate addCell:self.passwordRow];
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    [self.tableView reloadData];
    [AWSAuthUIHelper setUpFormShadowForView:self.tableFormView];
    [self setUpBackground];
}

- (void)setUpBackground {
    if ([AWSAuthUIHelper isBackgroundColorFullScreen:self.config]) {
        self.view.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    } else {
        self.view.backgroundColor = [AWSAuthUIHelper getSecondaryBackgroundColor];
    }
    
    self.title = @"New Password Required";
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
    backgroundImageView.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (IBAction)onSignIn:(id)sender {
    NSString *password = [self.tableDelegate getValueForCell:self.passwordRow
                                                forTableView:self.tableView];
    
    AWSCognitoIdentityNewPasswordRequiredDetails *details = [[AWSCognitoIdentityNewPasswordRequiredDetails alloc] initWithProposedPassword:password
                                                                                                                            userAttributes:self.passwordRequiredInput.userAttributes];
    [self.passRequiredCompletionSource setResult:details];
}

/**
 Obtain a new password and specify profile information as part of sign in from the end user
 @param newPasswordRequiredInput user profile and required attributes of the end user
 @param newPasswordRequiredCompletionSource set newPasswordRequiredCompletionSource.result with the new password and any attribute updates from the end user
 */
-(void) getNewPasswordDetails: (AWSCognitoIdentityNewPasswordRequiredInput *) newPasswordRequiredInput
newPasswordRequiredCompletionSource: (AWSTaskCompletionSource<AWSCognitoIdentityNewPasswordRequiredDetails *> *) newPasswordRequiredCompletionSource {
    self.passRequiredCompletionSource = newPasswordRequiredCompletionSource;
    self.passwordRequiredInput = newPasswordRequiredInput;
}
/**
 This step completed, usually either display an error to the end user or dismiss ui
 However [AWSUserPoolsUIOperations startNewPasswordRequired] will be pushing on a new view controller
 so we will save this error, wait for the next view controller to come on the stack, and then present
 the error once this this has completed.
 @param error the error if any that occured
 */
-(void) didCompleteNewPasswordStepWithError:(NSError* _Nullable) error {
    self.errorOfCompletedTask = error;
}

@end
