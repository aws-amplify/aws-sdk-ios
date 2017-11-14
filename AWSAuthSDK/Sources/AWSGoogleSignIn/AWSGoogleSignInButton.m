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

#import "AWSGoogleSignInButton.h"
#import "AWSGoogleSignInProvider.h"

#define SPACING_HORIZONTAL 10
#define SPACING_VERTICAL 5
#define HIGH_HUGGING_PRIORITY 99
#define LOW_HUGGING_PRIORITY 1

typedef void (^AWSSignInManagerCompletionBlock)(id result, NSError *error);

static NSString *GoogleLogoImageKey = @"google-icon";
static NSString *RESOURCES_BUNDLE = @"AWSGoogleSignIn.bundle";

@interface AWSGoogleSignInButton()

@property (nonatomic, strong) id<AWSSignInProvider> signInProvider;

@property (nonatomic, strong) UIImageView *signInButton;
@property (nonatomic, strong) UIButton *googleButton;
@property (nonatomic, strong) UIStackView *googleStackView;
@property (nonatomic, strong) UIImageView *googleLogoImageView;

@end

@implementation AWSGoogleSignInButton

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
    }
    return self;
}

- (void)commonInit {
    _signInProvider = [AWSGoogleSignInProvider sharedInstance];
    [self initGoogleButton];
    [self setUpButtonEffects];
    [self initStackView];
    [self initLogo];
    [self initLabel];
}

- (void)dealloc {
    @try {
        [self removeObserver:self forKeyPath:@"buttonStyle" context:nil];
    } @catch(id exception) {
        // ignore exception
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // property set
    if ([keyPath isEqualToString:@"buttonStyle"]) {
        if (self.googleButton) {
            [self.googleButton setImage:nil forState:UIControlStateNormal];
        }
        if (buttonStyle == AWSSignInButtonStyleLarge) {
            [self setupLargeGoogleButton];
        } else {
            [self setupSmallGoogleButton];
        }
        // refresh views
        [self.googleButton setNeedsDisplay];
        [self setNeedsDisplay];
    }
}

- (void)initGoogleButton {
    _googleButton = [[UIButton alloc] init];
    [self addObserver:self forKeyPath:@"buttonStyle" options:0 context:nil];
    [self.googleButton addTarget:self
                     action:@selector(logInWithProvider:)
           forControlEvents:UIControlEventTouchUpInside];
    CGRect buttonFrame = self.googleButton.frame;
    buttonFrame.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    self.googleButton.frame = buttonFrame;
    AWSDDLogDebug(@"Google Frame: %f %f", self.frame.size.width, self.frame.size.height);
    AWSDDLogDebug(@"Google Button: %f %f", self.googleButton.frame.size.width, self.googleButton.frame.size.height);
    [self addSubview:self.googleButton];
}

- (void)initLogo {
    UIImage *providerImage = [self getImageFromBundle:GoogleLogoImageKey];
    UIImageView *logoImageView = [[UIImageView alloc] initWithImage:providerImage];
    logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    logoImageView.exclusiveTouch = NO;
    logoImageView.userInteractionEnabled = NO;
    [self.googleStackView addArrangedSubview:logoImageView];
}

-(void)initStackView {
    _googleStackView = [[UIStackView alloc] initWithFrame:self.googleButton.frame];
    self.googleStackView.axis = UILayoutConstraintAxisHorizontal;
    self.googleStackView.distribution = UIStackViewDistributionEqualSpacing;
    self.googleStackView.contentMode = UIViewContentModeScaleAspectFit;
    self.googleStackView.alignment = UIStackViewAlignmentCenter;
    self.googleStackView.layoutMargins = UIEdgeInsetsMake(SPACING_VERTICAL, SPACING_HORIZONTAL, SPACING_VERTICAL, SPACING_HORIZONTAL);
    [self.googleStackView setLayoutMarginsRelativeArrangement:YES];
    [self.googleStackView setSpacing:SPACING_HORIZONTAL];
    self.googleStackView.exclusiveTouch = NO;
    self.googleStackView.userInteractionEnabled = NO;
    [self.googleButton addSubview:self.googleStackView];
}

- (void)initLabel {
    _textLabel = [[UILabel alloc] initWithFrame:self.googleButton.frame];
    self.textLabel.numberOfLines = 1;
    self.textLabel.text = @"Sign in with Google";
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    self.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
    
    self.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    self.textLabel.textColor = [UIColor darkGrayColor];
    self.textLabel.exclusiveTouch = NO;
    self.textLabel.userInteractionEnabled = NO;
    [self.textLabel setContentHuggingPriority:HIGH_HUGGING_PRIORITY forAxis:UILayoutConstraintAxisHorizontal];
}

- (void)setUpButtonEffects {
    self.googleButton.backgroundColor = [UIColor whiteColor];
    self.googleButton.layer.cornerRadius = 4.0f;
    self.googleButton.layer.borderWidth = 0.1f;
    self.googleButton.layer.borderColor = [[UIColor grayColor] CGColor];
    self.googleButton.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.googleButton.layer.shadowOffset = CGSizeMake(0, 2.0f);
    self.googleButton.layer.shadowOpacity = 0.5f;
    self.googleButton.layer.shadowRadius = 0.0f;
    self.googleButton.layer.masksToBounds = NO;
}

- (void)setupSmallGoogleButton {
    self.googleStackView.distribution = UIStackViewDistributionEqualCentering;
    [self.textLabel removeFromSuperview];
}

- (void)setupLargeGoogleButton {
    self.googleStackView.distribution = UIStackViewDistributionFill;
    [self.googleLogoImageView setContentHuggingPriority:LOW_HUGGING_PRIORITY forAxis:UILayoutConstraintAxisHorizontal];
    [self.googleStackView addArrangedSubview:self.textLabel];
}


- (UIImage *)getImageFromBundle:(NSString *)imageName {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    UIImage *imageFromBundle = [UIImage imageNamed:imageName inBundle:currentBundle compatibleWithTraitCollection:nil];
    if (imageFromBundle) {
        return  imageFromBundle;
    }
    NSURL *url = [[currentBundle resourceURL] URLByAppendingPathComponent:RESOURCES_BUNDLE];
    NSBundle *assetsBundle = [NSBundle bundleWithURL:url];
    return [UIImage imageNamed:imageName inBundle:assetsBundle compatibleWithTraitCollection:nil];
}

- (void)setSignInProvider:(id<AWSSignInProvider>)signInProvider {
    self.signInProvider = signInProvider;
}

- (void)logInWithProvider:(id)sender {
    
    [[AWSSignInManager sharedInstance] loginWithSignInProviderKey:[self.signInProvider identityProviderName]
                                                completionHandler:^(id result, NSError *error) {
                                                    [self.delegate onLoginWithSignInProvider:self.signInProvider
                                                                                      result:result
                                                                                       error:error];
                                                }];
}

@end
