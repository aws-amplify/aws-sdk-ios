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

#import "AWSHALModel.h"

#import "AZNetworking.h"
#import "AWSService.h"

@interface AWSHALModel()

@property (nonatomic, strong) AWSHALService *HALService;

@end

@implementation AWSHALModel

- (instancetype)initWithHALResource:(AZHALResource *)HALResource
                         HALService:(AWSHALService *)HALService {
    if (self = [super initWithHALResource:HALResource]) {
        _HALService = HALService;
    }

    return self;
}

+ (instancetype)resourceWithHALResource:(AZHALResource *)HALResource
                             HALService:(AWSHALService *)HALService {
    return [[self alloc] initWithHALResource:HALResource
                                  HALService:HALService];
}

- (BFTask *)oneself {
    return [self.HALService followHALLink:self.links[@"self"]
                               HTTPMethod:AZHTTPMethodGET
                                  headers:nil
                               parameters:nil
                              outputClass:nil];
}

@end
