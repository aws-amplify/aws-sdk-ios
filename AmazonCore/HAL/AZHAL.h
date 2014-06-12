/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AZModel.h"

@interface AZHALResource : AZModel

/**
 *  Optional.
 */
@property (nonatomic, strong, readonly) NSDictionary *links;

/**
 *  Optional.
 */
@property (nonatomic, strong, readonly) NSDictionary *embedded;

@property (nonatomic, strong, readonly) NSDictionary *curies;

@property (nonatomic, strong, readonly) NSDictionary *resourceJSON;

- (instancetype)initWithJSONObject:(id)JSONObject;
- (instancetype)initWithHALResource:(AZHALResource *)HALResource;

+ (instancetype)resourceWithJSONObject:(id)JSONObject;
+ (instancetype)resourceWithHALResource:(AZHALResource *)HALResource;

@end

@interface AZHALLink : AZModel

@property (nonatomic, strong, readonly) NSString *rel;

/**
 *  Required.
 *  http://tools.ietf.org/html/draft-kelly-json-hal-06#section-5.1
 */
@property (nonatomic, strong, readonly) NSString *href;

/**
 *  Optional.
 *  http://tools.ietf.org/html/draft-kelly-json-hal-06#section-5.2
 */
@property (nonatomic, assign, readonly, getter=isTemplated) BOOL templated;

/**
 *  Optional.
 *  http://tools.ietf.org/html/draft-kelly-json-hal-06#section-5.3
 */
@property (nonatomic, strong, readonly) NSString *type;

/**
 *  Optional.
 *  http://tools.ietf.org/html/draft-kelly-json-hal-06#section-5.4
 */
@property (nonatomic, strong, readonly) NSString *deprecation;

/**
 *  Optional.
 *  http://tools.ietf.org/html/draft-kelly-json-hal-06#section-5.5
 */
@property (nonatomic, strong, readonly) NSString *name;

/**
 *  Optional.
 *  http://tools.ietf.org/html/draft-kelly-json-hal-06#section-5.6
 */
@property (nonatomic, strong, readonly) NSString *profile;

/**
 *  Optional.
 *  http://tools.ietf.org/html/draft-kelly-json-hal-06#section-5.7
 */
@property (nonatomic, strong, readonly) NSString *title;

/**
 *  Optional.
 *  http://tools.ietf.org/html/draft-kelly-json-hal-06#section-5.8
 */
@property (nonatomic, strong, readonly) NSString *hreflang;

+ (AZHALLink *)linkWithRel:(NSString *)rel JSONObject:(id)JSONObject;

@end
