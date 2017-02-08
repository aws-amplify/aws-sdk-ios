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

#import "NSLocale+TTTOverrideLocale.h"
#import "NSObject+TTTSwizzling.h"
#import <objc/runtime.h>

@implementation NSLocale (TTTOverrideLocale)

+ (void)load
{
    [self ttt_swizzleLocales];
}

static NSLocale *ttt_locale = nil;

+ (void)ttt_overrideRuntimeLocale:(NSLocale *)locale
{
    ttt_locale = locale;
}

+ (void)ttt_resetRuntimeLocale
{
    ttt_locale = nil;
}

+ (void)ttt_swizzleLocales
{
    [self ttt_swizzleClassMethod:@selector(autoupdatingCurrentLocale) withReplacement:@selector(ttt_autoupdatingCurrentLocale)];
    [self ttt_swizzleClassMethod:@selector(currentLocale) withReplacement:@selector(ttt_currentLocale)];
    [self ttt_swizzleClassMethod:@selector(systemLocale) withReplacement:@selector(ttt_systemLocale)];
}

+ (id /* NSLocale * */)ttt_autoupdatingCurrentLocale
{
    return ttt_locale ?: [self ttt_autoupdatingCurrentLocale];
}

+ (id /* NSLocale * */)ttt_currentLocale
{
    return ttt_locale ?: [self ttt_currentLocale];
}

+ (id /* NSLocale * */)ttt_systemLocale
{
    return ttt_locale ?: [self ttt_systemLocale];
}

@end
