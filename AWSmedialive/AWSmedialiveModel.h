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

FOUNDATION_EXPORT NSString *const AWSmedialiveErrorDomain;

typedef NS_ENUM(NSInteger, AWSmedialiveErrorType) {
    AWSmedialiveErrorUnknown,
    AWSmedialiveErrorBadGateway,
    AWSmedialiveErrorBadRequest,
    AWSmedialiveErrorConflict,
    AWSmedialiveErrorForbidden,
    AWSmedialiveErrorGatewayTimeout,
    AWSmedialiveErrorInternalServerError,
    AWSmedialiveErrorNotFound,
    AWSmedialiveErrorTooManyRequests,
    AWSmedialiveErrorUnprocessableEntity,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAacCodingMode) {
    AWSmedialiveAacCodingModeUnknown,
    AWSmedialiveAacCodingModeAdReceiverMix,
    AWSmedialiveAacCodingModeCodingMode10,
    AWSmedialiveAacCodingModeCodingMode11,
    AWSmedialiveAacCodingModeCodingMode20,
    AWSmedialiveAacCodingModeCodingMode51,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAacInputType) {
    AWSmedialiveAacInputTypeUnknown,
    AWSmedialiveAacInputTypeBroadcasterMixedAd,
    AWSmedialiveAacInputTypeNormal,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAacProfile) {
    AWSmedialiveAacProfileUnknown,
    AWSmedialiveAacProfileHev1,
    AWSmedialiveAacProfileHev2,
    AWSmedialiveAacProfileLc,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAacRateControlMode) {
    AWSmedialiveAacRateControlModeUnknown,
    AWSmedialiveAacRateControlModeCbr,
    AWSmedialiveAacRateControlModeVbr,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAacRawFormat) {
    AWSmedialiveAacRawFormatUnknown,
    AWSmedialiveAacRawFormatLatmLoas,
    AWSmedialiveAacRawFormatNone,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAacSpec) {
    AWSmedialiveAacSpecUnknown,
    AWSmedialiveAacSpecMpeg2,
    AWSmedialiveAacSpecMpeg4,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAacVbrQuality) {
    AWSmedialiveAacVbrQualityUnknown,
    AWSmedialiveAacVbrQualityHigh,
    AWSmedialiveAacVbrQualityLow,
    AWSmedialiveAacVbrQualityMediumHigh,
    AWSmedialiveAacVbrQualityMediumLow,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAc3BitstreamMode) {
    AWSmedialiveAc3BitstreamModeUnknown,
    AWSmedialiveAc3BitstreamModeCommentary,
    AWSmedialiveAc3BitstreamModeCompleteMain,
    AWSmedialiveAc3BitstreamModeDialogue,
    AWSmedialiveAc3BitstreamModeEmergency,
    AWSmedialiveAc3BitstreamModeHearingImpaired,
    AWSmedialiveAc3BitstreamModeMusicAndEffects,
    AWSmedialiveAc3BitstreamModeVisuallyImpaired,
    AWSmedialiveAc3BitstreamModeVoiceOver,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAc3CodingMode) {
    AWSmedialiveAc3CodingModeUnknown,
    AWSmedialiveAc3CodingModeCodingMode10,
    AWSmedialiveAc3CodingModeCodingMode11,
    AWSmedialiveAc3CodingModeCodingMode20,
    AWSmedialiveAc3CodingModeCodingMode32Lfe,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAc3DrcProfile) {
    AWSmedialiveAc3DrcProfileUnknown,
    AWSmedialiveAc3DrcProfileFilmStandard,
    AWSmedialiveAc3DrcProfileNone,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAc3LfeFilter) {
    AWSmedialiveAc3LfeFilterUnknown,
    AWSmedialiveAc3LfeFilterDisabled,
    AWSmedialiveAc3LfeFilterEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAc3MetadataControl) {
    AWSmedialiveAc3MetadataControlUnknown,
    AWSmedialiveAc3MetadataControlFollowInput,
    AWSmedialiveAc3MetadataControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAfdSignaling) {
    AWSmedialiveAfdSignalingUnknown,
    AWSmedialiveAfdSignalingAuto,
    AWSmedialiveAfdSignalingFixed,
    AWSmedialiveAfdSignalingNone,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAudioDescriptionAudioTypeControl) {
    AWSmedialiveAudioDescriptionAudioTypeControlUnknown,
    AWSmedialiveAudioDescriptionAudioTypeControlFollowInput,
    AWSmedialiveAudioDescriptionAudioTypeControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAudioDescriptionLanguageCodeControl) {
    AWSmedialiveAudioDescriptionLanguageCodeControlUnknown,
    AWSmedialiveAudioDescriptionLanguageCodeControlFollowInput,
    AWSmedialiveAudioDescriptionLanguageCodeControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAudioLanguageSelectionPolicy) {
    AWSmedialiveAudioLanguageSelectionPolicyUnknown,
    AWSmedialiveAudioLanguageSelectionPolicyLoose,
    AWSmedialiveAudioLanguageSelectionPolicyStrict,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAudioNormalizationAlgorithm) {
    AWSmedialiveAudioNormalizationAlgorithmUnknown,
    AWSmedialiveAudioNormalizationAlgorithmItu17701,
    AWSmedialiveAudioNormalizationAlgorithmItu17702,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAudioNormalizationAlgorithmControl) {
    AWSmedialiveAudioNormalizationAlgorithmControlUnknown,
    AWSmedialiveAudioNormalizationAlgorithmControlCorrectAudio,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAudioOnlyHlsSegmentType) {
    AWSmedialiveAudioOnlyHlsSegmentTypeUnknown,
    AWSmedialiveAudioOnlyHlsSegmentTypeAac,
    AWSmedialiveAudioOnlyHlsSegmentTypeFmp4,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAudioOnlyHlsTrackType) {
    AWSmedialiveAudioOnlyHlsTrackTypeUnknown,
    AWSmedialiveAudioOnlyHlsTrackTypeAlternateAudioAutoSelect,
    AWSmedialiveAudioOnlyHlsTrackTypeAlternateAudioAutoSelectDefault,
    AWSmedialiveAudioOnlyHlsTrackTypeAlternateAudioNotAutoSelect,
    AWSmedialiveAudioOnlyHlsTrackTypeAudioOnlyVariantStream,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAudioType) {
    AWSmedialiveAudioTypeUnknown,
    AWSmedialiveAudioTypeCleanEffects,
    AWSmedialiveAudioTypeHearingImpaired,
    AWSmedialiveAudioTypeUndefined,
    AWSmedialiveAudioTypeVisualImpairedCommentary,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAuthenticationScheme) {
    AWSmedialiveAuthenticationSchemeUnknown,
    AWSmedialiveAuthenticationSchemeAkamai,
    AWSmedialiveAuthenticationSchemeCommon,
};

typedef NS_ENUM(NSInteger, AWSmedialiveAvailBlankingState) {
    AWSmedialiveAvailBlankingStateUnknown,
    AWSmedialiveAvailBlankingStateDisabled,
    AWSmedialiveAvailBlankingStateEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveBlackoutSlateNetworkEndBlackout) {
    AWSmedialiveBlackoutSlateNetworkEndBlackoutUnknown,
    AWSmedialiveBlackoutSlateNetworkEndBlackoutDisabled,
    AWSmedialiveBlackoutSlateNetworkEndBlackoutEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveBlackoutSlateState) {
    AWSmedialiveBlackoutSlateStateUnknown,
    AWSmedialiveBlackoutSlateStateDisabled,
    AWSmedialiveBlackoutSlateStateEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveBurnInAlignment) {
    AWSmedialiveBurnInAlignmentUnknown,
    AWSmedialiveBurnInAlignmentCentered,
    AWSmedialiveBurnInAlignmentLeft,
    AWSmedialiveBurnInAlignmentSmart,
};

typedef NS_ENUM(NSInteger, AWSmedialiveBurnInBackgroundColor) {
    AWSmedialiveBurnInBackgroundColorUnknown,
    AWSmedialiveBurnInBackgroundColorBlack,
    AWSmedialiveBurnInBackgroundColorNone,
    AWSmedialiveBurnInBackgroundColorWhite,
};

typedef NS_ENUM(NSInteger, AWSmedialiveBurnInFontColor) {
    AWSmedialiveBurnInFontColorUnknown,
    AWSmedialiveBurnInFontColorBlack,
    AWSmedialiveBurnInFontColorBlue,
    AWSmedialiveBurnInFontColorGreen,
    AWSmedialiveBurnInFontColorRed,
    AWSmedialiveBurnInFontColorWhite,
    AWSmedialiveBurnInFontColorYellow,
};

typedef NS_ENUM(NSInteger, AWSmedialiveBurnInOutlineColor) {
    AWSmedialiveBurnInOutlineColorUnknown,
    AWSmedialiveBurnInOutlineColorBlack,
    AWSmedialiveBurnInOutlineColorBlue,
    AWSmedialiveBurnInOutlineColorGreen,
    AWSmedialiveBurnInOutlineColorRed,
    AWSmedialiveBurnInOutlineColorWhite,
    AWSmedialiveBurnInOutlineColorYellow,
};

typedef NS_ENUM(NSInteger, AWSmedialiveBurnInShadowColor) {
    AWSmedialiveBurnInShadowColorUnknown,
    AWSmedialiveBurnInShadowColorBlack,
    AWSmedialiveBurnInShadowColorNone,
    AWSmedialiveBurnInShadowColorWhite,
};

typedef NS_ENUM(NSInteger, AWSmedialiveBurnInTeletextGridControl) {
    AWSmedialiveBurnInTeletextGridControlUnknown,
    AWSmedialiveBurnInTeletextGridControlFixed,
    AWSmedialiveBurnInTeletextGridControlScaled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveChannelClass) {
    AWSmedialiveChannelClassUnknown,
    AWSmedialiveChannelClassStandard,
    AWSmedialiveChannelClassSinglePipeline,
};

typedef NS_ENUM(NSInteger, AWSmedialiveChannelState) {
    AWSmedialiveChannelStateUnknown,
    AWSmedialiveChannelStateCreating,
    AWSmedialiveChannelStateCreateFailed,
    AWSmedialiveChannelStateIdle,
    AWSmedialiveChannelStateStarting,
    AWSmedialiveChannelStateRunning,
    AWSmedialiveChannelStateRecovering,
    AWSmedialiveChannelStateStopping,
    AWSmedialiveChannelStateDeleting,
    AWSmedialiveChannelStateDeleted,
    AWSmedialiveChannelStateUpdating,
    AWSmedialiveChannelStateUpdateFailed,
};

typedef NS_ENUM(NSInteger, AWSmedialiveDvbSdtOutputSdt) {
    AWSmedialiveDvbSdtOutputSdtUnknown,
    AWSmedialiveDvbSdtOutputSdtSdtFollow,
    AWSmedialiveDvbSdtOutputSdtSdtFollowIfPresent,
    AWSmedialiveDvbSdtOutputSdtSdtManual,
    AWSmedialiveDvbSdtOutputSdtSdtNone,
};

typedef NS_ENUM(NSInteger, AWSmedialiveDvbSubDestinationAlignment) {
    AWSmedialiveDvbSubDestinationAlignmentUnknown,
    AWSmedialiveDvbSubDestinationAlignmentCentered,
    AWSmedialiveDvbSubDestinationAlignmentLeft,
    AWSmedialiveDvbSubDestinationAlignmentSmart,
};

typedef NS_ENUM(NSInteger, AWSmedialiveDvbSubDestinationBackgroundColor) {
    AWSmedialiveDvbSubDestinationBackgroundColorUnknown,
    AWSmedialiveDvbSubDestinationBackgroundColorBlack,
    AWSmedialiveDvbSubDestinationBackgroundColorNone,
    AWSmedialiveDvbSubDestinationBackgroundColorWhite,
};

typedef NS_ENUM(NSInteger, AWSmedialiveDvbSubDestinationFontColor) {
    AWSmedialiveDvbSubDestinationFontColorUnknown,
    AWSmedialiveDvbSubDestinationFontColorBlack,
    AWSmedialiveDvbSubDestinationFontColorBlue,
    AWSmedialiveDvbSubDestinationFontColorGreen,
    AWSmedialiveDvbSubDestinationFontColorRed,
    AWSmedialiveDvbSubDestinationFontColorWhite,
    AWSmedialiveDvbSubDestinationFontColorYellow,
};

typedef NS_ENUM(NSInteger, AWSmedialiveDvbSubDestinationOutlineColor) {
    AWSmedialiveDvbSubDestinationOutlineColorUnknown,
    AWSmedialiveDvbSubDestinationOutlineColorBlack,
    AWSmedialiveDvbSubDestinationOutlineColorBlue,
    AWSmedialiveDvbSubDestinationOutlineColorGreen,
    AWSmedialiveDvbSubDestinationOutlineColorRed,
    AWSmedialiveDvbSubDestinationOutlineColorWhite,
    AWSmedialiveDvbSubDestinationOutlineColorYellow,
};

typedef NS_ENUM(NSInteger, AWSmedialiveDvbSubDestinationShadowColor) {
    AWSmedialiveDvbSubDestinationShadowColorUnknown,
    AWSmedialiveDvbSubDestinationShadowColorBlack,
    AWSmedialiveDvbSubDestinationShadowColorNone,
    AWSmedialiveDvbSubDestinationShadowColorWhite,
};

typedef NS_ENUM(NSInteger, AWSmedialiveDvbSubDestinationTeletextGridControl) {
    AWSmedialiveDvbSubDestinationTeletextGridControlUnknown,
    AWSmedialiveDvbSubDestinationTeletextGridControlFixed,
    AWSmedialiveDvbSubDestinationTeletextGridControlScaled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3AttenuationControl) {
    AWSmedialiveEac3AttenuationControlUnknown,
    AWSmedialiveEac3AttenuationControlAttenuate3Db,
    AWSmedialiveEac3AttenuationControlNone,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3BitstreamMode) {
    AWSmedialiveEac3BitstreamModeUnknown,
    AWSmedialiveEac3BitstreamModeCommentary,
    AWSmedialiveEac3BitstreamModeCompleteMain,
    AWSmedialiveEac3BitstreamModeEmergency,
    AWSmedialiveEac3BitstreamModeHearingImpaired,
    AWSmedialiveEac3BitstreamModeVisuallyImpaired,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3CodingMode) {
    AWSmedialiveEac3CodingModeUnknown,
    AWSmedialiveEac3CodingModeCodingMode10,
    AWSmedialiveEac3CodingModeCodingMode20,
    AWSmedialiveEac3CodingModeCodingMode32,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3DcFilter) {
    AWSmedialiveEac3DcFilterUnknown,
    AWSmedialiveEac3DcFilterDisabled,
    AWSmedialiveEac3DcFilterEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3DrcLine) {
    AWSmedialiveEac3DrcLineUnknown,
    AWSmedialiveEac3DrcLineFilmLight,
    AWSmedialiveEac3DrcLineFilmStandard,
    AWSmedialiveEac3DrcLineMusicLight,
    AWSmedialiveEac3DrcLineMusicStandard,
    AWSmedialiveEac3DrcLineNone,
    AWSmedialiveEac3DrcLineSpeech,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3DrcRf) {
    AWSmedialiveEac3DrcRfUnknown,
    AWSmedialiveEac3DrcRfFilmLight,
    AWSmedialiveEac3DrcRfFilmStandard,
    AWSmedialiveEac3DrcRfMusicLight,
    AWSmedialiveEac3DrcRfMusicStandard,
    AWSmedialiveEac3DrcRfNone,
    AWSmedialiveEac3DrcRfSpeech,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3LfeControl) {
    AWSmedialiveEac3LfeControlUnknown,
    AWSmedialiveEac3LfeControlLfe,
    AWSmedialiveEac3LfeControlNoLfe,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3LfeFilter) {
    AWSmedialiveEac3LfeFilterUnknown,
    AWSmedialiveEac3LfeFilterDisabled,
    AWSmedialiveEac3LfeFilterEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3MetadataControl) {
    AWSmedialiveEac3MetadataControlUnknown,
    AWSmedialiveEac3MetadataControlFollowInput,
    AWSmedialiveEac3MetadataControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3PassthroughControl) {
    AWSmedialiveEac3PassthroughControlUnknown,
    AWSmedialiveEac3PassthroughControlNoPassthrough,
    AWSmedialiveEac3PassthroughControlWhenPossible,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3PhaseControl) {
    AWSmedialiveEac3PhaseControlUnknown,
    AWSmedialiveEac3PhaseControlNoShift,
    AWSmedialiveEac3PhaseControlShift90Degrees,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3StereoDownmix) {
    AWSmedialiveEac3StereoDownmixUnknown,
    AWSmedialiveEac3StereoDownmixDpl2,
    AWSmedialiveEac3StereoDownmixLoRo,
    AWSmedialiveEac3StereoDownmixLtRt,
    AWSmedialiveEac3StereoDownmixNotIndicated,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3SurroundExMode) {
    AWSmedialiveEac3SurroundExModeUnknown,
    AWSmedialiveEac3SurroundExModeDisabled,
    AWSmedialiveEac3SurroundExModeEnabled,
    AWSmedialiveEac3SurroundExModeNotIndicated,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEac3SurroundMode) {
    AWSmedialiveEac3SurroundModeUnknown,
    AWSmedialiveEac3SurroundModeDisabled,
    AWSmedialiveEac3SurroundModeEnabled,
    AWSmedialiveEac3SurroundModeNotIndicated,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEmbeddedConvert608To708) {
    AWSmedialiveEmbeddedConvert608To708Unknown,
    AWSmedialiveEmbeddedConvert608To708Disabled,
    AWSmedialiveEmbeddedConvert608To708Upconvert,
};

typedef NS_ENUM(NSInteger, AWSmedialiveEmbeddedScte20Detection) {
    AWSmedialiveEmbeddedScte20DetectionUnknown,
    AWSmedialiveEmbeddedScte20DetectionAuto,
    AWSmedialiveEmbeddedScte20DetectionOff,
};

typedef NS_ENUM(NSInteger, AWSmedialiveFecOutputIncludeFec) {
    AWSmedialiveFecOutputIncludeFecUnknown,
    AWSmedialiveFecOutputIncludeFecColumn,
    AWSmedialiveFecOutputIncludeFecColumnAndRow,
};

typedef NS_ENUM(NSInteger, AWSmedialiveFixedAfd) {
    AWSmedialiveFixedAfdUnknown,
    AWSmedialiveFixedAfdAfd0000,
    AWSmedialiveFixedAfdAfd0010,
    AWSmedialiveFixedAfdAfd0011,
    AWSmedialiveFixedAfdAfd0100,
    AWSmedialiveFixedAfdAfd1000,
    AWSmedialiveFixedAfdAfd1001,
    AWSmedialiveFixedAfdAfd1010,
    AWSmedialiveFixedAfdAfd1011,
    AWSmedialiveFixedAfdAfd1101,
    AWSmedialiveFixedAfdAfd1110,
    AWSmedialiveFixedAfdAfd1111,
};

typedef NS_ENUM(NSInteger, AWSmedialiveFmp4NielsenId3Behavior) {
    AWSmedialiveFmp4NielsenId3BehaviorUnknown,
    AWSmedialiveFmp4NielsenId3BehaviorNoPassthrough,
    AWSmedialiveFmp4NielsenId3BehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmedialiveFmp4TimedMetadataBehavior) {
    AWSmedialiveFmp4TimedMetadataBehaviorUnknown,
    AWSmedialiveFmp4TimedMetadataBehaviorNoPassthrough,
    AWSmedialiveFmp4TimedMetadataBehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmedialiveFollowPoint) {
    AWSmedialiveFollowPointUnknown,
    AWSmedialiveFollowPointEnd,
    AWSmedialiveFollowPointStart,
};

typedef NS_ENUM(NSInteger, AWSmedialiveFrameCaptureIntervalUnit) {
    AWSmedialiveFrameCaptureIntervalUnitUnknown,
    AWSmedialiveFrameCaptureIntervalUnitMilliseconds,
    AWSmedialiveFrameCaptureIntervalUnitSeconds,
};

typedef NS_ENUM(NSInteger, AWSmedialiveGlobalConfigurationInputEndAction) {
    AWSmedialiveGlobalConfigurationInputEndActionUnknown,
    AWSmedialiveGlobalConfigurationInputEndActionNone,
    AWSmedialiveGlobalConfigurationInputEndActionSwitchAndLoopInputs,
};

typedef NS_ENUM(NSInteger, AWSmedialiveGlobalConfigurationLowFramerateInputs) {
    AWSmedialiveGlobalConfigurationLowFramerateInputsUnknown,
    AWSmedialiveGlobalConfigurationLowFramerateInputsDisabled,
    AWSmedialiveGlobalConfigurationLowFramerateInputsEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveGlobalConfigurationOutputLockingMode) {
    AWSmedialiveGlobalConfigurationOutputLockingModeUnknown,
    AWSmedialiveGlobalConfigurationOutputLockingModeEpochLocking,
    AWSmedialiveGlobalConfigurationOutputLockingModePipelineLocking,
};

typedef NS_ENUM(NSInteger, AWSmedialiveGlobalConfigurationOutputTimingSource) {
    AWSmedialiveGlobalConfigurationOutputTimingSourceUnknown,
    AWSmedialiveGlobalConfigurationOutputTimingSourceInputClock,
    AWSmedialiveGlobalConfigurationOutputTimingSourceSystemClock,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264AdaptiveQuantization) {
    AWSmedialiveH264AdaptiveQuantizationUnknown,
    AWSmedialiveH264AdaptiveQuantizationHigh,
    AWSmedialiveH264AdaptiveQuantizationHigher,
    AWSmedialiveH264AdaptiveQuantizationLow,
    AWSmedialiveH264AdaptiveQuantizationMax,
    AWSmedialiveH264AdaptiveQuantizationMedium,
    AWSmedialiveH264AdaptiveQuantizationOff,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264ColorMetadata) {
    AWSmedialiveH264ColorMetadataUnknown,
    AWSmedialiveH264ColorMetadataIgnore,
    AWSmedialiveH264ColorMetadataInsert,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264EntropyEncoding) {
    AWSmedialiveH264EntropyEncodingUnknown,
    AWSmedialiveH264EntropyEncodingCabac,
    AWSmedialiveH264EntropyEncodingCavlc,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264FlickerAq) {
    AWSmedialiveH264FlickerAqUnknown,
    AWSmedialiveH264FlickerAqDisabled,
    AWSmedialiveH264FlickerAqEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264ForceFieldPictures) {
    AWSmedialiveH264ForceFieldPicturesUnknown,
    AWSmedialiveH264ForceFieldPicturesDisabled,
    AWSmedialiveH264ForceFieldPicturesEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264FramerateControl) {
    AWSmedialiveH264FramerateControlUnknown,
    AWSmedialiveH264FramerateControlInitializeFromSource,
    AWSmedialiveH264FramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264GopBReference) {
    AWSmedialiveH264GopBReferenceUnknown,
    AWSmedialiveH264GopBReferenceDisabled,
    AWSmedialiveH264GopBReferenceEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264GopSizeUnits) {
    AWSmedialiveH264GopSizeUnitsUnknown,
    AWSmedialiveH264GopSizeUnitsFrames,
    AWSmedialiveH264GopSizeUnitsSeconds,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264Level) {
    AWSmedialiveH264LevelUnknown,
    AWSmedialiveH264LevelH264Level1,
    AWSmedialiveH264LevelH264Level11,
    AWSmedialiveH264LevelH264Level12,
    AWSmedialiveH264LevelH264Level13,
    AWSmedialiveH264LevelH264Level2,
    AWSmedialiveH264LevelH264Level21,
    AWSmedialiveH264LevelH264Level22,
    AWSmedialiveH264LevelH264Level3,
    AWSmedialiveH264LevelH264Level31,
    AWSmedialiveH264LevelH264Level32,
    AWSmedialiveH264LevelH264Level4,
    AWSmedialiveH264LevelH264Level41,
    AWSmedialiveH264LevelH264Level42,
    AWSmedialiveH264LevelH264Level5,
    AWSmedialiveH264LevelH264Level51,
    AWSmedialiveH264LevelH264Level52,
    AWSmedialiveH264LevelH264LevelAuto,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264LookAheadRateControl) {
    AWSmedialiveH264LookAheadRateControlUnknown,
    AWSmedialiveH264LookAheadRateControlHigh,
    AWSmedialiveH264LookAheadRateControlLow,
    AWSmedialiveH264LookAheadRateControlMedium,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264ParControl) {
    AWSmedialiveH264ParControlUnknown,
    AWSmedialiveH264ParControlInitializeFromSource,
    AWSmedialiveH264ParControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264Profile) {
    AWSmedialiveH264ProfileUnknown,
    AWSmedialiveH264ProfileBaseline,
    AWSmedialiveH264ProfileHigh,
    AWSmedialiveH264ProfileHigh10bit,
    AWSmedialiveH264ProfileHigh422,
    AWSmedialiveH264ProfileHigh42210bit,
    AWSmedialiveH264ProfileMain,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264QualityLevel) {
    AWSmedialiveH264QualityLevelUnknown,
    AWSmedialiveH264QualityLevelEnhancedQuality,
    AWSmedialiveH264QualityLevelStandardQuality,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264RateControlMode) {
    AWSmedialiveH264RateControlModeUnknown,
    AWSmedialiveH264RateControlModeCbr,
    AWSmedialiveH264RateControlModeMultiplex,
    AWSmedialiveH264RateControlModeQvbr,
    AWSmedialiveH264RateControlModeVbr,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264ScanType) {
    AWSmedialiveH264ScanTypeUnknown,
    AWSmedialiveH264ScanTypeInterlaced,
    AWSmedialiveH264ScanTypeProgressive,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264SceneChangeDetect) {
    AWSmedialiveH264SceneChangeDetectUnknown,
    AWSmedialiveH264SceneChangeDetectDisabled,
    AWSmedialiveH264SceneChangeDetectEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264SpatialAq) {
    AWSmedialiveH264SpatialAqUnknown,
    AWSmedialiveH264SpatialAqDisabled,
    AWSmedialiveH264SpatialAqEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264SubGopLength) {
    AWSmedialiveH264SubGopLengthUnknown,
    AWSmedialiveH264SubGopLengthDynamic,
    AWSmedialiveH264SubGopLengthFixed,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264Syntax) {
    AWSmedialiveH264SyntaxUnknown,
    AWSmedialiveH264SyntaxDefault,
    AWSmedialiveH264SyntaxRp2027,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264TemporalAq) {
    AWSmedialiveH264TemporalAqUnknown,
    AWSmedialiveH264TemporalAqDisabled,
    AWSmedialiveH264TemporalAqEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH264TimecodeInsertionBehavior) {
    AWSmedialiveH264TimecodeInsertionBehaviorUnknown,
    AWSmedialiveH264TimecodeInsertionBehaviorDisabled,
    AWSmedialiveH264TimecodeInsertionBehaviorPicTimingSei,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265AdaptiveQuantization) {
    AWSmedialiveH265AdaptiveQuantizationUnknown,
    AWSmedialiveH265AdaptiveQuantizationHigh,
    AWSmedialiveH265AdaptiveQuantizationHigher,
    AWSmedialiveH265AdaptiveQuantizationLow,
    AWSmedialiveH265AdaptiveQuantizationMax,
    AWSmedialiveH265AdaptiveQuantizationMedium,
    AWSmedialiveH265AdaptiveQuantizationOff,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265AlternativeTransferFunction) {
    AWSmedialiveH265AlternativeTransferFunctionUnknown,
    AWSmedialiveH265AlternativeTransferFunctionInsert,
    AWSmedialiveH265AlternativeTransferFunctionOmit,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265ColorMetadata) {
    AWSmedialiveH265ColorMetadataUnknown,
    AWSmedialiveH265ColorMetadataIgnore,
    AWSmedialiveH265ColorMetadataInsert,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265FlickerAq) {
    AWSmedialiveH265FlickerAqUnknown,
    AWSmedialiveH265FlickerAqDisabled,
    AWSmedialiveH265FlickerAqEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265GopSizeUnits) {
    AWSmedialiveH265GopSizeUnitsUnknown,
    AWSmedialiveH265GopSizeUnitsFrames,
    AWSmedialiveH265GopSizeUnitsSeconds,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265Level) {
    AWSmedialiveH265LevelUnknown,
    AWSmedialiveH265LevelH265Level1,
    AWSmedialiveH265LevelH265Level2,
    AWSmedialiveH265LevelH265Level21,
    AWSmedialiveH265LevelH265Level3,
    AWSmedialiveH265LevelH265Level31,
    AWSmedialiveH265LevelH265Level4,
    AWSmedialiveH265LevelH265Level41,
    AWSmedialiveH265LevelH265Level5,
    AWSmedialiveH265LevelH265Level51,
    AWSmedialiveH265LevelH265Level52,
    AWSmedialiveH265LevelH265Level6,
    AWSmedialiveH265LevelH265Level61,
    AWSmedialiveH265LevelH265Level62,
    AWSmedialiveH265LevelH265LevelAuto,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265LookAheadRateControl) {
    AWSmedialiveH265LookAheadRateControlUnknown,
    AWSmedialiveH265LookAheadRateControlHigh,
    AWSmedialiveH265LookAheadRateControlLow,
    AWSmedialiveH265LookAheadRateControlMedium,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265Profile) {
    AWSmedialiveH265ProfileUnknown,
    AWSmedialiveH265ProfileMain,
    AWSmedialiveH265ProfileMain10bit,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265RateControlMode) {
    AWSmedialiveH265RateControlModeUnknown,
    AWSmedialiveH265RateControlModeCbr,
    AWSmedialiveH265RateControlModeMultiplex,
    AWSmedialiveH265RateControlModeQvbr,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265ScanType) {
    AWSmedialiveH265ScanTypeUnknown,
    AWSmedialiveH265ScanTypeProgressive,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265SceneChangeDetect) {
    AWSmedialiveH265SceneChangeDetectUnknown,
    AWSmedialiveH265SceneChangeDetectDisabled,
    AWSmedialiveH265SceneChangeDetectEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265Tier) {
    AWSmedialiveH265TierUnknown,
    AWSmedialiveH265TierHigh,
    AWSmedialiveH265TierMain,
};

typedef NS_ENUM(NSInteger, AWSmedialiveH265TimecodeInsertionBehavior) {
    AWSmedialiveH265TimecodeInsertionBehaviorUnknown,
    AWSmedialiveH265TimecodeInsertionBehaviorDisabled,
    AWSmedialiveH265TimecodeInsertionBehaviorPicTimingSei,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsAdMarkers) {
    AWSmedialiveHlsAdMarkersUnknown,
    AWSmedialiveHlsAdMarkersAdobe,
    AWSmedialiveHlsAdMarkersElemental,
    AWSmedialiveHlsAdMarkersElementalScte35,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsAkamaiHttpTransferMode) {
    AWSmedialiveHlsAkamaiHttpTransferModeUnknown,
    AWSmedialiveHlsAkamaiHttpTransferModeChunked,
    AWSmedialiveHlsAkamaiHttpTransferModeNonChunked,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsCaptionLanguageSetting) {
    AWSmedialiveHlsCaptionLanguageSettingUnknown,
    AWSmedialiveHlsCaptionLanguageSettingInsert,
    AWSmedialiveHlsCaptionLanguageSettingNone,
    AWSmedialiveHlsCaptionLanguageSettingOmit,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsClientCache) {
    AWSmedialiveHlsClientCacheUnknown,
    AWSmedialiveHlsClientCacheDisabled,
    AWSmedialiveHlsClientCacheEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsCodecSpecification) {
    AWSmedialiveHlsCodecSpecificationUnknown,
    AWSmedialiveHlsCodecSpecificationRfc4281,
    AWSmedialiveHlsCodecSpecificationRfc6381,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsDirectoryStructure) {
    AWSmedialiveHlsDirectoryStructureUnknown,
    AWSmedialiveHlsDirectoryStructureSingleDirectory,
    AWSmedialiveHlsDirectoryStructureSubdirectoryPerStream,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsEncryptionType) {
    AWSmedialiveHlsEncryptionTypeUnknown,
    AWSmedialiveHlsEncryptionTypeAes128,
    AWSmedialiveHlsEncryptionTypeSampleAes,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsH265PackagingType) {
    AWSmedialiveHlsH265PackagingTypeUnknown,
    AWSmedialiveHlsH265PackagingTypeHev1,
    AWSmedialiveHlsH265PackagingTypeHvc1,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsId3SegmentTaggingState) {
    AWSmedialiveHlsId3SegmentTaggingStateUnknown,
    AWSmedialiveHlsId3SegmentTaggingStateDisabled,
    AWSmedialiveHlsId3SegmentTaggingStateEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsIvInManifest) {
    AWSmedialiveHlsIvInManifestUnknown,
    AWSmedialiveHlsIvInManifestExclude,
    AWSmedialiveHlsIvInManifestInclude,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsIvSource) {
    AWSmedialiveHlsIvSourceUnknown,
    AWSmedialiveHlsIvSourceExplicit,
    AWSmedialiveHlsIvSourceFollowsSegmentNumber,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsManifestCompression) {
    AWSmedialiveHlsManifestCompressionUnknown,
    AWSmedialiveHlsManifestCompressionGzip,
    AWSmedialiveHlsManifestCompressionNone,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsManifestDurationFormat) {
    AWSmedialiveHlsManifestDurationFormatUnknown,
    AWSmedialiveHlsManifestDurationFormatFloatingPoint,
    AWSmedialiveHlsManifestDurationFormatInteger,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsMediaStoreStorageClass) {
    AWSmedialiveHlsMediaStoreStorageClassUnknown,
    AWSmedialiveHlsMediaStoreStorageClassTemporal,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsMode) {
    AWSmedialiveHlsModeUnknown,
    AWSmedialiveHlsModeLive,
    AWSmedialiveHlsModeVod,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsOutputSelection) {
    AWSmedialiveHlsOutputSelectionUnknown,
    AWSmedialiveHlsOutputSelectionManifestsAndSegments,
    AWSmedialiveHlsOutputSelectionSegmentsOnly,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsProgramDateTime) {
    AWSmedialiveHlsProgramDateTimeUnknown,
    AWSmedialiveHlsProgramDateTimeExclude,
    AWSmedialiveHlsProgramDateTimeInclude,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsRedundantManifest) {
    AWSmedialiveHlsRedundantManifestUnknown,
    AWSmedialiveHlsRedundantManifestDisabled,
    AWSmedialiveHlsRedundantManifestEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsSegmentationMode) {
    AWSmedialiveHlsSegmentationModeUnknown,
    AWSmedialiveHlsSegmentationModeUseInputSegmentation,
    AWSmedialiveHlsSegmentationModeUseSegmentDuration,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsStreamInfResolution) {
    AWSmedialiveHlsStreamInfResolutionUnknown,
    AWSmedialiveHlsStreamInfResolutionExclude,
    AWSmedialiveHlsStreamInfResolutionInclude,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsTimedMetadataId3Frame) {
    AWSmedialiveHlsTimedMetadataId3FrameUnknown,
    AWSmedialiveHlsTimedMetadataId3FrameNone,
    AWSmedialiveHlsTimedMetadataId3FramePriv,
    AWSmedialiveHlsTimedMetadataId3FrameTdrl,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsTsFileMode) {
    AWSmedialiveHlsTsFileModeUnknown,
    AWSmedialiveHlsTsFileModeSegmentedFiles,
    AWSmedialiveHlsTsFileModeSingleFile,
};

typedef NS_ENUM(NSInteger, AWSmedialiveHlsWebdavHttpTransferMode) {
    AWSmedialiveHlsWebdavHttpTransferModeUnknown,
    AWSmedialiveHlsWebdavHttpTransferModeChunked,
    AWSmedialiveHlsWebdavHttpTransferModeNonChunked,
};

