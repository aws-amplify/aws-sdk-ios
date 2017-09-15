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
#import <AWSCore/AWSCore.h>
#import <AWSAuthCore/AWSAuthCore.h>

#import "AWSFormTableCell.h"
#import "AWSTableInputCell.h"
#import "AWSFormTableDelegate.h"
#import "AWSUserPoolsUIHelper.h"
#import "AWSSignInViewController.h"

#define DEFAULT_BACKGROUND_COLOR_TOP [UIColor darkGrayColor]
#define DEFAULT_BACKGROUND_COLOR_BOTTOM [UIColor whiteColor]

static NSString *const RESOURCES_BUNDLE = @"AWSAuthUI.bundle";
static NSString *const SMALL_IMAGE_NAME = @"logo-aws-small";
static NSString *const BIG_IMAGE_NAME = @"logo-aws-big";


static NSString *const SIGNIN_STORYBOARD = @"SignIn";
static NSString *const SIGNIN_VIEW_CONTROLLER_IDENTIFIER = @"SignIn";;
static NSString *const USERPOOLS_UI_OPERATIONS = @"AWSUserPoolsUIOperations";

static NSInteger const SCALED_UP_LOGO_IMAGE_HEIGHT = 230;
static NSInteger const SCALED_DOWN_LOGO_IMAGE_HEIGHT = 140;

@interface AWSSignInViewController ()

@property (strong, atomic) AWSFormTableCell *passwordRow;
@property (strong, atomic) AWSFormTableCell *userNameRow;
@property (strong, atomic) AWSFormTableDelegate *tableDelegate;

@property (weak, nonatomic) IBOutlet UIButton *providerRow1;
@property (weak, nonatomic) IBOutlet UIButton *providerRow2;
@property (weak, nonatomic) IBOutlet UIButton *providerRow3;

@end

@interface AWSUserPoolsUIOperations: NSObject

-(id)initWithAuthUIConfiguration:(AWSAuthUIConfiguration *)configuration;

-(void)loginWithUserName:(NSString *)userName
                password:(NSString *)password
    navigationController:(UINavigationController *)navController
       completionHandler:(void (^)(id _Nullable result, NSError * _Nullable error))completionHandler;


-(void)pushSignUpVCFromNavigationController:(UINavigationController *)navController;

-(void)pushForgotPasswordVCFromNavigationController:(UINavigationController *)navController;

@end

@interface AWSSignInViewController() <AWSSignInDelegate>

@end


@interface AWSAuthUIConfiguration()

@property(nonatomic, nullable) NSMutableArray<Class<AWSSignInButtonView>> *registeredSignInButtonViews;

- (NSMutableArray<Class<AWSSignInButtonView>> *_Nonnull)getAllSignInButtonViews;

- (BOOL)hasSignInButtonView;

@end


@implementation AWSSignInViewController

@synthesize canCancel;
@synthesize config;

+ (void)initialize {
    AWSDDLogDebug(@"Initializing the AWSSignInViewController...");
    [super initialize];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self  = [super initWithCoder:decoder]) {

    }
    return self;
}


#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AWSDDLogDebug(@"Sign-In Loading...");
    
    // set up the navigation controller
    [self setUpNavigationController];
    
    // set up logo
    [self setUpLogo:self.config.logoImage ?: nil];
    
    // set up background color
    [self setUpBackground:self.config.backgroundColor ?: nil];
    
    // set up username and password UI if user pools enabled
    [self setUpUserPoolsUI];
    
    // add the  sign-in buttons created by the user to the sign-in view
    [self addButtonViewstoSignInView];
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

#pragma mark - Utility Methods

- (void)handleLoginWithSignInProvider:(id<AWSSignInProvider>)signInProvider {
    [[AWSSignInManager sharedInstance]
     loginWithSignInProviderKey:[signInProvider identityProviderName]
     completionHandler:^(id result, NSError *error) {
         if (!error) {
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self dismissViewControllerAnimated:YES
                                          completion:nil];
                 if (self.completionHandler) {
                     self.completionHandler(signInProvider, error);
                 }
             });
         } else {
             // in case of error, propogate the error back to customer, but do not dismiss sign in vc
             if (self.completionHandler) {
                 self.completionHandler(signInProvider, error);
             }
         }
         
         AWSDDLogDebug(@"result = %@, error = %@", result, error);
     }];
}

