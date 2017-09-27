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

#import "AWSFacebookSignInButton.h"
#import "AWSFacebookSignInProvider.h"

#define SPACING_HORIZONTAL 10
#define SPACING_VERTICAL 5
#define HIGH_HUGGING_PRIORITY 99
#define LOW_HUGGING_PRIORITY 1
// Facebook Blue color to match the logo
#define FB_BLUE_COLOR [UIColor colorWithRed:60.0/255.0 green:92.0/255.0 blue:149.0 /255.0 alpha:1.0]

typedef void (^AWSSignInManagerCompletionBlock)(id result, NSError *error);

static NSString *FacebookLogoImageKey = @"fb-icon";

@interface AWSFacebookSignInButton()

@property (nonatomic, strong) id<AWSSignInProvider> signInProvider;
@property (nonatomic, strong) UIButton *facebookButton;
@property (nonatomic, strong) UIStackView *facebookStackView;
@property (nonatomic, strong) UIImageView *facebookLogoImageView;

@end

@implementation AWSFacebookSignInButton

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
    _signInProvider = [AWSFacebookSignInProvider sharedInstance];
    [self initFacebookButton];
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
        if (self.facebookButton) {
            [self.facebookButton setImage:nil forState:UIControlStateNormal];
        }
        if (buttonStyle == AWSSignInButtonStyleLarge) {
            [self setupLargeFacebookButton];
        } else {
            [self setupSmallFacebookButton];
        }
        // refresh views
        [self.facebookButton setNeedsDisplay];
        [self setNeedsDisplay];
    }
}

- (void)initFacebookButton {
    _facebookButton = [[UIButton alloc] init];
    [self addObserver:self forKeyPath:@"buttonStyle" options:0 context:nil];
    [self.facebookButton addTarget:self
                       action:@selector(logInWithProvider:)
             forControlEvents:UIControlEventTouchUpInside];
    CGRect buttonFrame = _facebookButton.frame;
    buttonFrame.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    self.facebookButton.frame = buttonFrame;
    self.facebookButton.contentMode = UIViewContentModeCenter;
    [self addSubview:self.facebookButton];
}

- (void)initLogo {
    UIImage *providerImage = [self getImageFromBundle:FacebookLogoImageKey];
    UIImageView *facebookLogoImageView = [[UIImageView alloc] initWithImage:providerImage];
    facebookLogoImageView.contentMode = UIViewContentModeScaleAspectFit;
    facebookLogoImageView.exclusiveTouch = NO;
    facebookLogoImageView.userInteractionEnabled = NO;
    [self.facebookStackView addArrangedSubview:facebookLogoImageView];
}

-(void)initStackView {
    _facebookStackView = [[UIStackView alloc] initWithFrame:_facebookButton.frame];
    self.facebookStackView.axis = UILayoutConstraintAxisHorizontal;
    self.facebookStackView.distribution = UIStackViewDistributionEqualCentering;
    self.facebookStackView.contentMode = UIViewContentModeScaleAspectFit;
    self.facebookStackView.alignment = UIStackViewAlignmentCenter;
    self.facebookStackView.layoutMargins = UIEdgeInsetsMake(SPACING_VERTICAL, SPACING_HORIZONTAL, SPACING_VERTICAL, SPACING_HORIZONTAL);
    [self.facebookStackView setLayoutMarginsRelativeArrangement:YES];
    [self.facebookStackView setSpacing:SPACING_HORIZONTAL];
    self.facebookStackView.exclusiveTouch = NO;
    self.facebookStackView.userInteractionEnabled = NO;
    [self.facebookButton addSubview:self.facebookStackView];
}

- (void)initLabel {
    _textLabel = [[UILabel alloc] initWithFrame:_facebookButton.frame];
    self.textLabel.numberOfLines = 1;
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.text = @"Continue with Facebook";
    self.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.exclusiveTouch = NO;
    self.textLabel.userInteractionEnabled = NO;
    [self.textLabel setContentHuggingPriority:HIGH_HUGGING_PRIORITY forAxis:UILayoutConstraintAxisHorizontal];
    self.textLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    self.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
}

- (void)setUpButtonEffects {
    // Facebook Icon Blue Color as background color
    UIColor *fbBackGroundColor = FB_BLUE_COLOR;
    [self.facebookButton setBackgroundColor: fbBackGroundColor];
    self.facebookButton.layer.cornerRadius = 4.0f;
    self.facebookButton.layer.borderWidth = 0.1f;
    self.facebookButton.layer.borderColor = [[UIColor grayColor] CGColor];
    self.facebookButton.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.facebookButton.layer.shadowOffset = CGSizeMake(0, 2.0f);
    self.facebookButton.layer.shadowOpacity = 0.5f;
    self.facebookButton.layer.shadowRadius = 0.0f;
    self.facebookButton.layer.masksToBounds = NO;
}

- (void)setupSmallFacebookButton {
    [self.textLabel removeFromSuperview];
    self.facebookStackView.distribution = UIStackViewDistributionEqualCentering;
}

- (void)setupLargeFacebookButton {
    self.facebookStackView.distribution = UIStackViewDistributionFill;
    [self.facebookLogoImageView setContentHuggingPriority:LOW_HUGGING_PRIORITY forAxis:UILayoutConstraintAxisHorizontal];
    [self.facebookStackView addArrangedSubview:self.textLabel];
}

- (UIImage *)getImageFromBundle:(NSString *)imageName {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    UIImage *imageFromBundle = [UIImage imageNamed:imageName inBundle:currentBundle compatibleWithTraitCollection:nil];
    if (imageFromBundle) {
        return  imageFromBundle;
    }
    NSURL *url = [[currentBundle resourceURL] URLByAppendingPathComponent:@"AWSFacebookSignIn.bundle"];
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