typedef NS_ENUM(NSInteger, AWSmedialiveIFrameOnlyPlaylistType) {
    AWSmedialiveIFrameOnlyPlaylistTypeUnknown,
    AWSmedialiveIFrameOnlyPlaylistTypeDisabled,
    AWSmedialiveIFrameOnlyPlaylistTypeStandard,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputClass) {
    AWSmedialiveInputClassUnknown,
    AWSmedialiveInputClassStandard,
    AWSmedialiveInputClassSinglePipeline,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputCodec) {
    AWSmedialiveInputCodecUnknown,
    AWSmedialiveInputCodecMpeg2,
    AWSmedialiveInputCodecAvc,
    AWSmedialiveInputCodecHevc,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputDeblockFilter) {
    AWSmedialiveInputDeblockFilterUnknown,
    AWSmedialiveInputDeblockFilterDisabled,
    AWSmedialiveInputDeblockFilterEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputDenoiseFilter) {
    AWSmedialiveInputDenoiseFilterUnknown,
    AWSmedialiveInputDenoiseFilterDisabled,
    AWSmedialiveInputDenoiseFilterEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputFilter) {
    AWSmedialiveInputFilterUnknown,
    AWSmedialiveInputFilterAuto,
    AWSmedialiveInputFilterDisabled,
    AWSmedialiveInputFilterForced,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputLossActionForHlsOut) {
    AWSmedialiveInputLossActionForHlsOutUnknown,
    AWSmedialiveInputLossActionForHlsOutEmitOutput,
    AWSmedialiveInputLossActionForHlsOutPauseOutput,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputLossActionForMsSmoothOut) {
    AWSmedialiveInputLossActionForMsSmoothOutUnknown,
    AWSmedialiveInputLossActionForMsSmoothOutEmitOutput,
    AWSmedialiveInputLossActionForMsSmoothOutPauseOutput,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputLossActionForRtmpOut) {
    AWSmedialiveInputLossActionForRtmpOutUnknown,
    AWSmedialiveInputLossActionForRtmpOutEmitOutput,
    AWSmedialiveInputLossActionForRtmpOutPauseOutput,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputLossActionForUdpOut) {
    AWSmedialiveInputLossActionForUdpOutUnknown,
    AWSmedialiveInputLossActionForUdpOutDropProgram,
    AWSmedialiveInputLossActionForUdpOutDropTs,
    AWSmedialiveInputLossActionForUdpOutEmitProgram,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputLossImageType) {
    AWSmedialiveInputLossImageTypeUnknown,
    AWSmedialiveInputLossImageTypeColor,
    AWSmedialiveInputLossImageTypeSlate,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputMaximumBitrate) {
    AWSmedialiveInputMaximumBitrateUnknown,
    AWSmedialiveInputMaximumBitrateMax10Mbps,
    AWSmedialiveInputMaximumBitrateMax20Mbps,
    AWSmedialiveInputMaximumBitrateMax50Mbps,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputPreference) {
    AWSmedialiveInputPreferenceUnknown,
    AWSmedialiveInputPreferenceEqualInputPreference,
    AWSmedialiveInputPreferencePrimaryInputPreferred,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputResolution) {
    AWSmedialiveInputResolutionUnknown,
    AWSmedialiveInputResolutionSd,
    AWSmedialiveInputResolutionHd,
    AWSmedialiveInputResolutionUhd,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputSecurityGroupState) {
    AWSmedialiveInputSecurityGroupStateUnknown,
    AWSmedialiveInputSecurityGroupStateIdle,
    AWSmedialiveInputSecurityGroupStateInUse,
    AWSmedialiveInputSecurityGroupStateUpdating,
    AWSmedialiveInputSecurityGroupStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputSourceEndBehavior) {
    AWSmedialiveInputSourceEndBehaviorUnknown,
    AWSmedialiveInputSourceEndBehaviorContinue,
    AWSmedialiveInputSourceEndBehaviorLoop,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputSourceType) {
    AWSmedialiveInputSourceTypeUnknown,
    AWSmedialiveInputSourceTypeStatic,
    AWSmedialiveInputSourceTypeDynamic,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputState) {
    AWSmedialiveInputStateUnknown,
    AWSmedialiveInputStateCreating,
    AWSmedialiveInputStateDetached,
    AWSmedialiveInputStateAttached,
    AWSmedialiveInputStateDeleting,
    AWSmedialiveInputStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputTimecodeSource) {
    AWSmedialiveInputTimecodeSourceUnknown,
    AWSmedialiveInputTimecodeSourceZerobased,
    AWSmedialiveInputTimecodeSourceEmbedded,
};

typedef NS_ENUM(NSInteger, AWSmedialiveInputType) {
    AWSmedialiveInputTypeUnknown,
    AWSmedialiveInputTypeUdpPush,
    AWSmedialiveInputTypeRtpPush,
    AWSmedialiveInputTypeRtmpPush,
    AWSmedialiveInputTypeRtmpPull,
    AWSmedialiveInputTypeUrlPull,
    AWSmedialiveInputTypeMp4File,
    AWSmedialiveInputTypeMediaconnect,
};

typedef NS_ENUM(NSInteger, AWSmedialiveLastFrameClippingBehavior) {
    AWSmedialiveLastFrameClippingBehaviorUnknown,
    AWSmedialiveLastFrameClippingBehaviorExcludeLastFrame,
    AWSmedialiveLastFrameClippingBehaviorIncludeLastFrame,
};

typedef NS_ENUM(NSInteger, AWSmedialiveLogLevel) {
    AWSmedialiveLogLevelUnknown,
    AWSmedialiveLogLevelError,
    AWSmedialiveLogLevelWarning,
    AWSmedialiveLogLevelInfo,
    AWSmedialiveLogLevelDebug,
    AWSmedialiveLogLevelDisabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsAbsentInputAudioBehavior) {
    AWSmedialiveM2tsAbsentInputAudioBehaviorUnknown,
    AWSmedialiveM2tsAbsentInputAudioBehaviorDrop,
    AWSmedialiveM2tsAbsentInputAudioBehaviorEncodeSilence,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsArib) {
    AWSmedialiveM2tsAribUnknown,
    AWSmedialiveM2tsAribDisabled,
    AWSmedialiveM2tsAribEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsAribCaptionsPidControl) {
    AWSmedialiveM2tsAribCaptionsPidControlUnknown,
    AWSmedialiveM2tsAribCaptionsPidControlAuto,
    AWSmedialiveM2tsAribCaptionsPidControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsAudioBufferModel) {
    AWSmedialiveM2tsAudioBufferModelUnknown,
    AWSmedialiveM2tsAudioBufferModelAtsc,
    AWSmedialiveM2tsAudioBufferModelDvb,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsAudioInterval) {
    AWSmedialiveM2tsAudioIntervalUnknown,
    AWSmedialiveM2tsAudioIntervalVideoAndFixedIntervals,
    AWSmedialiveM2tsAudioIntervalVideoInterval,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsAudioStreamType) {
    AWSmedialiveM2tsAudioStreamTypeUnknown,
    AWSmedialiveM2tsAudioStreamTypeAtsc,
    AWSmedialiveM2tsAudioStreamTypeDvb,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsBufferModel) {
    AWSmedialiveM2tsBufferModelUnknown,
    AWSmedialiveM2tsBufferModelMultiplex,
    AWSmedialiveM2tsBufferModelNone,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsCcDescriptor) {
    AWSmedialiveM2tsCcDescriptorUnknown,
    AWSmedialiveM2tsCcDescriptorDisabled,
    AWSmedialiveM2tsCcDescriptorEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsEbifControl) {
    AWSmedialiveM2tsEbifControlUnknown,
    AWSmedialiveM2tsEbifControlNone,
    AWSmedialiveM2tsEbifControlPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsEbpPlacement) {
    AWSmedialiveM2tsEbpPlacementUnknown,
    AWSmedialiveM2tsEbpPlacementVideoAndAudioPids,
    AWSmedialiveM2tsEbpPlacementVideoPid,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsEsRateInPes) {
    AWSmedialiveM2tsEsRateInPesUnknown,
    AWSmedialiveM2tsEsRateInPesExclude,
    AWSmedialiveM2tsEsRateInPesInclude,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsKlv) {
    AWSmedialiveM2tsKlvUnknown,
    AWSmedialiveM2tsKlvNone,
    AWSmedialiveM2tsKlvPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsNielsenId3Behavior) {
    AWSmedialiveM2tsNielsenId3BehaviorUnknown,
    AWSmedialiveM2tsNielsenId3BehaviorNoPassthrough,
    AWSmedialiveM2tsNielsenId3BehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsPcrControl) {
    AWSmedialiveM2tsPcrControlUnknown,
    AWSmedialiveM2tsPcrControlConfiguredPcrPeriod,
    AWSmedialiveM2tsPcrControlPcrEveryPesPacket,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsRateMode) {
    AWSmedialiveM2tsRateModeUnknown,
    AWSmedialiveM2tsRateModeCbr,
    AWSmedialiveM2tsRateModeVbr,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsScte35Control) {
    AWSmedialiveM2tsScte35ControlUnknown,
    AWSmedialiveM2tsScte35ControlNone,
    AWSmedialiveM2tsScte35ControlPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsSegmentationMarkers) {
    AWSmedialiveM2tsSegmentationMarkersUnknown,
    AWSmedialiveM2tsSegmentationMarkersEbp,
    AWSmedialiveM2tsSegmentationMarkersEbpLegacy,
    AWSmedialiveM2tsSegmentationMarkersNone,
    AWSmedialiveM2tsSegmentationMarkersPsiSegstart,
    AWSmedialiveM2tsSegmentationMarkersRaiAdapt,
    AWSmedialiveM2tsSegmentationMarkersRaiSegstart,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsSegmentationStyle) {
    AWSmedialiveM2tsSegmentationStyleUnknown,
    AWSmedialiveM2tsSegmentationStyleMaintainCadence,
    AWSmedialiveM2tsSegmentationStyleResetCadence,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM2tsTimedMetadataBehavior) {
    AWSmedialiveM2tsTimedMetadataBehaviorUnknown,
    AWSmedialiveM2tsTimedMetadataBehaviorNoPassthrough,
    AWSmedialiveM2tsTimedMetadataBehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM3u8NielsenId3Behavior) {
    AWSmedialiveM3u8NielsenId3BehaviorUnknown,
    AWSmedialiveM3u8NielsenId3BehaviorNoPassthrough,
    AWSmedialiveM3u8NielsenId3BehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM3u8PcrControl) {
    AWSmedialiveM3u8PcrControlUnknown,
    AWSmedialiveM3u8PcrControlConfiguredPcrPeriod,
    AWSmedialiveM3u8PcrControlPcrEveryPesPacket,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM3u8Scte35Behavior) {
    AWSmedialiveM3u8Scte35BehaviorUnknown,
    AWSmedialiveM3u8Scte35BehaviorNoPassthrough,
    AWSmedialiveM3u8Scte35BehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmedialiveM3u8TimedMetadataBehavior) {
    AWSmedialiveM3u8TimedMetadataBehaviorUnknown,
    AWSmedialiveM3u8TimedMetadataBehaviorNoPassthrough,
    AWSmedialiveM3u8TimedMetadataBehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmedialiveMp2CodingMode) {
    AWSmedialiveMp2CodingModeUnknown,
    AWSmedialiveMp2CodingModeCodingMode10,
    AWSmedialiveMp2CodingModeCodingMode20,
};

typedef NS_ENUM(NSInteger, AWSmedialiveMsSmoothH265PackagingType) {
    AWSmedialiveMsSmoothH265PackagingTypeUnknown,
    AWSmedialiveMsSmoothH265PackagingTypeHev1,
    AWSmedialiveMsSmoothH265PackagingTypeHvc1,
};

typedef NS_ENUM(NSInteger, AWSmedialiveMultiplexState) {
    AWSmedialiveMultiplexStateUnknown,
    AWSmedialiveMultiplexStateCreating,
    AWSmedialiveMultiplexStateCreateFailed,
    AWSmedialiveMultiplexStateIdle,
    AWSmedialiveMultiplexStateStarting,
    AWSmedialiveMultiplexStateRunning,
    AWSmedialiveMultiplexStateRecovering,
    AWSmedialiveMultiplexStateStopping,
    AWSmedialiveMultiplexStateDeleting,
    AWSmedialiveMultiplexStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSmedialiveNetworkInputServerValidation) {
    AWSmedialiveNetworkInputServerValidationUnknown,
    AWSmedialiveNetworkInputServerValidationCheckCryptographyAndValidateName,
    AWSmedialiveNetworkInputServerValidationCheckCryptographyOnly,
};

typedef NS_ENUM(NSInteger, AWSmedialiveNielsenPcmToId3TaggingState) {
    AWSmedialiveNielsenPcmToId3TaggingStateUnknown,
    AWSmedialiveNielsenPcmToId3TaggingStateDisabled,
    AWSmedialiveNielsenPcmToId3TaggingStateEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveOfferingDurationUnits) {
    AWSmedialiveOfferingDurationUnitsUnknown,
    AWSmedialiveOfferingDurationUnitsMonths,
};

typedef NS_ENUM(NSInteger, AWSmedialiveOfferingType) {
    AWSmedialiveOfferingTypeUnknown,
    AWSmedialiveOfferingTypeNoUpfront,
};

typedef NS_ENUM(NSInteger, AWSmedialivePipelineId) {
    AWSmedialivePipelineIdUnknown,
    AWSmedialivePipelineIdPipeline0,
    AWSmedialivePipelineIdPipeline1,
};

typedef NS_ENUM(NSInteger, AWSmedialivePreferredChannelPipeline) {
    AWSmedialivePreferredChannelPipelineUnknown,
    AWSmedialivePreferredChannelPipelineCurrentlyActive,
    AWSmedialivePreferredChannelPipelinePipeline0,
    AWSmedialivePreferredChannelPipelinePipeline1,
};

typedef NS_ENUM(NSInteger, AWSmedialiveReservationCodec) {
    AWSmedialiveReservationCodecUnknown,
    AWSmedialiveReservationCodecMpeg2,
    AWSmedialiveReservationCodecAvc,
    AWSmedialiveReservationCodecHevc,
    AWSmedialiveReservationCodecAudio,
};

typedef NS_ENUM(NSInteger, AWSmedialiveReservationMaximumBitrate) {
    AWSmedialiveReservationMaximumBitrateUnknown,
    AWSmedialiveReservationMaximumBitrateMax10Mbps,
    AWSmedialiveReservationMaximumBitrateMax20Mbps,
    AWSmedialiveReservationMaximumBitrateMax50Mbps,
};

typedef NS_ENUM(NSInteger, AWSmedialiveReservationMaximumFramerate) {
    AWSmedialiveReservationMaximumFramerateUnknown,
    AWSmedialiveReservationMaximumFramerateMax30Fps,
    AWSmedialiveReservationMaximumFramerateMax60Fps,
};

typedef NS_ENUM(NSInteger, AWSmedialiveReservationResolution) {
    AWSmedialiveReservationResolutionUnknown,
    AWSmedialiveReservationResolutionSd,
    AWSmedialiveReservationResolutionHd,
    AWSmedialiveReservationResolutionFhd,
    AWSmedialiveReservationResolutionUhd,
};

typedef NS_ENUM(NSInteger, AWSmedialiveReservationResourceType) {
    AWSmedialiveReservationResourceTypeUnknown,
    AWSmedialiveReservationResourceTypeInput,
    AWSmedialiveReservationResourceTypeOutput,
    AWSmedialiveReservationResourceTypeMultiplex,
    AWSmedialiveReservationResourceTypeChannel,
};

typedef NS_ENUM(NSInteger, AWSmedialiveReservationSpecialFeature) {
    AWSmedialiveReservationSpecialFeatureUnknown,
    AWSmedialiveReservationSpecialFeatureAdvancedAudio,
    AWSmedialiveReservationSpecialFeatureAudioNormalization,
};

typedef NS_ENUM(NSInteger, AWSmedialiveReservationState) {
    AWSmedialiveReservationStateUnknown,
    AWSmedialiveReservationStateActive,
    AWSmedialiveReservationStateExpired,
    AWSmedialiveReservationStateCanceled,
    AWSmedialiveReservationStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSmedialiveReservationVideoQuality) {
    AWSmedialiveReservationVideoQualityUnknown,
    AWSmedialiveReservationVideoQualityStandard,
    AWSmedialiveReservationVideoQualityEnhanced,
    AWSmedialiveReservationVideoQualityPremium,
};

typedef NS_ENUM(NSInteger, AWSmedialiveRtmpCacheFullBehavior) {
    AWSmedialiveRtmpCacheFullBehaviorUnknown,
    AWSmedialiveRtmpCacheFullBehaviorDisconnectImmediately,
    AWSmedialiveRtmpCacheFullBehaviorWaitForServer,
};

typedef NS_ENUM(NSInteger, AWSmedialiveRtmpCaptionData) {
    AWSmedialiveRtmpCaptionDataUnknown,
    AWSmedialiveRtmpCaptionDataAll,
    AWSmedialiveRtmpCaptionDataField1608,
    AWSmedialiveRtmpCaptionDataField1AndField2608,
};

typedef NS_ENUM(NSInteger, AWSmedialiveRtmpOutputCertificateMode) {
    AWSmedialiveRtmpOutputCertificateModeUnknown,
    AWSmedialiveRtmpOutputCertificateModeSelfSigned,
    AWSmedialiveRtmpOutputCertificateModeVerifyAuthenticity,
};

typedef NS_ENUM(NSInteger, AWSmedialiveScte20Convert608To708) {
    AWSmedialiveScte20Convert608To708Unknown,
    AWSmedialiveScte20Convert608To708Disabled,
    AWSmedialiveScte20Convert608To708Upconvert,
};

typedef NS_ENUM(NSInteger, AWSmedialiveScte35AposNoRegionalBlackoutBehavior) {
    AWSmedialiveScte35AposNoRegionalBlackoutBehaviorUnknown,
    AWSmedialiveScte35AposNoRegionalBlackoutBehaviorFollow,
    AWSmedialiveScte35AposNoRegionalBlackoutBehaviorIgnore,
};

typedef NS_ENUM(NSInteger, AWSmedialiveScte35AposWebDeliveryAllowedBehavior) {
    AWSmedialiveScte35AposWebDeliveryAllowedBehaviorUnknown,
    AWSmedialiveScte35AposWebDeliveryAllowedBehaviorFollow,
    AWSmedialiveScte35AposWebDeliveryAllowedBehaviorIgnore,
};

typedef NS_ENUM(NSInteger, AWSmedialiveScte35ArchiveAllowedFlag) {
    AWSmedialiveScte35ArchiveAllowedFlagUnknown,
    AWSmedialiveScte35ArchiveAllowedFlagArchiveNotAllowed,
    AWSmedialiveScte35ArchiveAllowedFlagArchiveAllowed,
};

typedef NS_ENUM(NSInteger, AWSmedialiveScte35DeviceRestrictions) {
    AWSmedialiveScte35DeviceRestrictionsUnknown,
    AWSmedialiveScte35DeviceRestrictionsNone,
    AWSmedialiveScte35DeviceRestrictionsRestrictGroup0,
    AWSmedialiveScte35DeviceRestrictionsRestrictGroup1,
    AWSmedialiveScte35DeviceRestrictionsRestrictGroup2,
};

typedef NS_ENUM(NSInteger, AWSmedialiveScte35NoRegionalBlackoutFlag) {
    AWSmedialiveScte35NoRegionalBlackoutFlagUnknown,
    AWSmedialiveScte35NoRegionalBlackoutFlagRegionalBlackout,
    AWSmedialiveScte35NoRegionalBlackoutFlagNoRegionalBlackout,
};

typedef NS_ENUM(NSInteger, AWSmedialiveScte35SegmentationCancelIndicator) {
    AWSmedialiveScte35SegmentationCancelIndicatorUnknown,
    AWSmedialiveScte35SegmentationCancelIndicatorSegmentationEventNotCanceled,
    AWSmedialiveScte35SegmentationCancelIndicatorSegmentationEventCanceled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveScte35SpliceInsertNoRegionalBlackoutBehavior) {
    AWSmedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorUnknown,
    AWSmedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorFollow,
    AWSmedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorIgnore,
};

typedef NS_ENUM(NSInteger, AWSmedialiveScte35SpliceInsertWebDeliveryAllowedBehavior) {
    AWSmedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorUnknown,
    AWSmedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorFollow,
    AWSmedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorIgnore,
};

typedef NS_ENUM(NSInteger, AWSmedialiveScte35WebDeliveryAllowedFlag) {
    AWSmedialiveScte35WebDeliveryAllowedFlagUnknown,
    AWSmedialiveScte35WebDeliveryAllowedFlagWebDeliveryNotAllowed,
    AWSmedialiveScte35WebDeliveryAllowedFlagWebDeliveryAllowed,
};

typedef NS_ENUM(NSInteger, AWSmedialiveSmoothGroupAudioOnlyTimecodeControl) {
    AWSmedialiveSmoothGroupAudioOnlyTimecodeControlUnknown,
    AWSmedialiveSmoothGroupAudioOnlyTimecodeControlPassthrough,
    AWSmedialiveSmoothGroupAudioOnlyTimecodeControlUseConfiguredClock,
};

typedef NS_ENUM(NSInteger, AWSmedialiveSmoothGroupCertificateMode) {
    AWSmedialiveSmoothGroupCertificateModeUnknown,
    AWSmedialiveSmoothGroupCertificateModeSelfSigned,
    AWSmedialiveSmoothGroupCertificateModeVerifyAuthenticity,
};

typedef NS_ENUM(NSInteger, AWSmedialiveSmoothGroupEventIdMode) {
    AWSmedialiveSmoothGroupEventIdModeUnknown,
    AWSmedialiveSmoothGroupEventIdModeNoEventId,
    AWSmedialiveSmoothGroupEventIdModeUseConfigured,
    AWSmedialiveSmoothGroupEventIdModeUseTimestamp,
};

typedef NS_ENUM(NSInteger, AWSmedialiveSmoothGroupEventStopBehavior) {
    AWSmedialiveSmoothGroupEventStopBehaviorUnknown,
    AWSmedialiveSmoothGroupEventStopBehaviorNone,
    AWSmedialiveSmoothGroupEventStopBehaviorSendEos,
};

typedef NS_ENUM(NSInteger, AWSmedialiveSmoothGroupSegmentationMode) {
    AWSmedialiveSmoothGroupSegmentationModeUnknown,
    AWSmedialiveSmoothGroupSegmentationModeUseInputSegmentation,
    AWSmedialiveSmoothGroupSegmentationModeUseSegmentDuration,
};

typedef NS_ENUM(NSInteger, AWSmedialiveSmoothGroupSparseTrackType) {
    AWSmedialiveSmoothGroupSparseTrackTypeUnknown,
    AWSmedialiveSmoothGroupSparseTrackTypeNone,
    AWSmedialiveSmoothGroupSparseTrackTypeScte35,
    AWSmedialiveSmoothGroupSparseTrackTypeScte35WithoutSegmentation,
};

typedef NS_ENUM(NSInteger, AWSmedialiveSmoothGroupStreamManifestBehavior) {
    AWSmedialiveSmoothGroupStreamManifestBehaviorUnknown,
    AWSmedialiveSmoothGroupStreamManifestBehaviorDoNotSend,
    AWSmedialiveSmoothGroupStreamManifestBehaviorSend,
};

typedef NS_ENUM(NSInteger, AWSmedialiveSmoothGroupTimestampOffsetMode) {
    AWSmedialiveSmoothGroupTimestampOffsetModeUnknown,
    AWSmedialiveSmoothGroupTimestampOffsetModeUseConfiguredOffset,
    AWSmedialiveSmoothGroupTimestampOffsetModeUseEventStartDate,
};

typedef NS_ENUM(NSInteger, AWSmedialiveTemporalFilterPostFilterSharpening) {
    AWSmedialiveTemporalFilterPostFilterSharpeningUnknown,
    AWSmedialiveTemporalFilterPostFilterSharpeningAuto,
    AWSmedialiveTemporalFilterPostFilterSharpeningDisabled,
    AWSmedialiveTemporalFilterPostFilterSharpeningEnabled,
};

typedef NS_ENUM(NSInteger, AWSmedialiveTemporalFilterStrength) {
    AWSmedialiveTemporalFilterStrengthUnknown,
    AWSmedialiveTemporalFilterStrengthAuto,
    AWSmedialiveTemporalFilterStrengthStrength1,
    AWSmedialiveTemporalFilterStrengthStrength10,
    AWSmedialiveTemporalFilterStrengthStrength11,
    AWSmedialiveTemporalFilterStrengthStrength12,
    AWSmedialiveTemporalFilterStrengthStrength13,
    AWSmedialiveTemporalFilterStrengthStrength14,
    AWSmedialiveTemporalFilterStrengthStrength15,
    AWSmedialiveTemporalFilterStrengthStrength16,
    AWSmedialiveTemporalFilterStrengthStrength2,
    AWSmedialiveTemporalFilterStrengthStrength3,
    AWSmedialiveTemporalFilterStrengthStrength4,
    AWSmedialiveTemporalFilterStrengthStrength5,
    AWSmedialiveTemporalFilterStrengthStrength6,
    AWSmedialiveTemporalFilterStrengthStrength7,
    AWSmedialiveTemporalFilterStrengthStrength8,
    AWSmedialiveTemporalFilterStrengthStrength9,
};

typedef NS_ENUM(NSInteger, AWSmedialiveTimecodeConfigSource) {
    AWSmedialiveTimecodeConfigSourceUnknown,
    AWSmedialiveTimecodeConfigSourceEmbedded,
    AWSmedialiveTimecodeConfigSourceSystemclock,
    AWSmedialiveTimecodeConfigSourceZerobased,
};

typedef NS_ENUM(NSInteger, AWSmedialiveTtmlDestinationStyleControl) {
    AWSmedialiveTtmlDestinationStyleControlUnknown,
    AWSmedialiveTtmlDestinationStyleControlPassthrough,
    AWSmedialiveTtmlDestinationStyleControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSmedialiveUdpTimedMetadataId3Frame) {
    AWSmedialiveUdpTimedMetadataId3FrameUnknown,
    AWSmedialiveUdpTimedMetadataId3FrameNone,
    AWSmedialiveUdpTimedMetadataId3FramePriv,
    AWSmedialiveUdpTimedMetadataId3FrameTdrl,
};

typedef NS_ENUM(NSInteger, AWSmedialiveVideoDescriptionRespondToAfd) {
    AWSmedialiveVideoDescriptionRespondToAfdUnknown,
    AWSmedialiveVideoDescriptionRespondToAfdNone,
    AWSmedialiveVideoDescriptionRespondToAfdPassthrough,
    AWSmedialiveVideoDescriptionRespondToAfdRespond,
};

typedef NS_ENUM(NSInteger, AWSmedialiveVideoDescriptionScalingBehavior) {
    AWSmedialiveVideoDescriptionScalingBehaviorUnknown,
    AWSmedialiveVideoDescriptionScalingBehaviorDefault,
    AWSmedialiveVideoDescriptionScalingBehaviorStretchToOutput,
};

typedef NS_ENUM(NSInteger, AWSmedialiveVideoSelectorColorSpace) {
    AWSmedialiveVideoSelectorColorSpaceUnknown,
    AWSmedialiveVideoSelectorColorSpaceFollow,
    AWSmedialiveVideoSelectorColorSpaceRec601,
    AWSmedialiveVideoSelectorColorSpaceRec709,
};

typedef NS_ENUM(NSInteger, AWSmedialiveVideoSelectorColorSpaceUsage) {
    AWSmedialiveVideoSelectorColorSpaceUsageUnknown,
    AWSmedialiveVideoSelectorColorSpaceUsageFallback,
    AWSmedialiveVideoSelectorColorSpaceUsageForce,
};

@class AWSmedialiveAacSettings;
@class AWSmedialiveAc3Settings;
@class AWSmedialiveAccessDenied;
@class AWSmedialiveArchiveContainerSettings;
@class AWSmedialiveArchiveGroupSettings;
@class AWSmedialiveArchiveOutputSettings;
@class AWSmedialiveAribDestinationSettings;
@class AWSmedialiveAribSourceSettings;
@class AWSmedialiveAudioChannelMapping;
@class AWSmedialiveAudioCodecSettings;
@class AWSmedialiveAudioDescription;
@class AWSmedialiveAudioLanguageSelection;
@class AWSmedialiveAudioNormalizationSettings;
@class AWSmedialiveAudioOnlyHlsSettings;
@class AWSmedialiveAudioPidSelection;
@class AWSmedialiveAudioSelector;
@class AWSmedialiveAudioSelectorSettings;
@class AWSmedialiveAudioTrack;
@class AWSmedialiveAudioTrackSelection;
@class AWSmedialiveAutomaticInputFailoverSettings;
@class AWSmedialiveAvailBlanking;
@class AWSmedialiveAvailConfiguration;
@class AWSmedialiveAvailSettings;
@class AWSmedialiveBatchScheduleActionCreateRequest;
@class AWSmedialiveBatchScheduleActionCreateResult;
@class AWSmedialiveBatchScheduleActionDeleteRequest;
@class AWSmedialiveBatchScheduleActionDeleteResult;
@class AWSmedialiveBatchUpdateScheduleRequest;
@class AWSmedialiveBatchUpdateScheduleResponse;
@class AWSmedialiveBatchUpdateScheduleResult;
@class AWSmedialiveBlackoutSlate;
@class AWSmedialiveBurnInDestinationSettings;
@class AWSmedialiveCaptionDescription;
@class AWSmedialiveCaptionDestinationSettings;
@class AWSmedialiveCaptionLanguageMapping;
@class AWSmedialiveCaptionSelector;
@class AWSmedialiveCaptionSelectorSettings;
@class AWSmedialiveChannel;
@class AWSmedialiveChannelConfigurationValidationError;
@class AWSmedialiveChannelEgressEndpoint;
@class AWSmedialiveChannelSummary;
@class AWSmedialiveColorSpacePassthroughSettings;
@class AWSmedialiveCreateChannel;
@class AWSmedialiveCreateChannelRequest;
@class AWSmedialiveCreateChannelResponse;
@class AWSmedialiveCreateChannelResultModel;
@class AWSmedialiveCreateInput;
@class AWSmedialiveCreateInputRequest;
@class AWSmedialiveCreateInputResponse;
@class AWSmedialiveCreateInputResultModel;
@class AWSmedialiveCreateInputSecurityGroupRequest;
@class AWSmedialiveCreateInputSecurityGroupResponse;
@class AWSmedialiveCreateInputSecurityGroupResultModel;
@class AWSmedialiveCreateMultiplex;
@class AWSmedialiveCreateMultiplexProgram;
@class AWSmedialiveCreateMultiplexProgramRequest;
@class AWSmedialiveCreateMultiplexProgramResponse;
@class AWSmedialiveCreateMultiplexProgramResultModel;
@class AWSmedialiveCreateMultiplexRequest;
@class AWSmedialiveCreateMultiplexResponse;
@class AWSmedialiveCreateMultiplexResultModel;
@class AWSmedialiveCreateTagsRequest;
@class AWSmedialiveDeleteChannelRequest;
@class AWSmedialiveDeleteChannelResponse;
@class AWSmedialiveDeleteInputRequest;
@class AWSmedialiveDeleteInputResponse;
@class AWSmedialiveDeleteInputSecurityGroupRequest;
@class AWSmedialiveDeleteInputSecurityGroupResponse;
@class AWSmedialiveDeleteMultiplexProgramRequest;
@class AWSmedialiveDeleteMultiplexProgramResponse;
@class AWSmedialiveDeleteMultiplexRequest;
@class AWSmedialiveDeleteMultiplexResponse;
@class AWSmedialiveDeleteReservationRequest;
@class AWSmedialiveDeleteReservationResponse;
@class AWSmedialiveDeleteScheduleRequest;
@class AWSmedialiveDeleteScheduleResponse;
@class AWSmedialiveDeleteTagsRequest;
@class AWSmedialiveDescribeChannelRequest;
@class AWSmedialiveDescribeChannelResponse;
@class AWSmedialiveDescribeInputRequest;
@class AWSmedialiveDescribeInputResponse;
@class AWSmedialiveDescribeInputSecurityGroupRequest;
@class AWSmedialiveDescribeInputSecurityGroupResponse;
@class AWSmedialiveDescribeMultiplexProgramRequest;
@class AWSmedialiveDescribeMultiplexProgramResponse;
@class AWSmedialiveDescribeMultiplexRequest;
@class AWSmedialiveDescribeMultiplexResponse;
@class AWSmedialiveDescribeOfferingRequest;
@class AWSmedialiveDescribeOfferingResponse;
@class AWSmedialiveDescribeReservationRequest;
@class AWSmedialiveDescribeReservationResponse;
@class AWSmedialiveDescribeScheduleRequest;
@class AWSmedialiveDescribeScheduleResponse;
@class AWSmedialiveDvbNitSettings;
@class AWSmedialiveDvbSdtSettings;
@class AWSmedialiveDvbSubDestinationSettings;
@class AWSmedialiveDvbSubSourceSettings;
@class AWSmedialiveDvbTdtSettings;
@class AWSmedialiveEac3Settings;
@class AWSmedialiveEmbeddedDestinationSettings;
@class AWSmedialiveEmbeddedPlusScte20DestinationSettings;
@class AWSmedialiveEmbeddedSourceSettings;
@class AWSmedialiveEmpty;
@class AWSmedialiveEncoderSettings;
@class AWSmedialiveFecOutputSettings;
@class AWSmedialiveFixedModeScheduleActionStartSettings;
@class AWSmedialiveFmp4HlsSettings;
@class AWSmedialiveFollowModeScheduleActionStartSettings;
@class AWSmedialiveFrameCaptureGroupSettings;
@class AWSmedialiveFrameCaptureOutputSettings;
@class AWSmedialiveFrameCaptureSettings;
@class AWSmedialiveGlobalConfiguration;
@class AWSmedialiveH264ColorSpaceSettings;
@class AWSmedialiveH264FilterSettings;
@class AWSmedialiveH264Settings;
@class AWSmedialiveH265ColorSpaceSettings;
@class AWSmedialiveH265Settings;
@class AWSmedialiveHdr10Settings;
@class AWSmedialiveHlsAkamaiSettings;
@class AWSmedialiveHlsBasicPutSettings;
@class AWSmedialiveHlsCdnSettings;
@class AWSmedialiveHlsGroupSettings;
@class AWSmedialiveHlsId3SegmentTaggingScheduleActionSettings;
@class AWSmedialiveHlsInputSettings;
@class AWSmedialiveHlsMediaStoreSettings;
@class AWSmedialiveHlsOutputSettings;
@class AWSmedialiveHlsSettings;
@class AWSmedialiveHlsTimedMetadataScheduleActionSettings;
@class AWSmedialiveHlsWebdavSettings;
@class AWSmedialiveImmediateModeScheduleActionStartSettings;
@class AWSmedialiveInput;
@class AWSmedialiveInputAttachment;
@class AWSmedialiveInputChannelLevel;
@class AWSmedialiveInputClippingSettings;
@class AWSmedialiveInputDestination;
@class AWSmedialiveInputDestinationRequest;
@class AWSmedialiveInputDestinationVpc;
@class AWSmedialiveInputLocation;
@class AWSmedialiveInputLossBehavior;
@class AWSmedialiveInputSecurityGroup;
@class AWSmedialiveInputSecurityGroupWhitelistRequest;
@class AWSmedialiveInputSettings;
@class AWSmedialiveInputSource;
@class AWSmedialiveInputSourceRequest;
@class AWSmedialiveInputSpecification;
@class AWSmedialiveInputSwitchScheduleActionSettings;
@class AWSmedialiveInputVpcRequest;
@class AWSmedialiveInputWhitelistRule;
@class AWSmedialiveInputWhitelistRuleCidr;
@class AWSmedialiveInternalServiceError;
@class AWSmedialiveInvalidRequest;
@class AWSmedialiveKeyProviderSettings;
@class AWSmedialiveLimitExceeded;
@class AWSmedialiveListChannelsRequest;
@class AWSmedialiveListChannelsResponse;
@class AWSmedialiveListChannelsResultModel;
@class AWSmedialiveListInputSecurityGroupsRequest;
@class AWSmedialiveListInputSecurityGroupsResponse;
@class AWSmedialiveListInputSecurityGroupsResultModel;
@class AWSmedialiveListInputsRequest;
@class AWSmedialiveListInputsResponse;
@class AWSmedialiveListInputsResultModel;
@class AWSmedialiveListMultiplexProgramsRequest;
@class AWSmedialiveListMultiplexProgramsResponse;
@class AWSmedialiveListMultiplexProgramsResultModel;
@class AWSmedialiveListMultiplexesRequest;
@class AWSmedialiveListMultiplexesResponse;
@class AWSmedialiveListMultiplexesResultModel;
@class AWSmedialiveListOfferingsRequest;
@class AWSmedialiveListOfferingsResponse;
@class AWSmedialiveListOfferingsResultModel;
@class AWSmedialiveListReservationsRequest;
@class AWSmedialiveListReservationsResponse;
@class AWSmedialiveListReservationsResultModel;
@class AWSmedialiveListTagsForResourceRequest;
@class AWSmedialiveListTagsForResourceResponse;
@class AWSmedialiveM2tsSettings;
@class AWSmedialiveM3u8Settings;
@class AWSmedialiveMediaConnectFlow;
@class AWSmedialiveMediaConnectFlowRequest;
@class AWSmedialiveMediaPackageGroupSettings;
@class AWSmedialiveMediaPackageOutputDestinationSettings;
@class AWSmedialiveMediaPackageOutputSettings;
@class AWSmedialiveMp2Settings;
@class AWSmedialiveMsSmoothGroupSettings;
@class AWSmedialiveMsSmoothOutputSettings;
@class AWSmedialiveMultiplex;
@class AWSmedialiveMultiplexConfigurationValidationError;
@class AWSmedialiveMultiplexGroupSettings;
@class AWSmedialiveMultiplexMediaConnectOutputDestinationSettings;
@class AWSmedialiveMultiplexOutputDestination;
@class AWSmedialiveMultiplexOutputSettings;
@class AWSmedialiveMultiplexProgram;
@class AWSmedialiveMultiplexProgramChannelDestinationSettings;
@class AWSmedialiveMultiplexProgramPacketIdentifiersMap;
@class AWSmedialiveMultiplexProgramServiceDescriptor;
@class AWSmedialiveMultiplexProgramSettings;
@class AWSmedialiveMultiplexProgramSummary;
@class AWSmedialiveMultiplexSettings;
@class AWSmedialiveMultiplexSettingsSummary;
@class AWSmedialiveMultiplexStatmuxVideoSettings;
@class AWSmedialiveMultiplexSummary;
@class AWSmedialiveMultiplexValidationError;
@class AWSmedialiveMultiplexVideoSettings;
@class AWSmedialiveNetworkInputSettings;
@class AWSmedialiveNielsenConfiguration;
@class AWSmedialiveOffering;
@class AWSmedialiveOutput;
@class AWSmedialiveOutputDestination;
@class AWSmedialiveOutputDestinationSettings;
@class AWSmedialiveOutputGroup;
@class AWSmedialiveOutputGroupSettings;
@class AWSmedialiveOutputLocationRef;
@class AWSmedialiveOutputSettings;
@class AWSmedialivePassThroughSettings;
@class AWSmedialivePauseStateScheduleActionSettings;
@class AWSmedialivePipelineDetail;
@class AWSmedialivePipelinePauseStateSettings;
@class AWSmedialivePurchaseOffering;
@class AWSmedialivePurchaseOfferingRequest;
@class AWSmedialivePurchaseOfferingResponse;
@class AWSmedialivePurchaseOfferingResultModel;
@class AWSmedialiveRec601Settings;
@class AWSmedialiveRec709Settings;
@class AWSmedialiveRemixSettings;
@class AWSmedialiveReservation;
@class AWSmedialiveReservationResourceSpecification;
@class AWSmedialiveResourceConflict;
@class AWSmedialiveResourceNotFound;
@class AWSmedialiveRtmpCaptionInfoDestinationSettings;
@class AWSmedialiveRtmpGroupSettings;
@class AWSmedialiveRtmpOutputSettings;
@class AWSmedialiveScheduleAction;
@class AWSmedialiveScheduleActionSettings;
@class AWSmedialiveScheduleActionStartSettings;
@class AWSmedialiveScheduleDeleteResultModel;
@class AWSmedialiveScheduleDescribeResultModel;
@class AWSmedialiveScte20PlusEmbeddedDestinationSettings;
@class AWSmedialiveScte20SourceSettings;
@class AWSmedialiveScte27DestinationSettings;
@class AWSmedialiveScte27SourceSettings;
@class AWSmedialiveScte35DeliveryRestrictions;
@class AWSmedialiveScte35Descriptor;
@class AWSmedialiveScte35DescriptorSettings;
@class AWSmedialiveScte35ReturnToNetworkScheduleActionSettings;
@class AWSmedialiveScte35SegmentationDescriptor;
@class AWSmedialiveScte35SpliceInsert;
@class AWSmedialiveScte35SpliceInsertScheduleActionSettings;
@class AWSmedialiveScte35TimeSignalApos;
@class AWSmedialiveScte35TimeSignalScheduleActionSettings;
@class AWSmedialiveSmpteTtDestinationSettings;
@class AWSmedialiveStandardHlsSettings;
@class AWSmedialiveStartChannelRequest;
@class AWSmedialiveStartChannelResponse;
@class AWSmedialiveStartMultiplexRequest;
@class AWSmedialiveStartMultiplexResponse;
@class AWSmedialiveStartTimecode;
@class AWSmedialiveStaticImageActivateScheduleActionSettings;
@class AWSmedialiveStaticImageDeactivateScheduleActionSettings;
@class AWSmedialiveStaticKeySettings;
@class AWSmedialiveStopChannelRequest;
@class AWSmedialiveStopChannelResponse;
@class AWSmedialiveStopMultiplexRequest;
@class AWSmedialiveStopMultiplexResponse;
@class AWSmedialiveStopTimecode;
@class AWSmedialiveTagsModel;
@class AWSmedialiveTeletextDestinationSettings;
@class AWSmedialiveTeletextSourceSettings;
@class AWSmedialiveTemporalFilterSettings;
@class AWSmedialiveTimecodeConfig;
@class AWSmedialiveTtmlDestinationSettings;
@class AWSmedialiveUdpContainerSettings;
@class AWSmedialiveUdpGroupSettings;
@class AWSmedialiveUdpOutputSettings;
@class AWSmedialiveUpdateChannel;
@class AWSmedialiveUpdateChannelClass;
@class AWSmedialiveUpdateChannelClassRequest;
@class AWSmedialiveUpdateChannelClassResponse;
@class AWSmedialiveUpdateChannelRequest;
@class AWSmedialiveUpdateChannelResponse;
@class AWSmedialiveUpdateChannelResultModel;
@class AWSmedialiveUpdateInput;
@class AWSmedialiveUpdateInputRequest;
@class AWSmedialiveUpdateInputResponse;
@class AWSmedialiveUpdateInputResultModel;
@class AWSmedialiveUpdateInputSecurityGroupRequest;
@class AWSmedialiveUpdateInputSecurityGroupResponse;
@class AWSmedialiveUpdateInputSecurityGroupResultModel;
@class AWSmedialiveUpdateMultiplex;
@class AWSmedialiveUpdateMultiplexProgram;
@class AWSmedialiveUpdateMultiplexProgramRequest;
@class AWSmedialiveUpdateMultiplexProgramResponse;
@class AWSmedialiveUpdateMultiplexProgramResultModel;
@class AWSmedialiveUpdateMultiplexRequest;
@class AWSmedialiveUpdateMultiplexResponse;
@class AWSmedialiveUpdateMultiplexResultModel;
@class AWSmedialiveUpdateReservation;
@class AWSmedialiveUpdateReservationRequest;
@class AWSmedialiveUpdateReservationResponse;
@class AWSmedialiveUpdateReservationResultModel;
@class AWSmedialiveValidationError;
@class AWSmedialiveVideoCodecSettings;
@class AWSmedialiveVideoDescription;
@class AWSmedialiveVideoSelector;
@class AWSmedialiveVideoSelectorPid;
@class AWSmedialiveVideoSelectorProgramId;
@class AWSmedialiveVideoSelectorSettings;
@class AWSmedialiveWebvttDestinationSettings;