- (void)setUpUserPoolsUI {
    if (self.config.enableUserPoolsUI) {
        AWSDDLogDebug(@"User Pools Enabled. Setting up the view...");
        Class formTableCell = NSClassFromString(@"AWSFormTableCell");
        self.passwordRow = [[formTableCell alloc] initWithPlaceHolder:@"Password"
                                                                 type:InputTypePassword];
        self.userNameRow = [[formTableCell alloc] initWithPlaceHolder:@"User Name"
                                                                 type:InputTypeText];
        Class formTableDelegate = NSClassFromString(@"AWSFormTableDelegate");
        self.tableDelegate = [formTableDelegate new];
        [self.tableDelegate addCell:self.userNameRow];
        [self.tableDelegate addCell:self.passwordRow];
        self.tableView.delegate = self.tableDelegate;
        self.tableView.dataSource = self.tableDelegate;
        [self.tableView reloadData];
        Class AWSUserPoolsUIHelper = NSClassFromString(@"AWSUserPoolsUIHelper");
        if ([AWSUserPoolsUIHelper respondsToSelector:@selector(setUpFormShadowForView:)]) {
            [AWSUserPoolsUIHelper setUpFormShadowForView:self.tableFormView];
        }
        
        
        // Add SignInButton to the view
        [self.signInButton addTarget:self
                              action:@selector(handleUserPoolSignIn)
                    forControlEvents:UIControlEventTouchUpInside];
        
        if (self.config.enableUserPoolsUI) {
            
            [self.forgotPasswordButton addTarget:self
                                          action:@selector(handleUserPoolForgotPassword)
                                forControlEvents:UIControlEventTouchUpInside];
        } else {
            [self.forgotPasswordButton removeFromSuperview];
        }
        
        if (self.config.enableUserPoolsUI) {
            
            [self.signUpButton addTarget:self
                                  action:@selector(handleUserPoolSignUp)
                        forControlEvents:UIControlEventTouchUpInside];
        } else {
            [self.signUpButton removeFromSuperview];
        }
    } else {
        [self.tableFormView removeFromSuperview];
        self.orSignInWithLabel.text = @"Sign in with";
        [self.signInButton removeFromSuperview];
        [self.signUpButton removeFromSuperview];
        [self.forgotPasswordButton removeFromSuperview];
        
        [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.orSignInWithLabel
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.logoView
                                                               attribute:NSLayoutAttributeBottom multiplier:1 constant:8.0]];
    }
    if (![self.config hasSignInButtonView]) {
        [self.orSignInWithLabel removeFromSuperview];
    }
}

- (void)setUpLogo:(UIImage *)image {
    
    /** 
        If user did not select a logo image, use the default AWS Logo
        Else, use the logo image passed in by the user
     */
    if (image == nil) {
        self.logoView.contentMode = UIViewContentModeCenter;
        if (self.config.enableUserPoolsUI &&
            [self.config hasSignInButtonView]) {
            self.logoView.image = [AWSSignInViewController getImageFromBundle:SMALL_IMAGE_NAME];
        } else {
            self.logoView.image = [AWSSignInViewController getImageFromBundle:BIG_IMAGE_NAME];
            self.logoViewHeight.constant = SCALED_UP_LOGO_IMAGE_HEIGHT;
            [self.logoView setNeedsLayout];
            [self.view setNeedsLayout];
            [self.view layoutIfNeeded];
        }
    } else {
        if (self.config.enableUserPoolsUI &&
            [self.config hasSignInButtonView]) {
            self.logoViewHeight.constant = SCALED_DOWN_LOGO_IMAGE_HEIGHT;
        } else {
            self.logoViewHeight.constant = SCALED_UP_LOGO_IMAGE_HEIGHT;
        }
        self.logoView.image = image;
        self.logoView.contentMode = UIViewContentModeScaleAspectFit;
        [self.logoView setNeedsLayout];
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    }
}

