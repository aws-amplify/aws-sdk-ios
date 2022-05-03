//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSKinesisVideoModel.h"

@interface AWSKinesisVideoNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSKinesisVideoChannelInfo API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoChannelNameCondition API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoCreateSignalingChannelInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoCreateSignalingChannelOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoCreateStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoCreateStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoDeleteSignalingChannelInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoDeleteSignalingChannelOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoDeleteStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoDeleteStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoDescribeImageGenerationConfigurationInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoDescribeImageGenerationConfigurationOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoDescribeNotificationConfigurationInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoDescribeNotificationConfigurationOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoDescribeSignalingChannelInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoDescribeSignalingChannelOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoDescribeStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoDescribeStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoGetDataEndpointInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoGetDataEndpointOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoGetSignalingChannelEndpointInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoGetSignalingChannelEndpointOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoImageGenerationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoImageGenerationDestinationConfig API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoListSignalingChannelsInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoListSignalingChannelsOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoListStreamsInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoListStreamsOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoListTagsForResourceInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoListTagsForResourceOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoListTagsForStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoListTagsForStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoNotificationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoNotificationDestinationConfig API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoResourceEndpointListItem API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoSingleMasterChannelEndpointConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoSingleMasterConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoStreamInfo API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoStreamNameCondition API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoTag API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoTagResourceInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoTagResourceOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoTagStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoTagStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUntagResourceInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUntagResourceOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUntagStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUntagStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUpdateDataRetentionInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUpdateDataRetentionOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUpdateImageGenerationConfigurationInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUpdateImageGenerationConfigurationOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUpdateNotificationConfigurationInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUpdateNotificationConfigurationOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUpdateSignalingChannelInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUpdateSignalingChannelOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUpdateStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisVideoUpdateStreamOutput API_AVAILABLE(ios(11));

@end

@implementation AWSKinesisVideoNSSecureCodingTests

- (void) test_AWSKinesisVideoChannelInfo {
    [self validateSecureCodingForClass:[AWSKinesisVideoChannelInfo class]];
}

- (void) test_AWSKinesisVideoChannelNameCondition {
    [self validateSecureCodingForClass:[AWSKinesisVideoChannelNameCondition class]];
}

- (void) test_AWSKinesisVideoCreateSignalingChannelInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoCreateSignalingChannelInput class]];
}

- (void) test_AWSKinesisVideoCreateSignalingChannelOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoCreateSignalingChannelOutput class]];
}

- (void) test_AWSKinesisVideoCreateStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoCreateStreamInput class]];
}

- (void) test_AWSKinesisVideoCreateStreamOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoCreateStreamOutput class]];
}

- (void) test_AWSKinesisVideoDeleteSignalingChannelInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoDeleteSignalingChannelInput class]];
}

- (void) test_AWSKinesisVideoDeleteSignalingChannelOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoDeleteSignalingChannelOutput class]];
}

- (void) test_AWSKinesisVideoDeleteStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoDeleteStreamInput class]];
}

- (void) test_AWSKinesisVideoDeleteStreamOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoDeleteStreamOutput class]];
}

- (void) test_AWSKinesisVideoDescribeImageGenerationConfigurationInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoDescribeImageGenerationConfigurationInput class]];
}

- (void) test_AWSKinesisVideoDescribeImageGenerationConfigurationOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoDescribeImageGenerationConfigurationOutput class]];
}

- (void) test_AWSKinesisVideoDescribeNotificationConfigurationInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoDescribeNotificationConfigurationInput class]];
}

- (void) test_AWSKinesisVideoDescribeNotificationConfigurationOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoDescribeNotificationConfigurationOutput class]];
}

- (void) test_AWSKinesisVideoDescribeSignalingChannelInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoDescribeSignalingChannelInput class]];
}

- (void) test_AWSKinesisVideoDescribeSignalingChannelOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoDescribeSignalingChannelOutput class]];
}

- (void) test_AWSKinesisVideoDescribeStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoDescribeStreamInput class]];
}

- (void) test_AWSKinesisVideoDescribeStreamOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoDescribeStreamOutput class]];
}

- (void) test_AWSKinesisVideoGetDataEndpointInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoGetDataEndpointInput class]];
}

- (void) test_AWSKinesisVideoGetDataEndpointOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoGetDataEndpointOutput class]];
}

- (void) test_AWSKinesisVideoGetSignalingChannelEndpointInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoGetSignalingChannelEndpointInput class]];
}

- (void) test_AWSKinesisVideoGetSignalingChannelEndpointOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoGetSignalingChannelEndpointOutput class]];
}