/**
 Aac Settings
 */
@interface AWSmedialiveAacSettings : AWSModel


/**
 Average bitrate in bits/second. Valid values depend on rate control mode and profile.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Mono, Stereo, or 5.1 channel layout. Valid values depend on rate control mode and profile. The adReceiverMix setting receives a stereo description plus control track and emits a mono AAC encode of the description track, with control data emitted in the PES header as per ETSI TS 101 154 Annex E.
 */
@property (nonatomic, assign) AWSmedialiveAacCodingMode codingMode;

/**
 Set to "broadcasterMixedAd" when input contains pre-mixed main audio + AD (narration) as a stereo pair.The Audio Type field (audioType) will be set to 3, which signals to downstream systems that this stream contains "broadcaster mixed AD". Note that the input received by the encoder must contain pre-mixed audio; the encoder does not perform the mixing. The values in audioTypeControl and audioType (in AudioDescription) are ignored when set to broadcasterMixedAd.Leave set to "normal" when input does not contain pre-mixed audio + AD.
 */
@property (nonatomic, assign) AWSmedialiveAacInputType inputType;

/**
 AAC Profile.
 */
@property (nonatomic, assign) AWSmedialiveAacProfile profile;

/**
 Rate Control Mode.
 */
@property (nonatomic, assign) AWSmedialiveAacRateControlMode rateControlMode;

/**
 Sets LATM / LOAS AAC output for raw containers.
 */
@property (nonatomic, assign) AWSmedialiveAacRawFormat rawFormat;

/**
 Sample rate in Hz. Valid values depend on rate control mode and profile.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

/**
 Use MPEG-2 AAC audio instead of MPEG-4 AAC audio for raw or MPEG-2 Transport Stream containers.
 */
@property (nonatomic, assign) AWSmedialiveAacSpec spec;

/**
 VBR Quality Level - Only used if rateControlMode is VBR.
 */
@property (nonatomic, assign) AWSmedialiveAacVbrQuality vbrQuality;

@end

/**
 Ac3 Settings
 */
@interface AWSmedialiveAc3Settings : AWSModel


/**
 Average bitrate in bits/second. Valid bitrates depend on the coding mode.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specifies the bitstream mode (bsmod) for the emitted AC-3 stream. See ATSC A/52-2012 for background on these values.
 */
@property (nonatomic, assign) AWSmedialiveAc3BitstreamMode bitstreamMode;

/**
 Dolby Digital coding mode. Determines number of channels.
 */
@property (nonatomic, assign) AWSmedialiveAc3CodingMode codingMode;

/**
 Sets the dialnorm for the output. If excluded and input audio is Dolby Digital, dialnorm will be passed through.
 */
@property (nonatomic, strong) NSNumber * _Nullable dialnorm;

/**
 If set to filmStandard, adds dynamic range compression signaling to the output bitstream as defined in the Dolby Digital specification.
 */
@property (nonatomic, assign) AWSmedialiveAc3DrcProfile drcProfile;

/**
 When set to enabled, applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid in codingMode32Lfe mode.
 */
@property (nonatomic, assign) AWSmedialiveAc3LfeFilter lfeFilter;

/**
 When set to "followInput", encoder metadata will be sourced from the DD, DD+, or DolbyE decoder that supplied this audio data. If audio was not supplied from one of these streams, then the static metadata settings will be used.
 */
@property (nonatomic, assign) AWSmedialiveAc3MetadataControl metadataControl;

@end

/**
 Placeholder documentation for AccessDenied
 */
@interface AWSmedialiveAccessDenied : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Archive Container Settings
 */
@interface AWSmedialiveArchiveContainerSettings : AWSModel


/**
 M2ts Settings
 */
@property (nonatomic, strong) AWSmedialiveM2tsSettings * _Nullable m2tsSettings;

@end

/**
 Archive Group Settings
 Required parameters: [Destination]
 */
@interface AWSmedialiveArchiveGroupSettings : AWSModel


/**
 A directory and base filename where archive files should be written.
 */
@property (nonatomic, strong) AWSmedialiveOutputLocationRef * _Nullable destination;

/**
 Number of seconds to write to archive file before closing and starting a new one.
 */
@property (nonatomic, strong) NSNumber * _Nullable rolloverInterval;

@end

/**
 Archive Output Settings
 Required parameters: [ContainerSettings]
 */
@interface AWSmedialiveArchiveOutputSettings : AWSModel


/**
 Settings specific to the container type of the file.
 */
@property (nonatomic, strong) AWSmedialiveArchiveContainerSettings * _Nullable containerSettings;

/**
 Output file extension. If excluded, this will be auto-selected from the container type.
 */
@property (nonatomic, strong) NSString * _Nullable extension;

/**
 String concatenated to the end of the destination filename.Required for multiple outputs of the same type.
 */
@property (nonatomic, strong) NSString * _Nullable nameModifier;

@end

/**
 Arib Destination Settings
 */
@interface AWSmedialiveAribDestinationSettings : AWSModel


@end

/**
 Arib Source Settings
 */
@interface AWSmedialiveAribSourceSettings : AWSModel


@end

/**
 Audio Channel Mapping
 Required parameters: [OutputChannel, InputChannelLevels]
 */
@interface AWSmedialiveAudioChannelMapping : AWSModel


/**
 Indices and gain values for each input channel that should be remixed into this output channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputChannelLevel *> * _Nullable inputChannelLevels;

/**
 The index of the output channel being produced.
 */
@property (nonatomic, strong) NSNumber * _Nullable outputChannel;

@end

/**
 Audio Codec Settings
 */
@interface AWSmedialiveAudioCodecSettings : AWSModel


/**
 Aac Settings
 */
@property (nonatomic, strong) AWSmedialiveAacSettings * _Nullable aacSettings;

/**
 Ac3 Settings
 */
@property (nonatomic, strong) AWSmedialiveAc3Settings * _Nullable ac3Settings;

/**
 Eac3 Settings
 */
@property (nonatomic, strong) AWSmedialiveEac3Settings * _Nullable eac3Settings;

/**
 Mp2 Settings
 */
@property (nonatomic, strong) AWSmedialiveMp2Settings * _Nullable mp2Settings;

/**
 Pass Through Settings
 */
@property (nonatomic, strong) AWSmedialivePassThroughSettings * _Nullable passThroughSettings;

@end

/**
 Audio Description
 Required parameters: [AudioSelectorName, Name]
 */
@interface AWSmedialiveAudioDescription : AWSModel


/**
 Advanced audio normalization settings.
 */
@property (nonatomic, strong) AWSmedialiveAudioNormalizationSettings * _Nullable audioNormalizationSettings;

/**
 The name of the AudioSelector used as the source for this AudioDescription.
 */
@property (nonatomic, strong) NSString * _Nullable audioSelectorName;

/**
 Applies only if audioTypeControl is useConfigured. The values for audioType are defined in ISO-IEC 13818-1.
 */
@property (nonatomic, assign) AWSmedialiveAudioType audioType;

/**
 Determines how audio type is determined. followInput: If the input contains an ISO 639 audioType, then that value is passed through to the output. If the input contains no ISO 639 audioType, the value in Audio Type is included in the output. useConfigured: The value in Audio Type is included in the output. Note that this field and audioType are both ignored if inputType is broadcasterMixedAd.
 */
@property (nonatomic, assign) AWSmedialiveAudioDescriptionAudioTypeControl audioTypeControl;

/**
 Audio codec settings.
 */
@property (nonatomic, strong) AWSmedialiveAudioCodecSettings * _Nullable codecSettings;

/**
 Indicates the language of the audio output track. Only used if languageControlMode is useConfigured, or there is no ISO 639 language code specified in the input.
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 Choosing followInput will cause the ISO 639 language code of the output to follow the ISO 639 language code of the input. The languageCode will be used when useConfigured is set, or when followInput is selected but there is no ISO 639 language code specified by the input.
 */
@property (nonatomic, assign) AWSmedialiveAudioDescriptionLanguageCodeControl languageCodeControl;

/**
 The name of this AudioDescription. Outputs will use this name to uniquely identify this AudioDescription.Description names should be unique within this Live Event.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Settings that control how input audio channels are remixed into the output audio channels.
 */
@property (nonatomic, strong) AWSmedialiveRemixSettings * _Nullable remixSettings;

/**
 Used for MS Smooth and Apple HLS outputs. Indicates the name displayed by the player (eg. English, or Director Commentary).
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 Audio Language Selection
 Required parameters: [LanguageCode]
 */
@interface AWSmedialiveAudioLanguageSelection : AWSModel


/**
 Selects a specific three-letter language code from within an audio source.
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 When set to "strict", the transport stream demux strictly identifies audio streams by their language descriptor. If a PMT update occurs such that an audio stream matching the initially selected language is no longer present then mute will be encoded until the language returns. If "loose", then on a PMT update the demux will choose another audio stream in the program with the same stream type if it can't find one with the same language.
 */
@property (nonatomic, assign) AWSmedialiveAudioLanguageSelectionPolicy languageSelectionPolicy;

@end

/**
 Audio Normalization Settings
 */
@interface AWSmedialiveAudioNormalizationSettings : AWSModel


/**
 Audio normalization algorithm to use. itu17701 conforms to the CALM Act specification, itu17702 conforms to the EBU R-128 specification.
 */
@property (nonatomic, assign) AWSmedialiveAudioNormalizationAlgorithm algorithm;

/**
 When set to correctAudio the output audio is corrected using the chosen algorithm. If set to measureOnly, the audio will be measured but not adjusted.
 */
@property (nonatomic, assign) AWSmedialiveAudioNormalizationAlgorithmControl algorithmControl;

/**
 Target LKFS(loudness) to adjust volume to. If no value is entered, a default value will be used according to the chosen algorithm.The CALM Act (1770-1) recommends a target of -24 LKFS. The EBU R-128 specification (1770-2) recommends a target of -23 LKFS.
 */
@property (nonatomic, strong) NSNumber * _Nullable targetLkfs;

@end

/**
 Audio Only Hls Settings
 */
@interface AWSmedialiveAudioOnlyHlsSettings : AWSModel


/**
 Specifies the group to which the audio Rendition belongs.
 */
@property (nonatomic, strong) NSString * _Nullable audioGroupId;

/**
 Optional. Specifies the .jpg or .png image to use as the cover art for an audio-only output. We recommend a low bit-size file because the image increases the output audio bandwidth.The image is attached to the audio as an ID3 tag, frame type APIC, picture type 0x10, as per the "ID3 tag version 2.4.0 - Native Frames" standard.
 */
@property (nonatomic, strong) AWSmedialiveInputLocation * _Nullable audioOnlyImage;

/**
 Four types of audio-only tracks are supported:Audio-Only Variant Stream The client can play back this audio-only stream instead of video in low-bandwidth scenarios. Represented as an EXT-X-STREAM-INF in the HLS manifest.Alternate Audio, Auto Select, Default Alternate rendition that the client should try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=YES, AUTOSELECT=YESAlternate Audio, Auto Select, Not Default Alternate rendition that the client may try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO, AUTOSELECT=YESAlternate Audio, not Auto Select Alternate rendition that the client will not try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO, AUTOSELECT=NO
 */
@property (nonatomic, assign) AWSmedialiveAudioOnlyHlsTrackType audioTrackType;

/**
 Specifies the segment type.
 */
@property (nonatomic, assign) AWSmedialiveAudioOnlyHlsSegmentType segmentType;

@end

/**
 Audio Pid Selection
 Required parameters: [Pid]
 */
@interface AWSmedialiveAudioPidSelection : AWSModel


/**
 Selects a specific PID from within a source.
 */
@property (nonatomic, strong) NSNumber * _Nullable pid;

@end

/**
 Audio Selector
 Required parameters: [Name]
 */
@interface AWSmedialiveAudioSelector : AWSModel


/**
 The name of this AudioSelector. AudioDescriptions will use this name to uniquely identify this Selector.Selector names should be unique per input.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The audio selector settings.
 */
@property (nonatomic, strong) AWSmedialiveAudioSelectorSettings * _Nullable selectorSettings;

@end

/**
 Audio Selector Settings
 */
@interface AWSmedialiveAudioSelectorSettings : AWSModel


/**
 Audio Language Selection
 */
@property (nonatomic, strong) AWSmedialiveAudioLanguageSelection * _Nullable audioLanguageSelection;

/**
 Audio Pid Selection
 */
@property (nonatomic, strong) AWSmedialiveAudioPidSelection * _Nullable audioPidSelection;

/**
 Audio Track Selection
 */
@property (nonatomic, strong) AWSmedialiveAudioTrackSelection * _Nullable audioTrackSelection;

@end

/**
 Audio Track
 Required parameters: [Track]
 */
@interface AWSmedialiveAudioTrack : AWSModel


/**
 1-based integer value that maps to a specific audio track
 */
@property (nonatomic, strong) NSNumber * _Nullable track;

@end

/**
 Audio Track Selection
 Required parameters: [Tracks]
 */
@interface AWSmedialiveAudioTrackSelection : AWSModel


/**
 Selects one or more unique audio tracks from within an mp4 source.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveAudioTrack *> * _Nullable tracks;

@end

/**
 The settings for Automatic Input Failover.
 Required parameters: [SecondaryInputId]
 */
@interface AWSmedialiveAutomaticInputFailoverSettings : AWSModel


/**
 Input preference when deciding which input to make active when a previously failed input has recovered.
 */
@property (nonatomic, assign) AWSmedialiveInputPreference inputPreference;

/**
 The input ID of the secondary input in the automatic input failover pair.
 */
@property (nonatomic, strong) NSString * _Nullable secondaryInputId;

@end

/**
 Avail Blanking
 */
@interface AWSmedialiveAvailBlanking : AWSModel


/**
 Blanking image to be used. Leave empty for solid black. Only bmp and png images are supported.
 */
@property (nonatomic, strong) AWSmedialiveInputLocation * _Nullable availBlankingImage;

/**
 When set to enabled, causes video, audio and captions to be blanked when insertion metadata is added.
 */
@property (nonatomic, assign) AWSmedialiveAvailBlankingState state;

@end

/**
 Avail Configuration
 */
@interface AWSmedialiveAvailConfiguration : AWSModel


/**
 Ad avail settings.
 */
@property (nonatomic, strong) AWSmedialiveAvailSettings * _Nullable availSettings;

@end

/**
 Avail Settings
 */
@interface AWSmedialiveAvailSettings : AWSModel


/**
 Scte35 Splice Insert
 */
@property (nonatomic, strong) AWSmedialiveScte35SpliceInsert * _Nullable scte35SpliceInsert;

/**
 Scte35 Time Signal Apos
 */
@property (nonatomic, strong) AWSmedialiveScte35TimeSignalApos * _Nullable scte35TimeSignalApos;

@end

/**
 A list of schedule actions to create (in a request) or that have been created (in a response).
 Required parameters: [ScheduleActions]
 */
@interface AWSmedialiveBatchScheduleActionCreateRequest : AWSModel


/**
 A list of schedule actions to create.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveScheduleAction *> * _Nullable scheduleActions;

@end

/**
 List of actions that have been created in the schedule.
 Required parameters: [ScheduleActions]
 */
@interface AWSmedialiveBatchScheduleActionCreateResult : AWSModel


/**
 List of actions that have been created in the schedule.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveScheduleAction *> * _Nullable scheduleActions;

@end

/**
 A list of schedule actions to delete.
 Required parameters: [ActionNames]
 */
@interface AWSmedialiveBatchScheduleActionDeleteRequest : AWSModel


/**
 A list of schedule actions to delete.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actionNames;

@end

/**
 List of actions that have been deleted from the schedule.
 Required parameters: [ScheduleActions]
 */
@interface AWSmedialiveBatchScheduleActionDeleteResult : AWSModel


/**
 List of actions that have been deleted from the schedule.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveScheduleAction *> * _Nullable scheduleActions;

@end

/**
 List of actions to create and list of actions to delete.
 Required parameters: [ChannelId]
 */
@interface AWSmedialiveBatchUpdateScheduleRequest : AWSRequest


/**
 Id of the channel whose schedule is being updated.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 Schedule actions to create in the schedule.
 */
@property (nonatomic, strong) AWSmedialiveBatchScheduleActionCreateRequest * _Nullable creates;

/**
 Schedule actions to delete from the schedule.
 */
@property (nonatomic, strong) AWSmedialiveBatchScheduleActionDeleteRequest * _Nullable deletes;

@end

/**
 Placeholder documentation for BatchUpdateScheduleResponse
 */
@interface AWSmedialiveBatchUpdateScheduleResponse : AWSModel


/**
 Schedule actions created in the schedule.
 */
@property (nonatomic, strong) AWSmedialiveBatchScheduleActionCreateResult * _Nullable creates;

/**
 Schedule actions deleted from the schedule.
 */
@property (nonatomic, strong) AWSmedialiveBatchScheduleActionDeleteResult * _Nullable deletes;

@end

/**
 Results of a batch schedule update.
 */
@interface AWSmedialiveBatchUpdateScheduleResult : AWSModel


/**
 Schedule actions created in the schedule.
 */
@property (nonatomic, strong) AWSmedialiveBatchScheduleActionCreateResult * _Nullable creates;

/**
 Schedule actions deleted from the schedule.
 */
@property (nonatomic, strong) AWSmedialiveBatchScheduleActionDeleteResult * _Nullable deletes;

@end

/**
 Blackout Slate
 */
@interface AWSmedialiveBlackoutSlate : AWSModel


/**
 Blackout slate image to be used. Leave empty for solid black. Only bmp and png images are supported.
 */
@property (nonatomic, strong) AWSmedialiveInputLocation * _Nullable blackoutSlateImage;

/**
 Setting to enabled causes the encoder to blackout the video, audio, and captions, and raise the "Network Blackout Image" slate when an SCTE104/35 Network End Segmentation Descriptor is encountered. The blackout will be lifted when the Network Start Segmentation Descriptor is encountered. The Network End and Network Start descriptors must contain a network ID that matches the value entered in "Network ID".
 */
@property (nonatomic, assign) AWSmedialiveBlackoutSlateNetworkEndBlackout networkEndBlackout;

/**
 Path to local file to use as Network End Blackout image. Image will be scaled to fill the entire output raster.
 */
@property (nonatomic, strong) AWSmedialiveInputLocation * _Nullable networkEndBlackoutImage;

/**
 Provides Network ID that matches EIDR ID format (e.g., "10.XXXX/XXXX-XXXX-XXXX-XXXX-XXXX-C").
 */
@property (nonatomic, strong) NSString * _Nullable networkId;

/**
 When set to enabled, causes video, audio and captions to be blanked when indicated by program metadata.
 */
@property (nonatomic, assign) AWSmedialiveBlackoutSlateState state;

@end

/**
 Burn In Destination Settings
 */
@interface AWSmedialiveBurnInDestinationSettings : AWSModel


/**
 If no explicit xPosition or yPosition is provided, setting alignment to centered will place the captions at the bottom center of the output. Similarly, setting a left alignment will align captions to the bottom left of the output. If x and y positions are given in conjunction with the alignment parameter, the font will be justified (either left or centered) relative to those coordinates. Selecting "smart" justification will left-justify live subtitles and center-justify pre-recorded subtitles.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmedialiveBurnInAlignment alignment;

/**
 Specifies the color of the rectangle behind the captions.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmedialiveBurnInBackgroundColor backgroundColor;

/**
 Specifies the opacity of the background rectangle. 255 is opaque; 0 is transparent. Leaving this parameter out is equivalent to setting it to 0 (transparent).All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable backgroundOpacity;

/**
 External font file used for caption burn-in. File extension must be 'ttf' or 'tte'.Although the user can select output fonts for many different types of input captions,embedded, STL and teletext sources use a strict grid system. Using external fonts with these caption sources could cause unexpected display of proportional fonts.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) AWSmedialiveInputLocation * _Nullable font;

/**
 Specifies the color of the burned-in captions.This option is not valid for source captions that are STL, 608/embedded or teletext.These source settings are already pre-defined by the caption stream.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmedialiveBurnInFontColor fontColor;

/**
 Specifies the opacity of the burned-in captions. 255 is opaque; 0 is transparent.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontOpacity;

/**
 Font resolution in DPI (dots per inch); default is 96 dpi.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontResolution;

/**
 When set to 'auto' fontSize will scale depending on the size of the output.Giving a positive integer will specify the exact font size in points.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSString * _Nullable fontSize;

/**
 Specifies font outline color. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmedialiveBurnInOutlineColor outlineColor;

/**
 Specifies font outline size in pixels. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable outlineSize;

/**
 Specifies the color of the shadow cast by the captions.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmedialiveBurnInShadowColor shadowColor;

/**
 Specifies the opacity of the shadow. 255 is opaque; 0 is transparent. Leaving this parameter out is equivalent to setting it to 0 (transparent).All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable shadowOpacity;

/**
 Specifies the horizontal offset of the shadow relative to the captions in pixels. A value of -2 would result in a shadow offset 2 pixels to the left.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable shadowXOffset;

/**
 Specifies the vertical offset of the shadow relative to the captions in pixels. A value of -2 would result in a shadow offset 2 pixels above the text.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable shadowYOffset;

/**
 Controls whether a fixed grid size will be used to generate the output subtitles bitmap. Only applicable for Teletext inputs and DVB-Sub/Burn-in outputs.
 */
@property (nonatomic, assign) AWSmedialiveBurnInTeletextGridControl teletextGridControl;

/**
 Specifies the horizontal position of the caption relative to the left side of the output in pixels. A value of 10 would result in the captions starting 10 pixels from the left of the output. If no explicit xPosition is provided, the horizontal caption position will be determined by the alignment parameter.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable XPosition;

/**
 Specifies the vertical position of the caption relative to the top of the output in pixels. A value of 10 would result in the captions starting 10 pixels from the top of the output. If no explicit yPosition is provided, the caption will be positioned towards the bottom of the output.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable YPosition;

@end

/**
 Caption Description
 Required parameters: [CaptionSelectorName, Name]
 */
@interface AWSmedialiveCaptionDescription : AWSModel


/**
 Specifies which input caption selector to use as a caption source when generating output captions. This field should match a captionSelector name.
 */
@property (nonatomic, strong) NSString * _Nullable captionSelectorName;

/**
 Additional settings for captions destination that depend on the destination type.
 */
@property (nonatomic, strong) AWSmedialiveCaptionDestinationSettings * _Nullable destinationSettings;

/**
 ISO 639-2 three-digit code: http://www.loc.gov/standards/iso639-2/
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 Human readable information to indicate captions available for players (eg. English, or Spanish).
 */
@property (nonatomic, strong) NSString * _Nullable languageDescription;

/**
 Name of the caption description.Used to associate a caption description with an output.Names must be unique within an event.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 Caption Destination Settings
 */
@interface AWSmedialiveCaptionDestinationSettings : AWSModel


/**
 Arib Destination Settings
 */
@property (nonatomic, strong) AWSmedialiveAribDestinationSettings * _Nullable aribDestinationSettings;

/**
 Burn In Destination Settings
 */
@property (nonatomic, strong) AWSmedialiveBurnInDestinationSettings * _Nullable burnInDestinationSettings;

/**
 Dvb Sub Destination Settings
 */
@property (nonatomic, strong) AWSmedialiveDvbSubDestinationSettings * _Nullable dvbSubDestinationSettings;

/**
 Embedded Destination Settings
 */
@property (nonatomic, strong) AWSmedialiveEmbeddedDestinationSettings * _Nullable embeddedDestinationSettings;

/**
 Embedded Plus Scte20 Destination Settings
 */
@property (nonatomic, strong) AWSmedialiveEmbeddedPlusScte20DestinationSettings * _Nullable embeddedPlusScte20DestinationSettings;

/**
 Rtmp Caption Info Destination Settings
 */
@property (nonatomic, strong) AWSmedialiveRtmpCaptionInfoDestinationSettings * _Nullable rtmpCaptionInfoDestinationSettings;

/**
 Scte20 Plus Embedded Destination Settings
 */
@property (nonatomic, strong) AWSmedialiveScte20PlusEmbeddedDestinationSettings * _Nullable scte20PlusEmbeddedDestinationSettings;

/**
 Scte27 Destination Settings
 */
@property (nonatomic, strong) AWSmedialiveScte27DestinationSettings * _Nullable scte27DestinationSettings;

/**
 Smpte Tt Destination Settings
 */
@property (nonatomic, strong) AWSmedialiveSmpteTtDestinationSettings * _Nullable smpteTtDestinationSettings;

/**
 Teletext Destination Settings
 */
@property (nonatomic, strong) AWSmedialiveTeletextDestinationSettings * _Nullable teletextDestinationSettings;

/**
 Ttml Destination Settings
 */
@property (nonatomic, strong) AWSmedialiveTtmlDestinationSettings * _Nullable ttmlDestinationSettings;

/**
 Webvtt Destination Settings
 */
@property (nonatomic, strong) AWSmedialiveWebvttDestinationSettings * _Nullable webvttDestinationSettings;

@end

/**
 Maps a caption channel to an ISO 693-2 language code (http://www.loc.gov/standards/iso639-2), with an optional description.
 Required parameters: [LanguageCode, LanguageDescription, CaptionChannel]
 */
@interface AWSmedialiveCaptionLanguageMapping : AWSModel


/**
 The closed caption channel being described by this CaptionLanguageMapping.Each channel mapping must have a unique channel number (maximum of 4)
 */
@property (nonatomic, strong) NSNumber * _Nullable captionChannel;

/**
 Three character ISO 639-2 language code (see http://www.loc.gov/standards/iso639-2)
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 Textual description of language
 */
@property (nonatomic, strong) NSString * _Nullable languageDescription;

@end

/**
 Output groups for this Live Event. Output groups contain information about where streams should be distributed.
 Required parameters: [Name]
 */
@interface AWSmedialiveCaptionSelector : AWSModel


/**
 When specified this field indicates the three letter language code of the caption track to extract from the source.
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 Name identifier for a caption selector.This name is used to associate this caption selector with one or more caption descriptions.Names must be unique within an event.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Caption selector settings.
 */
@property (nonatomic, strong) AWSmedialiveCaptionSelectorSettings * _Nullable selectorSettings;

@end

/**
 Caption Selector Settings
 */
@interface AWSmedialiveCaptionSelectorSettings : AWSModel


/**
 Arib Source Settings
 */
@property (nonatomic, strong) AWSmedialiveAribSourceSettings * _Nullable aribSourceSettings;

/**
 Dvb Sub Source Settings
 */
@property (nonatomic, strong) AWSmedialiveDvbSubSourceSettings * _Nullable dvbSubSourceSettings;

/**
 Embedded Source Settings
 */
@property (nonatomic, strong) AWSmedialiveEmbeddedSourceSettings * _Nullable embeddedSourceSettings;

/**
 Scte20 Source Settings
 */
@property (nonatomic, strong) AWSmedialiveScte20SourceSettings * _Nullable scte20SourceSettings;

/**
 Scte27 Source Settings
 */
@property (nonatomic, strong) AWSmedialiveScte27SourceSettings * _Nullable scte27SourceSettings;

/**
 Teletext Source Settings
 */
@property (nonatomic, strong) AWSmedialiveTeletextSourceSettings * _Nullable teletextSourceSettings;

@end

/**
 Placeholder documentation for Channel
 */
@interface AWSmedialiveChannel : AWSModel


/**
 The unique arn of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSmedialiveChannelClass channelClass;

/**
 A list of destinations of the channel. For UDP outputs, there is one destination per output. For other types (HLS, for example), there is one destination per packager. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestination *> * _Nullable destinations;

/**
 The endpoints where outgoing connections initiate from
 */
@property (nonatomic, strong) NSArray<AWSmedialiveChannelEgressEndpoint *> * _Nullable egressEndpoints;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSmedialiveEncoderSettings * _Nullable encoderSettings;

/**
 The unique id of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Placeholder documentation for InputSpecification
 */
@property (nonatomic, strong) AWSmedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level being written to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSmedialiveLogLevel logLevel;

/**
 The name of the channel. (user-mutable)
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Runtime details for the pipelines of a running channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialivePipelineDetail *> * _Nullable pipelineDetails;

/**
 The number of currently healthy pipelines.
 */
@property (nonatomic, strong) NSNumber * _Nullable pipelinesRunningCount;

/**
 The Amazon Resource Name (ARN) of the role assumed when running the Channel.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 Placeholder documentation for ChannelState
 */
@property (nonatomic, assign) AWSmedialiveChannelState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for ChannelConfigurationValidationError
 */
@interface AWSmedialiveChannelConfigurationValidationError : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 A collection of validation error responses.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveValidationError *> * _Nullable validationErrors;

@end

/**
 Placeholder documentation for ChannelEgressEndpoint
 */
@interface AWSmedialiveChannelEgressEndpoint : AWSModel


/**
 Public IP of where a channel's output comes from
 */
@property (nonatomic, strong) NSString * _Nullable sourceIp;

@end

/**
 Placeholder documentation for ChannelSummary
 */
@interface AWSmedialiveChannelSummary : AWSModel


/**
 The unique arn of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSmedialiveChannelClass channelClass;

/**
 A list of destinations of the channel. For UDP outputs, there is one destination per output. For other types (HLS, for example), there is one destination per packager. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestination *> * _Nullable destinations;

/**
 The endpoints where outgoing connections initiate from
 */
@property (nonatomic, strong) NSArray<AWSmedialiveChannelEgressEndpoint *> * _Nullable egressEndpoints;

/**
 The unique id of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Placeholder documentation for InputSpecification
 */
@property (nonatomic, strong) AWSmedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level being written to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSmedialiveLogLevel logLevel;

/**
 The name of the channel. (user-mutable)
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The number of currently healthy pipelines.
 */
@property (nonatomic, strong) NSNumber * _Nullable pipelinesRunningCount;

/**
 The Amazon Resource Name (ARN) of the role assumed when running the Channel.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 Placeholder documentation for ChannelState
 */
@property (nonatomic, assign) AWSmedialiveChannelState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Passthrough applies no color space conversion to the output
 */
@interface AWSmedialiveColorSpacePassthroughSettings : AWSModel


@end

/**
 Placeholder documentation for CreateChannel
 */
@interface AWSmedialiveCreateChannel : AWSModel


/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSmedialiveChannelClass channelClass;

/**
 Placeholder documentation for __listOfOutputDestination
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestination *> * _Nullable destinations;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSmedialiveEncoderSettings * _Nullable encoderSettings;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Specification of input for this channel (max. bitrate, resolution, codec, etc.)
 */
@property (nonatomic, strong) AWSmedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level to write to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSmedialiveLogLevel logLevel;

/**
 Name of channel.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Unique request ID to be specified. This is needed to prevent retries from creating multiple resources. 
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 Deprecated field that's only usable by whitelisted customers.
 */