- (void)setUpBackground:(UIColor *)color {
    self.view.backgroundColor = DEFAULT_BACKGROUND_COLOR_BOTTOM;
    if (self.config.enableUserPoolsUI) {
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
        if (color != nil) {
            backgroundImageView.backgroundColor = color;
        } else {
            backgroundImageView.backgroundColor = DEFAULT_BACKGROUND_COLOR_TOP;
        }
        backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.view insertSubview:backgroundImageView atIndex:0];
    }
}

- (void)setUpResponders {
    [self.signUpButton addTarget:self
                          action:@selector(handleUserPoolSignUp)
                forControlEvents:UIControlEventTouchUpInside];
    [self.signInButton addTarget:self
                          action:@selector(handleUserPoolSignIn)
                forControlEvents:UIControlEventTouchUpInside];
    [self.forgotPasswordButton addTarget:self
                                  action:@selector(handleUserPoolForgotPassword)
                        forControlEvents:UIControlEventTouchUpInside];
}

- (void)setUpNavigationController {
    self.navigationController.navigationBar.topItem.title = @"Sign In";
    self.canCancel = self.config.canCancel;
    if (self.canCancel) {
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                         style:UIBarButtonItemStylePlain
                                                                        target:self
                                                                        action:@selector(barButtonClosePressed)];
        cancelButton.tintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.topItem.leftBarButtonItem = cancelButton;
    }
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                    };
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = self.config.backgroundColor ?: DEFAULT_BACKGROUND_COLOR_TOP;
    self.navigationController.navigationBar.tintColor = DEFAULT_BACKGROUND_COLOR_BOTTOM;
    
}

- (void)barButtonClosePressed {
    [self dismissViewControllerAnimated:YES completion:nil];
    AWSDDLogDebug(@"User closed sign in screen.");
}

- (void)addButtonViewstoSignInView {
    
    NSMutableArray<Class<AWSSignInButtonView>> *buttonViews = [self.config getAllSignInButtonViews];
    NSArray<UIButton *> *buttons = @[self.providerRow1, self.providerRow2, self.providerRow3];
    for (NSUInteger i = buttonViews.count; i < buttons.count; i++) {
        [buttons[i] removeFromSuperview];
    }
    if (buttonViews.count > 3) {
        [NSException raise:NSInvalidArgumentException format:@"Only 3 Button Sign In Providers are currently supported."];
    } else if (buttonViews.count == 3 && !self.config.enableUserPoolsUI) {
        for (UIButton *btn in buttons) {
            CGRect buttonFrame = btn.frame;
            buttonFrame.size = CGSizeMake(280, 30);
            btn.frame = buttonFrame;
        }
    }
    
    for (Class signInButtonViewClass in buttonViews) {
        AWSDDLogDebug(@"Operating on Button View=%@", signInButtonViewClass);
        UIButton *btn = buttons[[buttonViews indexOfObject:signInButtonViewClass]];
        UIView<AWSSignInButtonView> *buttonView = [[signInButtonViewClass alloc] initWithFrame:CGRectMake(0, 0, btn.frame.size.width, btn.frame.size.height)];
        buttonView.buttonStyle = AWSSignInButtonStyleLarge;
        buttonView.delegate = self;
        
        [btn addSubview:buttonView];
    }
    
    [self.view setNeedsLayout];
    [self.view setNeedsDisplay];
}

+ (UIImage *)getImageFromBundle:(NSString *)imageName {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    NSURL *url = [[currentBundle resourceURL] URLByAppendingPathComponent:RESOURCES_BUNDLE];
    AWSDDLogDebug(@"URL: %@", url);
    
    NSBundle *assetsBundle = [NSBundle bundleWithURL:url];
    AWSDDLogDebug(@"assetsBundle: %@", assetsBundle);
    
    [assetsBundle load];
    UIImage *imageFromBundle = [UIImage imageNamed:imageName inBundle:assetsBundle compatibleWithTraitCollection:nil];
    if (imageFromBundle) {
        return  imageFromBundle;
    } else {
        return [UIImage imageNamed:imageName inBundle:currentBundle compatibleWithTraitCollection:nil];
    }
}

