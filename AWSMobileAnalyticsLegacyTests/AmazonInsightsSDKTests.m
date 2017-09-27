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

#import "AmazonInsightsSDKTests.h"
#import <objc/objc.h>
#import "AWSMockFileManager.h"
#define methodSwizzle(class, original, swizzle) (method_exchangeImplementations(\
class_getInstanceMethod(class, original), class_getInstanceMethod(class, swizzle)))


@implementation NSString (RegExpExtensions)
- (BOOL)doesMatchRegStringExp:(NSString *)string {
    NSPredicate *regExpPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", string];
    return [regExpPredicate evaluateWithObject:self];
}
@end


@implementation ClassMethodSwizzler

-(id) initWithSourceClass:(Class)sourceClass
             withNewClass:(Class)newClass
withClassSelectorToSwizzle:(SEL)selectorToSwizzle
   withClassSelectorToUse:(SEL)selectorToUse
{
    if (self = [super init]) {
        self.originalMethod = class_getClassMethod(sourceClass, selectorToSwizzle);
        self.newMethod = class_getClassMethod(newClass, selectorToUse);
    }
    return self;
}

-(void) applySwizzle
{
    if(!self.isSwizzleActive)
    {
        method_exchangeImplementations(self.originalMethod, self.newMethod);
        self.isSwizzleActive = YES;
    }
    
}

-(void) revertSwizzle
{
    if(self.isSwizzleActive)
    {
        method_exchangeImplementations(self.newMethod, self.originalMethod);
        self.isSwizzleActive = FALSE;
    }
    
    
}

@end


@implementation AmazonInsightsSDKTests

- (void) setUp
{
     
    [super setUp];
    
}

- (void) tearDown
{
    [super tearDown];
    
}


- (void)testMethod
{
    assertThatBool(YES, is(equalToBool(YES)));
}

@end