@property (nonatomic, strong) NSString * _Nullable reserved;

/**
 An optional Amazon Resource Name (ARN) of the role to assume when running the Channel.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 A request to create a channel
 */
@interface AWSmedialiveCreateChannelRequest : AWSRequest


/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSmedialiveChannelClass channelClass;

/**
 Placeholder documentation for __listOfOutputDestination
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestination *> * _Nullable destinations;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSmedialiveEncoderSettings * _Nullable encoderSettings;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Specification of input for this channel (max. bitrate, resolution, codec, etc.)
 */
@property (nonatomic, strong) AWSmedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level to write to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSmedialiveLogLevel logLevel;

/**
 Name of channel.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Unique request ID to be specified. This is needed to prevent retries from creating multiple resources. 
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 Deprecated field that's only usable by whitelisted customers.
 */
@property (nonatomic, strong) NSString * _Nullable reserved;

/**
 An optional Amazon Resource Name (ARN) of the role to assume when running the Channel.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for CreateChannelResponse
 */
@interface AWSmedialiveCreateChannelResponse : AWSModel


/**
 Placeholder documentation for Channel
 */
@property (nonatomic, strong) AWSmedialiveChannel * _Nullable channel;

@end

/**
 Placeholder documentation for CreateChannelResultModel
 */
@interface AWSmedialiveCreateChannelResultModel : AWSModel


/**
 Placeholder documentation for Channel
 */
@property (nonatomic, strong) AWSmedialiveChannel * _Nullable channel;

@end

/**
 Placeholder documentation for CreateInput
 */
@interface AWSmedialiveCreateInput : AWSModel


/**
 Destination settings for PUSH type inputs.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputDestinationRequest *> * _Nullable destinations;

/**
 A list of security groups referenced by IDs to attach to the input.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inputSecurityGroups;

/**
 A list of the MediaConnect Flows that you want to use in this input. You can specify as few as one Flow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a separate Availability Zone as this ensures your EML input is redundant to AZ issues. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMediaConnectFlowRequest *> * _Nullable mediaConnectFlows;

/**
 Name of the input.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Unique identifier of the request to ensure the request is handled exactly once in case of retries. 
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 The Amazon Resource Name (ARN) of the role this input assumes during and after creation.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 The source URLs for a PULL-type input. Every PULL type input needs exactly two source URLs for redundancy. Only specify sources for PULL type Inputs. Leave Destinations empty. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputSourceRequest *> * _Nullable sources;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Placeholder documentation for InputType
 */
@property (nonatomic, assign) AWSmedialiveInputType types;

/**
 Settings for a private VPC Input. When this property is specified, the input destination addresses will be created in a VPC rather than with public Internet addresses. This property requires setting the roleArn property on Input creation. Not compatible with the inputSecurityGroups property. 
 */
@property (nonatomic, strong) AWSmedialiveInputVpcRequest * _Nullable vpc;

@end

/**
 The name of the input
 */
@interface AWSmedialiveCreateInputRequest : AWSRequest


/**
 Destination settings for PUSH type inputs.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputDestinationRequest *> * _Nullable destinations;

/**
 A list of security groups referenced by IDs to attach to the input.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inputSecurityGroups;

/**
 A list of the MediaConnect Flows that you want to use in this input. You can specify as few as one Flow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a separate Availability Zone as this ensures your EML input is redundant to AZ issues. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMediaConnectFlowRequest *> * _Nullable mediaConnectFlows;

/**
 Name of the input.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Unique identifier of the request to ensure the request is handled exactly once in case of retries. 
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 The Amazon Resource Name (ARN) of the role this input assumes during and after creation.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 The source URLs for a PULL-type input. Every PULL type input needs exactly two source URLs for redundancy. Only specify sources for PULL type Inputs. Leave Destinations empty. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputSourceRequest *> * _Nullable sources;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Placeholder documentation for InputType
 */
@property (nonatomic, assign) AWSmedialiveInputType types;

/**
 Settings for a private VPC Input. When this property is specified, the input destination addresses will be created in a VPC rather than with public Internet addresses. This property requires setting the roleArn property on Input creation. Not compatible with the inputSecurityGroups property. 
 */
@property (nonatomic, strong) AWSmedialiveInputVpcRequest * _Nullable vpc;

@end

/**
 Placeholder documentation for CreateInputResponse
 */
@interface AWSmedialiveCreateInputResponse : AWSModel


/**
 Placeholder documentation for Input
 */
@property (nonatomic, strong) AWSmedialiveInput * _Nullable input;

@end

/**
 Placeholder documentation for CreateInputResultModel
 */
@interface AWSmedialiveCreateInputResultModel : AWSModel


/**
 Placeholder documentation for Input
 */
@property (nonatomic, strong) AWSmedialiveInput * _Nullable input;

@end

/**
 The IPv4 CIDRs to whitelist for this Input Security Group
 */
@interface AWSmedialiveCreateInputSecurityGroupRequest : AWSRequest


/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 List of IPv4 CIDR addresses to whitelist
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputWhitelistRuleCidr *> * _Nullable whitelistRules;

@end

/**
 Placeholder documentation for CreateInputSecurityGroupResponse
 */
@interface AWSmedialiveCreateInputSecurityGroupResponse : AWSModel


/**
 An Input Security Group
 */
@property (nonatomic, strong) AWSmedialiveInputSecurityGroup * _Nullable securityGroup;

@end

/**
 Placeholder documentation for CreateInputSecurityGroupResultModel
 */
@interface AWSmedialiveCreateInputSecurityGroupResultModel : AWSModel


/**
 An Input Security Group
 */
@property (nonatomic, strong) AWSmedialiveInputSecurityGroup * _Nullable securityGroup;

@end

/**
 Placeholder documentation for CreateMultiplex
 Required parameters: [RequestId, MultiplexSettings, AvailabilityZones, Name]
 */
@interface AWSmedialiveCreateMultiplex : AWSModel


/**
 A list of availability zones for the multiplex. You must specify exactly two.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexSettings * _Nullable multiplexSettings;

/**
 Name of multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Unique request ID. This prevents retries from creating multiple resources. 
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for CreateMultiplexProgram
 Required parameters: [RequestId, MultiplexProgramSettings, ProgramName]
 */
@interface AWSmedialiveCreateMultiplexProgram : AWSModel


/**
 The settings for this multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

/**
 Name of multiplex program.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

/**
 Unique request ID. This prevents retries from creating multiple resources. 
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 A request to create a program in a multiplex.
 Required parameters: [MultiplexId, RequestId, MultiplexProgramSettings, ProgramName]
 */
@interface AWSmedialiveCreateMultiplexProgramRequest : AWSRequest


/**
 ID of the multiplex where the program is to be created.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

/**
 The settings for this multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

/**
 Name of multiplex program.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

/**
 Unique request ID. This prevents retries from creating multiple resources. 
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

@end

/**
 Placeholder documentation for CreateMultiplexProgramResponse
 */
@interface AWSmedialiveCreateMultiplexProgramResponse : AWSModel


/**
 The newly created multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgram * _Nullable multiplexProgram;

@end

/**
 Placeholder documentation for CreateMultiplexProgramResultModel
 */
@interface AWSmedialiveCreateMultiplexProgramResultModel : AWSModel


/**
 The newly created multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgram * _Nullable multiplexProgram;

@end

/**
 A request to create a multiplex.
 Required parameters: [RequestId, MultiplexSettings, AvailabilityZones, Name]
 */
@interface AWSmedialiveCreateMultiplexRequest : AWSRequest


/**
 A list of availability zones for the multiplex. You must specify exactly two.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexSettings * _Nullable multiplexSettings;

/**
 Name of multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Unique request ID. This prevents retries from creating multiple resources. 
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for CreateMultiplexResponse
 */
@interface AWSmedialiveCreateMultiplexResponse : AWSModel


/**
 The newly created multiplex.
 */
@property (nonatomic, strong) AWSmedialiveMultiplex * _Nullable multiplex;

@end

/**
 Placeholder documentation for CreateMultiplexResultModel
 */
@interface AWSmedialiveCreateMultiplexResultModel : AWSModel


/**
 The newly created multiplex.
 */
@property (nonatomic, strong) AWSmedialiveMultiplex * _Nullable multiplex;

@end

/**
 Placeholder documentation for CreateTagsRequest
 Required parameters: [ResourceArn]
 */
@interface AWSmedialiveCreateTagsRequest : AWSRequest


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 Placeholder documentation for Tags
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for DeleteChannelRequest
 Required parameters: [ChannelId]
 */
@interface AWSmedialiveDeleteChannelRequest : AWSRequest


/**
 Unique ID of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

@end

/**
 Placeholder documentation for DeleteChannelResponse
 */
@interface AWSmedialiveDeleteChannelResponse : AWSModel


/**
 The unique arn of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSmedialiveChannelClass channelClass;

/**
 A list of destinations of the channel. For UDP outputs, there is one destination per output. For other types (HLS, for example), there is one destination per packager. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestination *> * _Nullable destinations;

/**
 The endpoints where outgoing connections initiate from
 */
@property (nonatomic, strong) NSArray<AWSmedialiveChannelEgressEndpoint *> * _Nullable egressEndpoints;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSmedialiveEncoderSettings * _Nullable encoderSettings;

/**
 The unique id of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Placeholder documentation for InputSpecification
 */
@property (nonatomic, strong) AWSmedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level being written to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSmedialiveLogLevel logLevel;

/**
 The name of the channel. (user-mutable)
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Runtime details for the pipelines of a running channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialivePipelineDetail *> * _Nullable pipelineDetails;

/**
 The number of currently healthy pipelines.
 */
@property (nonatomic, strong) NSNumber * _Nullable pipelinesRunningCount;

/**
 The Amazon Resource Name (ARN) of the role assumed when running the Channel.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 Placeholder documentation for ChannelState
 */
@property (nonatomic, assign) AWSmedialiveChannelState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for DeleteInputRequest
 Required parameters: [InputId]
 */
@interface AWSmedialiveDeleteInputRequest : AWSRequest


/**
 Unique ID of the input
 */
@property (nonatomic, strong) NSString * _Nullable inputId;

@end

/**
 Placeholder documentation for DeleteInputResponse
 */
@interface AWSmedialiveDeleteInputResponse : AWSModel


@end

/**
 Placeholder documentation for DeleteInputSecurityGroupRequest
 Required parameters: [InputSecurityGroupId]
 */
@interface AWSmedialiveDeleteInputSecurityGroupRequest : AWSRequest


/**
 The Input Security Group to delete
 */
@property (nonatomic, strong) NSString * _Nullable inputSecurityGroupId;

@end

/**
 Placeholder documentation for DeleteInputSecurityGroupResponse
 */
@interface AWSmedialiveDeleteInputSecurityGroupResponse : AWSModel


@end

/**
 Placeholder documentation for DeleteMultiplexProgramRequest
 Required parameters: [MultiplexId, ProgramName]
 */
@interface AWSmedialiveDeleteMultiplexProgramRequest : AWSRequest


/**
 The ID of the multiplex that the program belongs to.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

/**
 The multiplex program name.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

@end

/**
 Placeholder documentation for DeleteMultiplexProgramResponse
 */
@interface AWSmedialiveDeleteMultiplexProgramResponse : AWSModel


/**
 The MediaLive channel associated with the program.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 The settings for this multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

/**
 The packet identifier map for this multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgramPacketIdentifiersMap * _Nullable packetIdentifiersMap;

/**
 The name of the multiplex program.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

@end

/**
 Placeholder documentation for DeleteMultiplexRequest
 Required parameters: [MultiplexId]
 */
@interface AWSmedialiveDeleteMultiplexRequest : AWSRequest


/**
 The ID of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

@end

/**
 Placeholder documentation for DeleteMultiplexResponse
 */
@interface AWSmedialiveDeleteMultiplexResponse : AWSModel


/**
 The unique arn of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A list of availability zones for the multiplex.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 A list of the multiplex output destinations.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMultiplexOutputDestination *> * _Nullable destinations;

/**
 The unique id of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexSettings * _Nullable multiplexSettings;

/**
 The name of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The number of currently healthy pipelines.
 */
@property (nonatomic, strong) NSNumber * _Nullable pipelinesRunningCount;

/**
 The number of programs in the multiplex.
 */
@property (nonatomic, strong) NSNumber * _Nullable programCount;

/**
 The current state of the multiplex.
 */
@property (nonatomic, assign) AWSmedialiveMultiplexState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for DeleteReservationRequest
 Required parameters: [ReservationId]
 */
@interface AWSmedialiveDeleteReservationRequest : AWSRequest


/**
 Unique reservation ID, e.g. '1234567'
 */
@property (nonatomic, strong) NSString * _Nullable reservationId;

@end

/**
 Placeholder documentation for DeleteReservationResponse
 */
@interface AWSmedialiveDeleteReservationResponse : AWSModel


/**
 Unique reservation ARN, e.g. 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 Number of reserved resources
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 Lease duration, e.g. '12'
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 Units for duration, e.g. 'MONTHS'
 */
@property (nonatomic, assign) AWSmedialiveOfferingDurationUnits durationUnits;

/**
 Reservation UTC end date and time in ISO-8601 format, e.g. '2019-03-01T00:00:00'
 */
@property (nonatomic, strong) NSString * _Nullable end;

/**
 One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT offering
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 User specified reservation name
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and standard VQ in US West (Oregon)'
 */
@property (nonatomic, strong) NSString * _Nullable offeringDescription;

/**
 Unique offering ID, e.g. '87654321'
 */
@property (nonatomic, strong) NSString * _Nullable offeringId;

/**
 Offering type, e.g. 'NO_UPFRONT'
 */
@property (nonatomic, assign) AWSmedialiveOfferingType offeringType;

/**
 AWS region, e.g. 'us-west-2'
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 Unique reservation ID, e.g. '1234567'
 */
@property (nonatomic, strong) NSString * _Nullable reservationId;

/**
 Resource configuration details
 */
@property (nonatomic, strong) AWSmedialiveReservationResourceSpecification * _Nullable resourceSpecification;

/**
 Reservation UTC start date and time in ISO-8601 format, e.g. '2018-03-01T00:00:00'
 */
@property (nonatomic, strong) NSString * _Nullable start;

/**
 Current state of reservation, e.g. 'ACTIVE'
 */
@property (nonatomic, assign) AWSmedialiveReservationState state;

/**
 A collection of key-value pairs
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Recurring usage charge for each reserved resource, e.g. '157.0'
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 Placeholder documentation for DeleteScheduleRequest
 Required parameters: [ChannelId]
 */
@interface AWSmedialiveDeleteScheduleRequest : AWSRequest


/**
 Id of the channel whose schedule is being deleted.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

@end

/**
 Placeholder documentation for DeleteScheduleResponse
 */
@interface AWSmedialiveDeleteScheduleResponse : AWSModel


@end

/**
 Placeholder documentation for DeleteTagsRequest
 Required parameters: [TagKeys, ResourceArn]
 */
@interface AWSmedialiveDeleteTagsRequest : AWSRequest


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 An array of tag keys to delete
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 Placeholder documentation for DescribeChannelRequest
 Required parameters: [ChannelId]
 */
@interface AWSmedialiveDescribeChannelRequest : AWSRequest


/**
 channel ID
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

@end

/**
 Placeholder documentation for DescribeChannelResponse
 */
@interface AWSmedialiveDescribeChannelResponse : AWSModel


/**
 The unique arn of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSmedialiveChannelClass channelClass;

/**
 A list of destinations of the channel. For UDP outputs, there is one destination per output. For other types (HLS, for example), there is one destination per packager. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestination *> * _Nullable destinations;

/**
 The endpoints where outgoing connections initiate from
 */
@property (nonatomic, strong) NSArray<AWSmedialiveChannelEgressEndpoint *> * _Nullable egressEndpoints;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSmedialiveEncoderSettings * _Nullable encoderSettings;

/**
 The unique id of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Placeholder documentation for InputSpecification
 */
@property (nonatomic, strong) AWSmedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level being written to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSmedialiveLogLevel logLevel;

/**
 The name of the channel. (user-mutable)
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Runtime details for the pipelines of a running channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialivePipelineDetail *> * _Nullable pipelineDetails;

/**
 The number of currently healthy pipelines.
 */
@property (nonatomic, strong) NSNumber * _Nullable pipelinesRunningCount;

/**
 The Amazon Resource Name (ARN) of the role assumed when running the Channel.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 Placeholder documentation for ChannelState
 */
@property (nonatomic, assign) AWSmedialiveChannelState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for DescribeInputRequest
 Required parameters: [InputId]
 */
@interface AWSmedialiveDescribeInputRequest : AWSRequest


/**
 Unique ID of the input
 */
@property (nonatomic, strong) NSString * _Nullable inputId;

@end

/**
 Placeholder documentation for DescribeInputResponse
 */
@interface AWSmedialiveDescribeInputResponse : AWSModel


/**
 The Unique ARN of the input (generated, immutable).
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A list of channel IDs that that input is attached to (currently an input can only be attached to one channel).
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attachedChannels;

/**
 A list of the destinations of the input (PUSH-type).
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputDestination *> * _Nullable destinations;

/**
 The generated ID of the input (unique for user account, immutable).
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 STANDARD - MediaLive expects two sources to be connected to this input. If the channel is also STANDARD, both sources will be ingested. If the channel is SINGLE_PIPELINE, only the first source will be ingested; the second source will always be ignored, even if the first source fails. SINGLE_PIPELINE - You can connect only one source to this input. If the ChannelClass is alsoSINGLE_PIPELINE, this value is valid. If the ChannelClass is STANDARD, this value is not valid because the channel requires two sources in the input. 
 */
@property (nonatomic, assign) AWSmedialiveInputClass inputClass;

/**
 Certain pull input sources can be dynamic, meaning that they can have their URL's dynamically changes during input switch actions. Presently, this functionality only works with MP4_FILE inputs. 
 */
@property (nonatomic, assign) AWSmedialiveInputSourceType inputSourceType;

/**
 A list of MediaConnect Flows for this input.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMediaConnectFlow *> * _Nullable mediaConnectFlows;

/**
 The user-assigned name (This is a mutable value).
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The Amazon Resource Name (ARN) of the role this input assumes during and after creation.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 A list of IDs for all the Input Security Groups attached to the input.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 A list of the sources of the input (PULL-type).
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputSource *> * _Nullable sources;

/**
 Placeholder documentation for InputState
 */
@property (nonatomic, assign) AWSmedialiveInputState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Placeholder documentation for InputType
 */
@property (nonatomic, assign) AWSmedialiveInputType types;

@end

/**
 Placeholder documentation for DescribeInputSecurityGroupRequest
 Required parameters: [InputSecurityGroupId]
 */
@interface AWSmedialiveDescribeInputSecurityGroupRequest : AWSRequest


/**
 The id of the Input Security Group to describe
 */
@property (nonatomic, strong) NSString * _Nullable inputSecurityGroupId;

@end

/**
 Placeholder documentation for DescribeInputSecurityGroupResponse
 */
@interface AWSmedialiveDescribeInputSecurityGroupResponse : AWSModel


/**
 Unique ARN of Input Security Group
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The Id of the Input Security Group
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The list of inputs currently using this Input Security Group.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inputs;

/**
 The current state of the Input Security Group.
 */
@property (nonatomic, assign) AWSmedialiveInputSecurityGroupState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Whitelist rules and their sync status
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputWhitelistRule *> * _Nullable whitelistRules;

@end

/**
 Placeholder documentation for DescribeMultiplexProgramRequest
 Required parameters: [MultiplexId, ProgramName]
 */
@interface AWSmedialiveDescribeMultiplexProgramRequest : AWSRequest


/**
 The ID of the multiplex that the program belongs to.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

/**
 The name of the program.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

@end

/**
 Placeholder documentation for DescribeMultiplexProgramResponse
 */
@interface AWSmedialiveDescribeMultiplexProgramResponse : AWSModel


/**
 The MediaLive channel associated with the program.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 The settings for this multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

/**
 The packet identifier map for this multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgramPacketIdentifiersMap * _Nullable packetIdentifiersMap;

/**
 The name of the multiplex program.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

@end

/**
 Placeholder documentation for DescribeMultiplexRequest
 Required parameters: [MultiplexId]
 */
@interface AWSmedialiveDescribeMultiplexRequest : AWSRequest


/**
 The ID of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

@end

/**
 Placeholder documentation for DescribeMultiplexResponse
 */
@interface AWSmedialiveDescribeMultiplexResponse : AWSModel


/**
 The unique arn of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A list of availability zones for the multiplex.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 A list of the multiplex output destinations.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMultiplexOutputDestination *> * _Nullable destinations;

/**
 The unique id of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexSettings * _Nullable multiplexSettings;

/**
 The name of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The number of currently healthy pipelines.
 */
@property (nonatomic, strong) NSNumber * _Nullable pipelinesRunningCount;

/**
 The number of programs in the multiplex.
 */
@property (nonatomic, strong) NSNumber * _Nullable programCount;

/**
 The current state of the multiplex.
 */
@property (nonatomic, assign) AWSmedialiveMultiplexState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for DescribeOfferingRequest
 Required parameters: [OfferingId]
 */
@interface AWSmedialiveDescribeOfferingRequest : AWSRequest


/**
 Unique offering ID, e.g. '87654321'
 */
@property (nonatomic, strong) NSString * _Nullable offeringId;

@end

/**
 Placeholder documentation for DescribeOfferingResponse
 */
@interface AWSmedialiveDescribeOfferingResponse : AWSModel


/**
 Unique offering ARN, e.g. 'arn:aws:medialive:us-west-2:123456789012:offering:87654321'
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 Lease duration, e.g. '12'
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 Units for duration, e.g. 'MONTHS'
 */
@property (nonatomic, assign) AWSmedialiveOfferingDurationUnits durationUnits;

/**
 One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT offering
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and standard VQ in US West (Oregon)'
 */
@property (nonatomic, strong) NSString * _Nullable offeringDescription;

/**
 Unique offering ID, e.g. '87654321'
 */
@property (nonatomic, strong) NSString * _Nullable offeringId;

/**
 Offering type, e.g. 'NO_UPFRONT'
 */
@property (nonatomic, assign) AWSmedialiveOfferingType offeringType;

/**
 AWS region, e.g. 'us-west-2'
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 Resource configuration details
 */
@property (nonatomic, strong) AWSmedialiveReservationResourceSpecification * _Nullable resourceSpecification;

/**
 Recurring usage charge for each reserved resource, e.g. '157.0'
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 Placeholder documentation for DescribeReservationRequest
 Required parameters: [ReservationId]
 */
@interface AWSmedialiveDescribeReservationRequest : AWSRequest


/**
 Unique reservation ID, e.g. '1234567'
 */
@property (nonatomic, strong) NSString * _Nullable reservationId;

@end

/**
 Placeholder documentation for DescribeReservationResponse
 */
@interface AWSmedialiveDescribeReservationResponse : AWSModel


/**
 Unique reservation ARN, e.g. 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 Number of reserved resources
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 Lease duration, e.g. '12'
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 Units for duration, e.g. 'MONTHS'
 */
@property (nonatomic, assign) AWSmedialiveOfferingDurationUnits durationUnits;

/**
 Reservation UTC end date and time in ISO-8601 format, e.g. '2019-03-01T00:00:00'
 */
@property (nonatomic, strong) NSString * _Nullable end;

/**
 One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT offering
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 User specified reservation name
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and standard VQ in US West (Oregon)'
 */
@property (nonatomic, strong) NSString * _Nullable offeringDescription;

/**
 Unique offering ID, e.g. '87654321'
 */
@property (nonatomic, strong) NSString * _Nullable offeringId;

/**
 Offering type, e.g. 'NO_UPFRONT'
 */
@property (nonatomic, assign) AWSmedialiveOfferingType offeringType;

/**
 AWS region, e.g. 'us-west-2'
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 Unique reservation ID, e.g. '1234567'
 */
@property (nonatomic, strong) NSString * _Nullable reservationId;

/**
 Resource configuration details
 */
@property (nonatomic, strong) AWSmedialiveReservationResourceSpecification * _Nullable resourceSpecification;

/**
 Reservation UTC start date and time in ISO-8601 format, e.g. '2018-03-01T00:00:00'
 */
@property (nonatomic, strong) NSString * _Nullable start;

/**
 Current state of reservation, e.g. 'ACTIVE'
 */
@property (nonatomic, assign) AWSmedialiveReservationState state;

/**
 A collection of key-value pairs
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Recurring usage charge for each reserved resource, e.g. '157.0'
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 Placeholder documentation for DescribeScheduleRequest
 Required parameters: [ChannelId]
 */
@interface AWSmedialiveDescribeScheduleRequest : AWSRequest


/**
 Id of the channel whose schedule is being updated.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 Placeholder documentation for MaxResults
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for DescribeScheduleResponse
 */
@interface AWSmedialiveDescribeScheduleResponse : AWSModel


/**
 The next token; for use in pagination.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 The list of actions in the schedule.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveScheduleAction *> * _Nullable scheduleActions;

@end

/**
 DVB Network Information Table (NIT)
 Required parameters: [NetworkName, NetworkId]
 */
@interface AWSmedialiveDvbNitSettings : AWSModel


/**
 The numeric value placed in the Network Information Table (NIT).
 */
@property (nonatomic, strong) NSNumber * _Nullable networkId;

/**
 The network name text placed in the networkNameDescriptor inside the Network Information Table. Maximum length is 256 characters.
 */
@property (nonatomic, strong) NSString * _Nullable networkName;

/**
 The number of milliseconds between instances of this table in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable repInterval;

@end

/**
 DVB Service Description Table (SDT)
 */
@interface AWSmedialiveDvbSdtSettings : AWSModel


/**
 Selects method of inserting SDT information into output stream. The sdtFollow setting copies SDT information from input stream to output stream. The sdtFollowIfPresent setting copies SDT information from input stream to output stream if SDT information is present in the input, otherwise it will fall back on the user-defined values. The sdtManual setting means user will enter the SDT information. The sdtNone setting means output stream will not contain SDT information.
 */
@property (nonatomic, assign) AWSmedialiveDvbSdtOutputSdt outputSdt;

/**
 The number of milliseconds between instances of this table in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable repInterval;

/**
 The service name placed in the serviceDescriptor in the Service Description Table. Maximum length is 256 characters.
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

/**
 The service provider name placed in the serviceDescriptor in the Service Description Table. Maximum length is 256 characters.
 */
@property (nonatomic, strong) NSString * _Nullable serviceProviderName;

@end

/**
 Dvb Sub Destination Settings
 */
@interface AWSmedialiveDvbSubDestinationSettings : AWSModel


/**
 If no explicit xPosition or yPosition is provided, setting alignment to centered will place the captions at the bottom center of the output. Similarly, setting a left alignment will align captions to the bottom left of the output. If x and y positions are given in conjunction with the alignment parameter, the font will be justified (either left or centered) relative to those coordinates. Selecting "smart" justification will left-justify live subtitles and center-justify pre-recorded subtitles.This option is not valid for source captions that are STL or 608/embedded.These source settings are already pre-defined by the caption stream.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmedialiveDvbSubDestinationAlignment alignment;

/**
 Specifies the color of the rectangle behind the captions.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmedialiveDvbSubDestinationBackgroundColor backgroundColor;

/**
 Specifies the opacity of the background rectangle. 255 is opaque; 0 is transparent. Leaving this parameter blank is equivalent to setting it to 0 (transparent).All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable backgroundOpacity;

/**
 External font file used for caption burn-in. File extension must be 'ttf' or 'tte'.Although the user can select output fonts for many different types of input captions, embedded, STL and teletext sources use a strict grid system. Using external fonts with these caption sources could cause unexpected display of proportional fonts.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) AWSmedialiveInputLocation * _Nullable font;

/**
 Specifies the color of the burned-in captions.This option is not valid for source captions that are STL, 608/embedded or teletext.These source settings are already pre-defined by the caption stream.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmedialiveDvbSubDestinationFontColor fontColor;

/**
 Specifies the opacity of the burned-in captions. 255 is opaque; 0 is transparent.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontOpacity;

/**
 Font resolution in DPI (dots per inch); default is 96 dpi.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontResolution;

/**
 When set to auto fontSize will scale depending on the size of the output.Giving a positive integer will specify the exact font size in points.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSString * _Nullable fontSize;

/**
 Specifies font outline color. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmedialiveDvbSubDestinationOutlineColor outlineColor;

/**
 Specifies font outline size in pixels. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable outlineSize;

/**
 Specifies the color of the shadow cast by the captions.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmedialiveDvbSubDestinationShadowColor shadowColor;

/**
 Specifies the opacity of the shadow. 255 is opaque; 0 is transparent. Leaving this parameter blank is equivalent to setting it to 0 (transparent).All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable shadowOpacity;

/**
 Specifies the horizontal offset of the shadow relative to the captions in pixels. A value of -2 would result in a shadow offset 2 pixels to the left.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable shadowXOffset;

/**
 Specifies the vertical offset of the shadow relative to the captions in pixels. A value of -2 would result in a shadow offset 2 pixels above the text.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable shadowYOffset;

/**
 Controls whether a fixed grid size will be used to generate the output subtitles bitmap. Only applicable for Teletext inputs and DVB-Sub/Burn-in outputs.
 */
@property (nonatomic, assign) AWSmedialiveDvbSubDestinationTeletextGridControl teletextGridControl;

/**
 Specifies the horizontal position of the caption relative to the left side of the output in pixels. A value of 10 would result in the captions starting 10 pixels from the left of the output. If no explicit xPosition is provided, the horizontal caption position will be determined by the alignment parameter.This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable XPosition;

/**
 Specifies the vertical position of the caption relative to the top of the output in pixels. A value of 10 would result in the captions starting 10 pixels from the top of the output. If no explicit yPosition is provided, the caption will be positioned towards the bottom of the output.This option is not valid for source captions that are STL, 608/embedded or teletext.These source settings are already pre-defined by the caption stream.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable YPosition;

@end

/**
 Dvb Sub Source Settings
 */
@interface AWSmedialiveDvbSubSourceSettings : AWSModel


/**
 When using DVB-Sub with Burn-In or SMPTE-TT, use this PID for the source content. Unused for DVB-Sub passthrough. All DVB-Sub content is passed through, regardless of selectors.
 */
@property (nonatomic, strong) NSNumber * _Nullable pid;

@end

/**
 DVB Time and Date Table (SDT)
 */
@interface AWSmedialiveDvbTdtSettings : AWSModel


/**
 The number of milliseconds between instances of this table in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable repInterval;

@end

/**
 Eac3 Settings
 */
@interface AWSmedialiveEac3Settings : AWSModel


/**
 When set to attenuate3Db, applies a 3 dB attenuation to the surround channels. Only used for 3/2 coding mode.
 */
@property (nonatomic, assign) AWSmedialiveEac3AttenuationControl attenuationControl;

/**
 Average bitrate in bits/second. Valid bitrates depend on the coding mode.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specifies the bitstream mode (bsmod) for the emitted E-AC-3 stream. See ATSC A/52-2012 (Annex E) for background on these values.
 */
@property (nonatomic, assign) AWSmedialiveEac3BitstreamMode bitstreamMode;

/**
 Dolby Digital Plus coding mode. Determines number of channels.
 */
@property (nonatomic, assign) AWSmedialiveEac3CodingMode codingMode;

/**
 When set to enabled, activates a DC highpass filter for all input channels.
 */
@property (nonatomic, assign) AWSmedialiveEac3DcFilter dcFilter;

/**
 Sets the dialnorm for the output. If blank and input audio is Dolby Digital Plus, dialnorm will be passed through.
 */
@property (nonatomic, strong) NSNumber * _Nullable dialnorm;

/**
 Sets the Dolby dynamic range compression profile.
 */
@property (nonatomic, assign) AWSmedialiveEac3DrcLine drcLine;

/**
 Sets the profile for heavy Dolby dynamic range compression, ensures that the instantaneous signal peaks do not exceed specified levels.
 */
@property (nonatomic, assign) AWSmedialiveEac3DrcRf drcRf;

/**
 When encoding 3/2 audio, setting to lfe enables the LFE channel
 */
@property (nonatomic, assign) AWSmedialiveEac3LfeControl lfeControl;

/**
 When set to enabled, applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid with codingMode32 coding mode.
 */
@property (nonatomic, assign) AWSmedialiveEac3LfeFilter lfeFilter;

/**
 Left only/Right only center mix level. Only used for 3/2 coding mode.
 */
@property (nonatomic, strong) NSNumber * _Nullable loRoCenterMixLevel;

/**
 Left only/Right only surround mix level. Only used for 3/2 coding mode.
 */
@property (nonatomic, strong) NSNumber * _Nullable loRoSurroundMixLevel;

/**
 Left total/Right total center mix level. Only used for 3/2 coding mode.
 */
@property (nonatomic, strong) NSNumber * _Nullable ltRtCenterMixLevel;

/**
 Left total/Right total surround mix level. Only used for 3/2 coding mode.
 */
@property (nonatomic, strong) NSNumber * _Nullable ltRtSurroundMixLevel;

/**
 When set to followInput, encoder metadata will be sourced from the DD, DD+, or DolbyE decoder that supplied this audio data. If audio was not supplied from one of these streams, then the static metadata settings will be used.
 */
@property (nonatomic, assign) AWSmedialiveEac3MetadataControl metadataControl;

/**
 When set to whenPossible, input DD+ audio will be passed through if it is present on the input. This detection is dynamic over the life of the transcode. Inputs that alternate between DD+ and non-DD+ content will have a consistent DD+ output as the system alternates between passthrough and encoding.
 */
@property (nonatomic, assign) AWSmedialiveEac3PassthroughControl passthroughControl;

/**
 When set to shift90Degrees, applies a 90-degree phase shift to the surround channels. Only used for 3/2 coding mode.
 */
@property (nonatomic, assign) AWSmedialiveEac3PhaseControl phaseControl;

/**
 Stereo downmix preference. Only used for 3/2 coding mode.
 */
@property (nonatomic, assign) AWSmedialiveEac3StereoDownmix stereoDownmix;

/**
 When encoding 3/2 audio, sets whether an extra center back surround channel is matrix encoded into the left and right surround channels.
 */
@property (nonatomic, assign) AWSmedialiveEac3SurroundExMode surroundExMode;

/**
 When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded into the two channels.
 */
@property (nonatomic, assign) AWSmedialiveEac3SurroundMode surroundMode;

@end

/**
 Embedded Destination Settings
 */
@interface AWSmedialiveEmbeddedDestinationSettings : AWSModel


@end

/**
 Embedded Plus Scte20 Destination Settings
 */
@interface AWSmedialiveEmbeddedPlusScte20DestinationSettings : AWSModel


@end

/**
 Embedded Source Settings
 */
@interface AWSmedialiveEmbeddedSourceSettings : AWSModel


/**
 If upconvert, 608 data is both passed through via the "608 compatibility bytes" fields of the 708 wrapper as well as translated into 708. 708 data present in the source content will be discarded.
 */
@property (nonatomic, assign) AWSmedialiveEmbeddedConvert608To708 convert608To708;

/**
 Set to "auto" to handle streams with intermittent and/or non-aligned SCTE-20 and Embedded captions.
 */
@property (nonatomic, assign) AWSmedialiveEmbeddedScte20Detection scte20Detection;

/**
 Specifies the 608/708 channel number within the video track from which to extract captions. Unused for passthrough.
 */
@property (nonatomic, strong) NSNumber * _Nullable source608ChannelNumber;

/**
 This field is unused and deprecated.
 */
@property (nonatomic, strong) NSNumber * _Nullable source608TrackNumber;

@end

/**
 Placeholder documentation for Empty
 */
@interface AWSmedialiveEmpty : AWSModel


@end

/**
 Encoder Settings
 Required parameters: [VideoDescriptions, AudioDescriptions, OutputGroups, TimecodeConfig]
 */
@interface AWSmedialiveEncoderSettings : AWSModel


/**
 Placeholder documentation for __listOfAudioDescription
 */
@property (nonatomic, strong) NSArray<AWSmedialiveAudioDescription *> * _Nullable audioDescriptions;

/**
 Settings for ad avail blanking.
 */
@property (nonatomic, strong) AWSmedialiveAvailBlanking * _Nullable availBlanking;

/**
 Event-wide configuration settings for ad avail insertion.
 */
@property (nonatomic, strong) AWSmedialiveAvailConfiguration * _Nullable availConfiguration;

/**
 Settings for blackout slate.
 */
@property (nonatomic, strong) AWSmedialiveBlackoutSlate * _Nullable blackoutSlate;

/**
 Settings for caption decriptions
 */
@property (nonatomic, strong) NSArray<AWSmedialiveCaptionDescription *> * _Nullable captionDescriptions;

/**
 Configuration settings that apply to the event as a whole.
 */
@property (nonatomic, strong) AWSmedialiveGlobalConfiguration * _Nullable globalConfiguration;

/**
 Nielsen configuration settings.
 */
@property (nonatomic, strong) AWSmedialiveNielsenConfiguration * _Nullable nielsenConfiguration;

