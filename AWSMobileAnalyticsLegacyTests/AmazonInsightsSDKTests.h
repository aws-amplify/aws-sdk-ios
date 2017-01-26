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

#define HC_SHORTHAND

#import <objc/runtime.h>
#import <OCHamcrestIOS/OCHamcrestIOS.h>
#import <XCTest/XCTest.h>
#import "OCMock.h"

@interface NSString (RegExpExtensions)
- (BOOL)doesMatchRegStringExp:(NSString *)string;
@end

@interface ClassMethodSwizzler : NSObject
@property Method originalMethod;
@property Method newMethod;
@property BOOL isSwizzleActive;

-(id)  initWithSourceClass:(Class)sourceClass
              withNewClass:(Class)newClass
withClassSelectorToSwizzle:(SEL)selectorToSwizzle
    withClassSelectorToUse:(SEL)selectorToUse;

-(void) applySwizzle;
-(void) revertSwizzle;

@end

@interface AmazonInsightsSDKTests : XCTestCase
void SwizzleClassMethod(Class c, SEL orig, SEL new);
@end