- (void) test_AWSKinesisVideoImageGenerationConfiguration {
    [self validateSecureCodingForClass:[AWSKinesisVideoImageGenerationConfiguration class]];
}

- (void) test_AWSKinesisVideoImageGenerationDestinationConfig {
    [self validateSecureCodingForClass:[AWSKinesisVideoImageGenerationDestinationConfig class]];
}

- (void) test_AWSKinesisVideoListSignalingChannelsInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoListSignalingChannelsInput class]];
}

- (void) test_AWSKinesisVideoListSignalingChannelsOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoListSignalingChannelsOutput class]];
}

- (void) test_AWSKinesisVideoListStreamsInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoListStreamsInput class]];
}

- (void) test_AWSKinesisVideoListStreamsOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoListStreamsOutput class]];
}

- (void) test_AWSKinesisVideoListTagsForResourceInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoListTagsForResourceInput class]];
}

- (void) test_AWSKinesisVideoListTagsForResourceOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoListTagsForResourceOutput class]];
}

- (void) test_AWSKinesisVideoListTagsForStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoListTagsForStreamInput class]];
}

- (void) test_AWSKinesisVideoListTagsForStreamOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoListTagsForStreamOutput class]];
}

- (void) test_AWSKinesisVideoNotificationConfiguration {
    [self validateSecureCodingForClass:[AWSKinesisVideoNotificationConfiguration class]];
}

- (void) test_AWSKinesisVideoNotificationDestinationConfig {
    [self validateSecureCodingForClass:[AWSKinesisVideoNotificationDestinationConfig class]];
}

- (void) test_AWSKinesisVideoResourceEndpointListItem {
    [self validateSecureCodingForClass:[AWSKinesisVideoResourceEndpointListItem class]];
}

- (void) test_AWSKinesisVideoSingleMasterChannelEndpointConfiguration {
    [self validateSecureCodingForClass:[AWSKinesisVideoSingleMasterChannelEndpointConfiguration class]];
}

- (void) test_AWSKinesisVideoSingleMasterConfiguration {
    [self validateSecureCodingForClass:[AWSKinesisVideoSingleMasterConfiguration class]];
}

- (void) test_AWSKinesisVideoStreamInfo {
    [self validateSecureCodingForClass:[AWSKinesisVideoStreamInfo class]];
}

- (void) test_AWSKinesisVideoStreamNameCondition {
    [self validateSecureCodingForClass:[AWSKinesisVideoStreamNameCondition class]];
}

- (void) test_AWSKinesisVideoTag {
    [self validateSecureCodingForClass:[AWSKinesisVideoTag class]];
}

- (void) test_AWSKinesisVideoTagResourceInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoTagResourceInput class]];
}

- (void) test_AWSKinesisVideoTagResourceOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoTagResourceOutput class]];
}

- (void) test_AWSKinesisVideoTagStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoTagStreamInput class]];
}

- (void) test_AWSKinesisVideoTagStreamOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoTagStreamOutput class]];
}

- (void) test_AWSKinesisVideoUntagResourceInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUntagResourceInput class]];
}

- (void) test_AWSKinesisVideoUntagResourceOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUntagResourceOutput class]];
}

- (void) test_AWSKinesisVideoUntagStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUntagStreamInput class]];
}

- (void) test_AWSKinesisVideoUntagStreamOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUntagStreamOutput class]];
}

- (void) test_AWSKinesisVideoUpdateDataRetentionInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUpdateDataRetentionInput class]];
}

- (void) test_AWSKinesisVideoUpdateDataRetentionOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUpdateDataRetentionOutput class]];
}

- (void) test_AWSKinesisVideoUpdateImageGenerationConfigurationInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUpdateImageGenerationConfigurationInput class]];
}

- (void) test_AWSKinesisVideoUpdateImageGenerationConfigurationOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUpdateImageGenerationConfigurationOutput class]];
}

- (void) test_AWSKinesisVideoUpdateNotificationConfigurationInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUpdateNotificationConfigurationInput class]];
}

- (void) test_AWSKinesisVideoUpdateNotificationConfigurationOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUpdateNotificationConfigurationOutput class]];
}

- (void) test_AWSKinesisVideoUpdateSignalingChannelInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUpdateSignalingChannelInput class]];
}

- (void) test_AWSKinesisVideoUpdateSignalingChannelOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUpdateSignalingChannelOutput class]];
}

- (void) test_AWSKinesisVideoUpdateStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUpdateStreamInput class]];
}

- (void) test_AWSKinesisVideoUpdateStreamOutput {
    [self validateSecureCodingForClass:[AWSKinesisVideoUpdateStreamOutput class]];
}

@end