/**
 Placeholder documentation for __listOfOutputGroup
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputGroup *> * _Nullable outputGroups;

/**
 Contains settings used to acquire and adjust timecode information from inputs.
 */
@property (nonatomic, strong) AWSmedialiveTimecodeConfig * _Nullable timecodeConfig;

/**
 Placeholder documentation for __listOfVideoDescription
 */
@property (nonatomic, strong) NSArray<AWSmedialiveVideoDescription *> * _Nullable videoDescriptions;

@end

/**
 Fec Output Settings
 */
@interface AWSmedialiveFecOutputSettings : AWSModel


/**
 Parameter D from SMPTE 2022-1. The height of the FEC protection matrix.The number of transport stream packets per column error correction packet. Must be between 4 and 20, inclusive.
 */
@property (nonatomic, strong) NSNumber * _Nullable columnDepth;

/**
 Enables column only or column and row based FEC
 */
@property (nonatomic, assign) AWSmedialiveFecOutputIncludeFec includeFec;

/**
 Parameter L from SMPTE 2022-1. The width of the FEC protection matrix.Must be between 1 and 20, inclusive. If only Column FEC is used, then larger values increase robustness.If Row FEC is used, then this is the number of transport stream packets per row error correction packet, and the value must be between 4 and 20, inclusive, if includeFec is columnAndRow. If includeFec is column, this value must be 1 to 20, inclusive.
 */
@property (nonatomic, strong) NSNumber * _Nullable rowLength;

@end

/**
 Start time for the action.
 Required parameters: [Time]
 */
@interface AWSmedialiveFixedModeScheduleActionStartSettings : AWSModel


/**
 Start time for the action to start in the channel. (Not the time for the action to be added to the schedule: actions are always added to the schedule immediately.) UTC format: yyyy-mm-ddThh:mm:ss.nnnZ. All the letters are digits (for example, mm might be 01) except for the two constants "T" for time and "Z" for "UTC format".
 */
@property (nonatomic, strong) NSString * _Nullable time;

@end

/**
 Fmp4 Hls Settings
 */
@interface AWSmedialiveFmp4HlsSettings : AWSModel


/**
 List all the audio groups that are used with the video output stream. Input all the audio GROUP-IDs that are associated to the video, separate by ','.
 */
@property (nonatomic, strong) NSString * _Nullable audioRenditionSets;

/**
 If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input audio and an equivalent ID3 tag will be inserted in the output.
 */
@property (nonatomic, assign) AWSmedialiveFmp4NielsenId3Behavior nielsenId3Behavior;

/**
 When set to passthrough, timed metadata is passed through from input to output.
 */
@property (nonatomic, assign) AWSmedialiveFmp4TimedMetadataBehavior timedMetadataBehavior;

@end

/**
 Settings to specify if an action follows another.
 Required parameters: [ReferenceActionName, FollowPoint]
 */
@interface AWSmedialiveFollowModeScheduleActionStartSettings : AWSModel


/**
 Identifies whether this action starts relative to the start or relative to the end of the reference action.
 */
@property (nonatomic, assign) AWSmedialiveFollowPoint followPoint;

/**
 The action name of another action that this one refers to.
 */
@property (nonatomic, strong) NSString * _Nullable referenceActionName;

@end

/**
 Frame Capture Group Settings
 Required parameters: [Destination]
 */
@interface AWSmedialiveFrameCaptureGroupSettings : AWSModel


/**
 The destination for the frame capture files. Either the URI for an Amazon S3 bucket and object, plus a file name prefix (for example, s3ssl://sportsDelivery/highlights/20180820/curling_) or the URI for a MediaStore container, plus a file name prefix (for example, mediastoressl://sportsDelivery/20180820/curling_). The final file names consist of the prefix from the destination field (for example, "curling_") + name modifier + the counter (5 digits, starting from 00001) + extension (which is always .jpg).For example, curlingLow.00001.jpg
 */
@property (nonatomic, strong) AWSmedialiveOutputLocationRef * _Nullable destination;

@end

/**
 Frame Capture Output Settings
 */
@interface AWSmedialiveFrameCaptureOutputSettings : AWSModel


/**
 Required if the output group contains more than one output. This modifier forms part of the output file name.
 */
@property (nonatomic, strong) NSString * _Nullable nameModifier;

@end

/**
 Frame Capture Settings
 Required parameters: [CaptureInterval]
 */
@interface AWSmedialiveFrameCaptureSettings : AWSModel


/**
 The frequency at which to capture frames for inclusion in the output. May be specified in either seconds or milliseconds, as specified by captureIntervalUnits.
 */
@property (nonatomic, strong) NSNumber * _Nullable captureInterval;

/**
 Unit for the frame capture interval.
 */
@property (nonatomic, assign) AWSmedialiveFrameCaptureIntervalUnit captureIntervalUnits;

@end

/**
 Global Configuration
 */
@interface AWSmedialiveGlobalConfiguration : AWSModel


/**
 Value to set the initial audio gain for the Live Event.
 */
@property (nonatomic, strong) NSNumber * _Nullable initialAudioGain;

/**
 Indicates the action to take when the current input completes (e.g. end-of-file). When switchAndLoopInputs is configured the encoder will restart at the beginning of the first input.When "none" is configured the encoder will transcode either black, a solid color, or a user specified slate images per the "Input Loss Behavior" configuration until the next input switch occurs (which is controlled through the Channel Schedule API).
 */
@property (nonatomic, assign) AWSmedialiveGlobalConfigurationInputEndAction inputEndAction;

/**
 Settings for system actions when input is lost.
 */
@property (nonatomic, strong) AWSmedialiveInputLossBehavior * _Nullable inputLossBehavior;

/**
 Indicates how MediaLive pipelines are synchronized.PIPELINELOCKING - MediaLive will attempt to synchronize the output of each pipeline to the other. EPOCHLOCKING - MediaLive will attempt to synchronize the output of each pipeline to the Unix epoch.
 */
@property (nonatomic, assign) AWSmedialiveGlobalConfigurationOutputLockingMode outputLockingMode;

/**
 Indicates whether the rate of frames emitted by the Live encoder should be paced by its system clock (which optionally may be locked to another source via NTP) or should be locked to the clock of the source that is providing the input stream.
 */
@property (nonatomic, assign) AWSmedialiveGlobalConfigurationOutputTimingSource outputTimingSource;

/**
 Adjusts video input buffer for streams with very low video framerates. This is commonly set to enabled for music channels with less than one video frame per second.
 */
@property (nonatomic, assign) AWSmedialiveGlobalConfigurationLowFramerateInputs supportLowFramerateInputs;

@end

/**
 H264 Color Space Settings
 */
@interface AWSmedialiveH264ColorSpaceSettings : AWSModel


/**
 Passthrough applies no color space conversion to the output
 */
@property (nonatomic, strong) AWSmedialiveColorSpacePassthroughSettings * _Nullable colorSpacePassthroughSettings;

/**
 Rec601 Settings
 */
@property (nonatomic, strong) AWSmedialiveRec601Settings * _Nullable rec601Settings;

/**
 Rec709 Settings
 */
@property (nonatomic, strong) AWSmedialiveRec709Settings * _Nullable rec709Settings;

@end

/**
 H264 Filter Settings
 */
@interface AWSmedialiveH264FilterSettings : AWSModel


/**
 Temporal Filter Settings
 */
@property (nonatomic, strong) AWSmedialiveTemporalFilterSettings * _Nullable temporalFilterSettings;

@end

/**
 H264 Settings
 */
@interface AWSmedialiveH264Settings : AWSModel


/**
 Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.
 */
@property (nonatomic, assign) AWSmedialiveH264AdaptiveQuantization adaptiveQuantization;

/**
 Indicates that AFD values will be written into the output stream.If afdSignaling is "auto", the system will try to preserve the input AFD value (in cases where multiple AFD values are valid). If set to "fixed", the AFD value will be the value configured in the fixedAfd parameter.
 */
@property (nonatomic, assign) AWSmedialiveAfdSignaling afdSignaling;

/**
 Average bitrate in bits/second. Required when the rate control mode is VBR or CBR. Not used for QVBR. In an MS Smooth output group, each output must have a unique value when its bitrate is rounded down to the nearest multiple of 1000.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Percentage of the buffer that should initially be filled (HRD buffer model).
 */
@property (nonatomic, strong) NSNumber * _Nullable bufFillPct;

/**
 Size of buffer (HRD buffer model) in bits.
 */
@property (nonatomic, strong) NSNumber * _Nullable bufSize;

/**
 Includes colorspace metadata in the output.
 */
@property (nonatomic, assign) AWSmedialiveH264ColorMetadata colorMetadata;

/**
 Color Space settings
 */
@property (nonatomic, strong) AWSmedialiveH264ColorSpaceSettings * _Nullable colorSpaceSettings;

/**
 Entropy encoding mode.Use cabac (must be in Main or High profile) or cavlc.
 */
@property (nonatomic, assign) AWSmedialiveH264EntropyEncoding entropyEncoding;

/**
 Settings associated with the specified filter.
 */
@property (nonatomic, strong) AWSmedialiveH264FilterSettings * _Nullable filterSettings;

/**
 Four bit AFD value to write on all frames of video in the output stream. Only valid when afdSignaling is set to 'Fixed'.
 */
@property (nonatomic, assign) AWSmedialiveFixedAfd fixedAfd;

/**
 If set to enabled, adjust quantization within each frame to reduce flicker or 'pop' on I-frames.
 */
@property (nonatomic, assign) AWSmedialiveH264FlickerAq flickerAq;

/**
 This setting applies only when scan type is "interlaced." It controls whether coding is performed on a field basis or on a frame basis. (When the video is progressive, the coding is always performed on a frame basis.) enabled: Force MediaLive to code on a field basis, so that odd and even sets of fields are coded separately. disabled: Code the two sets of fields separately (on a field basis) or together (on a frame basis using PAFF), depending on what is most appropriate for the content.
 */
@property (nonatomic, assign) AWSmedialiveH264ForceFieldPictures forceFieldPictures;

/**
 This field indicates how the output video frame rate is specified.If "specified" is selected then the output video frame rate is determined by framerateNumerator and framerateDenominator, else if "initializeFromSource" is selected then the output video frame rate will be set equal to the input video frame rate of the first input.
 */
@property (nonatomic, assign) AWSmedialiveH264FramerateControl framerateControl;

/**
 Framerate denominator.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 Framerate numerator - framerate is a fraction, e.g. 24000 / 1001 = 23.976 fps.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

/**
 Documentation update needed
 */
@property (nonatomic, assign) AWSmedialiveH264GopBReference gopBReference;

/**
 Frequency of closed GOPs. In streaming applications, it is recommended that this be set to 1 so a decoder joining mid-stream will receive an IDR frame as quickly as possible. Setting this value to 0 will break output segmenting.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopClosedCadence;

/**
 Number of B-frames between reference frames.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopNumBFrames;

/**
 GOP size (keyframe interval) in units of either frames or seconds per gopSizeUnits. If gopSizeUnits is frames, gopSize must be an integer and must be greater than or equal to 1. If gopSizeUnits is seconds, gopSize must be greater than 0, but need not be an integer.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopSize;

/**
 Indicates if the gopSize is specified in frames or seconds. If seconds the system will convert the gopSize into a frame count at run time.
 */
@property (nonatomic, assign) AWSmedialiveH264GopSizeUnits gopSizeUnits;

/**
 H.264 Level.
 */
@property (nonatomic, assign) AWSmedialiveH264Level level;

/**
 Amount of lookahead. A value of low can decrease latency and memory usage, while high can produce better quality for certain content.
 */
@property (nonatomic, assign) AWSmedialiveH264LookAheadRateControl lookAheadRateControl;

/**
 For QVBR: See the tooltip for Quality levelFor VBR: Set the maximum bitrate in order to accommodate expected spikes in the complexity of the video.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxBitrate;

/**
 Only meaningful if sceneChangeDetect is set to enabled.Defaults to 5 if multiplex rate control is used.Enforces separation between repeated (cadence) I-frames and I-frames inserted by Scene Change Detection. If a scene change I-frame is within I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched to the scene change I-frame. GOP stretch requires enabling lookahead as well as setting I-interval. The normal cadence resumes for the next GOP. Note: Maximum GOP stretch = GOP size + Min-I-interval - 1
 */
@property (nonatomic, strong) NSNumber * _Nullable minIInterval;

/**
 Number of reference frames to use. The encoder may use more than requested if using B-frames and/or interlaced encoding.
 */
@property (nonatomic, strong) NSNumber * _Nullable numRefFrames;

/**
 This field indicates how the output pixel aspect ratio is specified.If "specified" is selected then the output video pixel aspect ratio is determined by parNumerator and parDenominator, else if "initializeFromSource" is selected then the output pixsel aspect ratio will be set equal to the input video pixel aspect ratio of the first input.
 */
@property (nonatomic, assign) AWSmedialiveH264ParControl parControl;

/**
 Pixel Aspect Ratio denominator.
 */
@property (nonatomic, strong) NSNumber * _Nullable parDenominator;

/**
 Pixel Aspect Ratio numerator.
 */
@property (nonatomic, strong) NSNumber * _Nullable parNumerator;

/**
 H.264 Profile.
 */
@property (nonatomic, assign) AWSmedialiveH264Profile profile;

/**
 If set to "ENHANCEDQUALITY," improves visual quality at an increased output cost. If this video is being delivered to a MediaLive Multiplex, "ENHANCEDQUALITY" is always used.
 */
@property (nonatomic, assign) AWSmedialiveH264QualityLevel qualityLevel;

/**
 Controls the target quality for the video encode. Applies only when the rate control mode is QVBR. Set values for the QVBR quality level field and Max bitrate field that suit your most important viewing devices. Recommended values are: - Primary screen: Quality level: 8 to 10. Max bitrate: 4M - PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M - Smartphone: Quality level: 6. Max bitrate: 1M to 1.5M
 */
@property (nonatomic, strong) NSNumber * _Nullable qvbrQualityLevel;

/**
 Rate control mode.QVBR: Quality will match the specified quality level except when it is constrained by the maximum bitrate.Recommended if you or your viewers pay for bandwidth.VBR: Quality and bitrate vary, depending on the video complexity. Recommended instead of QVBR if you want to maintain a specific average bitrate over the duration of the channel.CBR: Quality varies, depending on the video complexity. Recommended only if you distribute your assets to devices that cannot handle variable bitrates.Multiplex: This rate control mode is only supported (and is required) when the video is being delivered to a MediaLive Multiplex in which case the rate control configuration is controlled by the properties within the Multiplex Program.
 */
@property (nonatomic, assign) AWSmedialiveH264RateControlMode rateControlMode;

/**
 Sets the scan type of the output to progressive or top-field-first interlaced.
 */
@property (nonatomic, assign) AWSmedialiveH264ScanType scanType;

/**
 Scene change detection.- On: inserts I-frames when scene change is detected. - Off: does not force an I-frame when scene change is detected.
 */
@property (nonatomic, assign) AWSmedialiveH264SceneChangeDetect sceneChangeDetect;

/**
 Number of slices per picture. Must be less than or equal to the number of macroblock rows for progressive pictures, and less than or equal to half the number of macroblock rows for interlaced pictures. This field is optional; when no value is specified the encoder will choose the number of slices based on encode resolution.
 */
@property (nonatomic, strong) NSNumber * _Nullable slices;

/**
 Softness. Selects quantizer matrix, larger values reduce high-frequency content in the encoded image.
 */
@property (nonatomic, strong) NSNumber * _Nullable softness;

/**
 If set to enabled, adjust quantization within each frame based on spatial variation of content complexity.
 */
@property (nonatomic, assign) AWSmedialiveH264SpatialAq spatialAq;

/**
 If set to fixed, use gopNumBFrames B-frames per sub-GOP. If set to dynamic, optimize the number of B-frames used for each sub-GOP to improve visual quality.
 */
@property (nonatomic, assign) AWSmedialiveH264SubGopLength subgopLength;

/**
 Produces a bitstream compliant with SMPTE RP-2027.
 */
@property (nonatomic, assign) AWSmedialiveH264Syntax syntax;

/**
 If set to enabled, adjust quantization within each frame based on temporal variation of content complexity.
 */
@property (nonatomic, assign) AWSmedialiveH264TemporalAq temporalAq;

/**
 Determines how timecodes should be inserted into the video elementary stream. - 'disabled': Do not include timecodes - 'picTimingSei': Pass through picture timing SEI messages from the source specified in Timecode Config
 */
@property (nonatomic, assign) AWSmedialiveH264TimecodeInsertionBehavior timecodeInsertion;

@end

/**
 H265 Color Space Settings
 */
@interface AWSmedialiveH265ColorSpaceSettings : AWSModel


/**
 Passthrough applies no color space conversion to the output
 */
@property (nonatomic, strong) AWSmedialiveColorSpacePassthroughSettings * _Nullable colorSpacePassthroughSettings;

/**
 Hdr10 Settings
 */
@property (nonatomic, strong) AWSmedialiveHdr10Settings * _Nullable hdr10Settings;

/**
 Rec601 Settings
 */
@property (nonatomic, strong) AWSmedialiveRec601Settings * _Nullable rec601Settings;

/**
 Rec709 Settings
 */
@property (nonatomic, strong) AWSmedialiveRec709Settings * _Nullable rec709Settings;

@end

/**
 H265 Settings
 Required parameters: [FramerateNumerator, FramerateDenominator]
 */
@interface AWSmedialiveH265Settings : AWSModel


/**
 Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.
 */
@property (nonatomic, assign) AWSmedialiveH265AdaptiveQuantization adaptiveQuantization;

/**
 Indicates that AFD values will be written into the output stream.If afdSignaling is "auto", the system will try to preserve the input AFD value (in cases where multiple AFD values are valid). If set to "fixed", the AFD value will be the value configured in the fixedAfd parameter.
 */
@property (nonatomic, assign) AWSmedialiveAfdSignaling afdSignaling;

/**
 Whether or not EML should insert an Alternative Transfer Function SEI message to support backwards compatibility with non-HDR decoders and displays.
 */
@property (nonatomic, assign) AWSmedialiveH265AlternativeTransferFunction alternativeTransferFunction;

/**
 Average bitrate in bits/second. Required when the rate control mode is VBR or CBR. Not used for QVBR. In an MS Smooth output group, each output must have a unique value when its bitrate is rounded down to the nearest multiple of 1000.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Size of buffer (HRD buffer model) in bits.
 */
@property (nonatomic, strong) NSNumber * _Nullable bufSize;

/**
 Includes colorspace metadata in the output.
 */
@property (nonatomic, assign) AWSmedialiveH265ColorMetadata colorMetadata;

/**
 Color Space settings
 */
@property (nonatomic, strong) AWSmedialiveH265ColorSpaceSettings * _Nullable colorSpaceSettings;

/**
 Four bit AFD value to write on all frames of video in the output stream. Only valid when afdSignaling is set to 'Fixed'.
 */
@property (nonatomic, assign) AWSmedialiveFixedAfd fixedAfd;

/**
 If set to enabled, adjust quantization within each frame to reduce flicker or 'pop' on I-frames.
 */
@property (nonatomic, assign) AWSmedialiveH265FlickerAq flickerAq;

/**
 Framerate denominator.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 Framerate numerator - framerate is a fraction, e.g. 24000 / 1001 = 23.976 fps.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

/**
 Frequency of closed GOPs. In streaming applications, it is recommended that this be set to 1 so a decoder joining mid-stream will receive an IDR frame as quickly as possible. Setting this value to 0 will break output segmenting.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopClosedCadence;

/**
 GOP size (keyframe interval) in units of either frames or seconds per gopSizeUnits. If gopSizeUnits is frames, gopSize must be an integer and must be greater than or equal to 1. If gopSizeUnits is seconds, gopSize must be greater than 0, but need not be an integer.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopSize;

/**
 Indicates if the gopSize is specified in frames or seconds. If seconds the system will convert the gopSize into a frame count at run time.
 */
@property (nonatomic, assign) AWSmedialiveH265GopSizeUnits gopSizeUnits;

/**
 H.265 Level.
 */
@property (nonatomic, assign) AWSmedialiveH265Level level;

/**
 Amount of lookahead. A value of low can decrease latency and memory usage, while high can produce better quality for certain content.
 */
@property (nonatomic, assign) AWSmedialiveH265LookAheadRateControl lookAheadRateControl;

/**
 For QVBR: See the tooltip for Quality level
 */
@property (nonatomic, strong) NSNumber * _Nullable maxBitrate;

/**
 Only meaningful if sceneChangeDetect is set to enabled.Defaults to 5 if multiplex rate control is used.Enforces separation between repeated (cadence) I-frames and I-frames inserted by Scene Change Detection. If a scene change I-frame is within I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched to the scene change I-frame. GOP stretch requires enabling lookahead as well as setting I-interval. The normal cadence resumes for the next GOP. Note: Maximum GOP stretch = GOP size + Min-I-interval - 1
 */
@property (nonatomic, strong) NSNumber * _Nullable minIInterval;

/**
 Pixel Aspect Ratio denominator.
 */
@property (nonatomic, strong) NSNumber * _Nullable parDenominator;

/**
 Pixel Aspect Ratio numerator.
 */
@property (nonatomic, strong) NSNumber * _Nullable parNumerator;

/**
 H.265 Profile.
 */
@property (nonatomic, assign) AWSmedialiveH265Profile profile;

/**
 Controls the target quality for the video encode. Applies only when the rate control mode is QVBR. Set values for the QVBR quality level field and Max bitrate field that suit your most important viewing devices. Recommended values are: - Primary screen: Quality level: 8 to 10. Max bitrate: 4M - PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M - Smartphone: Quality level: 6. Max bitrate: 1M to 1.5M
 */
@property (nonatomic, strong) NSNumber * _Nullable qvbrQualityLevel;

/**
 Rate control mode.QVBR: Quality will match the specified quality level except when it is constrained by the maximum bitrate.Recommended if you or your viewers pay for bandwidth.CBR: Quality varies, depending on the video complexity. Recommended only if you distribute your assets to devices that cannot handle variable bitrates.
 */
@property (nonatomic, assign) AWSmedialiveH265RateControlMode rateControlMode;

/**
 Sets the scan type of the output to progressive or top-field-first interlaced.
 */
@property (nonatomic, assign) AWSmedialiveH265ScanType scanType;

/**
 Scene change detection.
 */
@property (nonatomic, assign) AWSmedialiveH265SceneChangeDetect sceneChangeDetect;

/**
 Number of slices per picture. Must be less than or equal to the number of macroblock rows for progressive pictures, and less than or equal to half the number of macroblock rows for interlaced pictures. This field is optional; when no value is specified the encoder will choose the number of slices based on encode resolution.
 */
@property (nonatomic, strong) NSNumber * _Nullable slices;

/**
 H.265 Tier.
 */
@property (nonatomic, assign) AWSmedialiveH265Tier tier;

/**
 Determines how timecodes should be inserted into the video elementary stream. - 'disabled': Do not include timecodes - 'picTimingSei': Pass through picture timing SEI messages from the source specified in Timecode Config
 */
@property (nonatomic, assign) AWSmedialiveH265TimecodeInsertionBehavior timecodeInsertion;

@end

/**
 Hdr10 Settings
 */
@interface AWSmedialiveHdr10Settings : AWSModel


/**
 Maximum Content Light Level An integer metadata value defining the maximum light level, in nits, of any single pixel within an encoded HDR video stream or file.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCll;

/**
 Maximum Frame Average Light Level An integer metadata value defining the maximum average light level, in nits, for any single frame within an encoded HDR video stream or file.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxFall;

@end

/**
 Hls Akamai Settings
 */
@interface AWSmedialiveHlsAkamaiSettings : AWSModel


/**
 Number of seconds to wait before retrying connection to the CDN if the connection is lost.
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionRetryInterval;

/**
 Size in seconds of file cache for streaming outputs.
 */
@property (nonatomic, strong) NSNumber * _Nullable filecacheDuration;

/**
 Specify whether or not to use chunked transfer encoding to Akamai. User should contact Akamai to enable this feature.
 */
@property (nonatomic, assign) AWSmedialiveHlsAkamaiHttpTransferMode httpTransferMode;

/**
 Number of retry attempts that will be made before the Live Event is put into an error state.
 */
@property (nonatomic, strong) NSNumber * _Nullable numRetries;

/**
 If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0 means never restart.
 */
@property (nonatomic, strong) NSNumber * _Nullable restartDelay;

/**
 Salt for authenticated Akamai.
 */
@property (nonatomic, strong) NSString * _Nullable salt;

/**
 Token parameter for authenticated akamai. If not specified, _gda_ is used.
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 Hls Basic Put Settings
 */
@interface AWSmedialiveHlsBasicPutSettings : AWSModel


/**
 Number of seconds to wait before retrying connection to the CDN if the connection is lost.
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionRetryInterval;

/**
 Size in seconds of file cache for streaming outputs.
 */
@property (nonatomic, strong) NSNumber * _Nullable filecacheDuration;

/**
 Number of retry attempts that will be made before the Live Event is put into an error state.
 */
@property (nonatomic, strong) NSNumber * _Nullable numRetries;

/**
 If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0 means never restart.
 */
@property (nonatomic, strong) NSNumber * _Nullable restartDelay;

@end

/**
 Hls Cdn Settings
 */
@interface AWSmedialiveHlsCdnSettings : AWSModel


/**
 Hls Akamai Settings
 */
@property (nonatomic, strong) AWSmedialiveHlsAkamaiSettings * _Nullable hlsAkamaiSettings;

/**
 Hls Basic Put Settings
 */
@property (nonatomic, strong) AWSmedialiveHlsBasicPutSettings * _Nullable hlsBasicPutSettings;

/**
 Hls Media Store Settings
 */
@property (nonatomic, strong) AWSmedialiveHlsMediaStoreSettings * _Nullable hlsMediaStoreSettings;

/**
 Hls Webdav Settings
 */
@property (nonatomic, strong) AWSmedialiveHlsWebdavSettings * _Nullable hlsWebdavSettings;

@end

/**
 Hls Group Settings
 Required parameters: [Destination]
 */
@interface AWSmedialiveHlsGroupSettings : AWSModel


/**
 Choose one or more ad marker types to pass SCTE35 signals through to this group of Apple HLS outputs.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable adMarkers;

/**
 A partial URI prefix that will be prepended to each output in the media .m3u8 file. Can be used if base manifest is delivered from a different URL than the main .m3u8 file.
 */
@property (nonatomic, strong) NSString * _Nullable baseUrlContent;

/**
 Optional. One value per output group.This field is required only if you are completing Base URL content A, and the downstream system has notified you that the media files for pipeline 1 of all outputs are in a location different from the media files for pipeline 0.
 */
@property (nonatomic, strong) NSString * _Nullable baseUrlContent1;

/**
 A partial URI prefix that will be prepended to each output in the media .m3u8 file. Can be used if base manifest is delivered from a different URL than the main .m3u8 file.
 */
@property (nonatomic, strong) NSString * _Nullable baseUrlManifest;

/**
 Optional. One value per output group.Complete this field only if you are completing Base URL manifest A, and the downstream system has notified you that the child manifest files for pipeline 1 of all outputs are in a location different from the child manifest files for pipeline 0.
 */
@property (nonatomic, strong) NSString * _Nullable baseUrlManifest1;

/**
 Mapping of up to 4 caption channels to caption languages.Is only meaningful if captionLanguageSetting is set to "insert".
 */
@property (nonatomic, strong) NSArray<AWSmedialiveCaptionLanguageMapping *> * _Nullable captionLanguageMappings;

/**
 Applies only to 608 Embedded output captions. insert: Include CLOSED-CAPTIONS lines in the manifest. Specify at least one language in the CC1 Language Code field. One CLOSED-CAPTION line is added for each Language Code you specify. Make sure to specify the languages in the order in which they appear in the original source (if the source is embedded format) or the order of the caption selectors (if the source is other than embedded). Otherwise, languages in the manifest will not match up properly with the output captions. none: Include CLOSED-CAPTIONS=NONE line in the manifest. omit: Omit any CLOSED-CAPTIONS line from the manifest.
 */
@property (nonatomic, assign) AWSmedialiveHlsCaptionLanguageSetting captionLanguageSetting;

/**
 When set to "disabled", sets the #EXT-X-ALLOW-CACHE:no tag in the manifest, which prevents clients from saving media segments for later replay.
 */
@property (nonatomic, assign) AWSmedialiveHlsClientCache clientCache;

/**
 Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist generation.
 */
@property (nonatomic, assign) AWSmedialiveHlsCodecSpecification codecSpecification;

/**
 For use with encryptionType. This is a 128-bit, 16-byte hex value represented by a 32-character text string. If ivSource is set to "explicit" then this parameter is required and is used as the IV for encryption.
 */
@property (nonatomic, strong) NSString * _Nullable constantIv;

/**
 A directory or HTTP destination for the HLS segments, manifest files, and encryption keys (if enabled).
 */
@property (nonatomic, strong) AWSmedialiveOutputLocationRef * _Nullable destination;

/**
 Place segments in subdirectories.
 */
@property (nonatomic, assign) AWSmedialiveHlsDirectoryStructure directoryStructure;

/**
 Encrypts the segments with the given encryption scheme.Exclude this parameter if no encryption is desired.
 */
@property (nonatomic, assign) AWSmedialiveHlsEncryptionType encryptionType;

/**
 Parameters that control interactions with the CDN.
 */
@property (nonatomic, strong) AWSmedialiveHlsCdnSettings * _Nullable hlsCdnSettings;

/**
 State of HLS ID3 Segment Tagging
 */
@property (nonatomic, assign) AWSmedialiveHlsId3SegmentTaggingState hlsId3SegmentTagging;

/**
 DISABLED: Do not create an I-frame-only manifest, but do create the master and media manifests (according to the Output Selection field).STANDARD: Create an I-frame-only manifest for each output that contains video, as well as the other manifests (according to the Output Selection field). The I-frame manifest contains a #EXT-X-I-FRAMES-ONLY tag to indicate it is I-frame only, and one or more #EXT-X-BYTERANGE entries identifying the I-frame position. For example, #EXT-X-BYTERANGE:160364@1461888"
 */
@property (nonatomic, assign) AWSmedialiveIFrameOnlyPlaylistType IFrameOnlyPlaylists;

/**
 Applies only if Mode field is LIVE. Specifies the maximum number of segments in the media manifest file. After this maximum, older segments are removed from the media manifest. This number must be less than or equal to the Keep Segments field.
 */
@property (nonatomic, strong) NSNumber * _Nullable indexNSegments;

/**
 Parameter that control output group behavior on input loss.
 */
@property (nonatomic, assign) AWSmedialiveInputLossActionForHlsOut inputLossAction;

/**
 For use with encryptionType. The IV (Initialization Vector) is a 128-bit number used in conjunction with the key for encrypting blocks. If set to "include", IV is listed in the manifest, otherwise the IV is not in the manifest.
 */
@property (nonatomic, assign) AWSmedialiveHlsIvInManifest ivInManifest;

/**
 For use with encryptionType. The IV (Initialization Vector) is a 128-bit number used in conjunction with the key for encrypting blocks. If this setting is "followsSegmentNumber", it will cause the IV to change every segment (to match the segment number). If this is set to "explicit", you must enter a constantIv value.
 */
@property (nonatomic, assign) AWSmedialiveHlsIvSource ivSource;

/**
 Applies only if Mode field is LIVE. Specifies the number of media segments (.ts files) to retain in the destination directory.
 */
@property (nonatomic, strong) NSNumber * _Nullable keepSegments;

/**
 The value specifies how the key is represented in the resource identified by the URI.If parameter is absent, an implicit value of "identity" is used.A reverse DNS string can also be given.
 */
@property (nonatomic, strong) NSString * _Nullable keyFormat;

/**
 Either a single positive integer version value or a slash delimited list of version values (1/2/3).
 */
@property (nonatomic, strong) NSString * _Nullable keyFormatVersions;

/**
 The key provider settings.
 */
@property (nonatomic, strong) AWSmedialiveKeyProviderSettings * _Nullable keyProviderSettings;

/**
 When set to gzip, compresses HLS playlist.
 */
@property (nonatomic, assign) AWSmedialiveHlsManifestCompression manifestCompression;

/**
 Indicates whether the output manifest should use floating point or integer values for segment duration.
 */
@property (nonatomic, assign) AWSmedialiveHlsManifestDurationFormat manifestDurationFormat;

/**
 When set, minimumSegmentLength is enforced by looking ahead and back within the specified range for a nearby avail and extending the segment size if needed.
 */
@property (nonatomic, strong) NSNumber * _Nullable minSegmentLength;

/**
 If "vod", all segments are indexed and kept permanently in the destination and manifest. If "live", only the number segments specified in keepSegments and indexNSegments are kept; newer segments replace older segments, which may prevent players from rewinding all the way to the beginning of the event.VOD mode uses HLS EXT-X-PLAYLIST-TYPE of EVENT while the channel is running, converting it to a "VOD" type manifest on completion of the stream.
 */
@property (nonatomic, assign) AWSmedialiveHlsMode mode;

/**
 MANIFESTSANDSEGMENTS: Generates manifests (master manifest, if applicable, and media manifests) for this output group.VARIANTMANIFESTSANDSEGMENTS: Generates media manifests for this output group, but not a master manifest.SEGMENTSONLY: Does not generate any manifests for this output group.
 */
@property (nonatomic, assign) AWSmedialiveHlsOutputSelection outputSelection;

/**
 Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files. The value is calculated as follows: either the program date and time are initialized using the input timecode source, or the time is initialized using the input timecode source and the date is initialized using the timestampOffset.
 */
@property (nonatomic, assign) AWSmedialiveHlsProgramDateTime programDateTime;

/**
 Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable programDateTimePeriod;

/**
 ENABLED: The master manifest (.m3u8 file) for each pipeline includes information about both pipelines: first its own media files, then the media files of the other pipeline. This feature allows playout device that support stale manifest detection to switch from one manifest to the other, when the current manifest seems to be stale. There are still two destinations and two master manifests, but both master manifests reference the media files from both pipelines.DISABLED: The master manifest (.m3u8 file) for each pipeline includes information about its own pipeline only.For an HLS output group with MediaPackage as the destination, the DISABLED behavior is always followed. MediaPackage regenerates the manifests it serves to players so a redundant manifest from MediaLive is irrelevant.
 */
@property (nonatomic, assign) AWSmedialiveHlsRedundantManifest redundantManifest;

/**
 Length of MPEG-2 Transport Stream segments to create (in seconds). Note that segments will end on the next keyframe after this number of seconds, so actual segment length may be longer.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentLength;

/**
 useInputSegmentation has been deprecated. The configured segment size is always used.
 */
@property (nonatomic, assign) AWSmedialiveHlsSegmentationMode segmentationMode;

/**
 Number of segments to write to a subdirectory before starting a new one. directoryStructure must be subdirectoryPerStream for this setting to have an effect.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentsPerSubdirectory;

/**
 Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of variant manifest.
 */
@property (nonatomic, assign) AWSmedialiveHlsStreamInfResolution streamInfResolution;

/**
 Indicates ID3 frame that has the timecode.
 */
@property (nonatomic, assign) AWSmedialiveHlsTimedMetadataId3Frame timedMetadataId3Frame;

/**
 Timed Metadata interval in seconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable timedMetadataId3Period;

/**
 Provides an extra millisecond delta offset to fine tune the timestamps.
 */
@property (nonatomic, strong) NSNumber * _Nullable timestampDeltaMilliseconds;

/**
 SEGMENTEDFILES: Emit the program as segments - multiple .ts media files.SINGLEFILE: Applies only if Mode field is VOD. Emit the program as a single .ts media file. The media manifest includes #EXT-X-BYTERANGE tags to index segments for playback. A typical use for this value is when sending the output to AWS Elemental MediaConvert, which can accept only a single media file. Playback while the channel is running is not guaranteed due to HTTP server caching.
 */
@property (nonatomic, assign) AWSmedialiveHlsTsFileMode tsFileMode;

@end

/**
 Settings for the action to insert a user-defined ID3 tag in each HLS segment
 Required parameters: [Tag]
 */
@interface AWSmedialiveHlsId3SegmentTaggingScheduleActionSettings : AWSModel


/**
 ID3 tag to insert into each segment. Supports special keyword identifiers to substitute in segment-related values.\nSupported keyword identifiers: https://docs.aws.amazon.com/medialive/latest/ug/variable-data-identifiers.html
 */
@property (nonatomic, strong) NSString * _Nullable tag;

@end

/**
 Hls Input Settings
 */
@interface AWSmedialiveHlsInputSettings : AWSModel


/**
 When specified the HLS stream with the m3u8 BANDWIDTH that most closely matches this value will be chosen, otherwise the highest bandwidth stream in the m3u8 will be chosen.The bitrate is specified in bits per second, as in an HLS manifest.
 */
@property (nonatomic, strong) NSNumber * _Nullable bandwidth;

/**
 When specified, reading of the HLS input will begin this many buffer segments from the end (most recently written segment).When not specified, the HLS input will begin with the first segment specified in the m3u8.
 */
