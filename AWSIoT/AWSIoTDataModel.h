//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSIoTDataErrorDomain;

typedef NS_ENUM(NSInteger, AWSIoTDataErrorType) {
    AWSIoTDataErrorUnknown,
    AWSIoTDataErrorConflict,
    AWSIoTDataErrorInternalFailure,
    AWSIoTDataErrorInvalidRequest,
    AWSIoTDataErrorMethodNotAllowed,
    AWSIoTDataErrorRequestEntityTooLarge,
    AWSIoTDataErrorResourceNotFound,
    AWSIoTDataErrorServiceUnavailable,
    AWSIoTDataErrorThrottling,
    AWSIoTDataErrorUnauthorized,
    AWSIoTDataErrorUnsupportedDocumentEncoding,
};

@class AWSIoTDataDeleteThingShadowRequest;
@class AWSIoTDataDeleteThingShadowResponse;
@class AWSIoTDataGetThingShadowRequest;
@class AWSIoTDataGetThingShadowResponse;
@class AWSIoTDataPublishRequest;
@class AWSIoTDataUpdateThingShadowRequest;
@class AWSIoTDataUpdateThingShadowResponse;

/**
 <p>The input for the DeleteThingShadow operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTDataDeleteThingShadowRequest : AWSRequest


/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the DeleteThingShadow operation.</p>
 Required parameters: [payload]
 */
@interface AWSIoTDataDeleteThingShadowResponse : AWSModel


/**
 <p>The state information, in JSON format.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

@end

/**
 <p>The input for the GetThingShadow operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTDataGetThingShadowRequest : AWSRequest


/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the GetThingShadow operation.</p>
 */
@interface AWSIoTDataGetThingShadowResponse : AWSModel


/**
 <p>The state information, in JSON format.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

@end

/**
 <p>The input for the Publish operation.</p>
 Required parameters: [topic]
 */
@interface AWSIoTDataPublishRequest : AWSRequest


/**
 <p>The state information, in JSON format.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

/**
 <p>The Quality of Service (QoS) level.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable qos;

/**
 <p>The name of the MQTT topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>The input for the UpdateThingShadow operation.</p>
 Required parameters: [thingName, payload]
 */
@interface AWSIoTDataUpdateThingShadowRequest : AWSRequest


/**
 <p>The state information, in JSON format.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the UpdateThingShadow operation.</p>
 */
@interface AWSIoTDataUpdateThingShadowResponse : AWSModel


/**
 <p>The state information, in JSON format.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

@end

NS_ASSUME_NONNULL_END
