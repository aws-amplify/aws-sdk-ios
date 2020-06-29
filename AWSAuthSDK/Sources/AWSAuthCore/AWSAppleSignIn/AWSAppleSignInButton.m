//
//  AWSAppleSignInButton.m
//  AWSAuthCore
//
//  Created by Roy, Jithin on 6/28/20.
//  Copyright © 2020 Amazon Web Services. All rights reserved.
//

#import "AWSAppleSignInButton.h"
#import "AWSAppleSignInProvider.h"

@interface AWSAppleSignInButton()

@property (nonatomic, strong) id<AWSSignInProvider> signInProvider;

@property (nonatomic, strong) UIControl *appleButton;
@property (nonatomic, strong) UIStackView *appleStackView;

@end

@implementation AWSAppleSignInButton

@synthesize delegate;
@synthesize buttonStyle;

- (id)initWithCoder:(NSCoder*)aDecoder {

    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
        [self createAppleButton];
    }
    return self;
}

- (void)commonInit {
    _signInProvider = [AWSAppleSignInProvider sharedInstance];
}

- (void)createAppleButton {
    if (NSClassFromString(@"ASAuthorizationAppleIDButton")) {
        // Do something
        _appleButton = [[NSClassFromString(@"ASAuthorizationAppleIDButton") alloc] init];
        [self.appleButton addTarget:self
                             action:@selector(logInWithProvider:)
                   forControlEvents:UIControlEventTouchUpInside];
        CGRect buttonFrame = self.appleButton.frame;
        buttonFrame.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
        self.appleButton.frame = buttonFrame;
        AWSDDLogDebug(@"Apple Frame: %f %f", self.frame.size.width, self.frame.size.height);
        AWSDDLogDebug(@"Apple Button: %f %f", self.appleButton.frame.size.width,
                      self.appleButton.frame.size.height);
        [self addSubview:self.appleButton];
    }
}

- (void)setSignInProvider:(id<AWSSignInProvider>)signInProvider {
    self.signInProvider = signInProvider;
}

- (void)logInWithProvider:(id)sender {

    [[AWSSignInManager sharedInstance] loginWithSignInProviderKey:[self.signInProvider identityProviderName]
                                                completionHandler:^(id result, NSError *error) {
        [self.delegate onLoginWithSignInProvider:self.signInProvider result:result error:error];
    }];
}
@end