@property (nonatomic, strong) NSNumber * _Nullable bufferSegments;

/**
 The number of consecutive times that attempts to read a manifest or segment must fail before the input is considered unavailable.
 */
@property (nonatomic, strong) NSNumber * _Nullable retries;

/**
 The number of seconds between retries when an attempt to read a manifest or segment fails.
 */
@property (nonatomic, strong) NSNumber * _Nullable retryInterval;

@end

/**
 Hls Media Store Settings
 */
@interface AWSmedialiveHlsMediaStoreSettings : AWSModel


/**
 Number of seconds to wait before retrying connection to the CDN if the connection is lost.
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionRetryInterval;

/**
 Size in seconds of file cache for streaming outputs.
 */
@property (nonatomic, strong) NSNumber * _Nullable filecacheDuration;

/**
 When set to temporal, output files are stored in non-persistent memory for faster reading and writing.
 */
@property (nonatomic, assign) AWSmedialiveHlsMediaStoreStorageClass mediaStoreStorageClass;

/**
 Number of retry attempts that will be made before the Live Event is put into an error state.
 */
@property (nonatomic, strong) NSNumber * _Nullable numRetries;

/**
 If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0 means never restart.
 */
@property (nonatomic, strong) NSNumber * _Nullable restartDelay;

@end

/**
 Hls Output Settings
 Required parameters: [HlsSettings]
 */
@interface AWSmedialiveHlsOutputSettings : AWSModel


/**
 Only applicable when this output is referencing an H.265 video description. Specifies whether MP4 segments should be packaged as HEV1 or HVC1.
 */
@property (nonatomic, assign) AWSmedialiveHlsH265PackagingType h265PackagingType;

/**
 Settings regarding the underlying stream. These settings are different for audio-only outputs.
 */
@property (nonatomic, strong) AWSmedialiveHlsSettings * _Nullable hlsSettings;

/**
 String concatenated to the end of the destination filename. Accepts \"Format Identifiers\":#formatIdentifierParameters.
 */
@property (nonatomic, strong) NSString * _Nullable nameModifier;

/**
 String concatenated to end of segment filenames.
 */
@property (nonatomic, strong) NSString * _Nullable segmentModifier;

@end

/**
 Hls Settings
 */
@interface AWSmedialiveHlsSettings : AWSModel


/**
 Audio Only Hls Settings
 */
@property (nonatomic, strong) AWSmedialiveAudioOnlyHlsSettings * _Nullable audioOnlyHlsSettings;

/**
 Fmp4 Hls Settings
 */
@property (nonatomic, strong) AWSmedialiveFmp4HlsSettings * _Nullable fmp4HlsSettings;

/**
 Standard Hls Settings
 */
@property (nonatomic, strong) AWSmedialiveStandardHlsSettings * _Nullable standardHlsSettings;

@end

/**
 Settings for the action to emit HLS metadata
 Required parameters: [Id3]
 */
@interface AWSmedialiveHlsTimedMetadataScheduleActionSettings : AWSModel


/**
 Base64 string formatted according to the ID3 specification: http://id3.org/id3v2.4.0-structure
 */
@property (nonatomic, strong) NSString * _Nullable id3;

@end

/**
 Hls Webdav Settings
 */
@interface AWSmedialiveHlsWebdavSettings : AWSModel


/**
 Number of seconds to wait before retrying connection to the CDN if the connection is lost.
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionRetryInterval;

/**
 Size in seconds of file cache for streaming outputs.
 */
@property (nonatomic, strong) NSNumber * _Nullable filecacheDuration;

/**
 Specify whether or not to use chunked transfer encoding to WebDAV.
 */
@property (nonatomic, assign) AWSmedialiveHlsWebdavHttpTransferMode httpTransferMode;

/**
 Number of retry attempts that will be made before the Live Event is put into an error state.
 */
@property (nonatomic, strong) NSNumber * _Nullable numRetries;

/**
 If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0 means never restart.
 */
@property (nonatomic, strong) NSNumber * _Nullable restartDelay;

@end

/**
 Settings to configure an action so that it occurs as soon as possible.
 */
@interface AWSmedialiveImmediateModeScheduleActionStartSettings : AWSModel


@end

/**
 Placeholder documentation for Input
 */
@interface AWSmedialiveInput : AWSModel


/**
 The Unique ARN of the input (generated, immutable).
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A list of channel IDs that that input is attached to (currently an input can only be attached to one channel).
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attachedChannels;

/**
 A list of the destinations of the input (PUSH-type).
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputDestination *> * _Nullable destinations;

/**
 The generated ID of the input (unique for user account, immutable).
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 STANDARD - MediaLive expects two sources to be connected to this input. If the channel is also STANDARD, both sources will be ingested. If the channel is SINGLE_PIPELINE, only the first source will be ingested; the second source will always be ignored, even if the first source fails. SINGLE_PIPELINE - You can connect only one source to this input. If the ChannelClass is alsoSINGLE_PIPELINE, this value is valid. If the ChannelClass is STANDARD, this value is not valid because the channel requires two sources in the input. 
 */
@property (nonatomic, assign) AWSmedialiveInputClass inputClass;

/**
 Certain pull input sources can be dynamic, meaning that they can have their URL's dynamically changes during input switch actions. Presently, this functionality only works with MP4_FILE inputs. 
 */
@property (nonatomic, assign) AWSmedialiveInputSourceType inputSourceType;

/**
 A list of MediaConnect Flows for this input.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMediaConnectFlow *> * _Nullable mediaConnectFlows;

/**
 The user-assigned name (This is a mutable value).
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The Amazon Resource Name (ARN) of the role this input assumes during and after creation.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 A list of IDs for all the Input Security Groups attached to the input.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 A list of the sources of the input (PULL-type).
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputSource *> * _Nullable sources;

/**
 Placeholder documentation for InputState
 */
@property (nonatomic, assign) AWSmedialiveInputState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Placeholder documentation for InputType
 */
@property (nonatomic, assign) AWSmedialiveInputType types;

@end

/**
 Placeholder documentation for InputAttachment
 */
@interface AWSmedialiveInputAttachment : AWSModel


/**
 User-specified settings for defining what the conditions are for declaring the input unhealthy and failing over to a different input.
 */
@property (nonatomic, strong) AWSmedialiveAutomaticInputFailoverSettings * _Nullable automaticInputFailoverSettings;

/**
 User-specified name for the attachment. This is required if the user wants to use this input in an input switch action.
 */
@property (nonatomic, strong) NSString * _Nullable inputAttachmentName;

/**
 The ID of the input
 */
@property (nonatomic, strong) NSString * _Nullable inputId;

/**
 Settings of an input (caption selector, etc.)
 */
@property (nonatomic, strong) AWSmedialiveInputSettings * _Nullable inputSettings;

@end

/**
 Input Channel Level
 Required parameters: [InputChannel, Gain]
 */
@interface AWSmedialiveInputChannelLevel : AWSModel


/**
 Remixing value. Units are in dB and acceptable values are within the range from -60 (mute) and 6 dB.
 */
@property (nonatomic, strong) NSNumber * _Nullable gain;

/**
 The index of the input channel used as a source.
 */
@property (nonatomic, strong) NSNumber * _Nullable inputChannel;

@end

/**
 Settings to let you create a clip of the file input, in order to set up the input to ingest only a portion of the file.
 Required parameters: [InputTimecodeSource]
 */
@interface AWSmedialiveInputClippingSettings : AWSModel


/**
 The source of the timecodes in the source being clipped.
 */
@property (nonatomic, assign) AWSmedialiveInputTimecodeSource inputTimecodeSource;

/**
 Settings to identify the start of the clip.
 */
@property (nonatomic, strong) AWSmedialiveStartTimecode * _Nullable startTimecode;

/**
 Settings to identify the end of the clip.
 */
@property (nonatomic, strong) AWSmedialiveStopTimecode * _Nullable stopTimecode;

@end

/**
 The settings for a PUSH type input.
 */
@interface AWSmedialiveInputDestination : AWSModel


/**
 The system-generated static IP address of endpoint. It remains fixed for the lifetime of the input. 
 */
@property (nonatomic, strong) NSString * _Nullable ip;

/**
 The port number for the input.
 */
@property (nonatomic, strong) NSString * _Nullable port;

/**
 This represents the endpoint that the customer stream will be pushed to. 
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 The properties for a VPC type input destination.
 */
@property (nonatomic, strong) AWSmedialiveInputDestinationVpc * _Nullable vpc;

@end

/**
 Endpoint settings for a PUSH type input.
 */
@interface AWSmedialiveInputDestinationRequest : AWSModel


/**
 A unique name for the location the RTMP stream is being pushed to. 
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 The properties for a VPC type input destination.
 */
@interface AWSmedialiveInputDestinationVpc : AWSModel


/**
 The availability zone of the Input destination. 
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 The network interface ID of the Input destination in the VPC. 
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

@end

/**
 Input Location
 Required parameters: [Uri]
 */
@interface AWSmedialiveInputLocation : AWSModel


/**
 key used to extract the password from EC2 Parameter store
 */
@property (nonatomic, strong) NSString * _Nullable passwordParam;

/**
 Uniform Resource Identifier - This should be a path to a file accessible to the Live system (eg. a http:// URI) depending on the output type. For example, a RTMP destination should have a uri simliar to: "rtmp://fmsserver/live".
 */
@property (nonatomic, strong) NSString * _Nullable uri;

/**
 Documentation update needed
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 Input Loss Behavior
 */
@interface AWSmedialiveInputLossBehavior : AWSModel


/**
 Documentation update needed
 */
@property (nonatomic, strong) NSNumber * _Nullable blackFrameMsec;

/**
 When input loss image type is "color" this field specifies the color to use. Value: 6 hex characters representing the values of RGB.
 */
@property (nonatomic, strong) NSString * _Nullable inputLossImageColor;

/**
 When input loss image type is "slate" these fields specify the parameters for accessing the slate.
 */
@property (nonatomic, strong) AWSmedialiveInputLocation * _Nullable inputLossImageSlate;

/**
 Indicates whether to substitute a solid color or a slate into the output after input loss exceeds blackFrameMsec.
 */
@property (nonatomic, assign) AWSmedialiveInputLossImageType inputLossImageType;

/**
 Documentation update needed
 */
@property (nonatomic, strong) NSNumber * _Nullable repeatFrameMsec;

@end

/**
 An Input Security Group
 */
@interface AWSmedialiveInputSecurityGroup : AWSModel


/**
 Unique ARN of Input Security Group
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The Id of the Input Security Group
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The list of inputs currently using this Input Security Group.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inputs;

/**
 The current state of the Input Security Group.
 */
@property (nonatomic, assign) AWSmedialiveInputSecurityGroupState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Whitelist rules and their sync status
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputWhitelistRule *> * _Nullable whitelistRules;

@end

/**
 Request of IPv4 CIDR addresses to whitelist in a security group.
 */
@interface AWSmedialiveInputSecurityGroupWhitelistRequest : AWSModel


/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 List of IPv4 CIDR addresses to whitelist
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputWhitelistRuleCidr *> * _Nullable whitelistRules;

@end

/**
 Live Event input parameters. There can be multiple inputs in a single Live Event.
 */
@interface AWSmedialiveInputSettings : AWSModel


/**
 Used to select the audio stream to decode for inputs that have multiple available.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveAudioSelector *> * _Nullable audioSelectors;

/**
 Used to select the caption input to use for inputs that have multiple available.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveCaptionSelector *> * _Nullable captionSelectors;

/**
 Enable or disable the deblock filter when filtering.
 */
@property (nonatomic, assign) AWSmedialiveInputDeblockFilter deblockFilter;

/**
 Enable or disable the denoise filter when filtering.
 */
@property (nonatomic, assign) AWSmedialiveInputDenoiseFilter denoiseFilter;

/**
 Adjusts the magnitude of filtering from 1 (minimal) to 5 (strongest).
 */
@property (nonatomic, strong) NSNumber * _Nullable filterStrength;

/**
 Turns on the filter for this input. MPEG-2 inputs have the deblocking filter enabled by default. 1) auto - filtering will be applied depending on input type/quality 2) disabled - no filtering will be applied to the input 3) forced - filtering will be applied regardless of input type
 */
@property (nonatomic, assign) AWSmedialiveInputFilter inputFilter;

/**
 Input settings.
 */
@property (nonatomic, strong) AWSmedialiveNetworkInputSettings * _Nullable networkInputSettings;

/**
 Loop input if it is a file. This allows a file input to be streamed indefinitely.
 */
@property (nonatomic, assign) AWSmedialiveInputSourceEndBehavior sourceEndBehavior;

/**
 Informs which video elementary stream to decode for input types that have multiple available.
 */
@property (nonatomic, strong) AWSmedialiveVideoSelector * _Nullable videoSelector;

@end

/**
 The settings for a PULL type input.
 */
@interface AWSmedialiveInputSource : AWSModel


/**
 The key used to extract the password from EC2 Parameter store.
 */
@property (nonatomic, strong) NSString * _Nullable passwordParam;

/**
 This represents the customer's source URL where stream is pulled from. 
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 The username for the input source.
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 Settings for for a PULL type input.
 */
@interface AWSmedialiveInputSourceRequest : AWSModel


/**
 The key used to extract the password from EC2 Parameter store.
 */
@property (nonatomic, strong) NSString * _Nullable passwordParam;

/**
 This represents the customer's source URL where stream is pulled from. 
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 The username for the input source.
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 Placeholder documentation for InputSpecification
 */
@interface AWSmedialiveInputSpecification : AWSModel


/**
 Input codec
 */
@property (nonatomic, assign) AWSmedialiveInputCodec codec;

/**
 Maximum input bitrate, categorized coarsely
 */
@property (nonatomic, assign) AWSmedialiveInputMaximumBitrate maximumBitrate;

/**
 Input resolution, categorized coarsely
 */
@property (nonatomic, assign) AWSmedialiveInputResolution resolution;

@end

/**
 Settings for the "switch input" action: to switch from ingesting one input to ingesting another input.
 Required parameters: [InputAttachmentNameReference]
 */
@interface AWSmedialiveInputSwitchScheduleActionSettings : AWSModel


/**
 The name of the input attachment (not the name of the input!) to switch to. The name is specified in the channel configuration.
 */
@property (nonatomic, strong) NSString * _Nullable inputAttachmentNameReference;

/**
 Settings to let you create a clip of the file input, in order to set up the input to ingest only a portion of the file.
 */
@property (nonatomic, strong) AWSmedialiveInputClippingSettings * _Nullable inputClippingSettings;

/**
 The value for the variable portion of the URL for the dynamic input, for this instance of the input. Each time you use the same dynamic input in an input switch action, you can provide a different value, in order to connect the input to a different content source.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable urlPath;

@end

/**
 Settings for a private VPC Input. When this property is specified, the input destination addresses will be created in a VPC rather than with public Internet addresses. This property requires setting the roleArn property on Input creation. Not compatible with the inputSecurityGroups property. 
 Required parameters: [SubnetIds]
 */
@interface AWSmedialiveInputVpcRequest : AWSModel


/**
 A list of up to 5 EC2 VPC security group IDs to attach to the Input VPC network interfaces. Requires subnetIds. If none are specified then the VPC default security group will be used. 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 A list of 2 VPC subnet IDs from the same VPC. Subnet IDs must be mapped to two unique availability zones (AZ). 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 Whitelist rule
 */
@interface AWSmedialiveInputWhitelistRule : AWSModel


/**
 The IPv4 CIDR that's whitelisted.
 */
@property (nonatomic, strong) NSString * _Nullable cidr;

@end

/**
 An IPv4 CIDR to whitelist.
 */
@interface AWSmedialiveInputWhitelistRuleCidr : AWSModel


/**
 The IPv4 CIDR to whitelist.
 */
@property (nonatomic, strong) NSString * _Nullable cidr;

@end

/**
 Placeholder documentation for InternalServiceError
 */
@interface AWSmedialiveInternalServiceError : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Placeholder documentation for InvalidRequest
 */
@interface AWSmedialiveInvalidRequest : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Key Provider Settings
 */
@interface AWSmedialiveKeyProviderSettings : AWSModel


/**
 Static Key Settings
 */
@property (nonatomic, strong) AWSmedialiveStaticKeySettings * _Nullable staticKeySettings;

@end

/**
 Placeholder documentation for LimitExceeded
 */
@interface AWSmedialiveLimitExceeded : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Placeholder documentation for ListChannelsRequest
 */
@interface AWSmedialiveListChannelsRequest : AWSRequest


/**
 Placeholder documentation for MaxResults
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListChannelsResponse
 */
@interface AWSmedialiveListChannelsResponse : AWSModel


/**
 Placeholder documentation for __listOfChannelSummary
 */
@property (nonatomic, strong) NSArray<AWSmedialiveChannelSummary *> * _Nullable channels;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListChannelsResultModel
 */
@interface AWSmedialiveListChannelsResultModel : AWSModel


/**
 Placeholder documentation for __listOfChannelSummary
 */
@property (nonatomic, strong) NSArray<AWSmedialiveChannelSummary *> * _Nullable channels;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListInputSecurityGroupsRequest
 */
@interface AWSmedialiveListInputSecurityGroupsRequest : AWSRequest


/**
 Placeholder documentation for MaxResults
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListInputSecurityGroupsResponse
 */
@interface AWSmedialiveListInputSecurityGroupsResponse : AWSModel


/**
 List of input security groups
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputSecurityGroup *> * _Nullable inputSecurityGroups;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Result of input security group list request
 */
@interface AWSmedialiveListInputSecurityGroupsResultModel : AWSModel


/**
 List of input security groups
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputSecurityGroup *> * _Nullable inputSecurityGroups;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListInputsRequest
 */
@interface AWSmedialiveListInputsRequest : AWSRequest


/**
 Placeholder documentation for MaxResults
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListInputsResponse
 */
@interface AWSmedialiveListInputsResponse : AWSModel


/**
 Placeholder documentation for __listOfInput
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInput *> * _Nullable inputs;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListInputsResultModel
 */
@interface AWSmedialiveListInputsResultModel : AWSModel


/**
 Placeholder documentation for __listOfInput
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInput *> * _Nullable inputs;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListMultiplexProgramsRequest
 Required parameters: [MultiplexId]
 */
@interface AWSmedialiveListMultiplexProgramsRequest : AWSRequest


/**
 The maximum number of items to return.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 The ID of the multiplex that the programs belong to.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

/**
 The token to retrieve the next page of results.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListMultiplexProgramsResponse
 */
@interface AWSmedialiveListMultiplexProgramsResponse : AWSModel


/**
 List of multiplex programs.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMultiplexProgramSummary *> * _Nullable multiplexPrograms;

/**
 Token for the next ListMultiplexProgram request.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListMultiplexProgramsResultModel
 */
@interface AWSmedialiveListMultiplexProgramsResultModel : AWSModel


/**
 List of multiplex programs.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMultiplexProgramSummary *> * _Nullable multiplexPrograms;

/**
 Token for the next ListMultiplexProgram request.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListMultiplexesRequest
 */
@interface AWSmedialiveListMultiplexesRequest : AWSRequest


/**
 The maximum number of items to return.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 The token to retrieve the next page of results.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListMultiplexesResponse
 */
@interface AWSmedialiveListMultiplexesResponse : AWSModel


/**
 List of multiplexes.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMultiplexSummary *> * _Nullable multiplexes;

/**
 Token for the next ListMultiplexes request.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListMultiplexesResultModel
 */
@interface AWSmedialiveListMultiplexesResultModel : AWSModel


/**
 List of multiplexes.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMultiplexSummary *> * _Nullable multiplexes;

/**
 Token for the next ListMultiplexes request.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListOfferingsRequest
 */
@interface AWSmedialiveListOfferingsRequest : AWSRequest


/**
 Filter by channel class, 'STANDARD' or 'SINGLE_PIPELINE' 
 */
@property (nonatomic, strong) NSString * _Nullable channelClass;

/**
 Filter to offerings that match the configuration of an existing channel, e.g. '2345678' (a channel ID) 
 */
@property (nonatomic, strong) NSString * _Nullable channelConfiguration;

/**
 Filter by codec, 'AVC', 'HEVC', 'MPEG2', or 'AUDIO'
 */
@property (nonatomic, strong) NSString * _Nullable codec;

/**
 Filter by offering duration, e.g. '12'
 */
@property (nonatomic, strong) NSString * _Nullable duration;

/**
 Placeholder documentation for MaxResults
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 Filter by bitrate, 'MAX_10_MBPS', 'MAX_20_MBPS', or 'MAX_50_MBPS' 
 */
@property (nonatomic, strong) NSString * _Nullable maximumBitrate;

/**
 Filter by framerate, 'MAX_30_FPS' or 'MAX_60_FPS'
 */
@property (nonatomic, strong) NSString * _Nullable maximumFramerate;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 Filter by resolution, 'SD', 'HD', 'FHD', or 'UHD'
 */
@property (nonatomic, strong) NSString * _Nullable resolution;

/**
 Filter by resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 Filter by special feature, 'ADVANCED_AUDIO' or 'AUDIO_NORMALIZATION' 
 */
@property (nonatomic, strong) NSString * _Nullable specialFeature;

/**
 Filter by video quality, 'STANDARD', 'ENHANCED', or 'PREMIUM' 
 */
@property (nonatomic, strong) NSString * _Nullable videoQuality;

@end

/**
 Placeholder documentation for ListOfferingsResponse
 */
@interface AWSmedialiveListOfferingsResponse : AWSModel


/**
 Token to retrieve the next page of results
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 List of offerings
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOffering *> * _Nullable offerings;

@end

/**
 ListOfferings response
 */
@interface AWSmedialiveListOfferingsResultModel : AWSModel


/**
 Token to retrieve the next page of results
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 List of offerings
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOffering *> * _Nullable offerings;

@end

/**
 Placeholder documentation for ListReservationsRequest
 */
@interface AWSmedialiveListReservationsRequest : AWSRequest


/**
 Filter by channel class, 'STANDARD' or 'SINGLE_PIPELINE' 
 */
@property (nonatomic, strong) NSString * _Nullable channelClass;

/**
 Filter by codec, 'AVC', 'HEVC', 'MPEG2', or 'AUDIO'
 */
@property (nonatomic, strong) NSString * _Nullable codec;

/**
 Placeholder documentation for MaxResults
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 Filter by bitrate, 'MAX_10_MBPS', 'MAX_20_MBPS', or 'MAX_50_MBPS' 
 */
@property (nonatomic, strong) NSString * _Nullable maximumBitrate;

/**
 Filter by framerate, 'MAX_30_FPS' or 'MAX_60_FPS'
 */
@property (nonatomic, strong) NSString * _Nullable maximumFramerate;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 Filter by resolution, 'SD', 'HD', 'FHD', or 'UHD'
 */
@property (nonatomic, strong) NSString * _Nullable resolution;

/**
 Filter by resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 Filter by special feature, 'ADVANCED_AUDIO' or 'AUDIO_NORMALIZATION' 
 */
@property (nonatomic, strong) NSString * _Nullable specialFeature;

/**
 Filter by video quality, 'STANDARD', 'ENHANCED', or 'PREMIUM' 
 */
@property (nonatomic, strong) NSString * _Nullable videoQuality;

@end

/**
 Placeholder documentation for ListReservationsResponse
 */
@interface AWSmedialiveListReservationsResponse : AWSModel


/**
 Token to retrieve the next page of results
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 List of reservations
 */
@property (nonatomic, strong) NSArray<AWSmedialiveReservation *> * _Nullable reservations;

@end

/**
 ListReservations response
 */
@interface AWSmedialiveListReservationsResultModel : AWSModel


/**
 Token to retrieve the next page of results
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 List of reservations
 */
@property (nonatomic, strong) NSArray<AWSmedialiveReservation *> * _Nullable reservations;

@end

/**
 Placeholder documentation for ListTagsForResourceRequest
 Required parameters: [ResourceArn]
 */
@interface AWSmedialiveListTagsForResourceRequest : AWSRequest


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 Placeholder documentation for ListTagsForResourceResponse
 */
@interface AWSmedialiveListTagsForResourceResponse : AWSModel


/**
 Placeholder documentation for Tags
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 M2ts Settings
 */
@interface AWSmedialiveM2tsSettings : AWSModel


/**
 When set to drop, output audio streams will be removed from the program if the selected input audio stream is removed from the input. This allows the output audio configuration to dynamically change based on input configuration. If this is set to encodeSilence, all output audio streams will output encoded silence when not connected to an active input stream.
 */
@property (nonatomic, assign) AWSmedialiveM2tsAbsentInputAudioBehavior absentInputAudioBehavior;

/**
 When set to enabled, uses ARIB-compliant field muxing and removes video descriptor.
 */
@property (nonatomic, assign) AWSmedialiveM2tsArib arib;

/**
 Packet Identifier (PID) for ARIB Captions in the transport stream. Can be entered as a decimal or hexadecimal value.Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable aribCaptionsPid;

/**
 If set to auto, pid number used for ARIB Captions will be auto-selected from unused pids.If set to useConfigured, ARIB Captions will be on the configured pid number.
 */
@property (nonatomic, assign) AWSmedialiveM2tsAribCaptionsPidControl aribCaptionsPidControl;

/**
 When set to dvb, uses DVB buffer model for Dolby Digital audio.When set to atsc, the ATSC model is used.
 */
@property (nonatomic, assign) AWSmedialiveM2tsAudioBufferModel audioBufferModel;

/**
 The number of audio frames to insert for each PES packet.
 */
@property (nonatomic, strong) NSNumber * _Nullable audioFramesPerPes;

/**
 Packet Identifier (PID) of the elementary audio stream(s) in the transport stream. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values. Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable audioPids;

/**
 When set to atsc, uses stream type = 0x81 for AC3 and stream type = 0x87 for EAC3. When set to dvb, uses stream type = 0x06.
 */
@property (nonatomic, assign) AWSmedialiveM2tsAudioStreamType audioStreamType;

/**
 The output bitrate of the transport stream in bits per second. Setting to 0 lets the muxer automatically determine the appropriate bitrate.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 If set to multiplex, use multiplex buffer model for accurate interleaving.Setting to bufferModel to none can lead to lower latency, but low-memory devices may not be able to play back the stream without interruptions.
 */
@property (nonatomic, assign) AWSmedialiveM2tsBufferModel bufferModel;

/**
 When set to enabled, generates captionServiceDescriptor in PMT.
 */
@property (nonatomic, assign) AWSmedialiveM2tsCcDescriptor ccDescriptor;

/**
 Inserts DVB Network Information Table (NIT) at the specified table repetition interval.
 */
@property (nonatomic, strong) AWSmedialiveDvbNitSettings * _Nullable dvbNitSettings;

/**
 Inserts DVB Service Description Table (SDT) at the specified table repetition interval.
 */
@property (nonatomic, strong) AWSmedialiveDvbSdtSettings * _Nullable dvbSdtSettings;

/**
 Packet Identifier (PID) for input source DVB Subtitle data to this output. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values.Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable dvbSubPids;

/**
 Inserts DVB Time and Date Table (TDT) at the specified table repetition interval.
 */
@property (nonatomic, strong) AWSmedialiveDvbTdtSettings * _Nullable dvbTdtSettings;

/**
 Packet Identifier (PID) for input source DVB Teletext data to this output. Can be entered as a decimal or hexadecimal value.Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable dvbTeletextPid;

/**
 If set to passthrough, passes any EBIF data from the input source to this output.
 */
@property (nonatomic, assign) AWSmedialiveM2tsEbifControl ebif;

/**
 When videoAndFixedIntervals is selected, audio EBP markers will be added to partitions 3 and 4. The interval between these additional markers will be fixed, and will be slightly shorter than the video EBP marker interval. Only available when EBP Cablelabs segmentation markers are selected.Partitions 1 and 2 will always follow the video interval.
 */
@property (nonatomic, assign) AWSmedialiveM2tsAudioInterval ebpAudioInterval;

/**
 When set, enforces that Encoder Boundary Points do not come within the specified time interval of each other by looking ahead at input video. If another EBP is going to come in within the specified time interval, the current EBP is not emitted, and the segment is "stretched" to the next marker.The lookahead value does not add latency to the system. The Live Event must be configured elsewhere to create sufficient latency to make the lookahead accurate.
 */
@property (nonatomic, strong) NSNumber * _Nullable ebpLookaheadMs;

/**
 Controls placement of EBP on Audio PIDs. If set to videoAndAudioPids, EBP markers will be placed on the video PID and all audio PIDs.If set to videoPid, EBP markers will be placed on only the video PID.
 */
@property (nonatomic, assign) AWSmedialiveM2tsEbpPlacement ebpPlacement;

/**
 This field is unused and deprecated.
 */
@property (nonatomic, strong) NSString * _Nullable ecmPid;

/**
 Include or exclude the ES Rate field in the PES header.
 */
@property (nonatomic, assign) AWSmedialiveM2tsEsRateInPes esRateInPes;

/**
 Packet Identifier (PID) for input source ETV Platform data to this output. Can be entered as a decimal or hexadecimal value.Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable etvPlatformPid;

/**
 Packet Identifier (PID) for input source ETV Signal data to this output. Can be entered as a decimal or hexadecimal value.Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable etvSignalPid;

/**
 The length in seconds of each fragment. Only used with EBP markers.
 */
@property (nonatomic, strong) NSNumber * _Nullable fragmentTime;

/**
 If set to passthrough, passes any KLV data from the input source to this output.
 */
@property (nonatomic, assign) AWSmedialiveM2tsKlv klv;

/**
 Packet Identifier (PID) for input source KLV data to this output. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values.Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable klvDataPids;

/**
 If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input audio and an equivalent ID3 tag will be inserted in the output.
 */
@property (nonatomic, assign) AWSmedialiveM2tsNielsenId3Behavior nielsenId3Behavior;

/**
 Value in bits per second of extra null packets to insert into the transport stream. This can be used if a downstream encryption system requires periodic null packets.
 */
@property (nonatomic, strong) NSNumber * _Nullable nullPacketBitrate;

/**
 The number of milliseconds between instances of this table in the output transport stream.Valid values are 0, 10..1000.
 */
@property (nonatomic, strong) NSNumber * _Nullable patInterval;

/**
 When set to pcrEveryPesPacket, a Program Clock Reference value is inserted for every Packetized Elementary Stream (PES) header. This parameter is effective only when the PCR PID is the same as the video or audio elementary stream.
 */
@property (nonatomic, assign) AWSmedialiveM2tsPcrControl pcrControl;

/**
 Maximum time in milliseconds between Program Clock Reference (PCRs) inserted into the transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable pcrPeriod;

/**
 Packet Identifier (PID) of the Program Clock Reference (PCR) in the transport stream. When no value is given, the encoder will assign the same value as the Video PID. Can be entered as a decimal or hexadecimal value.Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable pcrPid;

/**
 The number of milliseconds between instances of this table in the output transport stream. Valid values are 0, 10..1000.
 */
@property (nonatomic, strong) NSNumber * _Nullable pmtInterval;

/**
 Packet Identifier (PID) for the Program Map Table (PMT) in the transport stream. Can be entered as a decimal or hexadecimal value. Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable pmtPid;

/**
 The value of the program number field in the Program Map Table.
 */
@property (nonatomic, strong) NSNumber * _Nullable programNum;

/**
 When vbr, does not insert null packets into transport stream to fill specified bitrate. The bitrate setting acts as the maximum bitrate when vbr is set.
 */
@property (nonatomic, assign) AWSmedialiveM2tsRateMode rateMode;

/**
 Packet Identifier (PID) for input source SCTE-27 data to this output. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values.Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable scte27Pids;

/**
 Optionally pass SCTE-35 signals from the input source to this output.
 */
@property (nonatomic, assign) AWSmedialiveM2tsScte35Control scte35Control;

/**
 Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can be entered as a decimal or hexadecimal value.Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable scte35Pid;

/**
 Inserts segmentation markers at each segmentationTime period. raiSegstart sets the Random Access Indicator bit in the adaptation field. raiAdapt sets the RAI bit and adds the current timecode in the private data bytes. psiSegstart inserts PAT and PMT tables at the start of segments. ebp adds Encoder Boundary Point information to the adaptation field as per OpenCable specification OC-SP-EBP-I01-130118. ebpLegacy adds Encoder Boundary Point information to the adaptation field using a legacy proprietary format.
 */
@property (nonatomic, assign) AWSmedialiveM2tsSegmentationMarkers segmentationMarkers;

/**
 The segmentation style parameter controls how segmentation markers are inserted into the transport stream. With avails, it is possible that segments may be truncated, which can influence where future segmentation markers are inserted.When a segmentation style of "resetCadence" is selected and a segment is truncated due to an avail, we will reset the segmentation cadence. This means the subsequent segment will have a duration of $segmentationTime seconds.When a segmentation style of "maintainCadence" is selected and a segment is truncated due to an avail, we will not reset the segmentation cadence. This means the subsequent segment will likely be truncated as well. However, all segments after that will have a duration of $segmentationTime seconds. Note that EBP lookahead is a slight exception to this rule.
 */
@property (nonatomic, assign) AWSmedialiveM2tsSegmentationStyle segmentationStyle;

/**
 The length in seconds of each segment. Required unless markers is set to None_.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentationTime;

/**
 When set to passthrough, timed metadata will be passed through from input to output.
 */
@property (nonatomic, assign) AWSmedialiveM2tsTimedMetadataBehavior timedMetadataBehavior;

/**
 Packet Identifier (PID) of the timed metadata stream in the transport stream. Can be entered as a decimal or hexadecimal value.Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable timedMetadataPid;

/**
 The value of the transport stream ID field in the Program Map Table.
 */
@property (nonatomic, strong) NSNumber * _Nullable transportStreamId;

/**
 Packet Identifier (PID) of the elementary video stream in the transport stream. Can be entered as a decimal or hexadecimal value.Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable videoPid;

@end

/**
 Settings information for the .m3u8 container
 */
@interface AWSmedialiveM3u8Settings : AWSModel


/**
 The number of audio frames to insert for each PES packet.
 */
@property (nonatomic, strong) NSNumber * _Nullable audioFramesPerPes;

/**
 Packet Identifier (PID) of the elementary audio stream(s) in the transport stream. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values.
 */
@property (nonatomic, strong) NSString * _Nullable audioPids;

/**
 This parameter is unused and deprecated.
 */
@property (nonatomic, strong) NSString * _Nullable ecmPid;

/**
 If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input audio and an equivalent ID3 tag will be inserted in the output.
 */
@property (nonatomic, assign) AWSmedialiveM3u8NielsenId3Behavior nielsenId3Behavior;

/**
 The number of milliseconds between instances of this table in the output transport stream. A value of \"0\" writes out the PMT once per segment file.
 */
@property (nonatomic, strong) NSNumber * _Nullable patInterval;

/**
 When set to pcrEveryPesPacket, a Program Clock Reference value is inserted for every Packetized Elementary Stream (PES) header. This parameter is effective only when the PCR PID is the same as the video or audio elementary stream.
 */
@property (nonatomic, assign) AWSmedialiveM3u8PcrControl pcrControl;

/**
 Maximum time in milliseconds between Program Clock References (PCRs) inserted into the transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable pcrPeriod;

/**
 Packet Identifier (PID) of the Program Clock Reference (PCR) in the transport stream. When no value is given, the encoder will assign the same value as the Video PID. Can be entered as a decimal or hexadecimal value.
 */
@property (nonatomic, strong) NSString * _Nullable pcrPid;

/**
 The number of milliseconds between instances of this table in the output transport stream. A value of \"0\" writes out the PMT once per segment file.
 */
@property (nonatomic, strong) NSNumber * _Nullable pmtInterval;

/**
 Packet Identifier (PID) for the Program Map Table (PMT) in the transport stream. Can be entered as a decimal or hexadecimal value.
 */
@property (nonatomic, strong) NSString * _Nullable pmtPid;

/**
 The value of the program number field in the Program Map Table.
 */
@property (nonatomic, strong) NSNumber * _Nullable programNum;

/**
 If set to passthrough, passes any SCTE-35 signals from the input source to this output.
 */
@property (nonatomic, assign) AWSmedialiveM3u8Scte35Behavior scte35Behavior;

/**
 Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can be entered as a decimal or hexadecimal value.
 */
@property (nonatomic, strong) NSString * _Nullable scte35Pid;

/**
 When set to passthrough, timed metadata is passed through from input to output.
 */
@property (nonatomic, assign) AWSmedialiveM3u8TimedMetadataBehavior timedMetadataBehavior;

/**
 Packet Identifier (PID) of the timed metadata stream in the transport stream. Can be entered as a decimal or hexadecimal value.Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable timedMetadataPid;

/**
 The value of the transport stream ID field in the Program Map Table.
 */
@property (nonatomic, strong) NSNumber * _Nullable transportStreamId;

/**
 Packet Identifier (PID) of the elementary video stream in the transport stream. Can be entered as a decimal or hexadecimal value.
 */
@property (nonatomic, strong) NSString * _Nullable videoPid;

