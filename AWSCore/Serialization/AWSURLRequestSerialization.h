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

#import "AZNetworking.h"

@interface AWSJSONRequestSerializer : NSObject <AZURLRequestSerializer>

@end

@interface AWSXMLRequestSerializer : NSObject <AZURLRequestSerializer>

+ (instancetype)serializerWithResource:(NSString *)resource
                            actionName:(NSString *)actionName;

@end

@interface AWSQueryStringRequestSerializer : NSObject <AZURLRequestSerializer>

+ (instancetype)serializerWithResource:(NSString *)resource
                            actionName:(NSString *)actionName;

@property (nonatomic, strong) NSDictionary *additionalParameters;
@property (nonatomic, strong) NSString *dateFormat;

@end