+ (UIStoryboard *)getUIStoryboardFromBundle:(NSString *)storyboardName {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    NSURL *url = [[currentBundle resourceURL] URLByAppendingPathComponent:RESOURCES_BUNDLE];
    AWSDDLogDebug(@"URL: %@", url);
    
    NSBundle *resourcesBundle = [NSBundle bundleWithURL:url];
    AWSDDLogDebug(@"assetsBundle: %@", resourcesBundle);
    
    [resourcesBundle load];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName
                                                         bundle:resourcesBundle];
    
    if (storyboard) {
        return storyboard;
    } else {
        return [UIStoryboard storyboardWithName:storyboardName
                                         bundle:currentBundle];
    }
}

+ (UIViewController *)getViewControllerWithName:(NSString *)viewControllerIdentitifer
                                     storyboard:(NSString *)storyboardIdentifier {
    UIStoryboard *storyboard = [AWSSignInViewController getUIStoryboardFromBundle:storyboardIdentifier];
    return (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:viewControllerIdentitifer];
}

+ (AWSSignInViewController *)getAWSSignInViewControllerWithconfiguration:(AWSAuthUIConfiguration *)configuration {
    AWSSignInViewController *vc = (AWSSignInViewController *)[AWSSignInViewController getViewControllerWithName:SIGNIN_VIEW_CONTROLLER_IDENTIFIER
                                                                                                     storyboard:SIGNIN_STORYBOARD];
    if (configuration) {
        vc.config = configuration;
    }
    return vc;
}

#pragma mark - IBActions

- (void)handleUserPoolSignIn {
    Class awsUserPoolsUIOperations = NSClassFromString(USERPOOLS_UI_OPERATIONS);
    AWSUserPoolsUIOperations *userPoolsOperations = [[awsUserPoolsUIOperations alloc] initWithAuthUIConfiguration:self.config];
    [userPoolsOperations loginWithUserName:[self.tableDelegate getValueForCell:self.userNameRow forTableView:self.tableView]
                                  password:[self.tableDelegate getValueForCell:self.passwordRow forTableView:self.tableView]
                      navigationController:self.navigationController
                         completionHandler:self.completionHandler];
}


- (void)handleUserPoolSignUp {
    
    // Dismisses the keyboard if open before transitioning to the new storyboard
    [self.view endEditing:YES];
    
    Class awsUserPoolsUIOperations = NSClassFromString(USERPOOLS_UI_OPERATIONS);
    AWSUserPoolsUIOperations *userPoolsOperations = [[awsUserPoolsUIOperations alloc] initWithAuthUIConfiguration:self.config];
    [userPoolsOperations pushSignUpVCFromNavigationController:self.navigationController];
}

- (void)handleUserPoolForgotPassword {
    
    // Dismisses the keyboard if open before transitioning to the new storyboard
    [self.view endEditing:YES];
    
    Class awsUserPoolsUIOperations = NSClassFromString(USERPOOLS_UI_OPERATIONS);
    AWSUserPoolsUIOperations *userPoolsOperations = [[awsUserPoolsUIOperations alloc] initWithAuthUIConfiguration:self.config];
    [userPoolsOperations pushForgotPasswordVCFromNavigationController:self.navigationController];
}

- (void)onLoginWithSignInProvider:(id<AWSSignInProvider>)signInProvider
                           result:(id _Nullable)result
                            error:(NSError * _Nullable)error {
    if (!error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:YES
                                     completion:nil];
            if (self.completionHandler) {
                self.completionHandler(signInProvider, error);
            }
        });
    } else {
        // in case of error attempt, send a completion handler to customer but do not dismiss vc
        if (self.completionHandler) {
            self.completionHandler(signInProvider, error);
        }
    }
    AWSDDLogDebug(@"result = %@, error = %@", result, error);
}

@end
