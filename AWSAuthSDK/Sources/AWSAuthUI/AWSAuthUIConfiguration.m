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

#import "AWSAuthUIConfiguration.h"

@interface AWSAuthUIConfiguration ()

@property(nonatomic, nullable) NSMutableArray<Class<AWSSignInButtonView>> *registeredSignInButtonViews;

- (NSMutableArray<Class<AWSSignInButtonView>> *_Nonnull)getAllSignInButtonViews;

- (BOOL)hasSignInButtonView;

@end


@implementation AWSAuthUIConfiguration

@synthesize logoImage;

@synthesize backgroundColor;

@synthesize registeredSignInButtonViews;

@synthesize enableUserPoolsUI;

- (id)init {
    self = [super init];
    if (self) {
        self.registeredSignInButtonViews = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addAWSSignInButtonViewClass:(Class<AWSSignInButtonView>)signInButtonViewClass {
    if (self.registeredSignInButtonViews == nil) {
        self.registeredSignInButtonViews = [[NSMutableArray alloc] init];
    }
    [self.registeredSignInButtonViews addObject:signInButtonViewClass];
}

- (NSMutableArray<Class<AWSSignInButtonView>> *)getAllSignInButtonViews {
    return self.registeredSignInButtonViews;
}

- (BOOL)hasSignInButtonView {
    return self.registeredSignInButtonViews.count > 0;
}

@end