@end

/**
 The settings for a MediaConnect Flow.
 */
@interface AWSmedialiveMediaConnectFlow : AWSModel


/**
 The unique ARN of the MediaConnect Flow being used as a source.
 */
@property (nonatomic, strong) NSString * _Nullable flowArn;

@end

/**
 The settings for a MediaConnect Flow.
 */
@interface AWSmedialiveMediaConnectFlowRequest : AWSModel


/**
 The ARN of the MediaConnect Flow that you want to use as a source.
 */
@property (nonatomic, strong) NSString * _Nullable flowArn;

@end

/**
 Media Package Group Settings
 Required parameters: [Destination]
 */
@interface AWSmedialiveMediaPackageGroupSettings : AWSModel


/**
 MediaPackage channel destination.
 */
@property (nonatomic, strong) AWSmedialiveOutputLocationRef * _Nullable destination;

@end

/**
 MediaPackage Output Destination Settings
 */
@interface AWSmedialiveMediaPackageOutputDestinationSettings : AWSModel


/**
 ID of the channel in MediaPackage that is the destination for this output group. You do not need to specify the individual inputs in MediaPackage; MediaLive will handle the connection of the two MediaLive pipelines to the two MediaPackage inputs. The MediaPackage channel and MediaLive channel must be in the same region.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

@end

/**
 Media Package Output Settings
 */
@interface AWSmedialiveMediaPackageOutputSettings : AWSModel


@end

/**
 Mp2 Settings
 */
@interface AWSmedialiveMp2Settings : AWSModel


/**
 Average bitrate in bits/second.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 The MPEG2 Audio coding mode.Valid values are codingMode10 (for mono) or codingMode20 (for stereo).
 */
@property (nonatomic, assign) AWSmedialiveMp2CodingMode codingMode;

/**
 Sample rate in Hz.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

@end

/**
 Ms Smooth Group Settings
 Required parameters: [Destination]
 */
@interface AWSmedialiveMsSmoothGroupSettings : AWSModel


/**
 The value of the "Acquisition Point Identity" element used in each message placed in the sparse track.Only enabled if sparseTrackType is not "none".
 */
@property (nonatomic, strong) NSString * _Nullable acquisitionPointId;

/**
 If set to passthrough for an audio-only MS Smooth output, the fragment absolute time will be set to the current timecode. This option does not write timecodes to the audio elementary stream.
 */
@property (nonatomic, assign) AWSmedialiveSmoothGroupAudioOnlyTimecodeControl audioOnlyTimecodeControl;

/**
 If set to verifyAuthenticity, verify the https certificate chain to a trusted Certificate Authority (CA).This will cause https outputs to self-signed certificates to fail.
 */
@property (nonatomic, assign) AWSmedialiveSmoothGroupCertificateMode certificateMode;

/**
 Number of seconds to wait before retrying connection to the IIS server if the connection is lost. Content will be cached during this time and the cache will be be delivered to the IIS server once the connection is re-established.
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionRetryInterval;

/**
 Smooth Streaming publish point on an IIS server. Elemental Live acts as a "Push" encoder to IIS.
 */
@property (nonatomic, strong) AWSmedialiveOutputLocationRef * _Nullable destination;

/**
 MS Smooth event ID to be sent to the IIS server.Should only be specified if eventIdMode is set to useConfigured.
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 Specifies whether or not to send an event ID to the IIS server. If no event ID is sent and the same Live Event is used without changing the publishing point, clients might see cached video from the previous run.Options: - "useConfigured" - use the value provided in eventId - "useTimestamp" - generate and send an event ID based on the current timestamp - "noEventId" - do not send an event ID to the IIS server.
 */
@property (nonatomic, assign) AWSmedialiveSmoothGroupEventIdMode eventIdMode;

/**
 When set to sendEos, send EOS signal to IIS server when stopping the event
 */
@property (nonatomic, assign) AWSmedialiveSmoothGroupEventStopBehavior eventStopBehavior;

/**
 Size in seconds of file cache for streaming outputs.
 */
@property (nonatomic, strong) NSNumber * _Nullable filecacheDuration;

/**
 Length of mp4 fragments to generate (in seconds). Fragment length must be compatible with GOP size and framerate.
 */
@property (nonatomic, strong) NSNumber * _Nullable fragmentLength;

/**
 Parameter that control output group behavior on input loss.
 */
@property (nonatomic, assign) AWSmedialiveInputLossActionForMsSmoothOut inputLossAction;

/**
 Number of retry attempts.
 */
@property (nonatomic, strong) NSNumber * _Nullable numRetries;

/**
 Number of seconds before initiating a restart due to output failure, due to exhausting the numRetries on one segment, or exceeding filecacheDuration.
 */
@property (nonatomic, strong) NSNumber * _Nullable restartDelay;

/**
 useInputSegmentation has been deprecated. The configured segment size is always used.
 */
@property (nonatomic, assign) AWSmedialiveSmoothGroupSegmentationMode segmentationMode;

/**
 Number of milliseconds to delay the output from the second pipeline.
 */
@property (nonatomic, strong) NSNumber * _Nullable sendDelayMs;

/**
 If set to scte35, use incoming SCTE-35 messages to generate a sparse track in this group of MS-Smooth outputs. scte35WithoutSegmentation is the same as scte35, except EML will not start a new segment at a SCTE-35 marker. It will still encode an IDR frame at a SCTE-35 marker.
 */
@property (nonatomic, assign) AWSmedialiveSmoothGroupSparseTrackType sparseTrackType;

/**
 When set to send, send stream manifest so publishing point doesn't start until all streams start.
 */
@property (nonatomic, assign) AWSmedialiveSmoothGroupStreamManifestBehavior streamManifestBehavior;

/**
 Timestamp offset for the event.Only used if timestampOffsetMode is set to useConfiguredOffset.
 */
@property (nonatomic, strong) NSString * _Nullable timestampOffset;

/**
 Type of timestamp date offset to use. - useEventStartDate: Use the date the event was started as the offset - useConfiguredOffset: Use an explicitly configured date as the offset
 */
@property (nonatomic, assign) AWSmedialiveSmoothGroupTimestampOffsetMode timestampOffsetMode;

@end

/**
 Ms Smooth Output Settings
 */
@interface AWSmedialiveMsSmoothOutputSettings : AWSModel


/**
 Only applicable when this output is referencing an H.265 video description. Specifies whether MP4 segments should be packaged as HEV1 or HVC1.
 */
@property (nonatomic, assign) AWSmedialiveMsSmoothH265PackagingType h265PackagingType;

/**
 String concatenated to the end of the destination filename.Required for multiple outputs of the same type.
 */
@property (nonatomic, strong) NSString * _Nullable nameModifier;

@end

/**
 The multiplex object.
 */
@interface AWSmedialiveMultiplex : AWSModel


/**
 The unique arn of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A list of availability zones for the multiplex.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 A list of the multiplex output destinations.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMultiplexOutputDestination *> * _Nullable destinations;

/**
 The unique id of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexSettings * _Nullable multiplexSettings;

/**
 The name of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The number of currently healthy pipelines.
 */
@property (nonatomic, strong) NSNumber * _Nullable pipelinesRunningCount;

/**
 The number of programs in the multiplex.
 */
@property (nonatomic, strong) NSNumber * _Nullable programCount;

/**
 The current state of the multiplex.
 */
@property (nonatomic, assign) AWSmedialiveMultiplexState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for MultiplexConfigurationValidationError
 */
@interface AWSmedialiveMultiplexConfigurationValidationError : AWSModel


/**
 The error message.
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 A collection of validation error responses.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMultiplexValidationError *> * _Nullable validationErrors;

@end

/**
 Multiplex Group Settings
 */
@interface AWSmedialiveMultiplexGroupSettings : AWSModel


@end

/**
 Multiplex MediaConnect output destination settings.
 */
@interface AWSmedialiveMultiplexMediaConnectOutputDestinationSettings : AWSModel


/**
 The MediaConnect entitlement ARN available as a Flow source.
 */
@property (nonatomic, strong) NSString * _Nullable entitlementArn;

@end

/**
 Multiplex output destination settings
 */
@interface AWSmedialiveMultiplexOutputDestination : AWSModel


/**
 Multiplex MediaConnect output destination settings.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexMediaConnectOutputDestinationSettings * _Nullable mediaConnectSettings;

@end

/**
 Multiplex Output Settings
 Required parameters: [Destination]
 */
@interface AWSmedialiveMultiplexOutputSettings : AWSModel


/**
 Destination is a Multiplex.
 */
@property (nonatomic, strong) AWSmedialiveOutputLocationRef * _Nullable destination;

@end

/**
 The multiplex program object.
 */
@interface AWSmedialiveMultiplexProgram : AWSModel


/**
 The MediaLive channel associated with the program.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 The settings for this multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

/**
 The packet identifier map for this multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgramPacketIdentifiersMap * _Nullable packetIdentifiersMap;

/**
 The name of the multiplex program.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

@end

/**
 Multiplex Program Input Destination Settings for outputting a Channel to a Multiplex
 */
@interface AWSmedialiveMultiplexProgramChannelDestinationSettings : AWSModel


/**
 The ID of the Multiplex that the encoder is providing output to. You do not need to specify the individual inputs to the Multiplex; MediaLive will handle the connection of the two MediaLive pipelines to the two Multiplex instances. The Multiplex must be in the same region as the Channel.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

/**
 The program name of the Multiplex program that the encoder is providing output to.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

@end

/**
 Packet identifiers map for a given Multiplex program.
 */
@interface AWSmedialiveMultiplexProgramPacketIdentifiersMap : AWSModel


/**
 Placeholder documentation for __listOf__integer
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable audioPids;

/**
 Placeholder documentation for __listOf__integer
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable dvbSubPids;

/**
 Placeholder documentation for __integer
 */
@property (nonatomic, strong) NSNumber * _Nullable dvbTeletextPid;

/**
 Placeholder documentation for __integer
 */
@property (nonatomic, strong) NSNumber * _Nullable etvPlatformPid;

/**
 Placeholder documentation for __integer
 */
@property (nonatomic, strong) NSNumber * _Nullable etvSignalPid;

/**
 Placeholder documentation for __listOf__integer
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable klvDataPids;

/**
 Placeholder documentation for __integer
 */
@property (nonatomic, strong) NSNumber * _Nullable pcrPid;

/**
 Placeholder documentation for __integer
 */
@property (nonatomic, strong) NSNumber * _Nullable pmtPid;

/**
 Placeholder documentation for __integer
 */
@property (nonatomic, strong) NSNumber * _Nullable privateMetadataPid;

/**
 Placeholder documentation for __listOf__integer
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable scte27Pids;

/**
 Placeholder documentation for __integer
 */
@property (nonatomic, strong) NSNumber * _Nullable scte35Pid;

/**
 Placeholder documentation for __integer
 */
@property (nonatomic, strong) NSNumber * _Nullable timedMetadataPid;

/**
 Placeholder documentation for __integer
 */
@property (nonatomic, strong) NSNumber * _Nullable videoPid;

@end

/**
 Transport stream service descriptor configuration for the Multiplex program.
 Required parameters: [ProviderName, ServiceName]
 */
@interface AWSmedialiveMultiplexProgramServiceDescriptor : AWSModel


/**
 Name of the provider.
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 Name of the service.
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

@end

/**
 Multiplex Program settings configuration.
 Required parameters: [ProgramNumber]
 */
@interface AWSmedialiveMultiplexProgramSettings : AWSModel


/**
 Indicates which pipeline is preferred by the multiplex for program ingest.
 */
@property (nonatomic, assign) AWSmedialivePreferredChannelPipeline preferredChannelPipeline;

/**
 Unique program number.
 */
@property (nonatomic, strong) NSNumber * _Nullable programNumber;

/**
 Transport stream service descriptor configuration for the Multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgramServiceDescriptor * _Nullable serviceDescriptor;

/**
 Program video settings configuration.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexVideoSettings * _Nullable videoSettings;

@end

/**
 Placeholder documentation for MultiplexProgramSummary
 */
@interface AWSmedialiveMultiplexProgramSummary : AWSModel


/**
 The MediaLive Channel associated with the program.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 The name of the multiplex program.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

@end

/**
 Contains configuration for a Multiplex event
 Required parameters: [TransportStreamBitrate, TransportStreamId]
 */
@interface AWSmedialiveMultiplexSettings : AWSModel


/**
 Maximum video buffer delay in milliseconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumVideoBufferDelayMilliseconds;

/**
 Transport stream bit rate.
 */
@property (nonatomic, strong) NSNumber * _Nullable transportStreamBitrate;

/**
 Transport stream ID.
 */
@property (nonatomic, strong) NSNumber * _Nullable transportStreamId;

/**
 Transport stream reserved bit rate.
 */
@property (nonatomic, strong) NSNumber * _Nullable transportStreamReservedBitrate;

@end

/**
 Contains summary configuration for a Multiplex event.
 */
@interface AWSmedialiveMultiplexSettingsSummary : AWSModel


/**
 Transport stream bit rate.
 */
@property (nonatomic, strong) NSNumber * _Nullable transportStreamBitrate;

@end

/**
 Statmux rate control settings
 */
@interface AWSmedialiveMultiplexStatmuxVideoSettings : AWSModel


/**
 Maximum statmux bitrate.
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumBitrate;

/**
 Minimum statmux bitrate.
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumBitrate;

@end

/**
 Placeholder documentation for MultiplexSummary
 */
@interface AWSmedialiveMultiplexSummary : AWSModel


/**
 The unique arn of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A list of availability zones for the multiplex.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 The unique id of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexSettingsSummary * _Nullable multiplexSettings;

/**
 The name of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The number of currently healthy pipelines.
 */
@property (nonatomic, strong) NSNumber * _Nullable pipelinesRunningCount;

/**
 The number of programs in the multiplex.
 */
@property (nonatomic, strong) NSNumber * _Nullable programCount;

/**
 The current state of the multiplex.
 */
@property (nonatomic, assign) AWSmedialiveMultiplexState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for MultiplexValidationError
 */
@interface AWSmedialiveMultiplexValidationError : AWSModel


/**
 Path to the source of the error.
 */
@property (nonatomic, strong) NSString * _Nullable elementPath;

/**
 The error message.
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

@end

/**
 The video configuration for each program in a multiplex.
 */
@interface AWSmedialiveMultiplexVideoSettings : AWSModel


/**
 The constant bitrate configuration for the video encode. When this field is defined, StatmuxSettings must be undefined.
 */
@property (nonatomic, strong) NSNumber * _Nullable constantBitrate;

/**
 Statmux rate control settings. When this field is defined, ConstantBitrate must be undefined.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexStatmuxVideoSettings * _Nullable statmuxSettings;

@end

/**
 Network source to transcode. Must be accessible to the Elemental Live node that is running the live event through a network connection.
 */
@interface AWSmedialiveNetworkInputSettings : AWSModel


/**
 Specifies HLS input settings when the uri is for a HLS manifest.
 */
@property (nonatomic, strong) AWSmedialiveHlsInputSettings * _Nullable hlsInputSettings;

/**
 Check HTTPS server certificates. When set to checkCryptographyOnly, cryptography in the certificate will be checked, but not the server's name. Certain subdomains (notably S3 buckets that use dots in the bucket name) do not strictly match the corresponding certificate's wildcard pattern and would otherwise cause the event to error. This setting is ignored for protocols that do not use https.
 */
@property (nonatomic, assign) AWSmedialiveNetworkInputServerValidation serverValidation;

@end

/**
 Nielsen Configuration
 */
@interface AWSmedialiveNielsenConfiguration : AWSModel


/**
 Enter the Distributor ID assigned to your organization by Nielsen.
 */
@property (nonatomic, strong) NSString * _Nullable distributorId;

/**
 Enables Nielsen PCM to ID3 tagging
 */
@property (nonatomic, assign) AWSmedialiveNielsenPcmToId3TaggingState nielsenPcmToId3Tagging;

@end

/**
 Reserved resources available for purchase
 */
@interface AWSmedialiveOffering : AWSModel


/**
 Unique offering ARN, e.g. 'arn:aws:medialive:us-west-2:123456789012:offering:87654321'
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 Lease duration, e.g. '12'
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 Units for duration, e.g. 'MONTHS'
 */
@property (nonatomic, assign) AWSmedialiveOfferingDurationUnits durationUnits;

/**
 One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT offering
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and standard VQ in US West (Oregon)'
 */
@property (nonatomic, strong) NSString * _Nullable offeringDescription;

/**
 Unique offering ID, e.g. '87654321'
 */
@property (nonatomic, strong) NSString * _Nullable offeringId;

/**
 Offering type, e.g. 'NO_UPFRONT'
 */
@property (nonatomic, assign) AWSmedialiveOfferingType offeringType;

/**
 AWS region, e.g. 'us-west-2'
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 Resource configuration details
 */
@property (nonatomic, strong) AWSmedialiveReservationResourceSpecification * _Nullable resourceSpecification;

/**
 Recurring usage charge for each reserved resource, e.g. '157.0'
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 Output settings. There can be multiple outputs within a group.
 Required parameters: [OutputSettings]
 */
@interface AWSmedialiveOutput : AWSModel


/**
 The names of the AudioDescriptions used as audio sources for this output.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable audioDescriptionNames;

/**
 The names of the CaptionDescriptions used as caption sources for this output.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable captionDescriptionNames;

/**
 The name used to identify an output.
 */
@property (nonatomic, strong) NSString * _Nullable outputName;

/**
 Output type-specific settings.
 */
@property (nonatomic, strong) AWSmedialiveOutputSettings * _Nullable outputSettings;

/**
 The name of the VideoDescription used as the source for this output.
 */
@property (nonatomic, strong) NSString * _Nullable videoDescriptionName;

@end

/**
 Placeholder documentation for OutputDestination
 */
@interface AWSmedialiveOutputDestination : AWSModel


/**
 User-specified id. This is used in an output group or an output.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Destination settings for a MediaPackage output; one destination for both encoders.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMediaPackageOutputDestinationSettings *> * _Nullable mediaPackageSettings;

/**
 Destination settings for a Multiplex output; one destination for both encoders.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgramChannelDestinationSettings * _Nullable multiplexSettings;

/**
 Destination settings for a standard output; one destination for each redundant encoder.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestinationSettings *> * _Nullable settings;

@end

/**
 Placeholder documentation for OutputDestinationSettings
 */
@interface AWSmedialiveOutputDestinationSettings : AWSModel


/**
 key used to extract the password from EC2 Parameter store
 */
@property (nonatomic, strong) NSString * _Nullable passwordParam;

/**
 Stream name for RTMP destinations (URLs of type rtmp://)
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 A URL specifying a destination
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 username for destination
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 Output groups for this Live Event. Output groups contain information about where streams should be distributed.
 Required parameters: [Outputs, OutputGroupSettings]
 */
@interface AWSmedialiveOutputGroup : AWSModel


/**
 Custom output group name optionally defined by the user.Only letters, numbers, and the underscore character allowed; only 32 characters allowed.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Settings associated with the output group.
 */
@property (nonatomic, strong) AWSmedialiveOutputGroupSettings * _Nullable outputGroupSettings;

/**
 Placeholder documentation for __listOfOutput
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutput *> * _Nullable outputs;

@end

/**
 Output Group Settings
 */
@interface AWSmedialiveOutputGroupSettings : AWSModel


/**
 Archive Group Settings
 */
@property (nonatomic, strong) AWSmedialiveArchiveGroupSettings * _Nullable archiveGroupSettings;

/**
 Frame Capture Group Settings
 */
@property (nonatomic, strong) AWSmedialiveFrameCaptureGroupSettings * _Nullable frameCaptureGroupSettings;

/**
 Hls Group Settings
 */
@property (nonatomic, strong) AWSmedialiveHlsGroupSettings * _Nullable hlsGroupSettings;

/**
 Media Package Group Settings
 */
@property (nonatomic, strong) AWSmedialiveMediaPackageGroupSettings * _Nullable mediaPackageGroupSettings;

/**
 Ms Smooth Group Settings
 */
@property (nonatomic, strong) AWSmedialiveMsSmoothGroupSettings * _Nullable msSmoothGroupSettings;

/**
 Multiplex Group Settings
 */
@property (nonatomic, strong) AWSmedialiveMultiplexGroupSettings * _Nullable multiplexGroupSettings;

/**
 Rtmp Group Settings
 */
@property (nonatomic, strong) AWSmedialiveRtmpGroupSettings * _Nullable rtmpGroupSettings;

/**
 Udp Group Settings
 */
@property (nonatomic, strong) AWSmedialiveUdpGroupSettings * _Nullable udpGroupSettings;

@end

/**
 Reference to an OutputDestination ID defined in the channel
 */
@interface AWSmedialiveOutputLocationRef : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable destinationRefId;

@end

/**
 Output Settings
 */
@interface AWSmedialiveOutputSettings : AWSModel


/**
 Archive Output Settings
 */
@property (nonatomic, strong) AWSmedialiveArchiveOutputSettings * _Nullable archiveOutputSettings;

/**
 Frame Capture Output Settings
 */
@property (nonatomic, strong) AWSmedialiveFrameCaptureOutputSettings * _Nullable frameCaptureOutputSettings;

/**
 Hls Output Settings
 */
@property (nonatomic, strong) AWSmedialiveHlsOutputSettings * _Nullable hlsOutputSettings;

/**
 Media Package Output Settings
 */
@property (nonatomic, strong) AWSmedialiveMediaPackageOutputSettings * _Nullable mediaPackageOutputSettings;

/**
 Ms Smooth Output Settings
 */
@property (nonatomic, strong) AWSmedialiveMsSmoothOutputSettings * _Nullable msSmoothOutputSettings;

/**
 Multiplex Output Settings
 */
@property (nonatomic, strong) AWSmedialiveMultiplexOutputSettings * _Nullable multiplexOutputSettings;

/**
 Rtmp Output Settings
 */
@property (nonatomic, strong) AWSmedialiveRtmpOutputSettings * _Nullable rtmpOutputSettings;

/**
 Udp Output Settings
 */
@property (nonatomic, strong) AWSmedialiveUdpOutputSettings * _Nullable udpOutputSettings;

@end

/**
 Pass Through Settings
 */
@interface AWSmedialivePassThroughSettings : AWSModel


@end

/**
 Settings for the action to set pause state of a channel.
 */
@interface AWSmedialivePauseStateScheduleActionSettings : AWSModel


/**
 Placeholder documentation for __listOfPipelinePauseStateSettings
 */
@property (nonatomic, strong) NSArray<AWSmedialivePipelinePauseStateSettings *> * _Nullable pipelines;

@end

/**
 Runtime details of a pipeline when a channel is running.
 */
@interface AWSmedialivePipelineDetail : AWSModel


/**
 The name of the active input attachment currently being ingested by this pipeline.
 */
@property (nonatomic, strong) NSString * _Nullable activeInputAttachmentName;

/**
 The name of the input switch schedule action that occurred most recently and that resulted in the switch to the current input attachment for this pipeline.
 */
@property (nonatomic, strong) NSString * _Nullable activeInputSwitchActionName;

/**
 Pipeline ID
 */
@property (nonatomic, strong) NSString * _Nullable pipelineId;

@end

/**
 Settings for pausing a pipeline.
 Required parameters: [PipelineId]
 */
@interface AWSmedialivePipelinePauseStateSettings : AWSModel


/**
 Pipeline ID to pause ("PIPELINE_0" or "PIPELINE_1").
 */
@property (nonatomic, assign) AWSmedialivePipelineId pipelineId;

@end

/**
 PurchaseOffering request
 Required parameters: [Count]
 */
@interface AWSmedialivePurchaseOffering : AWSModel


/**
 Number of resources
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 Name for the new reservation
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Unique request ID to be specified. This is needed to prevent retries from creating multiple resources.
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 Requested reservation start time (UTC) in ISO-8601 format. The specified time must be between the first day of the current month and one year from now. If no value is given, the default is now.
 */
@property (nonatomic, strong) NSString * _Nullable start;

/**
 A collection of key-value pairs
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for PurchaseOfferingRequest
 Required parameters: [OfferingId, Count]
 */
@interface AWSmedialivePurchaseOfferingRequest : AWSRequest


/**
 Number of resources
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 Name for the new reservation
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Offering to purchase, e.g. '87654321'
 */
@property (nonatomic, strong) NSString * _Nullable offeringId;

/**
 Unique request ID to be specified. This is needed to prevent retries from creating multiple resources.
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 Requested reservation start time (UTC) in ISO-8601 format. The specified time must be between the first day of the current month and one year from now. If no value is given, the default is now.
 */
@property (nonatomic, strong) NSString * _Nullable start;

/**
 A collection of key-value pairs
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for PurchaseOfferingResponse
 */
@interface AWSmedialivePurchaseOfferingResponse : AWSModel


/**
 Reserved resources available to use
 */
@property (nonatomic, strong) AWSmedialiveReservation * _Nullable reservation;

@end

/**
 PurchaseOffering response
 */
@interface AWSmedialivePurchaseOfferingResultModel : AWSModel


/**
 Reserved resources available to use
 */
@property (nonatomic, strong) AWSmedialiveReservation * _Nullable reservation;

@end

/**
 Rec601 Settings
 */
@interface AWSmedialiveRec601Settings : AWSModel


@end

/**
 Rec709 Settings
 */
@interface AWSmedialiveRec709Settings : AWSModel


@end

/**
 Remix Settings
 Required parameters: [ChannelMappings]
 */
@interface AWSmedialiveRemixSettings : AWSModel


/**
 Mapping of input channels to output channels, with appropriate gain adjustments.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveAudioChannelMapping *> * _Nullable channelMappings;

/**
 Number of input channels to be used.
 */
@property (nonatomic, strong) NSNumber * _Nullable channelsIn;

/**
 Number of output channels to be produced. Valid values: 1, 2, 4, 6, 8
 */
@property (nonatomic, strong) NSNumber * _Nullable channelsOut;

@end

/**
 Reserved resources available to use
 */
@interface AWSmedialiveReservation : AWSModel


/**
 Unique reservation ARN, e.g. 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 Number of reserved resources
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 Lease duration, e.g. '12'
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 Units for duration, e.g. 'MONTHS'
 */
@property (nonatomic, assign) AWSmedialiveOfferingDurationUnits durationUnits;

/**
 Reservation UTC end date and time in ISO-8601 format, e.g. '2019-03-01T00:00:00'
 */
@property (nonatomic, strong) NSString * _Nullable end;

/**
 One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT offering
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 User specified reservation name
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and standard VQ in US West (Oregon)'
 */
@property (nonatomic, strong) NSString * _Nullable offeringDescription;

/**
 Unique offering ID, e.g. '87654321'
 */
@property (nonatomic, strong) NSString * _Nullable offeringId;

/**
 Offering type, e.g. 'NO_UPFRONT'
 */
@property (nonatomic, assign) AWSmedialiveOfferingType offeringType;

/**
 AWS region, e.g. 'us-west-2'
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 Unique reservation ID, e.g. '1234567'
 */
@property (nonatomic, strong) NSString * _Nullable reservationId;

/**
 Resource configuration details
 */
@property (nonatomic, strong) AWSmedialiveReservationResourceSpecification * _Nullable resourceSpecification;

/**
 Reservation UTC start date and time in ISO-8601 format, e.g. '2018-03-01T00:00:00'
 */
@property (nonatomic, strong) NSString * _Nullable start;

/**
 Current state of reservation, e.g. 'ACTIVE'
 */
@property (nonatomic, assign) AWSmedialiveReservationState state;

/**
 A collection of key-value pairs
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Recurring usage charge for each reserved resource, e.g. '157.0'
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 Resource configuration (codec, resolution, bitrate, ...)
 */
@interface AWSmedialiveReservationResourceSpecification : AWSModel


/**
 Channel class, e.g. 'STANDARD'
 */
@property (nonatomic, assign) AWSmedialiveChannelClass channelClass;

/**
 Codec, e.g. 'AVC'
 */
@property (nonatomic, assign) AWSmedialiveReservationCodec codec;

/**
 Maximum bitrate, e.g. 'MAX_20_MBPS'
 */
@property (nonatomic, assign) AWSmedialiveReservationMaximumBitrate maximumBitrate;

/**
 Maximum framerate, e.g. 'MAX_30_FPS' (Outputs only)
 */
@property (nonatomic, assign) AWSmedialiveReservationMaximumFramerate maximumFramerate;

/**
 Resolution, e.g. 'HD'
 */
@property (nonatomic, assign) AWSmedialiveReservationResolution resolution;

/**
 Resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'
 */
@property (nonatomic, assign) AWSmedialiveReservationResourceType resourceType;

/**
 Special feature, e.g. 'AUDIO_NORMALIZATION' (Channels only)
 */
@property (nonatomic, assign) AWSmedialiveReservationSpecialFeature specialFeature;

/**
 Video quality, e.g. 'STANDARD' (Outputs only)
 */
@property (nonatomic, assign) AWSmedialiveReservationVideoQuality videoQuality;

@end

/**
 Placeholder documentation for ResourceConflict
 */
@interface AWSmedialiveResourceConflict : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Placeholder documentation for ResourceNotFound
 */
@interface AWSmedialiveResourceNotFound : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Rtmp Caption Info Destination Settings
 */
@interface AWSmedialiveRtmpCaptionInfoDestinationSettings : AWSModel


@end

/**
 Rtmp Group Settings
 */
@interface AWSmedialiveRtmpGroupSettings : AWSModel


/**
 Authentication scheme to use when connecting with CDN
 */
@property (nonatomic, assign) AWSmedialiveAuthenticationScheme authenticationScheme;

/**
 Controls behavior when content cache fills up. If remote origin server stalls the RTMP connection and does not accept content fast enough the 'Media Cache' will fill up. When the cache reaches the duration specified by cacheLength the cache will stop accepting new content. If set to disconnectImmediately, the RTMP output will force a disconnect. Clear the media cache, and reconnect after restartDelay seconds. If set to waitForServer, the RTMP output will wait up to 5 minutes to allow the origin server to begin accepting data again.
 */
@property (nonatomic, assign) AWSmedialiveRtmpCacheFullBehavior cacheFullBehavior;

/**
 Cache length, in seconds, is used to calculate buffer size.
 */
@property (nonatomic, strong) NSNumber * _Nullable cacheLength;

/**
 Controls the types of data that passes to onCaptionInfo outputs.If set to 'all' then 608 and 708 carried DTVCC data will be passed.If set to 'field1AndField2608' then DTVCC data will be stripped out, but 608 data from both fields will be passed. If set to 'field1608' then only the data carried in 608 from field 1 video will be passed.
 */
@property (nonatomic, assign) AWSmedialiveRtmpCaptionData captionData;

/**
 Controls the behavior of this RTMP group if input becomes unavailable.- emitOutput: Emit a slate until input returns. - pauseOutput: Stop transmitting data until input returns. This does not close the underlying RTMP connection.
 */
@property (nonatomic, assign) AWSmedialiveInputLossActionForRtmpOut inputLossAction;

/**
 If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0 means never restart.
 */
@property (nonatomic, strong) NSNumber * _Nullable restartDelay;

@end

/**
 Rtmp Output Settings
 Required parameters: [Destination]
 */
@interface AWSmedialiveRtmpOutputSettings : AWSModel


/**
 If set to verifyAuthenticity, verify the tls certificate chain to a trusted Certificate Authority (CA).This will cause rtmps outputs with self-signed certificates to fail.
 */
@property (nonatomic, assign) AWSmedialiveRtmpOutputCertificateMode certificateMode;

/**
 Number of seconds to wait before retrying a connection to the Flash Media server if the connection is lost.
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionRetryInterval;

/**
 The RTMP endpoint excluding the stream name (eg. rtmp://host/appname). For connection to Akamai, a username and password must be supplied. URI fields accept format identifiers.
 */
@property (nonatomic, strong) AWSmedialiveOutputLocationRef * _Nullable destination;

/**
 Number of retry attempts.
 */
@property (nonatomic, strong) NSNumber * _Nullable numRetries;

@end

/**
 Contains information on a single schedule action.
 Required parameters: [ActionName, ScheduleActionStartSettings, ScheduleActionSettings]
 */
@interface AWSmedialiveScheduleAction : AWSModel


/**
 The name of the action, must be unique within the schedule. This name provides the main reference to an action once it is added to the schedule. A name is unique if it is no longer in the schedule. The schedule is automatically cleaned up to remove actions with a start time of more than 1 hour ago (approximately) so at that point a name can be reused.
 */
@property (nonatomic, strong) NSString * _Nullable actionName;

/**
 Settings for this schedule action.
 */
@property (nonatomic, strong) AWSmedialiveScheduleActionSettings * _Nullable scheduleActionSettings;

/**
 The time for the action to start in the channel.
 */
@property (nonatomic, strong) AWSmedialiveScheduleActionStartSettings * _Nullable scheduleActionStartSettings;

@end

/**
 Holds the settings for a single schedule action.
 */
@interface AWSmedialiveScheduleActionSettings : AWSModel


/**
 Action to insert HLS ID3 segment tagging
 */
@property (nonatomic, strong) AWSmedialiveHlsId3SegmentTaggingScheduleActionSettings * _Nullable hlsId3SegmentTaggingSettings;

/**
 Action to insert HLS metadata
 */
@property (nonatomic, strong) AWSmedialiveHlsTimedMetadataScheduleActionSettings * _Nullable hlsTimedMetadataSettings;

/**
 Action to switch the input
 */
@property (nonatomic, strong) AWSmedialiveInputSwitchScheduleActionSettings * _Nullable inputSwitchSettings;

/**
 Action to pause or unpause one or both channel pipelines
 */
@property (nonatomic, strong) AWSmedialivePauseStateScheduleActionSettings * _Nullable pauseStateSettings;

/**
 Action to insert SCTE-35 return_to_network message
 */
@property (nonatomic, strong) AWSmedialiveScte35ReturnToNetworkScheduleActionSettings * _Nullable scte35ReturnToNetworkSettings;

/**
 Action to insert SCTE-35 splice_insert message
 */
@property (nonatomic, strong) AWSmedialiveScte35SpliceInsertScheduleActionSettings * _Nullable scte35SpliceInsertSettings;

/**
 Action to insert SCTE-35 time_signal message
 */
@property (nonatomic, strong) AWSmedialiveScte35TimeSignalScheduleActionSettings * _Nullable scte35TimeSignalSettings;

/**
 Action to activate a static image overlay
 */
@property (nonatomic, strong) AWSmedialiveStaticImageActivateScheduleActionSettings * _Nullable staticImageActivateSettings;

/**
 Action to deactivate a static image overlay
 */
@property (nonatomic, strong) AWSmedialiveStaticImageDeactivateScheduleActionSettings * _Nullable staticImageDeactivateSettings;

@end

/**
 Settings to specify when an action should occur. Only one of the options must be selected.
 */
@interface AWSmedialiveScheduleActionStartSettings : AWSModel


/**
 Option for specifying the start time for an action.
 */
@property (nonatomic, strong) AWSmedialiveFixedModeScheduleActionStartSettings * _Nullable fixedModeScheduleActionStartSettings;

/**
 Option for specifying an action as relative to another action.
 */
@property (nonatomic, strong) AWSmedialiveFollowModeScheduleActionStartSettings * _Nullable followModeScheduleActionStartSettings;

/**
 Option for specifying an action that should be applied immediately.
 */
@property (nonatomic, strong) AWSmedialiveImmediateModeScheduleActionStartSettings * _Nullable immediateModeScheduleActionStartSettings;

@end

/**
 Result of a schedule deletion.
 */
@interface AWSmedialiveScheduleDeleteResultModel : AWSModel


@end

/**
 Results of a schedule describe.
 Required parameters: [ScheduleActions]
 */
@interface AWSmedialiveScheduleDescribeResultModel : AWSModel


/**
 The next token; for use in pagination.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 The list of actions in the schedule.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveScheduleAction *> * _Nullable scheduleActions;

@end

/**
 Scte20 Plus Embedded Destination Settings
 */
@interface AWSmedialiveScte20PlusEmbeddedDestinationSettings : AWSModel


@end

/**
 Scte20 Source Settings
 */
@interface AWSmedialiveScte20SourceSettings : AWSModel


/**
 If upconvert, 608 data is both passed through via the "608 compatibility bytes" fields of the 708 wrapper as well as translated into 708. 708 data present in the source content will be discarded.
 */
@property (nonatomic, assign) AWSmedialiveScte20Convert608To708 convert608To708;

/**
 Specifies the 608/708 channel number within the video track from which to extract captions. Unused for passthrough.
 */
@property (nonatomic, strong) NSNumber * _Nullable source608ChannelNumber;

@end

/**
 Scte27 Destination Settings
 */
@interface AWSmedialiveScte27DestinationSettings : AWSModel


@end

/**
 Scte27 Source Settings
 */
@interface AWSmedialiveScte27SourceSettings : AWSModel


