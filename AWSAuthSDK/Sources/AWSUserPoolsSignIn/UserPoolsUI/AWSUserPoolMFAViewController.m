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

#import "AWSUserPoolMFAViewController.h"

#import "AWSFormTableCell.h"
#import "AWSFormTableDelegate.h"
#import "AWSAuthUIHelper.h"
#import <AWSAuthCore/AWSUIConfiguration.h>

@interface AWSUserPoolMFAViewController () 

@property (strong, nonatomic) NSString *destination;
@property (nonatomic,strong) AWSTaskCompletionSource<NSString *>* mfaCodeCompletionSource;
@property (nonatomic, strong) AWSFormTableCell *authenticationCodeRow;
@property (nonatomic, strong) AWSFormTableDelegate *tableDelegate;

@end

@implementation AWSUserPoolMFAViewController

#pragma mark - UIViewController

- (void) viewWillAppear:(BOOL)animated {
    self.codeSentTo.text = self.destination;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

// This is used to dismiss the keyboard, user just has to tap outside the
// user name and password views and it will dismiss
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.phase == UITouchPhaseBegan) {
        [self.view endEditing:YES];
    }
    
    [super touchesBegan:touches withEvent:event];
}

- (void)setUp {
    _authenticationCodeRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Authentication Code" type:InputTypeText];
    _tableDelegate = [AWSFormTableDelegate new];
    [self.tableDelegate addCell:self.authenticationCodeRow];
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    [self.tableView reloadData];
    [AWSAuthUIHelper setUpFormShadowForView:self.tableFormView];
    [self setUpBackground];
    
    // setup button background
    [AWSAuthUIHelper applyPrimaryColorFromConfig:self.config
                                          toView:self.signInButton];
}

- (void)setUpBackground {
    if ([AWSAuthUIHelper isBackgroundColorFullScreen:self.config]) {
        self.view.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    } else {
        self.view.backgroundColor = [AWSAuthUIHelper getSecondaryBackgroundColor];
    }
    
    self.title = @"MFA";
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
    backgroundImageView.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (IBAction)onSignIn:(id)sender {
    self.mfaCodeCompletionSource.result = [self.tableDelegate getValueForCell:self.authenticationCodeRow
                                                                 forTableView:self.tableView];
}

-(void) getMultiFactorAuthenticationCode: (AWSCognitoIdentityMultifactorAuthenticationInput *)authenticationInput mfaCodeCompletionSource: (AWSTaskCompletionSource<NSString *> *) mfaCodeCompletionSource {
    self.mfaCodeCompletionSource = mfaCodeCompletionSource;
    self.destination = authenticationInput.destination;
}


-(void) didCompleteMultifactorAuthenticationStepWithError:(NSError*) error {
    dispatch_async(dispatch_get_main_queue(), ^{
        if(error){
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:error.userInfo[@"__type"]
                                                                                     message:error.userInfo[@"message"]
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            [self presentViewController:alertController
                               animated:YES
                             completion:nil];
        }
    });
}


@end
