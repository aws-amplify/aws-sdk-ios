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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import <AWSAuthCore/AWSAuthCore.h>

#import "AWSFormTableCell.h"
#import "AWSTableInputCell.h"
#import "AWSFormTableDelegate.h"
#import "AWSSignInViewController.h"

#define NAVIGATION_BAR_HEIGHT 64

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

@interface AWSSignInManager()

@property (nonatomic) BOOL shouldFederate;
@property (nonatomic) BOOL pendingSignIn;
@property (strong, atomic) NSString *pendingUsername;
@property (strong, atomic) NSString *pendingPassword;

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


- (void)keyboardDidShow:(NSNotification *)notification {
    CGSize keyboardSize = ((NSValue *)[[notification userInfo]
                                       valueForKey:UIKeyboardFrameBeginUserInfoKey]).CGRectValue.size;
    
    CGPoint buttonOrigin = self.signInButton.frame.origin;
    CGRect visibleRect = self.view.frame;
    
    visibleRect.size.height -= keyboardSize.height;
    
    if (visibleRect.size.height < buttonOrigin.y) {
        [self.view setFrame:CGRectMake(0,visibleRect.size.height - buttonOrigin.y, self.view.frame.size.width, self.view.frame.size.height)];
    }
}

- (void)keyboardDidHide:(NSNotification *)notification {
    [self.view setFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT ,self.view.frame.size.width,self.view.frame.size.height)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AWSDDLogDebug(@"Sign-In Loading...");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
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
    
    // Setup the font
    if (self.config.font) {
        [self setUpFont];
    }
}
    
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([AWSSignInManager sharedInstance].pendingSignIn) {
        
        Class awsUserPoolsUIOperations = NSClassFromString(USERPOOLS_UI_OPERATIONS);
        AWSUserPoolsUIOperations *userPoolsOperations = [[awsUserPoolsUIOperations alloc] initWithAuthUIConfiguration:self.config];
        [userPoolsOperations loginWithUserName:[AWSSignInManager sharedInstance].pendingUsername
                                      password:[AWSSignInManager sharedInstance].pendingPassword
                          navigationController:self.navigationController
                             completionHandler:self.completionHandler];
    }
    [AWSSignInManager sharedInstance].pendingSignIn = NO;
    [AWSSignInManager sharedInstance].pendingUsername = @"";
    [AWSSignInManager sharedInstance].pendingPassword = @"";
    
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
         
         if (![[AWSSignInManager sharedInstance] shouldFederate]) {
             if (error) {
                 self.completionHandlerCustom(nil, nil, error);
             } else {
                 [[signInProvider token] continueWithBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
                     if (task.result) {
                         NSString *token = task.result;
                         NSString *provider = signInProvider.identityProviderName;
                         self.completionHandlerCustom(provider, token, nil);
                     }
                     return nil;
                 }];
             }
         } else if (!error) {
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
        Class AWSAuthUIHelper = NSClassFromString(@"AWSAuthUIHelper");
        if ([AWSAuthUIHelper respondsToSelector:@selector(setUpFormShadowForView:)]) {
            [AWSAuthUIHelper setUpFormShadowForView:self.tableFormView];
        }
        
        if ([AWSAuthUIHelper respondsToSelector:@selector(setAWSUIConfiguration:)]) {
            [AWSAuthUIHelper setAWSUIConfiguration:self.config];
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
        
        if (self.config.enableUserPoolsUI && !self.config.disableSignUpButton) {
            
            [self.signUpButton addTarget:self
                                  action:@selector(handleUserPoolSignUp)
                        forControlEvents:UIControlEventTouchUpInside];
        } else {
            [self.signUpButton setAlpha:0.0f];
        }
        
        // style buttons (primary color)
        if (self.config.primaryColor) {
            self.signInButton.backgroundColor = self.config.primaryColor;
            self.signUpButton.tintColor = self.config.primaryColor;
            self.forgotPasswordButton.tintColor = self.config.primaryColor;
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
    if (self.config.isBackgroundColorFullScreen) {
        self.view.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    } else {
        self.view.backgroundColor = [AWSAuthUIHelper getSecondaryBackgroundColor];
    }
    
    if (self.config.enableUserPoolsUI) {
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
        if (color != nil) {
            backgroundImageView.backgroundColor = color;
        } else {
            backgroundImageView.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
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
    UIColor *textColor = [AWSAuthUIHelper getTextColor:config];

    self.navigationController.navigationBar.topItem.title = @"Sign In";
    self.canCancel = self.config.canCancel;
    if (self.canCancel) {
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                         style:UIBarButtonItemStylePlain
                                                                        target:self
                                                                        action:@selector(barButtonClosePressed)];
        cancelButton.tintColor = textColor;
        self.navigationController.navigationBar.topItem.leftBarButtonItem = cancelButton;
    }
    
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSForegroundColorAttributeName: textColor,
                                                                    };
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [AWSAuthUIHelper getBackgroundColor:config];
    self.navigationController.navigationBar.tintColor = textColor;
    
}

- (void)setUpFont {
    AWSDDLogDebug(@"Setting up Font");
    [self.signInButton.titleLabel setFont:self.config.font];
    [self.signUpButton.titleLabel setFont:self.config.font];
    [self.forgotPasswordButton.titleLabel setFont:self.config.font];
    [self.orSignInWithLabel setFont:self.config.font];
}

- (void)barButtonClosePressed {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.completionHandlerCustom(nil, nil, [[NSError alloc] initWithDomain:@"AWSMobileClientError" code:-2 userInfo:@{@"message": @"The user cancelled the sign in operation"}]);
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
        if (self.config.primaryColor) {
            buttonView.backgroundColor = self.config.primaryColor;
        }
        buttonView.delegate = self;
        
        [btn addSubview:buttonView];
    }
    
    [self.view setNeedsLayout];
    [self.view setNeedsDisplay];
}

+ (UIImage *)getImageFromBundle:(NSString *)imageName {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    // Check if the logo image is available in the framework directly; if available fetch and return it.
    // This is applicable when dependency is consumed via Carthage/ Frameworks.
    UIImage *imageFromCurrentBundle = [UIImage imageNamed:imageName inBundle:currentBundle compatibleWithTraitCollection:nil];
    if (imageFromCurrentBundle) {
        return imageFromCurrentBundle;
    }
    
    // If the image is not available in the framework, it is part of the resources bundle.
    // This is applicable when dependency is consumed via Cocoapods.
    NSURL *url = [[currentBundle resourceURL] URLByAppendingPathComponent:RESOURCES_BUNDLE];
    AWSDDLogDebug(@"URL: %@", url);
    
    NSBundle *assetsBundle = [NSBundle bundleWithURL:url];
    AWSDDLogDebug(@"assetsBundle: %@", assetsBundle);
    
    return [UIImage imageNamed:imageName inBundle:assetsBundle compatibleWithTraitCollection:nil];
}

+ (UIStoryboard *)getUIStoryboardFromBundle:(NSString *)storyboardName {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    
    // Check if the storyboard is available in the framework directly; if available fetch and return it.
    // This is applicable when dependency is consumed via Carthage/ Frameworks.
    if ([currentBundle pathForResource:storyboardName ofType:@"storyboardc"] != nil) {
        return [UIStoryboard storyboardWithName:storyboardName
                                         bundle:currentBundle];
    }
    
    // If the storyboard is not available in the framework, it is part of the resources bundle.
    // This is applicable when dependency is consumed via Cocoapods.
    NSURL *url = [[currentBundle resourceURL] URLByAppendingPathComponent:RESOURCES_BUNDLE];
    AWSDDLogDebug(@"URL: %@", url);
    
    NSBundle *resourcesBundle = [NSBundle bundleWithURL:url];
    AWSDDLogDebug(@"assetsBundle: %@", resourcesBundle);
    
    return [UIStoryboard storyboardWithName:storyboardName
                                     bundle:resourcesBundle];
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

-(void)createInternalCompletionHandler {
    __weak AWSSignInViewController *weakSelf = self;
    self.completionHandler = ^(id<AWSSignInProvider>  _Nonnull signInProvider, NSError * _Nullable error) {
        if (error) {
            weakSelf.completionHandlerCustom(nil, nil, error);
        } else{
            [[signInProvider token] continueWithBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
                if (task.result) {
                    weakSelf.completionHandlerCustom(signInProvider.identityProviderName, task.result, nil);
                } else {
                    weakSelf.completionHandlerCustom(nil, nil, task.error);
                }
                return nil;
            }];
        }
    };
}

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