/**
 The pid field is used in conjunction with the caption selector languageCode field as follows: - Specify PID and Language: Extracts captions from that PID; the language is "informational". - Specify PID and omit Language: Extracts the specified PID. - Omit PID and specify Language: Extracts the specified language, whichever PID that happens to be. - Omit PID and omit Language: Valid only if source is DVB-Sub that is being passed through; all languages will be passed through.
 */
@property (nonatomic, strong) NSNumber * _Nullable pid;

@end

/**
 Corresponds to SCTE-35 delivery_not_restricted_flag parameter. To declare delivery restrictions, include this element and its four "restriction" flags. To declare that there are no restrictions, omit this element.
 Required parameters: [DeviceRestrictions, ArchiveAllowedFlag, WebDeliveryAllowedFlag, NoRegionalBlackoutFlag]
 */
@interface AWSmedialiveScte35DeliveryRestrictions : AWSModel


/**
 Corresponds to SCTE-35 archive_allowed_flag.
 */
@property (nonatomic, assign) AWSmedialiveScte35ArchiveAllowedFlag archiveAllowedFlag;

/**
 Corresponds to SCTE-35 device_restrictions parameter.
 */
@property (nonatomic, assign) AWSmedialiveScte35DeviceRestrictions deviceRestrictions;

/**
 Corresponds to SCTE-35 no_regional_blackout_flag parameter.
 */
@property (nonatomic, assign) AWSmedialiveScte35NoRegionalBlackoutFlag noRegionalBlackoutFlag;

/**
 Corresponds to SCTE-35 web_delivery_allowed_flag parameter.
 */
@property (nonatomic, assign) AWSmedialiveScte35WebDeliveryAllowedFlag webDeliveryAllowedFlag;

@end

/**
 Holds one set of SCTE-35 Descriptor Settings.
 Required parameters: [Scte35DescriptorSettings]
 */
@interface AWSmedialiveScte35Descriptor : AWSModel


/**
 SCTE-35 Descriptor Settings.
 */
@property (nonatomic, strong) AWSmedialiveScte35DescriptorSettings * _Nullable scte35DescriptorSettings;

@end

/**
 SCTE-35 Descriptor settings.
 Required parameters: [SegmentationDescriptorScte35DescriptorSettings]
 */
@interface AWSmedialiveScte35DescriptorSettings : AWSModel


/**
 SCTE-35 Segmentation Descriptor.
 */
@property (nonatomic, strong) AWSmedialiveScte35SegmentationDescriptor * _Nullable segmentationDescriptorScte35DescriptorSettings;

@end

/**
 Settings for a SCTE-35 return_to_network message.
 Required parameters: [SpliceEventId]
 */
@interface AWSmedialiveScte35ReturnToNetworkScheduleActionSettings : AWSModel


/**
 The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.
 */
@property (nonatomic, strong) NSNumber * _Nullable spliceEventId;

@end

/**
 Corresponds to SCTE-35 segmentation_descriptor.
 Required parameters: [SegmentationEventId, SegmentationCancelIndicator]
 */
@interface AWSmedialiveScte35SegmentationDescriptor : AWSModel


/**
 Holds the four SCTE-35 delivery restriction parameters.
 */
@property (nonatomic, strong) AWSmedialiveScte35DeliveryRestrictions * _Nullable deliveryRestrictions;

/**
 Corresponds to SCTE-35 segment_num. A value that is valid for the specified segmentation_type_id.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentNum;

/**
 Corresponds to SCTE-35 segmentation_event_cancel_indicator.
 */
@property (nonatomic, assign) AWSmedialiveScte35SegmentationCancelIndicator segmentationCancelIndicator;

/**
 Corresponds to SCTE-35 segmentation_duration. Optional. The duration for the time_signal, in 90 KHz ticks. To convert seconds to ticks, multiple the seconds by 90,000. Enter time in 90 KHz clock ticks. If you do not enter a duration, the time_signal will continue until you insert a cancellation message.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentationDuration;

/**
 Corresponds to SCTE-35 segmentation_event_id. 
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentationEventId;

/**
 Corresponds to SCTE-35 segmentation_type_id. One of the segmentation_type_id values listed in the SCTE-35 specification. On the console, enter the ID in decimal (for example, "52"). In the CLI, API, or an SDK, enter the ID in hex (for example, "0x34") or decimal (for example, "52").
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentationTypeId;

/**
 Corresponds to SCTE-35 segmentation_upid. Enter a string containing the hexadecimal representation of the characters that make up the SCTE-35 segmentation_upid value. Must contain an even number of hex characters. Do not include spaces between each hex pair. For example, the ASCII "ADS Information" becomes hex "41445320496e666f726d6174696f6e.
 */
@property (nonatomic, strong) NSString * _Nullable segmentationUpid;

/**
 Corresponds to SCTE-35 segmentation_upid_type. On the console, enter one of the types listed in the SCTE-35 specification, converted to a decimal. For example, "0x0C" hex from the specification is "12" in decimal. In the CLI, API, or an SDK, enter one of the types listed in the SCTE-35 specification, in either hex (for example, "0x0C" ) or in decimal (for example, "12").
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentationUpidType;

/**
 Corresponds to SCTE-35 segments_expected. A value that is valid for the specified segmentation_type_id.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentsExpected;

/**
 Corresponds to SCTE-35 sub_segment_num. A value that is valid for the specified segmentation_type_id.
 */
@property (nonatomic, strong) NSNumber * _Nullable subSegmentNum;

/**
 Corresponds to SCTE-35 sub_segments_expected. A value that is valid for the specified segmentation_type_id.
 */
@property (nonatomic, strong) NSNumber * _Nullable subSegmentsExpected;

@end

/**
 Scte35 Splice Insert
 */
@interface AWSmedialiveScte35SpliceInsert : AWSModel


/**
 When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time. This only applies to embedded SCTE 104/35 messages and does not apply to OOB messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable adAvailOffset;

/**
 When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to 0 will no longer trigger blackouts or Ad Avail slates
 */
@property (nonatomic, assign) AWSmedialiveScte35SpliceInsertNoRegionalBlackoutBehavior noRegionalBlackoutFlag;

/**
 When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to 0 will no longer trigger blackouts or Ad Avail slates
 */
@property (nonatomic, assign) AWSmedialiveScte35SpliceInsertWebDeliveryAllowedBehavior webDeliveryAllowedFlag;

@end

/**
 Settings for a SCTE-35 splice_insert message.
 Required parameters: [SpliceEventId]
 */
@interface AWSmedialiveScte35SpliceInsertScheduleActionSettings : AWSModel


/**
 Optional, the duration for the splice_insert, in 90 KHz ticks. To convert seconds to ticks, multiple the seconds by 90,000. If you enter a duration, there is an expectation that the downstream system can read the duration and cue in at that time. If you do not enter a duration, the splice_insert will continue indefinitely and there is an expectation that you will enter a return_to_network to end the splice_insert at the appropriate time.
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.
 */
@property (nonatomic, strong) NSNumber * _Nullable spliceEventId;

@end

/**
 Scte35 Time Signal Apos
 */
@interface AWSmedialiveScte35TimeSignalApos : AWSModel


/**
 When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time. This only applies to embedded SCTE 104/35 messages and does not apply to OOB messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable adAvailOffset;

/**
 When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to 0 will no longer trigger blackouts or Ad Avail slates
 */
@property (nonatomic, assign) AWSmedialiveScte35AposNoRegionalBlackoutBehavior noRegionalBlackoutFlag;

/**
 When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to 0 will no longer trigger blackouts or Ad Avail slates
 */
@property (nonatomic, assign) AWSmedialiveScte35AposWebDeliveryAllowedBehavior webDeliveryAllowedFlag;

@end

/**
 Settings for a SCTE-35 time_signal.
 Required parameters: [Scte35Descriptors]
 */
@interface AWSmedialiveScte35TimeSignalScheduleActionSettings : AWSModel


/**
 The list of SCTE-35 descriptors accompanying the SCTE-35 time_signal.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveScte35Descriptor *> * _Nullable scte35Descriptors;

@end

/**
 Smpte Tt Destination Settings
 */
@interface AWSmedialiveSmpteTtDestinationSettings : AWSModel


@end

/**
 Standard Hls Settings
 Required parameters: [M3u8Settings]
 */
@interface AWSmedialiveStandardHlsSettings : AWSModel


/**
 List all the audio groups that are used with the video output stream. Input all the audio GROUP-IDs that are associated to the video, separate by ','.
 */
@property (nonatomic, strong) NSString * _Nullable audioRenditionSets;

/**
 Settings information for the .m3u8 container
 */
@property (nonatomic, strong) AWSmedialiveM3u8Settings * _Nullable m3u8Settings;

@end

/**
 Placeholder documentation for StartChannelRequest
 Required parameters: [ChannelId]
 */
@interface AWSmedialiveStartChannelRequest : AWSRequest


/**
 A request to start a channel
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

@end

/**
 Placeholder documentation for StartChannelResponse
 */
@interface AWSmedialiveStartChannelResponse : AWSModel


/**
 The unique arn of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSmedialiveChannelClass channelClass;

/**
 A list of destinations of the channel. For UDP outputs, there is one destination per output. For other types (HLS, for example), there is one destination per packager. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestination *> * _Nullable destinations;

/**
 The endpoints where outgoing connections initiate from
 */
@property (nonatomic, strong) NSArray<AWSmedialiveChannelEgressEndpoint *> * _Nullable egressEndpoints;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSmedialiveEncoderSettings * _Nullable encoderSettings;

/**
 The unique id of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Placeholder documentation for InputSpecification
 */
@property (nonatomic, strong) AWSmedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level being written to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSmedialiveLogLevel logLevel;

/**
 The name of the channel. (user-mutable)
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Runtime details for the pipelines of a running channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialivePipelineDetail *> * _Nullable pipelineDetails;

/**
 The number of currently healthy pipelines.
 */
@property (nonatomic, strong) NSNumber * _Nullable pipelinesRunningCount;

/**
 The Amazon Resource Name (ARN) of the role assumed when running the Channel.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 Placeholder documentation for ChannelState
 */
@property (nonatomic, assign) AWSmedialiveChannelState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for StartMultiplexRequest
 Required parameters: [MultiplexId]
 */
@interface AWSmedialiveStartMultiplexRequest : AWSRequest


/**
 The ID of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

@end

/**
 Placeholder documentation for StartMultiplexResponse
 */
@interface AWSmedialiveStartMultiplexResponse : AWSModel


/**
 The unique arn of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A list of availability zones for the multiplex.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 A list of the multiplex output destinations.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMultiplexOutputDestination *> * _Nullable destinations;

/**
 The unique id of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexSettings * _Nullable multiplexSettings;

/**
 The name of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The number of currently healthy pipelines.
 */
@property (nonatomic, strong) NSNumber * _Nullable pipelinesRunningCount;

/**
 The number of programs in the multiplex.
 */
@property (nonatomic, strong) NSNumber * _Nullable programCount;

/**
 The current state of the multiplex.
 */
@property (nonatomic, assign) AWSmedialiveMultiplexState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Settings to identify the start of the clip.
 */
@interface AWSmedialiveStartTimecode : AWSModel


/**
 The timecode for the frame where you want to start the clip. Optional; if not specified, the clip starts at first frame in the file. Enter the timecode as HH:MM:SS:FF or HH:MM:SS;FF.
 */
@property (nonatomic, strong) NSString * _Nullable timecode;

@end

/**
 Settings for the action to activate a static image.
 Required parameters: [Image]
 */
@interface AWSmedialiveStaticImageActivateScheduleActionSettings : AWSModel


/**
 The duration in milliseconds for the image to remain on the video. If omitted or set to 0 the duration is unlimited and the image will remain until it is explicitly deactivated.
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 The time in milliseconds for the image to fade in. The fade-in starts at the start time of the overlay. Default is 0 (no fade-in).
 */
@property (nonatomic, strong) NSNumber * _Nullable fadeIn;

/**
 Applies only if a duration is specified. The time in milliseconds for the image to fade out. The fade-out starts when the duration time is hit, so it effectively extends the duration. Default is 0 (no fade-out).
 */
@property (nonatomic, strong) NSNumber * _Nullable fadeOut;

/**
 The height of the image when inserted into the video, in pixels. The overlay will be scaled up or down to the specified height. Leave blank to use the native height of the overlay.
 */
@property (nonatomic, strong) NSNumber * _Nullable height;

/**
 The location and filename of the image file to overlay on the video. The file must be a 32-bit BMP, PNG, or TGA file, and must not be larger (in pixels) than the input video.
 */
@property (nonatomic, strong) AWSmedialiveInputLocation * _Nullable image;

/**
 Placement of the left edge of the overlay relative to the left edge of the video frame, in pixels. 0 (the default) is the left edge of the frame. If the placement causes the overlay to extend beyond the right edge of the underlying video, then the overlay is cropped on the right.
 */
@property (nonatomic, strong) NSNumber * _Nullable imageX;

/**
 Placement of the top edge of the overlay relative to the top edge of the video frame, in pixels. 0 (the default) is the top edge of the frame. If the placement causes the overlay to extend beyond the bottom edge of the underlying video, then the overlay is cropped on the bottom.
 */
@property (nonatomic, strong) NSNumber * _Nullable imageY;

/**
 The number of the layer, 0 to 7. There are 8 layers that can be overlaid on the video, each layer with a different image. The layers are in Z order, which means that overlays with higher values of layer are inserted on top of overlays with lower values of layer. Default is 0.
 */
@property (nonatomic, strong) NSNumber * _Nullable layer;

/**
 Opacity of image where 0 is transparent and 100 is fully opaque. Default is 100.
 */
@property (nonatomic, strong) NSNumber * _Nullable opacity;

/**
 The width of the image when inserted into the video, in pixels. The overlay will be scaled up or down to the specified width. Leave blank to use the native width of the overlay.
 */
@property (nonatomic, strong) NSNumber * _Nullable width;

@end

/**
 Settings for the action to deactivate the image in a specific layer.
 */
@interface AWSmedialiveStaticImageDeactivateScheduleActionSettings : AWSModel


/**
 The time in milliseconds for the image to fade out. Default is 0 (no fade-out).
 */
@property (nonatomic, strong) NSNumber * _Nullable fadeOut;

/**
 The image overlay layer to deactivate, 0 to 7. Default is 0.
 */
@property (nonatomic, strong) NSNumber * _Nullable layer;

@end

/**
 Static Key Settings
 Required parameters: [StaticKeyValue]
 */
@interface AWSmedialiveStaticKeySettings : AWSModel


/**
 The URL of the license server used for protecting content.
 */
@property (nonatomic, strong) AWSmedialiveInputLocation * _Nullable keyProviderServer;

/**
 Static key value as a 32 character hexadecimal string.
 */
@property (nonatomic, strong) NSString * _Nullable staticKeyValue;

@end

/**
 Placeholder documentation for StopChannelRequest
 Required parameters: [ChannelId]
 */
@interface AWSmedialiveStopChannelRequest : AWSRequest


/**
 A request to stop a running channel
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

@end

/**
 Placeholder documentation for StopChannelResponse
 */
@interface AWSmedialiveStopChannelResponse : AWSModel


/**
 The unique arn of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSmedialiveChannelClass channelClass;

/**
 A list of destinations of the channel. For UDP outputs, there is one destination per output. For other types (HLS, for example), there is one destination per packager. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestination *> * _Nullable destinations;

/**
 The endpoints where outgoing connections initiate from
 */
@property (nonatomic, strong) NSArray<AWSmedialiveChannelEgressEndpoint *> * _Nullable egressEndpoints;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSmedialiveEncoderSettings * _Nullable encoderSettings;

/**
 The unique id of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Placeholder documentation for InputSpecification
 */
@property (nonatomic, strong) AWSmedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level being written to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSmedialiveLogLevel logLevel;

/**
 The name of the channel. (user-mutable)
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Runtime details for the pipelines of a running channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialivePipelineDetail *> * _Nullable pipelineDetails;

/**
 The number of currently healthy pipelines.
 */
@property (nonatomic, strong) NSNumber * _Nullable pipelinesRunningCount;

/**
 The Amazon Resource Name (ARN) of the role assumed when running the Channel.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 Placeholder documentation for ChannelState
 */
@property (nonatomic, assign) AWSmedialiveChannelState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for StopMultiplexRequest
 Required parameters: [MultiplexId]
 */
@interface AWSmedialiveStopMultiplexRequest : AWSRequest


/**
 The ID of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

@end

/**
 Placeholder documentation for StopMultiplexResponse
 */
@interface AWSmedialiveStopMultiplexResponse : AWSModel


/**
 The unique arn of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A list of availability zones for the multiplex.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 A list of the multiplex output destinations.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMultiplexOutputDestination *> * _Nullable destinations;

/**
 The unique id of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexSettings * _Nullable multiplexSettings;

/**
 The name of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The number of currently healthy pipelines.
 */
@property (nonatomic, strong) NSNumber * _Nullable pipelinesRunningCount;

/**
 The number of programs in the multiplex.
 */
@property (nonatomic, strong) NSNumber * _Nullable programCount;

/**
 The current state of the multiplex.
 */
@property (nonatomic, assign) AWSmedialiveMultiplexState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Settings to identify the end of the clip.
 */
@interface AWSmedialiveStopTimecode : AWSModel


/**
 If you specify a StopTimecode in an input (in order to clip the file), you can specify if you want the clip to exclude (the default) or include the frame specified by the timecode.
 */
@property (nonatomic, assign) AWSmedialiveLastFrameClippingBehavior lastFrameClippingBehavior;

/**
 The timecode for the frame where you want to stop the clip. Optional; if not specified, the clip continues to the end of the file. Enter the timecode as HH:MM:SS:FF or HH:MM:SS;FF.
 */
@property (nonatomic, strong) NSString * _Nullable timecode;

@end

/**
 Placeholder documentation for TagsModel
 */
@interface AWSmedialiveTagsModel : AWSModel


/**
 Placeholder documentation for Tags
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Teletext Destination Settings
 */
@interface AWSmedialiveTeletextDestinationSettings : AWSModel


@end

/**
 Teletext Source Settings
 */
@interface AWSmedialiveTeletextSourceSettings : AWSModel


/**
 Specifies the teletext page number within the data stream from which to extract captions. Range of 0x100 (256) to 0x8FF (2303). Unused for passthrough. Should be specified as a hexadecimal string with no "0x" prefix.
 */
@property (nonatomic, strong) NSString * _Nullable pageNumber;

@end

/**
 Temporal Filter Settings
 */
@interface AWSmedialiveTemporalFilterSettings : AWSModel


/**
 If set to "ENABLED," applies post-filter sharpening to improve visual quality. This is most beneficial when using a noisy or compressed input source and low output bitrates.
 */
@property (nonatomic, assign) AWSmedialiveTemporalFilterPostFilterSharpening postFilterSharpening;

/**
 Filter strength. A higher value produces stronger filtering.
 */
@property (nonatomic, assign) AWSmedialiveTemporalFilterStrength strength;

@end

/**
 Timecode Config
 Required parameters: [Source]
 */
@interface AWSmedialiveTimecodeConfig : AWSModel


/**
 Identifies the source for the timecode that will be associated with the events outputs. -Embedded (embedded): Initialize the output timecode with timecode from the the source.If no embedded timecode is detected in the source, the system falls back to using "Start at 0" (zerobased). -System Clock (systemclock): Use the UTC time. -Start at 0 (zerobased): The time of the first frame of the event will be 00:00:00:00.
 */
@property (nonatomic, assign) AWSmedialiveTimecodeConfigSource source;

/**
 Threshold in frames beyond which output timecode is resynchronized to the input timecode. Discrepancies below this threshold are permitted to avoid unnecessary discontinuities in the output timecode. No timecode sync when this is not specified.
 */
@property (nonatomic, strong) NSNumber * _Nullable syncThreshold;

@end

/**
 Ttml Destination Settings
 */
@interface AWSmedialiveTtmlDestinationSettings : AWSModel


/**
 When set to passthrough, passes through style and position information from a TTML-like input source (TTML, SMPTE-TT, CFF-TT) to the CFF-TT output or TTML output.
 */
@property (nonatomic, assign) AWSmedialiveTtmlDestinationStyleControl styleControl;

@end

/**
 Udp Container Settings
 */
@interface AWSmedialiveUdpContainerSettings : AWSModel


/**
 M2ts Settings
 */
@property (nonatomic, strong) AWSmedialiveM2tsSettings * _Nullable m2tsSettings;

@end

/**
 Udp Group Settings
 */
@interface AWSmedialiveUdpGroupSettings : AWSModel


/**
 Specifies behavior of last resort when input video is lost, and no more backup inputs are available. When dropTs is selected the entire transport stream will stop being emitted.When dropProgram is selected the program can be dropped from the transport stream (and replaced with null packets to meet the TS bitrate requirement).Or, when emitProgram is chosen the transport stream will continue to be produced normally with repeat frames, black frames, or slate frames substituted for the absent input video.
 */
@property (nonatomic, assign) AWSmedialiveInputLossActionForUdpOut inputLossAction;

/**
 Indicates ID3 frame that has the timecode.
 */
@property (nonatomic, assign) AWSmedialiveUdpTimedMetadataId3Frame timedMetadataId3Frame;

/**
 Timed Metadata interval in seconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable timedMetadataId3Period;

@end

/**
 Udp Output Settings
 Required parameters: [Destination, ContainerSettings]
 */
@interface AWSmedialiveUdpOutputSettings : AWSModel


/**
 UDP output buffering in milliseconds. Larger values increase latency through the transcoder but simultaneously assist the transcoder in maintaining a constant, low-jitter UDP/RTP output while accommodating clock recovery, input switching, input disruptions, picture reordering, etc.
 */
@property (nonatomic, strong) NSNumber * _Nullable bufferMsec;

/**
 Udp Container Settings
 */
@property (nonatomic, strong) AWSmedialiveUdpContainerSettings * _Nullable containerSettings;

/**
 Destination address and port number for RTP or UDP packets. Can be unicast or multicast RTP or UDP (eg. rtp://239.10.10.10:5001 or udp://10.100.100.100:5002).
 */
@property (nonatomic, strong) AWSmedialiveOutputLocationRef * _Nullable destination;

/**
 Settings for enabling and adjusting Forward Error Correction on UDP outputs.
 */
@property (nonatomic, strong) AWSmedialiveFecOutputSettings * _Nullable fecOutputSettings;

@end

/**
 Placeholder documentation for UpdateChannel
 */
@interface AWSmedialiveUpdateChannel : AWSModel


/**
 A list of output destinations for this channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestination *> * _Nullable destinations;

/**
 The encoder settings for this channel.
 */
@property (nonatomic, strong) AWSmedialiveEncoderSettings * _Nullable encoderSettings;

/**
 Placeholder documentation for __listOfInputAttachment
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Specification of input for this channel (max. bitrate, resolution, codec, etc.)
 */
@property (nonatomic, strong) AWSmedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level to write to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSmedialiveLogLevel logLevel;

/**
 The name of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 An optional Amazon Resource Name (ARN) of the role to assume when running the Channel. If you do not specify this on an update call but the role was previously set that role will be removed.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 Placeholder documentation for UpdateChannelClass
 Required parameters: [ChannelClass]
 */
@interface AWSmedialiveUpdateChannelClass : AWSModel


/**
 The channel class that you wish to update this channel to use.
 */
@property (nonatomic, assign) AWSmedialiveChannelClass channelClass;

/**
 A list of output destinations for this channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestination *> * _Nullable destinations;

@end

/**
 Channel class that the channel should be updated to.
 Required parameters: [ChannelId, ChannelClass]
 */
@interface AWSmedialiveUpdateChannelClassRequest : AWSRequest


/**
 The channel class that you wish to update this channel to use.
 */
@property (nonatomic, assign) AWSmedialiveChannelClass channelClass;

/**
 Channel Id of the channel whose class should be updated.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 A list of output destinations for this channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestination *> * _Nullable destinations;

@end

/**
 Placeholder documentation for UpdateChannelClassResponse
 */
@interface AWSmedialiveUpdateChannelClassResponse : AWSModel


/**
 Placeholder documentation for Channel
 */
@property (nonatomic, strong) AWSmedialiveChannel * _Nullable channel;

@end

/**
 A request to update a channel.
 Required parameters: [ChannelId]
 */
@interface AWSmedialiveUpdateChannelRequest : AWSRequest


/**
 channel ID
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 A list of output destinations for this channel.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveOutputDestination *> * _Nullable destinations;

/**
 The encoder settings for this channel.
 */
@property (nonatomic, strong) AWSmedialiveEncoderSettings * _Nullable encoderSettings;

/**
 Placeholder documentation for __listOfInputAttachment
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Specification of input for this channel (max. bitrate, resolution, codec, etc.)
 */
@property (nonatomic, strong) AWSmedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level to write to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSmedialiveLogLevel logLevel;

/**
 The name of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 An optional Amazon Resource Name (ARN) of the role to assume when running the Channel. If you do not specify this on an update call but the role was previously set that role will be removed.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 Placeholder documentation for UpdateChannelResponse
 */
@interface AWSmedialiveUpdateChannelResponse : AWSModel


/**
 Placeholder documentation for Channel
 */
@property (nonatomic, strong) AWSmedialiveChannel * _Nullable channel;

@end

/**
 The updated channel's description.
 */
@interface AWSmedialiveUpdateChannelResultModel : AWSModel


/**
 Placeholder documentation for Channel
 */
@property (nonatomic, strong) AWSmedialiveChannel * _Nullable channel;

@end

/**
 Placeholder documentation for UpdateInput
 */
@interface AWSmedialiveUpdateInput : AWSModel


/**
 Destination settings for PUSH type inputs.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputDestinationRequest *> * _Nullable destinations;

/**
 A list of security groups referenced by IDs to attach to the input.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inputSecurityGroups;

/**
 A list of the MediaConnect Flow ARNs that you want to use as the source of the input. You can specify as few as one Flow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a separate Availability Zone as this ensures your EML input is redundant to AZ issues. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMediaConnectFlowRequest *> * _Nullable mediaConnectFlows;

/**
 Name of the input.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The Amazon Resource Name (ARN) of the role this input assumes during and after creation.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 The source URLs for a PULL-type input. Every PULL type input needs exactly two source URLs for redundancy. Only specify sources for PULL type Inputs. Leave Destinations empty. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputSourceRequest *> * _Nullable sources;

@end

/**
 A request to update an input.
 Required parameters: [InputId]
 */
@interface AWSmedialiveUpdateInputRequest : AWSRequest


/**
 Destination settings for PUSH type inputs.
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputDestinationRequest *> * _Nullable destinations;

/**
 Unique ID of the input.
 */
@property (nonatomic, strong) NSString * _Nullable inputId;

/**
 A list of security groups referenced by IDs to attach to the input.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inputSecurityGroups;

/**
 A list of the MediaConnect Flow ARNs that you want to use as the source of the input. You can specify as few as one Flow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a separate Availability Zone as this ensures your EML input is redundant to AZ issues. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveMediaConnectFlowRequest *> * _Nullable mediaConnectFlows;

/**
 Name of the input.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The Amazon Resource Name (ARN) of the role this input assumes during and after creation.
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 The source URLs for a PULL-type input. Every PULL type input needs exactly two source URLs for redundancy. Only specify sources for PULL type Inputs. Leave Destinations empty. 
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputSourceRequest *> * _Nullable sources;

@end

/**
 Placeholder documentation for UpdateInputResponse
 */
@interface AWSmedialiveUpdateInputResponse : AWSModel


/**
 Placeholder documentation for Input
 */
@property (nonatomic, strong) AWSmedialiveInput * _Nullable input;

@end

/**
 Placeholder documentation for UpdateInputResultModel
 */
@interface AWSmedialiveUpdateInputResultModel : AWSModel


/**
 Placeholder documentation for Input
 */
@property (nonatomic, strong) AWSmedialiveInput * _Nullable input;

@end

/**
 The request to update some combination of the Input Security Group name and the IPv4 CIDRs the Input Security Group should allow.
 Required parameters: [InputSecurityGroupId]
 */
@interface AWSmedialiveUpdateInputSecurityGroupRequest : AWSRequest


/**
 The id of the Input Security Group to update.
 */
@property (nonatomic, strong) NSString * _Nullable inputSecurityGroupId;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 List of IPv4 CIDR addresses to whitelist
 */
@property (nonatomic, strong) NSArray<AWSmedialiveInputWhitelistRuleCidr *> * _Nullable whitelistRules;

@end

/**
 Placeholder documentation for UpdateInputSecurityGroupResponse
 */
@interface AWSmedialiveUpdateInputSecurityGroupResponse : AWSModel


/**
 An Input Security Group
 */
@property (nonatomic, strong) AWSmedialiveInputSecurityGroup * _Nullable securityGroup;

@end

/**
 Placeholder documentation for UpdateInputSecurityGroupResultModel
 */
@interface AWSmedialiveUpdateInputSecurityGroupResultModel : AWSModel


/**
 An Input Security Group
 */
@property (nonatomic, strong) AWSmedialiveInputSecurityGroup * _Nullable securityGroup;

@end

/**
 Placeholder documentation for UpdateMultiplex
 */
@interface AWSmedialiveUpdateMultiplex : AWSModel


/**
 The new settings for a multiplex.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexSettings * _Nullable multiplexSettings;

/**
 Name of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 Placeholder documentation for UpdateMultiplexProgram
 */
@interface AWSmedialiveUpdateMultiplexProgram : AWSModel


/**
 The new settings for a multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

@end

/**
 A request to update a program in a multiplex.
 Required parameters: [MultiplexId, ProgramName]
 */
@interface AWSmedialiveUpdateMultiplexProgramRequest : AWSRequest


/**
 The ID of the multiplex of the program to update.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

/**
 The new settings for a multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

/**
 The name of the program to update.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

@end

/**
 Placeholder documentation for UpdateMultiplexProgramResponse
 */
@interface AWSmedialiveUpdateMultiplexProgramResponse : AWSModel


/**
 The updated multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgram * _Nullable multiplexProgram;

@end

/**
 Placeholder documentation for UpdateMultiplexProgramResultModel
 */
@interface AWSmedialiveUpdateMultiplexProgramResultModel : AWSModel


/**
 The updated multiplex program.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexProgram * _Nullable multiplexProgram;

@end

/**
 A request to update a multiplex.
 Required parameters: [MultiplexId]
 */
@interface AWSmedialiveUpdateMultiplexRequest : AWSRequest


/**
 ID of the multiplex to update.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

/**
 The new settings for a multiplex.
 */
@property (nonatomic, strong) AWSmedialiveMultiplexSettings * _Nullable multiplexSettings;

/**
 Name of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 Placeholder documentation for UpdateMultiplexResponse
 */
@interface AWSmedialiveUpdateMultiplexResponse : AWSModel


/**
 The updated multiplex.
 */
@property (nonatomic, strong) AWSmedialiveMultiplex * _Nullable multiplex;

@end

/**
 Placeholder documentation for UpdateMultiplexResultModel
 */
@interface AWSmedialiveUpdateMultiplexResultModel : AWSModel


/**
 The updated multiplex.
 */
@property (nonatomic, strong) AWSmedialiveMultiplex * _Nullable multiplex;

@end

/**
 UpdateReservation request
 */
@interface AWSmedialiveUpdateReservation : AWSModel


/**
 Name of the reservation
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 Request to update a reservation
 Required parameters: [ReservationId]
 */
@interface AWSmedialiveUpdateReservationRequest : AWSRequest


/**
 Name of the reservation
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Unique reservation ID, e.g. '1234567'
 */
@property (nonatomic, strong) NSString * _Nullable reservationId;

@end

/**
 Placeholder documentation for UpdateReservationResponse
 */
@interface AWSmedialiveUpdateReservationResponse : AWSModel


/**
 Reserved resources available to use
 */
@property (nonatomic, strong) AWSmedialiveReservation * _Nullable reservation;

@end

/**
 UpdateReservation response
 */
@interface AWSmedialiveUpdateReservationResultModel : AWSModel


/**
 Reserved resources available to use
 */
@property (nonatomic, strong) AWSmedialiveReservation * _Nullable reservation;

@end

/**
 Placeholder documentation for ValidationError
 */
@interface AWSmedialiveValidationError : AWSModel


/**
 Path to the source of the error.
 */
@property (nonatomic, strong) NSString * _Nullable elementPath;

/**
 The error message.
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

@end

/**
 Video Codec Settings
 */
@interface AWSmedialiveVideoCodecSettings : AWSModel


/**
 Frame Capture Settings
 */
@property (nonatomic, strong) AWSmedialiveFrameCaptureSettings * _Nullable frameCaptureSettings;

/**
 H264 Settings
 */
@property (nonatomic, strong) AWSmedialiveH264Settings * _Nullable h264Settings;

/**
 H265 Settings
 */
@property (nonatomic, strong) AWSmedialiveH265Settings * _Nullable h265Settings;

@end

/**
 Video settings for this stream.
 Required parameters: [Name]
 */
@interface AWSmedialiveVideoDescription : AWSModel


/**
 Video codec settings.
 */
@property (nonatomic, strong) AWSmedialiveVideoCodecSettings * _Nullable codecSettings;

/**
 Output video height, in pixels. Must be an even number. For most codecs, you can leave this field and width blank in order to use the height and width (resolution) from the source. Note, however, that leaving blank is not recommended. For the Frame Capture codec, height and width are required.
 */
@property (nonatomic, strong) NSNumber * _Nullable height;

/**
 The name of this VideoDescription. Outputs will use this name to uniquely identify this Description.Description names should be unique within this Live Event.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Indicates how to respond to the AFD values in the input stream. RESPOND causes input video to be clipped, depending on the AFD value, input display aspect ratio, and output display aspect ratio, and (except for FRAMECAPTURE codec) includes the values in the output. PASSTHROUGH (does not apply to FRAMECAPTURE codec) ignores the AFD values and includes the values in the output, so input video is not clipped. NONE ignores the AFD values and does not include the values through to the output, so input video is not clipped.
 */
@property (nonatomic, assign) AWSmedialiveVideoDescriptionRespondToAfd respondToAfd;

/**
 STRETCHTOOUTPUT configures the output position to stretch the video to the specified output resolution (height and width). This option will override any position value. DEFAULT may insert black boxes (pillar boxes or letter boxes) around the video to provide the specified output resolution.
 */
@property (nonatomic, assign) AWSmedialiveVideoDescriptionScalingBehavior scalingBehavior;

/**
 Changes the strength of the anti-alias filter used for scaling. 0 is the softest setting, 100 is the sharpest. A setting of 50 is recommended for most content.
 */
@property (nonatomic, strong) NSNumber * _Nullable sharpness;

/**
 Output video width, in pixels. Must be an even number. For most codecs, you can leave this field and height blank in order to use the height and width (resolution) from the source. Note, however, that leaving blank is not recommended. For the Frame Capture codec, height and width are required.
 */
@property (nonatomic, strong) NSNumber * _Nullable width;

@end

/**
 Specifies a particular video stream within an input source. An input may have only a single video selector.
 */
@interface AWSmedialiveVideoSelector : AWSModel


/**
 Specifies the color space of an input. This setting works in tandem with colorSpaceUsage and a video description's colorSpaceSettingsChoice to determine if any conversion will be performed.
 */
@property (nonatomic, assign) AWSmedialiveVideoSelectorColorSpace colorSpace;

/**
 Applies only if colorSpace is a value other than follow. This field controls how the value in the colorSpace field will be used. fallback means that when the input does include color space data, that data will be used, but when the input has no color space data, the value in colorSpace will be used. Choose fallback if your input is sometimes missing color space data, but when it does have color space data, that data is correct. force means to always use the value in colorSpace. Choose force if your input usually has no color space data or might have unreliable color space data.
 */
@property (nonatomic, assign) AWSmedialiveVideoSelectorColorSpaceUsage colorSpaceUsage;

/**
 The video selector settings.
 */
@property (nonatomic, strong) AWSmedialiveVideoSelectorSettings * _Nullable selectorSettings;

@end

/**
 Video Selector Pid
 */
@interface AWSmedialiveVideoSelectorPid : AWSModel


/**
 Selects a specific PID from within a video source.
 */
@property (nonatomic, strong) NSNumber * _Nullable pid;

@end

/**
 Video Selector Program Id
 */
@interface AWSmedialiveVideoSelectorProgramId : AWSModel


/**
 Selects a specific program from within a multi-program transport stream. If the program doesn't exist, the first program within the transport stream will be selected by default.
 */
@property (nonatomic, strong) NSNumber * _Nullable programId;

@end

/**
 Video Selector Settings
 */
@interface AWSmedialiveVideoSelectorSettings : AWSModel


/**
 Video Selector Pid
 */
@property (nonatomic, strong) AWSmedialiveVideoSelectorPid * _Nullable videoSelectorPid;

/**
 Video Selector Program Id
 */
@property (nonatomic, strong) AWSmedialiveVideoSelectorProgramId * _Nullable videoSelectorProgramId;

@end

/**
 Webvtt Destination Settings
 */
@interface AWSmedialiveWebvttDestinationSettings : AWSModel


@end

NS_ASSUME_NONNULL_END
