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

FOUNDATION_EXPORT NSString *const AWSMedialiveErrorDomain;

typedef NS_ENUM(NSInteger, AWSMedialiveErrorType) {
    AWSMedialiveErrorUnknown,
    AWSMedialiveErrorBadGateway,
    AWSMedialiveErrorBadRequest,
    AWSMedialiveErrorConflict,
    AWSMedialiveErrorForbidden,
    AWSMedialiveErrorGatewayTimeout,
    AWSMedialiveErrorInternalServerError,
    AWSMedialiveErrorNotFound,
    AWSMedialiveErrorTooManyRequests,
    AWSMedialiveErrorUnprocessableEntity,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAacCodingMode) {
    AWSMedialiveAacCodingModeUnknown,
    AWSMedialiveAacCodingModeAdReceiverMix,
    AWSMedialiveAacCodingModeCodingMode10,
    AWSMedialiveAacCodingModeCodingMode11,
    AWSMedialiveAacCodingModeCodingMode20,
    AWSMedialiveAacCodingModeCodingMode51,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAacInputType) {
    AWSMedialiveAacInputTypeUnknown,
    AWSMedialiveAacInputTypeBroadcasterMixedAd,
    AWSMedialiveAacInputTypeNormal,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAacProfile) {
    AWSMedialiveAacProfileUnknown,
    AWSMedialiveAacProfileHev1,
    AWSMedialiveAacProfileHev2,
    AWSMedialiveAacProfileLc,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAacRateControlMode) {
    AWSMedialiveAacRateControlModeUnknown,
    AWSMedialiveAacRateControlModeCbr,
    AWSMedialiveAacRateControlModeVbr,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAacRawFormat) {
    AWSMedialiveAacRawFormatUnknown,
    AWSMedialiveAacRawFormatLatmLoas,
    AWSMedialiveAacRawFormatNone,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAacSpec) {
    AWSMedialiveAacSpecUnknown,
    AWSMedialiveAacSpecMpeg2,
    AWSMedialiveAacSpecMpeg4,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAacVbrQuality) {
    AWSMedialiveAacVbrQualityUnknown,
    AWSMedialiveAacVbrQualityHigh,
    AWSMedialiveAacVbrQualityLow,
    AWSMedialiveAacVbrQualityMediumHigh,
    AWSMedialiveAacVbrQualityMediumLow,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAc3BitstreamMode) {
    AWSMedialiveAc3BitstreamModeUnknown,
    AWSMedialiveAc3BitstreamModeCommentary,
    AWSMedialiveAc3BitstreamModeCompleteMain,
    AWSMedialiveAc3BitstreamModeDialogue,
    AWSMedialiveAc3BitstreamModeEmergency,
    AWSMedialiveAc3BitstreamModeHearingImpaired,
    AWSMedialiveAc3BitstreamModeMusicAndEffects,
    AWSMedialiveAc3BitstreamModeVisuallyImpaired,
    AWSMedialiveAc3BitstreamModeVoiceOver,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAc3CodingMode) {
    AWSMedialiveAc3CodingModeUnknown,
    AWSMedialiveAc3CodingModeCodingMode10,
    AWSMedialiveAc3CodingModeCodingMode11,
    AWSMedialiveAc3CodingModeCodingMode20,
    AWSMedialiveAc3CodingModeCodingMode32Lfe,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAc3DrcProfile) {
    AWSMedialiveAc3DrcProfileUnknown,
    AWSMedialiveAc3DrcProfileFilmStandard,
    AWSMedialiveAc3DrcProfileNone,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAc3LfeFilter) {
    AWSMedialiveAc3LfeFilterUnknown,
    AWSMedialiveAc3LfeFilterDisabled,
    AWSMedialiveAc3LfeFilterEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAc3MetadataControl) {
    AWSMedialiveAc3MetadataControlUnknown,
    AWSMedialiveAc3MetadataControlFollowInput,
    AWSMedialiveAc3MetadataControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAfdSignaling) {
    AWSMedialiveAfdSignalingUnknown,
    AWSMedialiveAfdSignalingAuto,
    AWSMedialiveAfdSignalingFixed,
    AWSMedialiveAfdSignalingNone,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAudioDescriptionAudioTypeControl) {
    AWSMedialiveAudioDescriptionAudioTypeControlUnknown,
    AWSMedialiveAudioDescriptionAudioTypeControlFollowInput,
    AWSMedialiveAudioDescriptionAudioTypeControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAudioDescriptionLanguageCodeControl) {
    AWSMedialiveAudioDescriptionLanguageCodeControlUnknown,
    AWSMedialiveAudioDescriptionLanguageCodeControlFollowInput,
    AWSMedialiveAudioDescriptionLanguageCodeControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAudioLanguageSelectionPolicy) {
    AWSMedialiveAudioLanguageSelectionPolicyUnknown,
    AWSMedialiveAudioLanguageSelectionPolicyLoose,
    AWSMedialiveAudioLanguageSelectionPolicyStrict,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAudioNormalizationAlgorithm) {
    AWSMedialiveAudioNormalizationAlgorithmUnknown,
    AWSMedialiveAudioNormalizationAlgorithmItu17701,
    AWSMedialiveAudioNormalizationAlgorithmItu17702,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAudioNormalizationAlgorithmControl) {
    AWSMedialiveAudioNormalizationAlgorithmControlUnknown,
    AWSMedialiveAudioNormalizationAlgorithmControlCorrectAudio,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAudioOnlyHlsSegmentType) {
    AWSMedialiveAudioOnlyHlsSegmentTypeUnknown,
    AWSMedialiveAudioOnlyHlsSegmentTypeAac,
    AWSMedialiveAudioOnlyHlsSegmentTypeFmp4,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAudioOnlyHlsTrackType) {
    AWSMedialiveAudioOnlyHlsTrackTypeUnknown,
    AWSMedialiveAudioOnlyHlsTrackTypeAlternateAudioAutoSelect,
    AWSMedialiveAudioOnlyHlsTrackTypeAlternateAudioAutoSelectDefault,
    AWSMedialiveAudioOnlyHlsTrackTypeAlternateAudioNotAutoSelect,
    AWSMedialiveAudioOnlyHlsTrackTypeAudioOnlyVariantStream,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAudioType) {
    AWSMedialiveAudioTypeUnknown,
    AWSMedialiveAudioTypeCleanEffects,
    AWSMedialiveAudioTypeHearingImpaired,
    AWSMedialiveAudioTypeUndefined,
    AWSMedialiveAudioTypeVisualImpairedCommentary,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAuthenticationScheme) {
    AWSMedialiveAuthenticationSchemeUnknown,
    AWSMedialiveAuthenticationSchemeAkamai,
    AWSMedialiveAuthenticationSchemeCommon,
};

typedef NS_ENUM(NSInteger, AWSMedialiveAvailBlankingState) {
    AWSMedialiveAvailBlankingStateUnknown,
    AWSMedialiveAvailBlankingStateDisabled,
    AWSMedialiveAvailBlankingStateEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveBlackoutSlateNetworkEndBlackout) {
    AWSMedialiveBlackoutSlateNetworkEndBlackoutUnknown,
    AWSMedialiveBlackoutSlateNetworkEndBlackoutDisabled,
    AWSMedialiveBlackoutSlateNetworkEndBlackoutEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveBlackoutSlateState) {
    AWSMedialiveBlackoutSlateStateUnknown,
    AWSMedialiveBlackoutSlateStateDisabled,
    AWSMedialiveBlackoutSlateStateEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveBurnInAlignment) {
    AWSMedialiveBurnInAlignmentUnknown,
    AWSMedialiveBurnInAlignmentCentered,
    AWSMedialiveBurnInAlignmentLeft,
    AWSMedialiveBurnInAlignmentSmart,
};

typedef NS_ENUM(NSInteger, AWSMedialiveBurnInBackgroundColor) {
    AWSMedialiveBurnInBackgroundColorUnknown,
    AWSMedialiveBurnInBackgroundColorBlack,
    AWSMedialiveBurnInBackgroundColorNone,
    AWSMedialiveBurnInBackgroundColorWhite,
};

typedef NS_ENUM(NSInteger, AWSMedialiveBurnInFontColor) {
    AWSMedialiveBurnInFontColorUnknown,
    AWSMedialiveBurnInFontColorBlack,
    AWSMedialiveBurnInFontColorBlue,
    AWSMedialiveBurnInFontColorGreen,
    AWSMedialiveBurnInFontColorRed,
    AWSMedialiveBurnInFontColorWhite,
    AWSMedialiveBurnInFontColorYellow,
};

typedef NS_ENUM(NSInteger, AWSMedialiveBurnInOutlineColor) {
    AWSMedialiveBurnInOutlineColorUnknown,
    AWSMedialiveBurnInOutlineColorBlack,
    AWSMedialiveBurnInOutlineColorBlue,
    AWSMedialiveBurnInOutlineColorGreen,
    AWSMedialiveBurnInOutlineColorRed,
    AWSMedialiveBurnInOutlineColorWhite,
    AWSMedialiveBurnInOutlineColorYellow,
};

typedef NS_ENUM(NSInteger, AWSMedialiveBurnInShadowColor) {
    AWSMedialiveBurnInShadowColorUnknown,
    AWSMedialiveBurnInShadowColorBlack,
    AWSMedialiveBurnInShadowColorNone,
    AWSMedialiveBurnInShadowColorWhite,
};

typedef NS_ENUM(NSInteger, AWSMedialiveBurnInTeletextGridControl) {
    AWSMedialiveBurnInTeletextGridControlUnknown,
    AWSMedialiveBurnInTeletextGridControlFixed,
    AWSMedialiveBurnInTeletextGridControlScaled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveChannelClass) {
    AWSMedialiveChannelClassUnknown,
    AWSMedialiveChannelClassStandard,
    AWSMedialiveChannelClassSinglePipeline,
};

typedef NS_ENUM(NSInteger, AWSMedialiveChannelState) {
    AWSMedialiveChannelStateUnknown,
    AWSMedialiveChannelStateCreating,
    AWSMedialiveChannelStateCreateFailed,
    AWSMedialiveChannelStateIdle,
    AWSMedialiveChannelStateStarting,
    AWSMedialiveChannelStateRunning,
    AWSMedialiveChannelStateRecovering,
    AWSMedialiveChannelStateStopping,
    AWSMedialiveChannelStateDeleting,
    AWSMedialiveChannelStateDeleted,
    AWSMedialiveChannelStateUpdating,
    AWSMedialiveChannelStateUpdateFailed,
};

typedef NS_ENUM(NSInteger, AWSMedialiveDeviceSettingsSyncState) {
    AWSMedialiveDeviceSettingsSyncStateUnknown,
    AWSMedialiveDeviceSettingsSyncStateSynced,
    AWSMedialiveDeviceSettingsSyncStateSyncing,
};

typedef NS_ENUM(NSInteger, AWSMedialiveDvbSdtOutputSdt) {
    AWSMedialiveDvbSdtOutputSdtUnknown,
    AWSMedialiveDvbSdtOutputSdtSdtFollow,
    AWSMedialiveDvbSdtOutputSdtSdtFollowIfPresent,
    AWSMedialiveDvbSdtOutputSdtSdtManual,
    AWSMedialiveDvbSdtOutputSdtSdtNone,
};

typedef NS_ENUM(NSInteger, AWSMedialiveDvbSubDestinationAlignment) {
    AWSMedialiveDvbSubDestinationAlignmentUnknown,
    AWSMedialiveDvbSubDestinationAlignmentCentered,
    AWSMedialiveDvbSubDestinationAlignmentLeft,
    AWSMedialiveDvbSubDestinationAlignmentSmart,
};

typedef NS_ENUM(NSInteger, AWSMedialiveDvbSubDestinationBackgroundColor) {
    AWSMedialiveDvbSubDestinationBackgroundColorUnknown,
    AWSMedialiveDvbSubDestinationBackgroundColorBlack,
    AWSMedialiveDvbSubDestinationBackgroundColorNone,
    AWSMedialiveDvbSubDestinationBackgroundColorWhite,
};

typedef NS_ENUM(NSInteger, AWSMedialiveDvbSubDestinationFontColor) {
    AWSMedialiveDvbSubDestinationFontColorUnknown,
    AWSMedialiveDvbSubDestinationFontColorBlack,
    AWSMedialiveDvbSubDestinationFontColorBlue,
    AWSMedialiveDvbSubDestinationFontColorGreen,
    AWSMedialiveDvbSubDestinationFontColorRed,
    AWSMedialiveDvbSubDestinationFontColorWhite,
    AWSMedialiveDvbSubDestinationFontColorYellow,
};

typedef NS_ENUM(NSInteger, AWSMedialiveDvbSubDestinationOutlineColor) {
    AWSMedialiveDvbSubDestinationOutlineColorUnknown,
    AWSMedialiveDvbSubDestinationOutlineColorBlack,
    AWSMedialiveDvbSubDestinationOutlineColorBlue,
    AWSMedialiveDvbSubDestinationOutlineColorGreen,
    AWSMedialiveDvbSubDestinationOutlineColorRed,
    AWSMedialiveDvbSubDestinationOutlineColorWhite,
    AWSMedialiveDvbSubDestinationOutlineColorYellow,
};

typedef NS_ENUM(NSInteger, AWSMedialiveDvbSubDestinationShadowColor) {
    AWSMedialiveDvbSubDestinationShadowColorUnknown,
    AWSMedialiveDvbSubDestinationShadowColorBlack,
    AWSMedialiveDvbSubDestinationShadowColorNone,
    AWSMedialiveDvbSubDestinationShadowColorWhite,
};

typedef NS_ENUM(NSInteger, AWSMedialiveDvbSubDestinationTeletextGridControl) {
    AWSMedialiveDvbSubDestinationTeletextGridControlUnknown,
    AWSMedialiveDvbSubDestinationTeletextGridControlFixed,
    AWSMedialiveDvbSubDestinationTeletextGridControlScaled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3AttenuationControl) {
    AWSMedialiveEac3AttenuationControlUnknown,
    AWSMedialiveEac3AttenuationControlAttenuate3Db,
    AWSMedialiveEac3AttenuationControlNone,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3BitstreamMode) {
    AWSMedialiveEac3BitstreamModeUnknown,
    AWSMedialiveEac3BitstreamModeCommentary,
    AWSMedialiveEac3BitstreamModeCompleteMain,
    AWSMedialiveEac3BitstreamModeEmergency,
    AWSMedialiveEac3BitstreamModeHearingImpaired,
    AWSMedialiveEac3BitstreamModeVisuallyImpaired,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3CodingMode) {
    AWSMedialiveEac3CodingModeUnknown,
    AWSMedialiveEac3CodingModeCodingMode10,
    AWSMedialiveEac3CodingModeCodingMode20,
    AWSMedialiveEac3CodingModeCodingMode32,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3DcFilter) {
    AWSMedialiveEac3DcFilterUnknown,
    AWSMedialiveEac3DcFilterDisabled,
    AWSMedialiveEac3DcFilterEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3DrcLine) {
    AWSMedialiveEac3DrcLineUnknown,
    AWSMedialiveEac3DrcLineFilmLight,
    AWSMedialiveEac3DrcLineFilmStandard,
    AWSMedialiveEac3DrcLineMusicLight,
    AWSMedialiveEac3DrcLineMusicStandard,
    AWSMedialiveEac3DrcLineNone,
    AWSMedialiveEac3DrcLineSpeech,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3DrcRf) {
    AWSMedialiveEac3DrcRfUnknown,
    AWSMedialiveEac3DrcRfFilmLight,
    AWSMedialiveEac3DrcRfFilmStandard,
    AWSMedialiveEac3DrcRfMusicLight,
    AWSMedialiveEac3DrcRfMusicStandard,
    AWSMedialiveEac3DrcRfNone,
    AWSMedialiveEac3DrcRfSpeech,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3LfeControl) {
    AWSMedialiveEac3LfeControlUnknown,
    AWSMedialiveEac3LfeControlLfe,
    AWSMedialiveEac3LfeControlNoLfe,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3LfeFilter) {
    AWSMedialiveEac3LfeFilterUnknown,
    AWSMedialiveEac3LfeFilterDisabled,
    AWSMedialiveEac3LfeFilterEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3MetadataControl) {
    AWSMedialiveEac3MetadataControlUnknown,
    AWSMedialiveEac3MetadataControlFollowInput,
    AWSMedialiveEac3MetadataControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3PassthroughControl) {
    AWSMedialiveEac3PassthroughControlUnknown,
    AWSMedialiveEac3PassthroughControlNoPassthrough,
    AWSMedialiveEac3PassthroughControlWhenPossible,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3PhaseControl) {
    AWSMedialiveEac3PhaseControlUnknown,
    AWSMedialiveEac3PhaseControlNoShift,
    AWSMedialiveEac3PhaseControlShift90Degrees,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3StereoDownmix) {
    AWSMedialiveEac3StereoDownmixUnknown,
    AWSMedialiveEac3StereoDownmixDpl2,
    AWSMedialiveEac3StereoDownmixLoRo,
    AWSMedialiveEac3StereoDownmixLtRt,
    AWSMedialiveEac3StereoDownmixNotIndicated,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3SurroundExMode) {
    AWSMedialiveEac3SurroundExModeUnknown,
    AWSMedialiveEac3SurroundExModeDisabled,
    AWSMedialiveEac3SurroundExModeEnabled,
    AWSMedialiveEac3SurroundExModeNotIndicated,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEac3SurroundMode) {
    AWSMedialiveEac3SurroundModeUnknown,
    AWSMedialiveEac3SurroundModeDisabled,
    AWSMedialiveEac3SurroundModeEnabled,
    AWSMedialiveEac3SurroundModeNotIndicated,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEmbeddedConvert608To708) {
    AWSMedialiveEmbeddedConvert608To708Unknown,
    AWSMedialiveEmbeddedConvert608To708Disabled,
    AWSMedialiveEmbeddedConvert608To708Upconvert,
};

typedef NS_ENUM(NSInteger, AWSMedialiveEmbeddedScte20Detection) {
    AWSMedialiveEmbeddedScte20DetectionUnknown,
    AWSMedialiveEmbeddedScte20DetectionAuto,
    AWSMedialiveEmbeddedScte20DetectionOff,
};

typedef NS_ENUM(NSInteger, AWSMedialiveFecOutputIncludeFec) {
    AWSMedialiveFecOutputIncludeFecUnknown,
    AWSMedialiveFecOutputIncludeFecColumn,
    AWSMedialiveFecOutputIncludeFecColumnAndRow,
};

typedef NS_ENUM(NSInteger, AWSMedialiveFixedAfd) {
    AWSMedialiveFixedAfdUnknown,
    AWSMedialiveFixedAfdAfd0000,
    AWSMedialiveFixedAfdAfd0010,
    AWSMedialiveFixedAfdAfd0011,
    AWSMedialiveFixedAfdAfd0100,
    AWSMedialiveFixedAfdAfd1000,
    AWSMedialiveFixedAfdAfd1001,
    AWSMedialiveFixedAfdAfd1010,
    AWSMedialiveFixedAfdAfd1011,
    AWSMedialiveFixedAfdAfd1101,
    AWSMedialiveFixedAfdAfd1110,
    AWSMedialiveFixedAfdAfd1111,
};

typedef NS_ENUM(NSInteger, AWSMedialiveFmp4NielsenId3Behavior) {
    AWSMedialiveFmp4NielsenId3BehaviorUnknown,
    AWSMedialiveFmp4NielsenId3BehaviorNoPassthrough,
    AWSMedialiveFmp4NielsenId3BehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMedialiveFmp4TimedMetadataBehavior) {
    AWSMedialiveFmp4TimedMetadataBehaviorUnknown,
    AWSMedialiveFmp4TimedMetadataBehaviorNoPassthrough,
    AWSMedialiveFmp4TimedMetadataBehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMedialiveFollowPoint) {
    AWSMedialiveFollowPointUnknown,
    AWSMedialiveFollowPointEnd,
    AWSMedialiveFollowPointStart,
};

typedef NS_ENUM(NSInteger, AWSMedialiveFrameCaptureIntervalUnit) {
    AWSMedialiveFrameCaptureIntervalUnitUnknown,
    AWSMedialiveFrameCaptureIntervalUnitMilliseconds,
    AWSMedialiveFrameCaptureIntervalUnitSeconds,
};

typedef NS_ENUM(NSInteger, AWSMedialiveGlobalConfigurationInputEndAction) {
    AWSMedialiveGlobalConfigurationInputEndActionUnknown,
    AWSMedialiveGlobalConfigurationInputEndActionNone,
    AWSMedialiveGlobalConfigurationInputEndActionSwitchAndLoopInputs,
};

typedef NS_ENUM(NSInteger, AWSMedialiveGlobalConfigurationLowFramerateInputs) {
    AWSMedialiveGlobalConfigurationLowFramerateInputsUnknown,
    AWSMedialiveGlobalConfigurationLowFramerateInputsDisabled,
    AWSMedialiveGlobalConfigurationLowFramerateInputsEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveGlobalConfigurationOutputLockingMode) {
    AWSMedialiveGlobalConfigurationOutputLockingModeUnknown,
    AWSMedialiveGlobalConfigurationOutputLockingModeEpochLocking,
    AWSMedialiveGlobalConfigurationOutputLockingModePipelineLocking,
};

typedef NS_ENUM(NSInteger, AWSMedialiveGlobalConfigurationOutputTimingSource) {
    AWSMedialiveGlobalConfigurationOutputTimingSourceUnknown,
    AWSMedialiveGlobalConfigurationOutputTimingSourceInputClock,
    AWSMedialiveGlobalConfigurationOutputTimingSourceSystemClock,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264AdaptiveQuantization) {
    AWSMedialiveH264AdaptiveQuantizationUnknown,
    AWSMedialiveH264AdaptiveQuantizationHigh,
    AWSMedialiveH264AdaptiveQuantizationHigher,
    AWSMedialiveH264AdaptiveQuantizationLow,
    AWSMedialiveH264AdaptiveQuantizationMax,
    AWSMedialiveH264AdaptiveQuantizationMedium,
    AWSMedialiveH264AdaptiveQuantizationOff,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264ColorMetadata) {
    AWSMedialiveH264ColorMetadataUnknown,
    AWSMedialiveH264ColorMetadataIgnore,
    AWSMedialiveH264ColorMetadataInsert,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264EntropyEncoding) {
    AWSMedialiveH264EntropyEncodingUnknown,
    AWSMedialiveH264EntropyEncodingCabac,
    AWSMedialiveH264EntropyEncodingCavlc,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264FlickerAq) {
    AWSMedialiveH264FlickerAqUnknown,
    AWSMedialiveH264FlickerAqDisabled,
    AWSMedialiveH264FlickerAqEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264ForceFieldPictures) {
    AWSMedialiveH264ForceFieldPicturesUnknown,
    AWSMedialiveH264ForceFieldPicturesDisabled,
    AWSMedialiveH264ForceFieldPicturesEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264FramerateControl) {
    AWSMedialiveH264FramerateControlUnknown,
    AWSMedialiveH264FramerateControlInitializeFromSource,
    AWSMedialiveH264FramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264GopBReference) {
    AWSMedialiveH264GopBReferenceUnknown,
    AWSMedialiveH264GopBReferenceDisabled,
    AWSMedialiveH264GopBReferenceEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264GopSizeUnits) {
    AWSMedialiveH264GopSizeUnitsUnknown,
    AWSMedialiveH264GopSizeUnitsFrames,
    AWSMedialiveH264GopSizeUnitsSeconds,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264Level) {
    AWSMedialiveH264LevelUnknown,
    AWSMedialiveH264LevelH264Level1,
    AWSMedialiveH264LevelH264Level11,
    AWSMedialiveH264LevelH264Level12,
    AWSMedialiveH264LevelH264Level13,
    AWSMedialiveH264LevelH264Level2,
    AWSMedialiveH264LevelH264Level21,
    AWSMedialiveH264LevelH264Level22,
    AWSMedialiveH264LevelH264Level3,
    AWSMedialiveH264LevelH264Level31,
    AWSMedialiveH264LevelH264Level32,
    AWSMedialiveH264LevelH264Level4,
    AWSMedialiveH264LevelH264Level41,
    AWSMedialiveH264LevelH264Level42,
    AWSMedialiveH264LevelH264Level5,
    AWSMedialiveH264LevelH264Level51,
    AWSMedialiveH264LevelH264Level52,
    AWSMedialiveH264LevelH264LevelAuto,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264LookAheadRateControl) {
    AWSMedialiveH264LookAheadRateControlUnknown,
    AWSMedialiveH264LookAheadRateControlHigh,
    AWSMedialiveH264LookAheadRateControlLow,
    AWSMedialiveH264LookAheadRateControlMedium,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264ParControl) {
    AWSMedialiveH264ParControlUnknown,
    AWSMedialiveH264ParControlInitializeFromSource,
    AWSMedialiveH264ParControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264Profile) {
    AWSMedialiveH264ProfileUnknown,
    AWSMedialiveH264ProfileBaseline,
    AWSMedialiveH264ProfileHigh,
    AWSMedialiveH264ProfileHigh10bit,
    AWSMedialiveH264ProfileHigh422,
    AWSMedialiveH264ProfileHigh42210bit,
    AWSMedialiveH264ProfileMain,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264QualityLevel) {
    AWSMedialiveH264QualityLevelUnknown,
    AWSMedialiveH264QualityLevelEnhancedQuality,
    AWSMedialiveH264QualityLevelStandardQuality,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264RateControlMode) {
    AWSMedialiveH264RateControlModeUnknown,
    AWSMedialiveH264RateControlModeCbr,
    AWSMedialiveH264RateControlModeMultiplex,
    AWSMedialiveH264RateControlModeQvbr,
    AWSMedialiveH264RateControlModeVbr,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264ScanType) {
    AWSMedialiveH264ScanTypeUnknown,
    AWSMedialiveH264ScanTypeInterlaced,
    AWSMedialiveH264ScanTypeProgressive,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264SceneChangeDetect) {
    AWSMedialiveH264SceneChangeDetectUnknown,
    AWSMedialiveH264SceneChangeDetectDisabled,
    AWSMedialiveH264SceneChangeDetectEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264SpatialAq) {
    AWSMedialiveH264SpatialAqUnknown,
    AWSMedialiveH264SpatialAqDisabled,
    AWSMedialiveH264SpatialAqEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264SubGopLength) {
    AWSMedialiveH264SubGopLengthUnknown,
    AWSMedialiveH264SubGopLengthDynamic,
    AWSMedialiveH264SubGopLengthFixed,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264Syntax) {
    AWSMedialiveH264SyntaxUnknown,
    AWSMedialiveH264SyntaxDefault,
    AWSMedialiveH264SyntaxRp2027,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264TemporalAq) {
    AWSMedialiveH264TemporalAqUnknown,
    AWSMedialiveH264TemporalAqDisabled,
    AWSMedialiveH264TemporalAqEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH264TimecodeInsertionBehavior) {
    AWSMedialiveH264TimecodeInsertionBehaviorUnknown,
    AWSMedialiveH264TimecodeInsertionBehaviorDisabled,
    AWSMedialiveH264TimecodeInsertionBehaviorPicTimingSei,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265AdaptiveQuantization) {
    AWSMedialiveH265AdaptiveQuantizationUnknown,
    AWSMedialiveH265AdaptiveQuantizationHigh,
    AWSMedialiveH265AdaptiveQuantizationHigher,
    AWSMedialiveH265AdaptiveQuantizationLow,
    AWSMedialiveH265AdaptiveQuantizationMax,
    AWSMedialiveH265AdaptiveQuantizationMedium,
    AWSMedialiveH265AdaptiveQuantizationOff,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265AlternativeTransferFunction) {
    AWSMedialiveH265AlternativeTransferFunctionUnknown,
    AWSMedialiveH265AlternativeTransferFunctionInsert,
    AWSMedialiveH265AlternativeTransferFunctionOmit,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265ColorMetadata) {
    AWSMedialiveH265ColorMetadataUnknown,
    AWSMedialiveH265ColorMetadataIgnore,
    AWSMedialiveH265ColorMetadataInsert,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265FlickerAq) {
    AWSMedialiveH265FlickerAqUnknown,
    AWSMedialiveH265FlickerAqDisabled,
    AWSMedialiveH265FlickerAqEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265GopSizeUnits) {
    AWSMedialiveH265GopSizeUnitsUnknown,
    AWSMedialiveH265GopSizeUnitsFrames,
    AWSMedialiveH265GopSizeUnitsSeconds,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265Level) {
    AWSMedialiveH265LevelUnknown,
    AWSMedialiveH265LevelH265Level1,
    AWSMedialiveH265LevelH265Level2,
    AWSMedialiveH265LevelH265Level21,
    AWSMedialiveH265LevelH265Level3,
    AWSMedialiveH265LevelH265Level31,
    AWSMedialiveH265LevelH265Level4,
    AWSMedialiveH265LevelH265Level41,
    AWSMedialiveH265LevelH265Level5,
    AWSMedialiveH265LevelH265Level51,
    AWSMedialiveH265LevelH265Level52,
    AWSMedialiveH265LevelH265Level6,
    AWSMedialiveH265LevelH265Level61,
    AWSMedialiveH265LevelH265Level62,
    AWSMedialiveH265LevelH265LevelAuto,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265LookAheadRateControl) {
    AWSMedialiveH265LookAheadRateControlUnknown,
    AWSMedialiveH265LookAheadRateControlHigh,
    AWSMedialiveH265LookAheadRateControlLow,
    AWSMedialiveH265LookAheadRateControlMedium,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265Profile) {
    AWSMedialiveH265ProfileUnknown,
    AWSMedialiveH265ProfileMain,
    AWSMedialiveH265ProfileMain10bit,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265RateControlMode) {
    AWSMedialiveH265RateControlModeUnknown,
    AWSMedialiveH265RateControlModeCbr,
    AWSMedialiveH265RateControlModeMultiplex,
    AWSMedialiveH265RateControlModeQvbr,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265ScanType) {
    AWSMedialiveH265ScanTypeUnknown,
    AWSMedialiveH265ScanTypeProgressive,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265SceneChangeDetect) {
    AWSMedialiveH265SceneChangeDetectUnknown,
    AWSMedialiveH265SceneChangeDetectDisabled,
    AWSMedialiveH265SceneChangeDetectEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265Tier) {
    AWSMedialiveH265TierUnknown,
    AWSMedialiveH265TierHigh,
    AWSMedialiveH265TierMain,
};

typedef NS_ENUM(NSInteger, AWSMedialiveH265TimecodeInsertionBehavior) {
    AWSMedialiveH265TimecodeInsertionBehaviorUnknown,
    AWSMedialiveH265TimecodeInsertionBehaviorDisabled,
    AWSMedialiveH265TimecodeInsertionBehaviorPicTimingSei,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsAdMarkers) {
    AWSMedialiveHlsAdMarkersUnknown,
    AWSMedialiveHlsAdMarkersAdobe,
    AWSMedialiveHlsAdMarkersElemental,
    AWSMedialiveHlsAdMarkersElementalScte35,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsAkamaiHttpTransferMode) {
    AWSMedialiveHlsAkamaiHttpTransferModeUnknown,
    AWSMedialiveHlsAkamaiHttpTransferModeChunked,
    AWSMedialiveHlsAkamaiHttpTransferModeNonChunked,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsCaptionLanguageSetting) {
    AWSMedialiveHlsCaptionLanguageSettingUnknown,
    AWSMedialiveHlsCaptionLanguageSettingInsert,
    AWSMedialiveHlsCaptionLanguageSettingNone,
    AWSMedialiveHlsCaptionLanguageSettingOmit,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsClientCache) {
    AWSMedialiveHlsClientCacheUnknown,
    AWSMedialiveHlsClientCacheDisabled,
    AWSMedialiveHlsClientCacheEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsCodecSpecification) {
    AWSMedialiveHlsCodecSpecificationUnknown,
    AWSMedialiveHlsCodecSpecificationRfc4281,
    AWSMedialiveHlsCodecSpecificationRfc6381,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsDirectoryStructure) {
    AWSMedialiveHlsDirectoryStructureUnknown,
    AWSMedialiveHlsDirectoryStructureSingleDirectory,
    AWSMedialiveHlsDirectoryStructureSubdirectoryPerStream,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsEncryptionType) {
    AWSMedialiveHlsEncryptionTypeUnknown,
    AWSMedialiveHlsEncryptionTypeAes128,
    AWSMedialiveHlsEncryptionTypeSampleAes,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsH265PackagingType) {
    AWSMedialiveHlsH265PackagingTypeUnknown,
    AWSMedialiveHlsH265PackagingTypeHev1,
    AWSMedialiveHlsH265PackagingTypeHvc1,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsId3SegmentTaggingState) {
    AWSMedialiveHlsId3SegmentTaggingStateUnknown,
    AWSMedialiveHlsId3SegmentTaggingStateDisabled,
    AWSMedialiveHlsId3SegmentTaggingStateEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsIvInManifest) {
    AWSMedialiveHlsIvInManifestUnknown,
    AWSMedialiveHlsIvInManifestExclude,
    AWSMedialiveHlsIvInManifestInclude,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsIvSource) {
    AWSMedialiveHlsIvSourceUnknown,
    AWSMedialiveHlsIvSourceExplicit,
    AWSMedialiveHlsIvSourceFollowsSegmentNumber,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsManifestCompression) {
    AWSMedialiveHlsManifestCompressionUnknown,
    AWSMedialiveHlsManifestCompressionGzip,
    AWSMedialiveHlsManifestCompressionNone,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsManifestDurationFormat) {
    AWSMedialiveHlsManifestDurationFormatUnknown,
    AWSMedialiveHlsManifestDurationFormatFloatingPoint,
    AWSMedialiveHlsManifestDurationFormatInteger,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsMediaStoreStorageClass) {
    AWSMedialiveHlsMediaStoreStorageClassUnknown,
    AWSMedialiveHlsMediaStoreStorageClassTemporal,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsMode) {
    AWSMedialiveHlsModeUnknown,
    AWSMedialiveHlsModeLive,
    AWSMedialiveHlsModeVod,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsOutputSelection) {
    AWSMedialiveHlsOutputSelectionUnknown,
    AWSMedialiveHlsOutputSelectionManifestsAndSegments,
    AWSMedialiveHlsOutputSelectionSegmentsOnly,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsProgramDateTime) {
    AWSMedialiveHlsProgramDateTimeUnknown,
    AWSMedialiveHlsProgramDateTimeExclude,
    AWSMedialiveHlsProgramDateTimeInclude,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsRedundantManifest) {
    AWSMedialiveHlsRedundantManifestUnknown,
    AWSMedialiveHlsRedundantManifestDisabled,
    AWSMedialiveHlsRedundantManifestEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsSegmentationMode) {
    AWSMedialiveHlsSegmentationModeUnknown,
    AWSMedialiveHlsSegmentationModeUseInputSegmentation,
    AWSMedialiveHlsSegmentationModeUseSegmentDuration,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsStreamInfResolution) {
    AWSMedialiveHlsStreamInfResolutionUnknown,
    AWSMedialiveHlsStreamInfResolutionExclude,
    AWSMedialiveHlsStreamInfResolutionInclude,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsTimedMetadataId3Frame) {
    AWSMedialiveHlsTimedMetadataId3FrameUnknown,
    AWSMedialiveHlsTimedMetadataId3FrameNone,
    AWSMedialiveHlsTimedMetadataId3FramePriv,
    AWSMedialiveHlsTimedMetadataId3FrameTdrl,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsTsFileMode) {
    AWSMedialiveHlsTsFileModeUnknown,
    AWSMedialiveHlsTsFileModeSegmentedFiles,
    AWSMedialiveHlsTsFileModeSingleFile,
};

typedef NS_ENUM(NSInteger, AWSMedialiveHlsWebdavHttpTransferMode) {
    AWSMedialiveHlsWebdavHttpTransferModeUnknown,
    AWSMedialiveHlsWebdavHttpTransferModeChunked,
    AWSMedialiveHlsWebdavHttpTransferModeNonChunked,
};

typedef NS_ENUM(NSInteger, AWSMedialiveIFrameOnlyPlaylistType) {
    AWSMedialiveIFrameOnlyPlaylistTypeUnknown,
    AWSMedialiveIFrameOnlyPlaylistTypeDisabled,
    AWSMedialiveIFrameOnlyPlaylistTypeStandard,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputClass) {
    AWSMedialiveInputClassUnknown,
    AWSMedialiveInputClassStandard,
    AWSMedialiveInputClassSinglePipeline,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputCodec) {
    AWSMedialiveInputCodecUnknown,
    AWSMedialiveInputCodecMpeg2,
    AWSMedialiveInputCodecAvc,
    AWSMedialiveInputCodecHevc,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputDeblockFilter) {
    AWSMedialiveInputDeblockFilterUnknown,
    AWSMedialiveInputDeblockFilterDisabled,
    AWSMedialiveInputDeblockFilterEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputDenoiseFilter) {
    AWSMedialiveInputDenoiseFilterUnknown,
    AWSMedialiveInputDenoiseFilterDisabled,
    AWSMedialiveInputDenoiseFilterEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputDeviceActiveInput) {
    AWSMedialiveInputDeviceActiveInputUnknown,
    AWSMedialiveInputDeviceActiveInputHdmi,
    AWSMedialiveInputDeviceActiveInputSdi,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputDeviceConfiguredInput) {
    AWSMedialiveInputDeviceConfiguredInputUnknown,
    AWSMedialiveInputDeviceConfiguredInputAuto,
    AWSMedialiveInputDeviceConfiguredInputHdmi,
    AWSMedialiveInputDeviceConfiguredInputSdi,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputDeviceConnectionState) {
    AWSMedialiveInputDeviceConnectionStateUnknown,
    AWSMedialiveInputDeviceConnectionStateDisconnected,
    AWSMedialiveInputDeviceConnectionStateConnected,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputDeviceIpScheme) {
    AWSMedialiveInputDeviceIpSchemeUnknown,
    AWSMedialiveInputDeviceIpSchemeStatic,
    AWSMedialiveInputDeviceIpSchemeDhcp,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputDeviceScanType) {
    AWSMedialiveInputDeviceScanTypeUnknown,
    AWSMedialiveInputDeviceScanTypeInterlaced,
    AWSMedialiveInputDeviceScanTypeProgressive,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputDeviceState) {
    AWSMedialiveInputDeviceStateUnknown,
    AWSMedialiveInputDeviceStateIdle,
    AWSMedialiveInputDeviceStateStreaming,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputDeviceType) {
    AWSMedialiveInputDeviceTypeUnknown,
    AWSMedialiveInputDeviceTypeHd,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputFilter) {
    AWSMedialiveInputFilterUnknown,
    AWSMedialiveInputFilterAuto,
    AWSMedialiveInputFilterDisabled,
    AWSMedialiveInputFilterForced,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputLossActionForHlsOut) {
    AWSMedialiveInputLossActionForHlsOutUnknown,
    AWSMedialiveInputLossActionForHlsOutEmitOutput,
    AWSMedialiveInputLossActionForHlsOutPauseOutput,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputLossActionForMsSmoothOut) {
    AWSMedialiveInputLossActionForMsSmoothOutUnknown,
    AWSMedialiveInputLossActionForMsSmoothOutEmitOutput,
    AWSMedialiveInputLossActionForMsSmoothOutPauseOutput,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputLossActionForRtmpOut) {
    AWSMedialiveInputLossActionForRtmpOutUnknown,
    AWSMedialiveInputLossActionForRtmpOutEmitOutput,
    AWSMedialiveInputLossActionForRtmpOutPauseOutput,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputLossActionForUdpOut) {
    AWSMedialiveInputLossActionForUdpOutUnknown,
    AWSMedialiveInputLossActionForUdpOutDropProgram,
    AWSMedialiveInputLossActionForUdpOutDropTs,
    AWSMedialiveInputLossActionForUdpOutEmitProgram,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputLossImageType) {
    AWSMedialiveInputLossImageTypeUnknown,
    AWSMedialiveInputLossImageTypeColor,
    AWSMedialiveInputLossImageTypeSlate,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputMaximumBitrate) {
    AWSMedialiveInputMaximumBitrateUnknown,
    AWSMedialiveInputMaximumBitrateMax10Mbps,
    AWSMedialiveInputMaximumBitrateMax20Mbps,
    AWSMedialiveInputMaximumBitrateMax50Mbps,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputPreference) {
    AWSMedialiveInputPreferenceUnknown,
    AWSMedialiveInputPreferenceEqualInputPreference,
    AWSMedialiveInputPreferencePrimaryInputPreferred,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputResolution) {
    AWSMedialiveInputResolutionUnknown,
    AWSMedialiveInputResolutionSd,
    AWSMedialiveInputResolutionHd,
    AWSMedialiveInputResolutionUhd,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputSecurityGroupState) {
    AWSMedialiveInputSecurityGroupStateUnknown,
    AWSMedialiveInputSecurityGroupStateIdle,
    AWSMedialiveInputSecurityGroupStateInUse,
    AWSMedialiveInputSecurityGroupStateUpdating,
    AWSMedialiveInputSecurityGroupStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputSourceEndBehavior) {
    AWSMedialiveInputSourceEndBehaviorUnknown,
    AWSMedialiveInputSourceEndBehaviorContinue,
    AWSMedialiveInputSourceEndBehaviorLoop,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputSourceType) {
    AWSMedialiveInputSourceTypeUnknown,
    AWSMedialiveInputSourceTypeStatic,
    AWSMedialiveInputSourceTypeDynamic,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputState) {
    AWSMedialiveInputStateUnknown,
    AWSMedialiveInputStateCreating,
    AWSMedialiveInputStateDetached,
    AWSMedialiveInputStateAttached,
    AWSMedialiveInputStateDeleting,
    AWSMedialiveInputStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputTimecodeSource) {
    AWSMedialiveInputTimecodeSourceUnknown,
    AWSMedialiveInputTimecodeSourceZerobased,
    AWSMedialiveInputTimecodeSourceEmbedded,
};

typedef NS_ENUM(NSInteger, AWSMedialiveInputType) {
    AWSMedialiveInputTypeUnknown,
    AWSMedialiveInputTypeUdpPush,
    AWSMedialiveInputTypeRtpPush,
    AWSMedialiveInputTypeRtmpPush,
    AWSMedialiveInputTypeRtmpPull,
    AWSMedialiveInputTypeUrlPull,
    AWSMedialiveInputTypeMp4File,
    AWSMedialiveInputTypeMediaconnect,
    AWSMedialiveInputTypeInputDevice,
};

typedef NS_ENUM(NSInteger, AWSMedialiveLastFrameClippingBehavior) {
    AWSMedialiveLastFrameClippingBehaviorUnknown,
    AWSMedialiveLastFrameClippingBehaviorExcludeLastFrame,
    AWSMedialiveLastFrameClippingBehaviorIncludeLastFrame,
};

typedef NS_ENUM(NSInteger, AWSMedialiveLogLevel) {
    AWSMedialiveLogLevelUnknown,
    AWSMedialiveLogLevelError,
    AWSMedialiveLogLevelWarning,
    AWSMedialiveLogLevelInfo,
    AWSMedialiveLogLevelDebug,
    AWSMedialiveLogLevelDisabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsAbsentInputAudioBehavior) {
    AWSMedialiveM2tsAbsentInputAudioBehaviorUnknown,
    AWSMedialiveM2tsAbsentInputAudioBehaviorDrop,
    AWSMedialiveM2tsAbsentInputAudioBehaviorEncodeSilence,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsArib) {
    AWSMedialiveM2tsAribUnknown,
    AWSMedialiveM2tsAribDisabled,
    AWSMedialiveM2tsAribEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsAribCaptionsPidControl) {
    AWSMedialiveM2tsAribCaptionsPidControlUnknown,
    AWSMedialiveM2tsAribCaptionsPidControlAuto,
    AWSMedialiveM2tsAribCaptionsPidControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsAudioBufferModel) {
    AWSMedialiveM2tsAudioBufferModelUnknown,
    AWSMedialiveM2tsAudioBufferModelAtsc,
    AWSMedialiveM2tsAudioBufferModelDvb,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsAudioInterval) {
    AWSMedialiveM2tsAudioIntervalUnknown,
    AWSMedialiveM2tsAudioIntervalVideoAndFixedIntervals,
    AWSMedialiveM2tsAudioIntervalVideoInterval,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsAudioStreamType) {
    AWSMedialiveM2tsAudioStreamTypeUnknown,
    AWSMedialiveM2tsAudioStreamTypeAtsc,
    AWSMedialiveM2tsAudioStreamTypeDvb,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsBufferModel) {
    AWSMedialiveM2tsBufferModelUnknown,
    AWSMedialiveM2tsBufferModelMultiplex,
    AWSMedialiveM2tsBufferModelNone,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsCcDescriptor) {
    AWSMedialiveM2tsCcDescriptorUnknown,
    AWSMedialiveM2tsCcDescriptorDisabled,
    AWSMedialiveM2tsCcDescriptorEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsEbifControl) {
    AWSMedialiveM2tsEbifControlUnknown,
    AWSMedialiveM2tsEbifControlNone,
    AWSMedialiveM2tsEbifControlPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsEbpPlacement) {
    AWSMedialiveM2tsEbpPlacementUnknown,
    AWSMedialiveM2tsEbpPlacementVideoAndAudioPids,
    AWSMedialiveM2tsEbpPlacementVideoPid,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsEsRateInPes) {
    AWSMedialiveM2tsEsRateInPesUnknown,
    AWSMedialiveM2tsEsRateInPesExclude,
    AWSMedialiveM2tsEsRateInPesInclude,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsKlv) {
    AWSMedialiveM2tsKlvUnknown,
    AWSMedialiveM2tsKlvNone,
    AWSMedialiveM2tsKlvPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsNielsenId3Behavior) {
    AWSMedialiveM2tsNielsenId3BehaviorUnknown,
    AWSMedialiveM2tsNielsenId3BehaviorNoPassthrough,
    AWSMedialiveM2tsNielsenId3BehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsPcrControl) {
    AWSMedialiveM2tsPcrControlUnknown,
    AWSMedialiveM2tsPcrControlConfiguredPcrPeriod,
    AWSMedialiveM2tsPcrControlPcrEveryPesPacket,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsRateMode) {
    AWSMedialiveM2tsRateModeUnknown,
    AWSMedialiveM2tsRateModeCbr,
    AWSMedialiveM2tsRateModeVbr,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsScte35Control) {
    AWSMedialiveM2tsScte35ControlUnknown,
    AWSMedialiveM2tsScte35ControlNone,
    AWSMedialiveM2tsScte35ControlPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsSegmentationMarkers) {
    AWSMedialiveM2tsSegmentationMarkersUnknown,
    AWSMedialiveM2tsSegmentationMarkersEbp,
    AWSMedialiveM2tsSegmentationMarkersEbpLegacy,
    AWSMedialiveM2tsSegmentationMarkersNone,
    AWSMedialiveM2tsSegmentationMarkersPsiSegstart,
    AWSMedialiveM2tsSegmentationMarkersRaiAdapt,
    AWSMedialiveM2tsSegmentationMarkersRaiSegstart,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsSegmentationStyle) {
    AWSMedialiveM2tsSegmentationStyleUnknown,
    AWSMedialiveM2tsSegmentationStyleMaintainCadence,
    AWSMedialiveM2tsSegmentationStyleResetCadence,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM2tsTimedMetadataBehavior) {
    AWSMedialiveM2tsTimedMetadataBehaviorUnknown,
    AWSMedialiveM2tsTimedMetadataBehaviorNoPassthrough,
    AWSMedialiveM2tsTimedMetadataBehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM3u8NielsenId3Behavior) {
    AWSMedialiveM3u8NielsenId3BehaviorUnknown,
    AWSMedialiveM3u8NielsenId3BehaviorNoPassthrough,
    AWSMedialiveM3u8NielsenId3BehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM3u8PcrControl) {
    AWSMedialiveM3u8PcrControlUnknown,
    AWSMedialiveM3u8PcrControlConfiguredPcrPeriod,
    AWSMedialiveM3u8PcrControlPcrEveryPesPacket,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM3u8Scte35Behavior) {
    AWSMedialiveM3u8Scte35BehaviorUnknown,
    AWSMedialiveM3u8Scte35BehaviorNoPassthrough,
    AWSMedialiveM3u8Scte35BehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMedialiveM3u8TimedMetadataBehavior) {
    AWSMedialiveM3u8TimedMetadataBehaviorUnknown,
    AWSMedialiveM3u8TimedMetadataBehaviorNoPassthrough,
    AWSMedialiveM3u8TimedMetadataBehaviorPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMedialiveMp2CodingMode) {
    AWSMedialiveMp2CodingModeUnknown,
    AWSMedialiveMp2CodingModeCodingMode10,
    AWSMedialiveMp2CodingModeCodingMode20,
};

typedef NS_ENUM(NSInteger, AWSMedialiveMsSmoothH265PackagingType) {
    AWSMedialiveMsSmoothH265PackagingTypeUnknown,
    AWSMedialiveMsSmoothH265PackagingTypeHev1,
    AWSMedialiveMsSmoothH265PackagingTypeHvc1,
};

typedef NS_ENUM(NSInteger, AWSMedialiveMultiplexState) {
    AWSMedialiveMultiplexStateUnknown,
    AWSMedialiveMultiplexStateCreating,
    AWSMedialiveMultiplexStateCreateFailed,
    AWSMedialiveMultiplexStateIdle,
    AWSMedialiveMultiplexStateStarting,
    AWSMedialiveMultiplexStateRunning,
    AWSMedialiveMultiplexStateRecovering,
    AWSMedialiveMultiplexStateStopping,
    AWSMedialiveMultiplexStateDeleting,
    AWSMedialiveMultiplexStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSMedialiveNetworkInputServerValidation) {
    AWSMedialiveNetworkInputServerValidationUnknown,
    AWSMedialiveNetworkInputServerValidationCheckCryptographyAndValidateName,
    AWSMedialiveNetworkInputServerValidationCheckCryptographyOnly,
};

typedef NS_ENUM(NSInteger, AWSMedialiveNielsenPcmToId3TaggingState) {
    AWSMedialiveNielsenPcmToId3TaggingStateUnknown,
    AWSMedialiveNielsenPcmToId3TaggingStateDisabled,
    AWSMedialiveNielsenPcmToId3TaggingStateEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveOfferingDurationUnits) {
    AWSMedialiveOfferingDurationUnitsUnknown,
    AWSMedialiveOfferingDurationUnitsMonths,
};

typedef NS_ENUM(NSInteger, AWSMedialiveOfferingType) {
    AWSMedialiveOfferingTypeUnknown,
    AWSMedialiveOfferingTypeNoUpfront,
};

typedef NS_ENUM(NSInteger, AWSMedialivePipelineId) {
    AWSMedialivePipelineIdUnknown,
    AWSMedialivePipelineIdPipeline0,
    AWSMedialivePipelineIdPipeline1,
};

typedef NS_ENUM(NSInteger, AWSMedialivePreferredChannelPipeline) {
    AWSMedialivePreferredChannelPipelineUnknown,
    AWSMedialivePreferredChannelPipelineCurrentlyActive,
    AWSMedialivePreferredChannelPipelinePipeline0,
    AWSMedialivePreferredChannelPipelinePipeline1,
};

typedef NS_ENUM(NSInteger, AWSMedialiveReservationCodec) {
    AWSMedialiveReservationCodecUnknown,
    AWSMedialiveReservationCodecMpeg2,
    AWSMedialiveReservationCodecAvc,
    AWSMedialiveReservationCodecHevc,
    AWSMedialiveReservationCodecAudio,
};

typedef NS_ENUM(NSInteger, AWSMedialiveReservationMaximumBitrate) {
    AWSMedialiveReservationMaximumBitrateUnknown,
    AWSMedialiveReservationMaximumBitrateMax10Mbps,
    AWSMedialiveReservationMaximumBitrateMax20Mbps,
    AWSMedialiveReservationMaximumBitrateMax50Mbps,
};

typedef NS_ENUM(NSInteger, AWSMedialiveReservationMaximumFramerate) {
    AWSMedialiveReservationMaximumFramerateUnknown,
    AWSMedialiveReservationMaximumFramerateMax30Fps,
    AWSMedialiveReservationMaximumFramerateMax60Fps,
};

typedef NS_ENUM(NSInteger, AWSMedialiveReservationResolution) {
    AWSMedialiveReservationResolutionUnknown,
    AWSMedialiveReservationResolutionSd,
    AWSMedialiveReservationResolutionHd,
    AWSMedialiveReservationResolutionFhd,
    AWSMedialiveReservationResolutionUhd,
};

typedef NS_ENUM(NSInteger, AWSMedialiveReservationResourceType) {
    AWSMedialiveReservationResourceTypeUnknown,
    AWSMedialiveReservationResourceTypeInput,
    AWSMedialiveReservationResourceTypeOutput,
    AWSMedialiveReservationResourceTypeMultiplex,
    AWSMedialiveReservationResourceTypeChannel,
};

typedef NS_ENUM(NSInteger, AWSMedialiveReservationSpecialFeature) {
    AWSMedialiveReservationSpecialFeatureUnknown,
    AWSMedialiveReservationSpecialFeatureAdvancedAudio,
    AWSMedialiveReservationSpecialFeatureAudioNormalization,
};

typedef NS_ENUM(NSInteger, AWSMedialiveReservationState) {
    AWSMedialiveReservationStateUnknown,
    AWSMedialiveReservationStateActive,
    AWSMedialiveReservationStateExpired,
    AWSMedialiveReservationStateCanceled,
    AWSMedialiveReservationStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSMedialiveReservationVideoQuality) {
    AWSMedialiveReservationVideoQualityUnknown,
    AWSMedialiveReservationVideoQualityStandard,
    AWSMedialiveReservationVideoQualityEnhanced,
    AWSMedialiveReservationVideoQualityPremium,
};

typedef NS_ENUM(NSInteger, AWSMedialiveRtmpCacheFullBehavior) {
    AWSMedialiveRtmpCacheFullBehaviorUnknown,
    AWSMedialiveRtmpCacheFullBehaviorDisconnectImmediately,
    AWSMedialiveRtmpCacheFullBehaviorWaitForServer,
};

typedef NS_ENUM(NSInteger, AWSMedialiveRtmpCaptionData) {
    AWSMedialiveRtmpCaptionDataUnknown,
    AWSMedialiveRtmpCaptionDataAll,
    AWSMedialiveRtmpCaptionDataField1608,
    AWSMedialiveRtmpCaptionDataField1AndField2608,
};

typedef NS_ENUM(NSInteger, AWSMedialiveRtmpOutputCertificateMode) {
    AWSMedialiveRtmpOutputCertificateModeUnknown,
    AWSMedialiveRtmpOutputCertificateModeSelfSigned,
    AWSMedialiveRtmpOutputCertificateModeVerifyAuthenticity,
};

typedef NS_ENUM(NSInteger, AWSMedialiveScte20Convert608To708) {
    AWSMedialiveScte20Convert608To708Unknown,
    AWSMedialiveScte20Convert608To708Disabled,
    AWSMedialiveScte20Convert608To708Upconvert,
};

typedef NS_ENUM(NSInteger, AWSMedialiveScte35AposNoRegionalBlackoutBehavior) {
    AWSMedialiveScte35AposNoRegionalBlackoutBehaviorUnknown,
    AWSMedialiveScte35AposNoRegionalBlackoutBehaviorFollow,
    AWSMedialiveScte35AposNoRegionalBlackoutBehaviorIgnore,
};

typedef NS_ENUM(NSInteger, AWSMedialiveScte35AposWebDeliveryAllowedBehavior) {
    AWSMedialiveScte35AposWebDeliveryAllowedBehaviorUnknown,
    AWSMedialiveScte35AposWebDeliveryAllowedBehaviorFollow,
    AWSMedialiveScte35AposWebDeliveryAllowedBehaviorIgnore,
};

typedef NS_ENUM(NSInteger, AWSMedialiveScte35ArchiveAllowedFlag) {
    AWSMedialiveScte35ArchiveAllowedFlagUnknown,
    AWSMedialiveScte35ArchiveAllowedFlagArchiveNotAllowed,
    AWSMedialiveScte35ArchiveAllowedFlagArchiveAllowed,
};

typedef NS_ENUM(NSInteger, AWSMedialiveScte35DeviceRestrictions) {
    AWSMedialiveScte35DeviceRestrictionsUnknown,
    AWSMedialiveScte35DeviceRestrictionsNone,
    AWSMedialiveScte35DeviceRestrictionsRestrictGroup0,
    AWSMedialiveScte35DeviceRestrictionsRestrictGroup1,
    AWSMedialiveScte35DeviceRestrictionsRestrictGroup2,
};

typedef NS_ENUM(NSInteger, AWSMedialiveScte35NoRegionalBlackoutFlag) {
    AWSMedialiveScte35NoRegionalBlackoutFlagUnknown,
    AWSMedialiveScte35NoRegionalBlackoutFlagRegionalBlackout,
    AWSMedialiveScte35NoRegionalBlackoutFlagNoRegionalBlackout,
};

typedef NS_ENUM(NSInteger, AWSMedialiveScte35SegmentationCancelIndicator) {
    AWSMedialiveScte35SegmentationCancelIndicatorUnknown,
    AWSMedialiveScte35SegmentationCancelIndicatorSegmentationEventNotCanceled,
    AWSMedialiveScte35SegmentationCancelIndicatorSegmentationEventCanceled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveScte35SpliceInsertNoRegionalBlackoutBehavior) {
    AWSMedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorUnknown,
    AWSMedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorFollow,
    AWSMedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorIgnore,
};

typedef NS_ENUM(NSInteger, AWSMedialiveScte35SpliceInsertWebDeliveryAllowedBehavior) {
    AWSMedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorUnknown,
    AWSMedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorFollow,
    AWSMedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorIgnore,
};

typedef NS_ENUM(NSInteger, AWSMedialiveScte35WebDeliveryAllowedFlag) {
    AWSMedialiveScte35WebDeliveryAllowedFlagUnknown,
    AWSMedialiveScte35WebDeliveryAllowedFlagWebDeliveryNotAllowed,
    AWSMedialiveScte35WebDeliveryAllowedFlagWebDeliveryAllowed,
};

typedef NS_ENUM(NSInteger, AWSMedialiveSmoothGroupAudioOnlyTimecodeControl) {
    AWSMedialiveSmoothGroupAudioOnlyTimecodeControlUnknown,
    AWSMedialiveSmoothGroupAudioOnlyTimecodeControlPassthrough,
    AWSMedialiveSmoothGroupAudioOnlyTimecodeControlUseConfiguredClock,
};

typedef NS_ENUM(NSInteger, AWSMedialiveSmoothGroupCertificateMode) {
    AWSMedialiveSmoothGroupCertificateModeUnknown,
    AWSMedialiveSmoothGroupCertificateModeSelfSigned,
    AWSMedialiveSmoothGroupCertificateModeVerifyAuthenticity,
};

typedef NS_ENUM(NSInteger, AWSMedialiveSmoothGroupEventIdMode) {
    AWSMedialiveSmoothGroupEventIdModeUnknown,
    AWSMedialiveSmoothGroupEventIdModeNoEventId,
    AWSMedialiveSmoothGroupEventIdModeUseConfigured,
    AWSMedialiveSmoothGroupEventIdModeUseTimestamp,
};

typedef NS_ENUM(NSInteger, AWSMedialiveSmoothGroupEventStopBehavior) {
    AWSMedialiveSmoothGroupEventStopBehaviorUnknown,
    AWSMedialiveSmoothGroupEventStopBehaviorNone,
    AWSMedialiveSmoothGroupEventStopBehaviorSendEos,
};

typedef NS_ENUM(NSInteger, AWSMedialiveSmoothGroupSegmentationMode) {
    AWSMedialiveSmoothGroupSegmentationModeUnknown,
    AWSMedialiveSmoothGroupSegmentationModeUseInputSegmentation,
    AWSMedialiveSmoothGroupSegmentationModeUseSegmentDuration,
};

typedef NS_ENUM(NSInteger, AWSMedialiveSmoothGroupSparseTrackType) {
    AWSMedialiveSmoothGroupSparseTrackTypeUnknown,
    AWSMedialiveSmoothGroupSparseTrackTypeNone,
    AWSMedialiveSmoothGroupSparseTrackTypeScte35,
    AWSMedialiveSmoothGroupSparseTrackTypeScte35WithoutSegmentation,
};

typedef NS_ENUM(NSInteger, AWSMedialiveSmoothGroupStreamManifestBehavior) {
    AWSMedialiveSmoothGroupStreamManifestBehaviorUnknown,
    AWSMedialiveSmoothGroupStreamManifestBehaviorDoNotSend,
    AWSMedialiveSmoothGroupStreamManifestBehaviorSend,
};

typedef NS_ENUM(NSInteger, AWSMedialiveSmoothGroupTimestampOffsetMode) {
    AWSMedialiveSmoothGroupTimestampOffsetModeUnknown,
    AWSMedialiveSmoothGroupTimestampOffsetModeUseConfiguredOffset,
    AWSMedialiveSmoothGroupTimestampOffsetModeUseEventStartDate,
};

typedef NS_ENUM(NSInteger, AWSMedialiveSmpte2038DataPreference) {
    AWSMedialiveSmpte2038DataPreferenceUnknown,
    AWSMedialiveSmpte2038DataPreferenceIgnore,
    AWSMedialiveSmpte2038DataPreferencePrefer,
};

typedef NS_ENUM(NSInteger, AWSMedialiveTemporalFilterPostFilterSharpening) {
    AWSMedialiveTemporalFilterPostFilterSharpeningUnknown,
    AWSMedialiveTemporalFilterPostFilterSharpeningAuto,
    AWSMedialiveTemporalFilterPostFilterSharpeningDisabled,
    AWSMedialiveTemporalFilterPostFilterSharpeningEnabled,
};

typedef NS_ENUM(NSInteger, AWSMedialiveTemporalFilterStrength) {
    AWSMedialiveTemporalFilterStrengthUnknown,
    AWSMedialiveTemporalFilterStrengthAuto,
    AWSMedialiveTemporalFilterStrengthStrength1,
    AWSMedialiveTemporalFilterStrengthStrength2,
    AWSMedialiveTemporalFilterStrengthStrength3,
    AWSMedialiveTemporalFilterStrengthStrength4,
    AWSMedialiveTemporalFilterStrengthStrength5,
    AWSMedialiveTemporalFilterStrengthStrength6,
    AWSMedialiveTemporalFilterStrengthStrength7,
    AWSMedialiveTemporalFilterStrengthStrength8,
    AWSMedialiveTemporalFilterStrengthStrength9,
    AWSMedialiveTemporalFilterStrengthStrength10,
    AWSMedialiveTemporalFilterStrengthStrength11,
    AWSMedialiveTemporalFilterStrengthStrength12,
    AWSMedialiveTemporalFilterStrengthStrength13,
    AWSMedialiveTemporalFilterStrengthStrength14,
    AWSMedialiveTemporalFilterStrengthStrength15,
    AWSMedialiveTemporalFilterStrengthStrength16,
};

typedef NS_ENUM(NSInteger, AWSMedialiveTimecodeConfigSource) {
    AWSMedialiveTimecodeConfigSourceUnknown,
    AWSMedialiveTimecodeConfigSourceEmbedded,
    AWSMedialiveTimecodeConfigSourceSystemclock,
    AWSMedialiveTimecodeConfigSourceZerobased,
};

typedef NS_ENUM(NSInteger, AWSMedialiveTtmlDestinationStyleControl) {
    AWSMedialiveTtmlDestinationStyleControlUnknown,
    AWSMedialiveTtmlDestinationStyleControlPassthrough,
    AWSMedialiveTtmlDestinationStyleControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSMedialiveUdpTimedMetadataId3Frame) {
    AWSMedialiveUdpTimedMetadataId3FrameUnknown,
    AWSMedialiveUdpTimedMetadataId3FrameNone,
    AWSMedialiveUdpTimedMetadataId3FramePriv,
    AWSMedialiveUdpTimedMetadataId3FrameTdrl,
};

typedef NS_ENUM(NSInteger, AWSMedialiveVideoDescriptionRespondToAfd) {
    AWSMedialiveVideoDescriptionRespondToAfdUnknown,
    AWSMedialiveVideoDescriptionRespondToAfdNone,
    AWSMedialiveVideoDescriptionRespondToAfdPassthrough,
    AWSMedialiveVideoDescriptionRespondToAfdRespond,
};

typedef NS_ENUM(NSInteger, AWSMedialiveVideoDescriptionScalingBehavior) {
    AWSMedialiveVideoDescriptionScalingBehaviorUnknown,
    AWSMedialiveVideoDescriptionScalingBehaviorDefault,
    AWSMedialiveVideoDescriptionScalingBehaviorStretchToOutput,
};

typedef NS_ENUM(NSInteger, AWSMedialiveVideoSelectorColorSpace) {
    AWSMedialiveVideoSelectorColorSpaceUnknown,
    AWSMedialiveVideoSelectorColorSpaceFollow,
    AWSMedialiveVideoSelectorColorSpaceRec601,
    AWSMedialiveVideoSelectorColorSpaceRec709,
};

typedef NS_ENUM(NSInteger, AWSMedialiveVideoSelectorColorSpaceUsage) {
    AWSMedialiveVideoSelectorColorSpaceUsageUnknown,
    AWSMedialiveVideoSelectorColorSpaceUsageFallback,
    AWSMedialiveVideoSelectorColorSpaceUsageForce,
};

@class AWSMedialiveAacSettings;
@class AWSMedialiveAc3Settings;
@class AWSMedialiveAccessDenied;
@class AWSMedialiveArchiveContainerSettings;
@class AWSMedialiveArchiveGroupSettings;
@class AWSMedialiveArchiveOutputSettings;
@class AWSMedialiveAribDestinationSettings;
@class AWSMedialiveAribSourceSettings;
@class AWSMedialiveAudioChannelMapping;
@class AWSMedialiveAudioCodecSettings;
@class AWSMedialiveAudioDescription;
@class AWSMedialiveAudioLanguageSelection;
@class AWSMedialiveAudioNormalizationSettings;
@class AWSMedialiveAudioOnlyHlsSettings;
@class AWSMedialiveAudioPidSelection;
@class AWSMedialiveAudioSelector;
@class AWSMedialiveAudioSelectorSettings;
@class AWSMedialiveAudioTrack;
@class AWSMedialiveAudioTrackSelection;
@class AWSMedialiveAutomaticInputFailoverSettings;
@class AWSMedialiveAvailBlanking;
@class AWSMedialiveAvailConfiguration;
@class AWSMedialiveAvailSettings;
@class AWSMedialiveBatchScheduleActionCreateRequest;
@class AWSMedialiveBatchScheduleActionCreateResult;
@class AWSMedialiveBatchScheduleActionDeleteRequest;
@class AWSMedialiveBatchScheduleActionDeleteResult;
@class AWSMedialiveBatchUpdateScheduleRequest;
@class AWSMedialiveBatchUpdateScheduleResponse;
@class AWSMedialiveBatchUpdateScheduleResult;
@class AWSMedialiveBlackoutSlate;
@class AWSMedialiveBurnInDestinationSettings;
@class AWSMedialiveCaptionDescription;
@class AWSMedialiveCaptionDestinationSettings;
@class AWSMedialiveCaptionLanguageMapping;
@class AWSMedialiveCaptionSelector;
@class AWSMedialiveCaptionSelectorSettings;
@class AWSMedialiveChannel;
@class AWSMedialiveChannelConfigurationValidationError;
@class AWSMedialiveChannelEgressEndpoint;
@class AWSMedialiveChannelSummary;
@class AWSMedialiveColorSpacePassthroughSettings;
@class AWSMedialiveCreateChannel;
@class AWSMedialiveCreateChannelRequest;
@class AWSMedialiveCreateChannelResponse;
@class AWSMedialiveCreateChannelResultModel;
@class AWSMedialiveCreateInput;
@class AWSMedialiveCreateInputRequest;
@class AWSMedialiveCreateInputResponse;
@class AWSMedialiveCreateInputResultModel;
@class AWSMedialiveCreateInputSecurityGroupRequest;
@class AWSMedialiveCreateInputSecurityGroupResponse;
@class AWSMedialiveCreateInputSecurityGroupResultModel;
@class AWSMedialiveCreateMultiplex;
@class AWSMedialiveCreateMultiplexProgram;
@class AWSMedialiveCreateMultiplexProgramRequest;
@class AWSMedialiveCreateMultiplexProgramResponse;
@class AWSMedialiveCreateMultiplexProgramResultModel;
@class AWSMedialiveCreateMultiplexRequest;
@class AWSMedialiveCreateMultiplexResponse;
@class AWSMedialiveCreateMultiplexResultModel;
@class AWSMedialiveCreateTagsRequest;
@class AWSMedialiveDeleteChannelRequest;
@class AWSMedialiveDeleteChannelResponse;
@class AWSMedialiveDeleteInputRequest;
@class AWSMedialiveDeleteInputResponse;
@class AWSMedialiveDeleteInputSecurityGroupRequest;
@class AWSMedialiveDeleteInputSecurityGroupResponse;
@class AWSMedialiveDeleteMultiplexProgramRequest;
@class AWSMedialiveDeleteMultiplexProgramResponse;
@class AWSMedialiveDeleteMultiplexRequest;
@class AWSMedialiveDeleteMultiplexResponse;
@class AWSMedialiveDeleteReservationRequest;
@class AWSMedialiveDeleteReservationResponse;
@class AWSMedialiveDeleteScheduleRequest;
@class AWSMedialiveDeleteScheduleResponse;
@class AWSMedialiveDeleteTagsRequest;
@class AWSMedialiveDescribeChannelRequest;
@class AWSMedialiveDescribeChannelResponse;
@class AWSMedialiveDescribeInputDeviceRequest;
@class AWSMedialiveDescribeInputDeviceResponse;
@class AWSMedialiveDescribeInputRequest;
@class AWSMedialiveDescribeInputResponse;
@class AWSMedialiveDescribeInputSecurityGroupRequest;
@class AWSMedialiveDescribeInputSecurityGroupResponse;
@class AWSMedialiveDescribeMultiplexProgramRequest;
@class AWSMedialiveDescribeMultiplexProgramResponse;
@class AWSMedialiveDescribeMultiplexRequest;
@class AWSMedialiveDescribeMultiplexResponse;
@class AWSMedialiveDescribeOfferingRequest;
@class AWSMedialiveDescribeOfferingResponse;
@class AWSMedialiveDescribeReservationRequest;
@class AWSMedialiveDescribeReservationResponse;
@class AWSMedialiveDescribeScheduleRequest;
@class AWSMedialiveDescribeScheduleResponse;
@class AWSMedialiveDvbNitSettings;
@class AWSMedialiveDvbSdtSettings;
@class AWSMedialiveDvbSubDestinationSettings;
@class AWSMedialiveDvbSubSourceSettings;
@class AWSMedialiveDvbTdtSettings;
@class AWSMedialiveEac3Settings;
@class AWSMedialiveEmbeddedDestinationSettings;
@class AWSMedialiveEmbeddedPlusScte20DestinationSettings;
@class AWSMedialiveEmbeddedSourceSettings;
@class AWSMedialiveEmpty;
@class AWSMedialiveEncoderSettings;
@class AWSMedialiveFecOutputSettings;
@class AWSMedialiveFixedModeScheduleActionStartSettings;
@class AWSMedialiveFmp4HlsSettings;
@class AWSMedialiveFollowModeScheduleActionStartSettings;
@class AWSMedialiveFrameCaptureGroupSettings;
@class AWSMedialiveFrameCaptureOutputSettings;
@class AWSMedialiveFrameCaptureSettings;
@class AWSMedialiveGlobalConfiguration;
@class AWSMedialiveH264ColorSpaceSettings;
@class AWSMedialiveH264FilterSettings;
@class AWSMedialiveH264Settings;
@class AWSMedialiveH265ColorSpaceSettings;
@class AWSMedialiveH265Settings;
@class AWSMedialiveHdr10Settings;
@class AWSMedialiveHlsAkamaiSettings;
@class AWSMedialiveHlsBasicPutSettings;
@class AWSMedialiveHlsCdnSettings;
@class AWSMedialiveHlsGroupSettings;
@class AWSMedialiveHlsId3SegmentTaggingScheduleActionSettings;
@class AWSMedialiveHlsInputSettings;
@class AWSMedialiveHlsMediaStoreSettings;
@class AWSMedialiveHlsOutputSettings;
@class AWSMedialiveHlsSettings;
@class AWSMedialiveHlsTimedMetadataScheduleActionSettings;
@class AWSMedialiveHlsWebdavSettings;
@class AWSMedialiveImmediateModeScheduleActionStartSettings;
@class AWSMedialiveInput;
@class AWSMedialiveInputAttachment;
@class AWSMedialiveInputChannelLevel;
@class AWSMedialiveInputClippingSettings;
@class AWSMedialiveInputDestination;
@class AWSMedialiveInputDestinationRequest;
@class AWSMedialiveInputDestinationVpc;
@class AWSMedialiveInputDevice;
@class AWSMedialiveInputDeviceConfigurableSettings;
@class AWSMedialiveInputDeviceConfigurationValidationError;
@class AWSMedialiveInputDeviceHdSettings;
@class AWSMedialiveInputDeviceNetworkSettings;
@class AWSMedialiveInputDeviceRequest;
@class AWSMedialiveInputDeviceSettings;
@class AWSMedialiveInputDeviceSummary;
@class AWSMedialiveInputLocation;
@class AWSMedialiveInputLossBehavior;
@class AWSMedialiveInputSecurityGroup;
@class AWSMedialiveInputSecurityGroupWhitelistRequest;
@class AWSMedialiveInputSettings;
@class AWSMedialiveInputSource;
@class AWSMedialiveInputSourceRequest;
@class AWSMedialiveInputSpecification;
@class AWSMedialiveInputSwitchScheduleActionSettings;
@class AWSMedialiveInputVpcRequest;
@class AWSMedialiveInputWhitelistRule;
@class AWSMedialiveInputWhitelistRuleCidr;
@class AWSMedialiveInternalServiceError;
@class AWSMedialiveInvalidRequest;
@class AWSMedialiveKeyProviderSettings;
@class AWSMedialiveLimitExceeded;
@class AWSMedialiveListChannelsRequest;
@class AWSMedialiveListChannelsResponse;
@class AWSMedialiveListChannelsResultModel;
@class AWSMedialiveListInputDevicesRequest;
@class AWSMedialiveListInputDevicesResponse;
@class AWSMedialiveListInputDevicesResultModel;
@class AWSMedialiveListInputSecurityGroupsRequest;
@class AWSMedialiveListInputSecurityGroupsResponse;
@class AWSMedialiveListInputSecurityGroupsResultModel;
@class AWSMedialiveListInputsRequest;
@class AWSMedialiveListInputsResponse;
@class AWSMedialiveListInputsResultModel;
@class AWSMedialiveListMultiplexProgramsRequest;
@class AWSMedialiveListMultiplexProgramsResponse;
@class AWSMedialiveListMultiplexProgramsResultModel;
@class AWSMedialiveListMultiplexesRequest;
@class AWSMedialiveListMultiplexesResponse;
@class AWSMedialiveListMultiplexesResultModel;
@class AWSMedialiveListOfferingsRequest;
@class AWSMedialiveListOfferingsResponse;
@class AWSMedialiveListOfferingsResultModel;
@class AWSMedialiveListReservationsRequest;
@class AWSMedialiveListReservationsResponse;
@class AWSMedialiveListReservationsResultModel;
@class AWSMedialiveListTagsForResourceRequest;
@class AWSMedialiveListTagsForResourceResponse;
@class AWSMedialiveM2tsSettings;
@class AWSMedialiveM3u8Settings;
@class AWSMedialiveMediaConnectFlow;
@class AWSMedialiveMediaConnectFlowRequest;
@class AWSMedialiveMediaPackageGroupSettings;
@class AWSMedialiveMediaPackageOutputDestinationSettings;
@class AWSMedialiveMediaPackageOutputSettings;
@class AWSMedialiveMp2Settings;
@class AWSMedialiveMsSmoothGroupSettings;
@class AWSMedialiveMsSmoothOutputSettings;
@class AWSMedialiveMultiplex;
@class AWSMedialiveMultiplexConfigurationValidationError;
@class AWSMedialiveMultiplexGroupSettings;
@class AWSMedialiveMultiplexMediaConnectOutputDestinationSettings;
@class AWSMedialiveMultiplexOutputDestination;
@class AWSMedialiveMultiplexOutputSettings;
@class AWSMedialiveMultiplexProgram;
@class AWSMedialiveMultiplexProgramChannelDestinationSettings;
@class AWSMedialiveMultiplexProgramPacketIdentifiersMap;
@class AWSMedialiveMultiplexProgramServiceDescriptor;
@class AWSMedialiveMultiplexProgramSettings;
@class AWSMedialiveMultiplexProgramSummary;
@class AWSMedialiveMultiplexSettings;
@class AWSMedialiveMultiplexSettingsSummary;
@class AWSMedialiveMultiplexStatmuxVideoSettings;
@class AWSMedialiveMultiplexSummary;
@class AWSMedialiveMultiplexVideoSettings;
@class AWSMedialiveNetworkInputSettings;
@class AWSMedialiveNielsenConfiguration;
@class AWSMedialiveOffering;
@class AWSMedialiveOutput;
@class AWSMedialiveOutputDestination;
@class AWSMedialiveOutputDestinationSettings;
@class AWSMedialiveOutputGroup;
@class AWSMedialiveOutputGroupSettings;
@class AWSMedialiveOutputLocationRef;
@class AWSMedialiveOutputSettings;
@class AWSMedialivePassThroughSettings;
@class AWSMedialivePauseStateScheduleActionSettings;
@class AWSMedialivePipelineDetail;
@class AWSMedialivePipelinePauseStateSettings;
@class AWSMedialivePurchaseOffering;
@class AWSMedialivePurchaseOfferingRequest;
@class AWSMedialivePurchaseOfferingResponse;
@class AWSMedialivePurchaseOfferingResultModel;
@class AWSMedialiveRec601Settings;
@class AWSMedialiveRec709Settings;
@class AWSMedialiveRemixSettings;
@class AWSMedialiveReservation;
@class AWSMedialiveReservationResourceSpecification;
@class AWSMedialiveResourceConflict;
@class AWSMedialiveResourceNotFound;
@class AWSMedialiveRtmpCaptionInfoDestinationSettings;
@class AWSMedialiveRtmpGroupSettings;
@class AWSMedialiveRtmpOutputSettings;
@class AWSMedialiveScheduleAction;
@class AWSMedialiveScheduleActionSettings;
@class AWSMedialiveScheduleActionStartSettings;
@class AWSMedialiveScheduleDeleteResultModel;
@class AWSMedialiveScheduleDescribeResultModel;
@class AWSMedialiveScte20PlusEmbeddedDestinationSettings;
@class AWSMedialiveScte20SourceSettings;
@class AWSMedialiveScte27DestinationSettings;
@class AWSMedialiveScte27SourceSettings;
@class AWSMedialiveScte35DeliveryRestrictions;
@class AWSMedialiveScte35Descriptor;
@class AWSMedialiveScte35DescriptorSettings;
@class AWSMedialiveScte35ReturnToNetworkScheduleActionSettings;
@class AWSMedialiveScte35SegmentationDescriptor;
@class AWSMedialiveScte35SpliceInsert;
@class AWSMedialiveScte35SpliceInsertScheduleActionSettings;
@class AWSMedialiveScte35TimeSignalApos;
@class AWSMedialiveScte35TimeSignalScheduleActionSettings;
@class AWSMedialiveSmpteTtDestinationSettings;
@class AWSMedialiveStandardHlsSettings;
@class AWSMedialiveStartChannelRequest;
@class AWSMedialiveStartChannelResponse;
@class AWSMedialiveStartMultiplexRequest;
@class AWSMedialiveStartMultiplexResponse;
@class AWSMedialiveStartTimecode;
@class AWSMedialiveStaticImageActivateScheduleActionSettings;
@class AWSMedialiveStaticImageDeactivateScheduleActionSettings;
@class AWSMedialiveStaticKeySettings;
@class AWSMedialiveStopChannelRequest;
@class AWSMedialiveStopChannelResponse;
@class AWSMedialiveStopMultiplexRequest;
@class AWSMedialiveStopMultiplexResponse;
@class AWSMedialiveStopTimecode;
@class AWSMedialiveTagsModel;
@class AWSMedialiveTeletextDestinationSettings;
@class AWSMedialiveTeletextSourceSettings;
@class AWSMedialiveTemporalFilterSettings;
@class AWSMedialiveTimecodeConfig;
@class AWSMedialiveTtmlDestinationSettings;
@class AWSMedialiveUdpContainerSettings;
@class AWSMedialiveUdpGroupSettings;
@class AWSMedialiveUdpOutputSettings;
@class AWSMedialiveUpdateChannel;
@class AWSMedialiveUpdateChannelClass;
@class AWSMedialiveUpdateChannelClassRequest;
@class AWSMedialiveUpdateChannelClassResponse;
@class AWSMedialiveUpdateChannelRequest;
@class AWSMedialiveUpdateChannelResponse;
@class AWSMedialiveUpdateChannelResultModel;
@class AWSMedialiveUpdateInput;
@class AWSMedialiveUpdateInputDevice;
@class AWSMedialiveUpdateInputDeviceRequest;
@class AWSMedialiveUpdateInputDeviceResponse;
@class AWSMedialiveUpdateInputRequest;
@class AWSMedialiveUpdateInputResponse;
@class AWSMedialiveUpdateInputResultModel;
@class AWSMedialiveUpdateInputSecurityGroupRequest;
@class AWSMedialiveUpdateInputSecurityGroupResponse;
@class AWSMedialiveUpdateInputSecurityGroupResultModel;
@class AWSMedialiveUpdateMultiplex;
@class AWSMedialiveUpdateMultiplexProgram;
@class AWSMedialiveUpdateMultiplexProgramRequest;
@class AWSMedialiveUpdateMultiplexProgramResponse;
@class AWSMedialiveUpdateMultiplexProgramResultModel;
@class AWSMedialiveUpdateMultiplexRequest;
@class AWSMedialiveUpdateMultiplexResponse;
@class AWSMedialiveUpdateMultiplexResultModel;
@class AWSMedialiveUpdateReservation;
@class AWSMedialiveUpdateReservationRequest;
@class AWSMedialiveUpdateReservationResponse;
@class AWSMedialiveUpdateReservationResultModel;
@class AWSMedialiveValidationError;
@class AWSMedialiveVideoCodecSettings;
@class AWSMedialiveVideoDescription;
@class AWSMedialiveVideoSelector;
@class AWSMedialiveVideoSelectorPid;
@class AWSMedialiveVideoSelectorProgramId;
@class AWSMedialiveVideoSelectorSettings;
@class AWSMedialiveWebvttDestinationSettings;

/**
 Aac Settings
 */
@interface AWSMedialiveAacSettings : AWSModel


/**
 Average bitrate in bits/second. Valid values depend on rate control mode and profile.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Mono, Stereo, or 5.1 channel layout. Valid values depend on rate control mode and profile. The adReceiverMix setting receives a stereo description plus control track and emits a mono AAC encode of the description track, with control data emitted in the PES header as per ETSI TS 101 154 Annex E.
 */
@property (nonatomic, assign) AWSMedialiveAacCodingMode codingMode;

/**
 Set to "broadcasterMixedAd" when input contains pre-mixed main audio + AD (narration) as a stereo pair.The Audio Type field (audioType) will be set to 3, which signals to downstream systems that this stream contains "broadcaster mixed AD". Note that the input received by the encoder must contain pre-mixed audio; the encoder does not perform the mixing. The values in audioTypeControl and audioType (in AudioDescription) are ignored when set to broadcasterMixedAd.Leave set to "normal" when input does not contain pre-mixed audio + AD.
 */
@property (nonatomic, assign) AWSMedialiveAacInputType inputType;

/**
 AAC Profile.
 */
@property (nonatomic, assign) AWSMedialiveAacProfile profile;

/**
 Rate Control Mode.
 */
@property (nonatomic, assign) AWSMedialiveAacRateControlMode rateControlMode;

/**
 Sets LATM / LOAS AAC output for raw containers.
 */
@property (nonatomic, assign) AWSMedialiveAacRawFormat rawFormat;

/**
 Sample rate in Hz. Valid values depend on rate control mode and profile.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

/**
 Use MPEG-2 AAC audio instead of MPEG-4 AAC audio for raw or MPEG-2 Transport Stream containers.
 */
@property (nonatomic, assign) AWSMedialiveAacSpec spec;

/**
 VBR Quality Level - Only used if rateControlMode is VBR.
 */
@property (nonatomic, assign) AWSMedialiveAacVbrQuality vbrQuality;

@end

/**
 Ac3 Settings
 */
@interface AWSMedialiveAc3Settings : AWSModel


/**
 Average bitrate in bits/second. Valid bitrates depend on the coding mode.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specifies the bitstream mode (bsmod) for the emitted AC-3 stream. See ATSC A/52-2012 for background on these values.
 */
@property (nonatomic, assign) AWSMedialiveAc3BitstreamMode bitstreamMode;

/**
 Dolby Digital coding mode. Determines number of channels.
 */
@property (nonatomic, assign) AWSMedialiveAc3CodingMode codingMode;

/**
 Sets the dialnorm for the output. If excluded and input audio is Dolby Digital, dialnorm will be passed through.
 */
@property (nonatomic, strong) NSNumber * _Nullable dialnorm;

/**
 If set to filmStandard, adds dynamic range compression signaling to the output bitstream as defined in the Dolby Digital specification.
 */
@property (nonatomic, assign) AWSMedialiveAc3DrcProfile drcProfile;

/**
 When set to enabled, applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid in codingMode32Lfe mode.
 */
@property (nonatomic, assign) AWSMedialiveAc3LfeFilter lfeFilter;

/**
 When set to "followInput", encoder metadata will be sourced from the DD, DD+, or DolbyE decoder that supplied this audio data. If audio was not supplied from one of these streams, then the static metadata settings will be used.
 */
@property (nonatomic, assign) AWSMedialiveAc3MetadataControl metadataControl;

@end

/**
 Placeholder documentation for AccessDenied
 */
@interface AWSMedialiveAccessDenied : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Archive Container Settings
 */
@interface AWSMedialiveArchiveContainerSettings : AWSModel


/**
 M2ts Settings
 */
@property (nonatomic, strong) AWSMedialiveM2tsSettings * _Nullable m2tsSettings;

@end

/**
 Archive Group Settings
 Required parameters: [Destination]
 */
@interface AWSMedialiveArchiveGroupSettings : AWSModel


/**
 A directory and base filename where archive files should be written.
 */
@property (nonatomic, strong) AWSMedialiveOutputLocationRef * _Nullable destination;

/**
 Number of seconds to write to archive file before closing and starting a new one.
 */
@property (nonatomic, strong) NSNumber * _Nullable rolloverInterval;

@end

/**
 Archive Output Settings
 Required parameters: [ContainerSettings]
 */
@interface AWSMedialiveArchiveOutputSettings : AWSModel


/**
 Settings specific to the container type of the file.
 */
@property (nonatomic, strong) AWSMedialiveArchiveContainerSettings * _Nullable containerSettings;

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
@interface AWSMedialiveAribDestinationSettings : AWSModel


@end

/**
 Arib Source Settings
 */
@interface AWSMedialiveAribSourceSettings : AWSModel


@end

/**
 Audio Channel Mapping
 Required parameters: [OutputChannel, InputChannelLevels]
 */
@interface AWSMedialiveAudioChannelMapping : AWSModel


/**
 Indices and gain values for each input channel that should be remixed into this output channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputChannelLevel *> * _Nullable inputChannelLevels;

/**
 The index of the output channel being produced.
 */
@property (nonatomic, strong) NSNumber * _Nullable outputChannel;

@end

/**
 Audio Codec Settings
 */
@interface AWSMedialiveAudioCodecSettings : AWSModel


/**
 Aac Settings
 */
@property (nonatomic, strong) AWSMedialiveAacSettings * _Nullable aacSettings;

/**
 Ac3 Settings
 */
@property (nonatomic, strong) AWSMedialiveAc3Settings * _Nullable ac3Settings;

/**
 Eac3 Settings
 */
@property (nonatomic, strong) AWSMedialiveEac3Settings * _Nullable eac3Settings;

/**
 Mp2 Settings
 */
@property (nonatomic, strong) AWSMedialiveMp2Settings * _Nullable mp2Settings;

/**
 Pass Through Settings
 */
@property (nonatomic, strong) AWSMedialivePassThroughSettings * _Nullable passThroughSettings;

@end

/**
 Audio Description
 Required parameters: [AudioSelectorName, Name]
 */
@interface AWSMedialiveAudioDescription : AWSModel


/**
 Advanced audio normalization settings.
 */
@property (nonatomic, strong) AWSMedialiveAudioNormalizationSettings * _Nullable audioNormalizationSettings;

/**
 The name of the AudioSelector used as the source for this AudioDescription.
 */
@property (nonatomic, strong) NSString * _Nullable audioSelectorName;

/**
 Applies only if audioTypeControl is useConfigured. The values for audioType are defined in ISO-IEC 13818-1.
 */
@property (nonatomic, assign) AWSMedialiveAudioType audioType;

/**
 Determines how audio type is determined. followInput: If the input contains an ISO 639 audioType, then that value is passed through to the output. If the input contains no ISO 639 audioType, the value in Audio Type is included in the output. useConfigured: The value in Audio Type is included in the output. Note that this field and audioType are both ignored if inputType is broadcasterMixedAd.
 */
@property (nonatomic, assign) AWSMedialiveAudioDescriptionAudioTypeControl audioTypeControl;

/**
 Audio codec settings.
 */
@property (nonatomic, strong) AWSMedialiveAudioCodecSettings * _Nullable codecSettings;

/**
 Indicates the language of the audio output track. Only used if languageControlMode is useConfigured, or there is no ISO 639 language code specified in the input.
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 Choosing followInput will cause the ISO 639 language code of the output to follow the ISO 639 language code of the input. The languageCode will be used when useConfigured is set, or when followInput is selected but there is no ISO 639 language code specified by the input.
 */
@property (nonatomic, assign) AWSMedialiveAudioDescriptionLanguageCodeControl languageCodeControl;

/**
 The name of this AudioDescription. Outputs will use this name to uniquely identify this AudioDescription.Description names should be unique within this Live Event.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Settings that control how input audio channels are remixed into the output audio channels.
 */
@property (nonatomic, strong) AWSMedialiveRemixSettings * _Nullable remixSettings;

/**
 Used for MS Smooth and Apple HLS outputs. Indicates the name displayed by the player (eg. English, or Director Commentary).
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 Audio Language Selection
 Required parameters: [LanguageCode]
 */
@interface AWSMedialiveAudioLanguageSelection : AWSModel


/**
 Selects a specific three-letter language code from within an audio source.
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 When set to "strict", the transport stream demux strictly identifies audio streams by their language descriptor. If a PMT update occurs such that an audio stream matching the initially selected language is no longer present then mute will be encoded until the language returns. If "loose", then on a PMT update the demux will choose another audio stream in the program with the same stream type if it can't find one with the same language.
 */
@property (nonatomic, assign) AWSMedialiveAudioLanguageSelectionPolicy languageSelectionPolicy;

@end

/**
 Audio Normalization Settings
 */
@interface AWSMedialiveAudioNormalizationSettings : AWSModel


/**
 Audio normalization algorithm to use. itu17701 conforms to the CALM Act specification, itu17702 conforms to the EBU R-128 specification.
 */
@property (nonatomic, assign) AWSMedialiveAudioNormalizationAlgorithm algorithm;

/**
 When set to correctAudio the output audio is corrected using the chosen algorithm. If set to measureOnly, the audio will be measured but not adjusted.
 */
@property (nonatomic, assign) AWSMedialiveAudioNormalizationAlgorithmControl algorithmControl;

/**
 Target LKFS(loudness) to adjust volume to. If no value is entered, a default value will be used according to the chosen algorithm.The CALM Act (1770-1) recommends a target of -24 LKFS. The EBU R-128 specification (1770-2) recommends a target of -23 LKFS.
 */
@property (nonatomic, strong) NSNumber * _Nullable targetLkfs;

@end

/**
 Audio Only Hls Settings
 */
@interface AWSMedialiveAudioOnlyHlsSettings : AWSModel


/**
 Specifies the group to which the audio Rendition belongs.
 */
@property (nonatomic, strong) NSString * _Nullable audioGroupId;

/**
 Optional. Specifies the .jpg or .png image to use as the cover art for an audio-only output. We recommend a low bit-size file because the image increases the output audio bandwidth.The image is attached to the audio as an ID3 tag, frame type APIC, picture type 0x10, as per the "ID3 tag version 2.4.0 - Native Frames" standard.
 */
@property (nonatomic, strong) AWSMedialiveInputLocation * _Nullable audioOnlyImage;

/**
 Four types of audio-only tracks are supported:Audio-Only Variant Stream The client can play back this audio-only stream instead of video in low-bandwidth scenarios. Represented as an EXT-X-STREAM-INF in the HLS manifest.Alternate Audio, Auto Select, Default Alternate rendition that the client should try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=YES, AUTOSELECT=YESAlternate Audio, Auto Select, Not Default Alternate rendition that the client may try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO, AUTOSELECT=YESAlternate Audio, not Auto Select Alternate rendition that the client will not try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO, AUTOSELECT=NO
 */
@property (nonatomic, assign) AWSMedialiveAudioOnlyHlsTrackType audioTrackType;

/**
 Specifies the segment type.
 */
@property (nonatomic, assign) AWSMedialiveAudioOnlyHlsSegmentType segmentType;

@end

/**
 Audio Pid Selection
 Required parameters: [Pid]
 */
@interface AWSMedialiveAudioPidSelection : AWSModel


/**
 Selects a specific PID from within a source.
 */
@property (nonatomic, strong) NSNumber * _Nullable pid;

@end

/**
 Audio Selector
 Required parameters: [Name]
 */
@interface AWSMedialiveAudioSelector : AWSModel


/**
 The name of this AudioSelector. AudioDescriptions will use this name to uniquely identify this Selector.Selector names should be unique per input.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The audio selector settings.
 */
@property (nonatomic, strong) AWSMedialiveAudioSelectorSettings * _Nullable selectorSettings;

@end

/**
 Audio Selector Settings
 */
@interface AWSMedialiveAudioSelectorSettings : AWSModel


/**
 Audio Language Selection
 */
@property (nonatomic, strong) AWSMedialiveAudioLanguageSelection * _Nullable audioLanguageSelection;

/**
 Audio Pid Selection
 */
@property (nonatomic, strong) AWSMedialiveAudioPidSelection * _Nullable audioPidSelection;

/**
 Audio Track Selection
 */
@property (nonatomic, strong) AWSMedialiveAudioTrackSelection * _Nullable audioTrackSelection;

@end

/**
 Audio Track
 Required parameters: [Track]
 */
@interface AWSMedialiveAudioTrack : AWSModel


/**
 1-based integer value that maps to a specific audio track
 */
@property (nonatomic, strong) NSNumber * _Nullable track;

@end

/**
 Audio Track Selection
 Required parameters: [Tracks]
 */
@interface AWSMedialiveAudioTrackSelection : AWSModel


/**
 Selects one or more unique audio tracks from within an mp4 source.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveAudioTrack *> * _Nullable tracks;

@end

/**
 The settings for Automatic Input Failover.
 Required parameters: [SecondaryInputId]
 */
@interface AWSMedialiveAutomaticInputFailoverSettings : AWSModel


/**
 Input preference when deciding which input to make active when a previously failed input has recovered.
 */
@property (nonatomic, assign) AWSMedialiveInputPreference inputPreference;

/**
 The input ID of the secondary input in the automatic input failover pair.
 */
@property (nonatomic, strong) NSString * _Nullable secondaryInputId;

@end

/**
 Avail Blanking
 */
@interface AWSMedialiveAvailBlanking : AWSModel


/**
 Blanking image to be used. Leave empty for solid black. Only bmp and png images are supported.
 */
@property (nonatomic, strong) AWSMedialiveInputLocation * _Nullable availBlankingImage;

/**
 When set to enabled, causes video, audio and captions to be blanked when insertion metadata is added.
 */
@property (nonatomic, assign) AWSMedialiveAvailBlankingState state;

@end

/**
 Avail Configuration
 */
@interface AWSMedialiveAvailConfiguration : AWSModel


/**
 Ad avail settings.
 */
@property (nonatomic, strong) AWSMedialiveAvailSettings * _Nullable availSettings;

@end

/**
 Avail Settings
 */
@interface AWSMedialiveAvailSettings : AWSModel


/**
 Scte35 Splice Insert
 */
@property (nonatomic, strong) AWSMedialiveScte35SpliceInsert * _Nullable scte35SpliceInsert;

/**
 Scte35 Time Signal Apos
 */
@property (nonatomic, strong) AWSMedialiveScte35TimeSignalApos * _Nullable scte35TimeSignalApos;

@end

/**
 A list of schedule actions to create (in a request) or that have been created (in a response).
 Required parameters: [ScheduleActions]
 */
@interface AWSMedialiveBatchScheduleActionCreateRequest : AWSModel


/**
 A list of schedule actions to create.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveScheduleAction *> * _Nullable scheduleActions;

@end

/**
 List of actions that have been created in the schedule.
 Required parameters: [ScheduleActions]
 */
@interface AWSMedialiveBatchScheduleActionCreateResult : AWSModel


/**
 List of actions that have been created in the schedule.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveScheduleAction *> * _Nullable scheduleActions;

@end

/**
 A list of schedule actions to delete.
 Required parameters: [ActionNames]
 */
@interface AWSMedialiveBatchScheduleActionDeleteRequest : AWSModel


/**
 A list of schedule actions to delete.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actionNames;

@end

/**
 List of actions that have been deleted from the schedule.
 Required parameters: [ScheduleActions]
 */
@interface AWSMedialiveBatchScheduleActionDeleteResult : AWSModel


/**
 List of actions that have been deleted from the schedule.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveScheduleAction *> * _Nullable scheduleActions;

@end

/**
 List of actions to create and list of actions to delete.
 Required parameters: [ChannelId]
 */
@interface AWSMedialiveBatchUpdateScheduleRequest : AWSRequest


/**
 Id of the channel whose schedule is being updated.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 Schedule actions to create in the schedule.
 */
@property (nonatomic, strong) AWSMedialiveBatchScheduleActionCreateRequest * _Nullable creates;

/**
 Schedule actions to delete from the schedule.
 */
@property (nonatomic, strong) AWSMedialiveBatchScheduleActionDeleteRequest * _Nullable deletes;

@end

/**
 Placeholder documentation for BatchUpdateScheduleResponse
 */
@interface AWSMedialiveBatchUpdateScheduleResponse : AWSModel


/**
 Schedule actions created in the schedule.
 */
@property (nonatomic, strong) AWSMedialiveBatchScheduleActionCreateResult * _Nullable creates;

/**
 Schedule actions deleted from the schedule.
 */
@property (nonatomic, strong) AWSMedialiveBatchScheduleActionDeleteResult * _Nullable deletes;

@end

/**
 Results of a batch schedule update.
 */
@interface AWSMedialiveBatchUpdateScheduleResult : AWSModel


/**
 Schedule actions created in the schedule.
 */
@property (nonatomic, strong) AWSMedialiveBatchScheduleActionCreateResult * _Nullable creates;

/**
 Schedule actions deleted from the schedule.
 */
@property (nonatomic, strong) AWSMedialiveBatchScheduleActionDeleteResult * _Nullable deletes;

@end

/**
 Blackout Slate
 */
@interface AWSMedialiveBlackoutSlate : AWSModel


/**
 Blackout slate image to be used. Leave empty for solid black. Only bmp and png images are supported.
 */
@property (nonatomic, strong) AWSMedialiveInputLocation * _Nullable blackoutSlateImage;

/**
 Setting to enabled causes the encoder to blackout the video, audio, and captions, and raise the "Network Blackout Image" slate when an SCTE104/35 Network End Segmentation Descriptor is encountered. The blackout will be lifted when the Network Start Segmentation Descriptor is encountered. The Network End and Network Start descriptors must contain a network ID that matches the value entered in "Network ID".
 */
@property (nonatomic, assign) AWSMedialiveBlackoutSlateNetworkEndBlackout networkEndBlackout;

/**
 Path to local file to use as Network End Blackout image. Image will be scaled to fill the entire output raster.
 */
@property (nonatomic, strong) AWSMedialiveInputLocation * _Nullable networkEndBlackoutImage;

/**
 Provides Network ID that matches EIDR ID format (e.g., "10.XXXX/XXXX-XXXX-XXXX-XXXX-XXXX-C").
 */
@property (nonatomic, strong) NSString * _Nullable networkId;

/**
 When set to enabled, causes video, audio and captions to be blanked when indicated by program metadata.
 */
@property (nonatomic, assign) AWSMedialiveBlackoutSlateState state;

@end

/**
 Burn In Destination Settings
 */
@interface AWSMedialiveBurnInDestinationSettings : AWSModel


/**
 If no explicit xPosition or yPosition is provided, setting alignment to centered will place the captions at the bottom center of the output. Similarly, setting a left alignment will align captions to the bottom left of the output. If x and y positions are given in conjunction with the alignment parameter, the font will be justified (either left or centered) relative to those coordinates. Selecting "smart" justification will left-justify live subtitles and center-justify pre-recorded subtitles.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMedialiveBurnInAlignment alignment;

/**
 Specifies the color of the rectangle behind the captions.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMedialiveBurnInBackgroundColor backgroundColor;

/**
 Specifies the opacity of the background rectangle. 255 is opaque; 0 is transparent. Leaving this parameter out is equivalent to setting it to 0 (transparent).All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable backgroundOpacity;

/**
 External font file used for caption burn-in. File extension must be 'ttf' or 'tte'.Although the user can select output fonts for many different types of input captions,embedded, STL and teletext sources use a strict grid system. Using external fonts with these caption sources could cause unexpected display of proportional fonts.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) AWSMedialiveInputLocation * _Nullable font;

/**
 Specifies the color of the burned-in captions.This option is not valid for source captions that are STL, 608/embedded or teletext.These source settings are already pre-defined by the caption stream.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMedialiveBurnInFontColor fontColor;

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
@property (nonatomic, assign) AWSMedialiveBurnInOutlineColor outlineColor;

/**
 Specifies font outline size in pixels. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable outlineSize;

/**
 Specifies the color of the shadow cast by the captions.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMedialiveBurnInShadowColor shadowColor;

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
@property (nonatomic, assign) AWSMedialiveBurnInTeletextGridControl teletextGridControl;

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
@interface AWSMedialiveCaptionDescription : AWSModel


/**
 Specifies which input caption selector to use as a caption source when generating output captions. This field should match a captionSelector name.
 */
@property (nonatomic, strong) NSString * _Nullable captionSelectorName;

/**
 Additional settings for captions destination that depend on the destination type.
 */
@property (nonatomic, strong) AWSMedialiveCaptionDestinationSettings * _Nullable destinationSettings;

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
@interface AWSMedialiveCaptionDestinationSettings : AWSModel


/**
 Arib Destination Settings
 */
@property (nonatomic, strong) AWSMedialiveAribDestinationSettings * _Nullable aribDestinationSettings;

/**
 Burn In Destination Settings
 */
@property (nonatomic, strong) AWSMedialiveBurnInDestinationSettings * _Nullable burnInDestinationSettings;

/**
 Dvb Sub Destination Settings
 */
@property (nonatomic, strong) AWSMedialiveDvbSubDestinationSettings * _Nullable dvbSubDestinationSettings;

/**
 Embedded Destination Settings
 */
@property (nonatomic, strong) AWSMedialiveEmbeddedDestinationSettings * _Nullable embeddedDestinationSettings;

/**
 Embedded Plus Scte20 Destination Settings
 */
@property (nonatomic, strong) AWSMedialiveEmbeddedPlusScte20DestinationSettings * _Nullable embeddedPlusScte20DestinationSettings;

/**
 Rtmp Caption Info Destination Settings
 */
@property (nonatomic, strong) AWSMedialiveRtmpCaptionInfoDestinationSettings * _Nullable rtmpCaptionInfoDestinationSettings;

/**
 Scte20 Plus Embedded Destination Settings
 */
@property (nonatomic, strong) AWSMedialiveScte20PlusEmbeddedDestinationSettings * _Nullable scte20PlusEmbeddedDestinationSettings;

/**
 Scte27 Destination Settings
 */
@property (nonatomic, strong) AWSMedialiveScte27DestinationSettings * _Nullable scte27DestinationSettings;

/**
 Smpte Tt Destination Settings
 */
@property (nonatomic, strong) AWSMedialiveSmpteTtDestinationSettings * _Nullable smpteTtDestinationSettings;

/**
 Teletext Destination Settings
 */
@property (nonatomic, strong) AWSMedialiveTeletextDestinationSettings * _Nullable teletextDestinationSettings;

/**
 Ttml Destination Settings
 */
@property (nonatomic, strong) AWSMedialiveTtmlDestinationSettings * _Nullable ttmlDestinationSettings;

/**
 Webvtt Destination Settings
 */
@property (nonatomic, strong) AWSMedialiveWebvttDestinationSettings * _Nullable webvttDestinationSettings;

@end

/**
 Maps a caption channel to an ISO 693-2 language code (http://www.loc.gov/standards/iso639-2), with an optional description.
 Required parameters: [LanguageCode, LanguageDescription, CaptionChannel]
 */
@interface AWSMedialiveCaptionLanguageMapping : AWSModel


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
@interface AWSMedialiveCaptionSelector : AWSModel


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
@property (nonatomic, strong) AWSMedialiveCaptionSelectorSettings * _Nullable selectorSettings;

@end

/**
 Caption Selector Settings
 */
@interface AWSMedialiveCaptionSelectorSettings : AWSModel


/**
 Arib Source Settings
 */
@property (nonatomic, strong) AWSMedialiveAribSourceSettings * _Nullable aribSourceSettings;

/**
 Dvb Sub Source Settings
 */
@property (nonatomic, strong) AWSMedialiveDvbSubSourceSettings * _Nullable dvbSubSourceSettings;

/**
 Embedded Source Settings
 */
@property (nonatomic, strong) AWSMedialiveEmbeddedSourceSettings * _Nullable embeddedSourceSettings;

/**
 Scte20 Source Settings
 */
@property (nonatomic, strong) AWSMedialiveScte20SourceSettings * _Nullable scte20SourceSettings;

/**
 Scte27 Source Settings
 */
@property (nonatomic, strong) AWSMedialiveScte27SourceSettings * _Nullable scte27SourceSettings;

/**
 Teletext Source Settings
 */
@property (nonatomic, strong) AWSMedialiveTeletextSourceSettings * _Nullable teletextSourceSettings;

@end

/**
 Placeholder documentation for Channel
 */
@interface AWSMedialiveChannel : AWSModel


/**
 The unique arn of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSMedialiveChannelClass channelClass;

/**
 A list of destinations of the channel. For UDP outputs, there is one destination per output. For other types (HLS, for example), there is one destination per packager. 
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestination *> * _Nullable destinations;

/**
 The endpoints where outgoing connections initiate from
 */
@property (nonatomic, strong) NSArray<AWSMedialiveChannelEgressEndpoint *> * _Nullable egressEndpoints;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSMedialiveEncoderSettings * _Nullable encoderSettings;

/**
 The unique id of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Placeholder documentation for InputSpecification
 */
@property (nonatomic, strong) AWSMedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level being written to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSMedialiveLogLevel logLevel;

/**
 The name of the channel. (user-mutable)
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Runtime details for the pipelines of a running channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialivePipelineDetail *> * _Nullable pipelineDetails;

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
@property (nonatomic, assign) AWSMedialiveChannelState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for ChannelConfigurationValidationError
 */
@interface AWSMedialiveChannelConfigurationValidationError : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 A collection of validation error responses.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveValidationError *> * _Nullable validationErrors;

@end

/**
 Placeholder documentation for ChannelEgressEndpoint
 */
@interface AWSMedialiveChannelEgressEndpoint : AWSModel


/**
 Public IP of where a channel's output comes from
 */
@property (nonatomic, strong) NSString * _Nullable sourceIp;

@end

/**
 Placeholder documentation for ChannelSummary
 */
@interface AWSMedialiveChannelSummary : AWSModel


/**
 The unique arn of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSMedialiveChannelClass channelClass;

/**
 A list of destinations of the channel. For UDP outputs, there is one destination per output. For other types (HLS, for example), there is one destination per packager. 
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestination *> * _Nullable destinations;

/**
 The endpoints where outgoing connections initiate from
 */
@property (nonatomic, strong) NSArray<AWSMedialiveChannelEgressEndpoint *> * _Nullable egressEndpoints;

/**
 The unique id of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Placeholder documentation for InputSpecification
 */
@property (nonatomic, strong) AWSMedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level being written to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSMedialiveLogLevel logLevel;

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
@property (nonatomic, assign) AWSMedialiveChannelState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Passthrough applies no color space conversion to the output
 */
@interface AWSMedialiveColorSpacePassthroughSettings : AWSModel


@end

/**
 Placeholder documentation for CreateChannel
 */
@interface AWSMedialiveCreateChannel : AWSModel


/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSMedialiveChannelClass channelClass;

/**
 Placeholder documentation for __listOfOutputDestination
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestination *> * _Nullable destinations;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSMedialiveEncoderSettings * _Nullable encoderSettings;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Specification of input for this channel (max. bitrate, resolution, codec, etc.)
 */
@property (nonatomic, strong) AWSMedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level to write to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSMedialiveLogLevel logLevel;

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
@interface AWSMedialiveCreateChannelRequest : AWSRequest


/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSMedialiveChannelClass channelClass;

/**
 Placeholder documentation for __listOfOutputDestination
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestination *> * _Nullable destinations;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSMedialiveEncoderSettings * _Nullable encoderSettings;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Specification of input for this channel (max. bitrate, resolution, codec, etc.)
 */
@property (nonatomic, strong) AWSMedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level to write to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSMedialiveLogLevel logLevel;

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
@interface AWSMedialiveCreateChannelResponse : AWSModel


/**
 Placeholder documentation for Channel
 */
@property (nonatomic, strong) AWSMedialiveChannel * _Nullable channel;

@end

/**
 Placeholder documentation for CreateChannelResultModel
 */
@interface AWSMedialiveCreateChannelResultModel : AWSModel


/**
 Placeholder documentation for Channel
 */
@property (nonatomic, strong) AWSMedialiveChannel * _Nullable channel;

@end

/**
 Placeholder documentation for CreateInput
 */
@interface AWSMedialiveCreateInput : AWSModel


/**
 Destination settings for PUSH type inputs.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputDestinationRequest *> * _Nullable destinations;

/**
 Settings for the devices.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputDeviceSettings *> * _Nullable inputDevices;

/**
 A list of security groups referenced by IDs to attach to the input.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inputSecurityGroups;

/**
 A list of the MediaConnect Flows that you want to use in this input. You can specify as few as one Flow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a separate Availability Zone as this ensures your EML input is redundant to AZ issues. 
 */
@property (nonatomic, strong) NSArray<AWSMedialiveMediaConnectFlowRequest *> * _Nullable mediaConnectFlows;

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
@property (nonatomic, strong) NSArray<AWSMedialiveInputSourceRequest *> * _Nullable sources;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Placeholder documentation for InputType
 */
@property (nonatomic, assign) AWSMedialiveInputType types;

/**
 Settings for a private VPC Input. When this property is specified, the input destination addresses will be created in a VPC rather than with public Internet addresses. This property requires setting the roleArn property on Input creation. Not compatible with the inputSecurityGroups property. 
 */
@property (nonatomic, strong) AWSMedialiveInputVpcRequest * _Nullable vpc;

@end

/**
 The name of the input
 */
@interface AWSMedialiveCreateInputRequest : AWSRequest


/**
 Destination settings for PUSH type inputs.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputDestinationRequest *> * _Nullable destinations;

/**
 Settings for the devices.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputDeviceSettings *> * _Nullable inputDevices;

/**
 A list of security groups referenced by IDs to attach to the input.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inputSecurityGroups;

/**
 A list of the MediaConnect Flows that you want to use in this input. You can specify as few as one Flow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a separate Availability Zone as this ensures your EML input is redundant to AZ issues. 
 */
@property (nonatomic, strong) NSArray<AWSMedialiveMediaConnectFlowRequest *> * _Nullable mediaConnectFlows;

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
@property (nonatomic, strong) NSArray<AWSMedialiveInputSourceRequest *> * _Nullable sources;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Placeholder documentation for InputType
 */
@property (nonatomic, assign) AWSMedialiveInputType types;

/**
 Settings for a private VPC Input. When this property is specified, the input destination addresses will be created in a VPC rather than with public Internet addresses. This property requires setting the roleArn property on Input creation. Not compatible with the inputSecurityGroups property. 
 */
@property (nonatomic, strong) AWSMedialiveInputVpcRequest * _Nullable vpc;

@end

/**
 Placeholder documentation for CreateInputResponse
 */
@interface AWSMedialiveCreateInputResponse : AWSModel


/**
 Placeholder documentation for Input
 */
@property (nonatomic, strong) AWSMedialiveInput * _Nullable input;

@end

/**
 Placeholder documentation for CreateInputResultModel
 */
@interface AWSMedialiveCreateInputResultModel : AWSModel


/**
 Placeholder documentation for Input
 */
@property (nonatomic, strong) AWSMedialiveInput * _Nullable input;

@end

/**
 The IPv4 CIDRs to whitelist for this Input Security Group
 */
@interface AWSMedialiveCreateInputSecurityGroupRequest : AWSRequest


/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 List of IPv4 CIDR addresses to whitelist
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputWhitelistRuleCidr *> * _Nullable whitelistRules;

@end

/**
 Placeholder documentation for CreateInputSecurityGroupResponse
 */
@interface AWSMedialiveCreateInputSecurityGroupResponse : AWSModel


/**
 An Input Security Group
 */
@property (nonatomic, strong) AWSMedialiveInputSecurityGroup * _Nullable securityGroup;

@end

/**
 Placeholder documentation for CreateInputSecurityGroupResultModel
 */
@interface AWSMedialiveCreateInputSecurityGroupResultModel : AWSModel


/**
 An Input Security Group
 */
@property (nonatomic, strong) AWSMedialiveInputSecurityGroup * _Nullable securityGroup;

@end

/**
 Placeholder documentation for CreateMultiplex
 Required parameters: [RequestId, MultiplexSettings, AvailabilityZones, Name]
 */
@interface AWSMedialiveCreateMultiplex : AWSModel


/**
 A list of availability zones for the multiplex. You must specify exactly two.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexSettings * _Nullable multiplexSettings;

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
@interface AWSMedialiveCreateMultiplexProgram : AWSModel


/**
 The settings for this multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

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
@interface AWSMedialiveCreateMultiplexProgramRequest : AWSRequest


/**
 ID of the multiplex where the program is to be created.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

/**
 The settings for this multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

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
@interface AWSMedialiveCreateMultiplexProgramResponse : AWSModel


/**
 The newly created multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgram * _Nullable multiplexProgram;

@end

/**
 Placeholder documentation for CreateMultiplexProgramResultModel
 */
@interface AWSMedialiveCreateMultiplexProgramResultModel : AWSModel


/**
 The newly created multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgram * _Nullable multiplexProgram;

@end

/**
 A request to create a multiplex.
 Required parameters: [RequestId, MultiplexSettings, AvailabilityZones, Name]
 */
@interface AWSMedialiveCreateMultiplexRequest : AWSRequest


/**
 A list of availability zones for the multiplex. You must specify exactly two.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexSettings * _Nullable multiplexSettings;

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
@interface AWSMedialiveCreateMultiplexResponse : AWSModel


/**
 The newly created multiplex.
 */
@property (nonatomic, strong) AWSMedialiveMultiplex * _Nullable multiplex;

@end

/**
 Placeholder documentation for CreateMultiplexResultModel
 */
@interface AWSMedialiveCreateMultiplexResultModel : AWSModel


/**
 The newly created multiplex.
 */
@property (nonatomic, strong) AWSMedialiveMultiplex * _Nullable multiplex;

@end

/**
 Placeholder documentation for CreateTagsRequest
 Required parameters: [ResourceArn]
 */
@interface AWSMedialiveCreateTagsRequest : AWSRequest


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
@interface AWSMedialiveDeleteChannelRequest : AWSRequest


/**
 Unique ID of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

@end

/**
 Placeholder documentation for DeleteChannelResponse
 */
@interface AWSMedialiveDeleteChannelResponse : AWSModel


/**
 The unique arn of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSMedialiveChannelClass channelClass;

/**
 A list of destinations of the channel. For UDP outputs, there is one destination per output. For other types (HLS, for example), there is one destination per packager. 
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestination *> * _Nullable destinations;

/**
 The endpoints where outgoing connections initiate from
 */
@property (nonatomic, strong) NSArray<AWSMedialiveChannelEgressEndpoint *> * _Nullable egressEndpoints;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSMedialiveEncoderSettings * _Nullable encoderSettings;

/**
 The unique id of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Placeholder documentation for InputSpecification
 */
@property (nonatomic, strong) AWSMedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level being written to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSMedialiveLogLevel logLevel;

/**
 The name of the channel. (user-mutable)
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Runtime details for the pipelines of a running channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialivePipelineDetail *> * _Nullable pipelineDetails;

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
@property (nonatomic, assign) AWSMedialiveChannelState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for DeleteInputRequest
 Required parameters: [InputId]
 */
@interface AWSMedialiveDeleteInputRequest : AWSRequest


/**
 Unique ID of the input
 */
@property (nonatomic, strong) NSString * _Nullable inputId;

@end

/**
 Placeholder documentation for DeleteInputResponse
 */
@interface AWSMedialiveDeleteInputResponse : AWSModel


@end

/**
 Placeholder documentation for DeleteInputSecurityGroupRequest
 Required parameters: [InputSecurityGroupId]
 */
@interface AWSMedialiveDeleteInputSecurityGroupRequest : AWSRequest


/**
 The Input Security Group to delete
 */
@property (nonatomic, strong) NSString * _Nullable inputSecurityGroupId;

@end

/**
 Placeholder documentation for DeleteInputSecurityGroupResponse
 */
@interface AWSMedialiveDeleteInputSecurityGroupResponse : AWSModel


@end

/**
 Placeholder documentation for DeleteMultiplexProgramRequest
 Required parameters: [MultiplexId, ProgramName]
 */
@interface AWSMedialiveDeleteMultiplexProgramRequest : AWSRequest


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
@interface AWSMedialiveDeleteMultiplexProgramResponse : AWSModel


/**
 The MediaLive channel associated with the program.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 The settings for this multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

/**
 The packet identifier map for this multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgramPacketIdentifiersMap * _Nullable packetIdentifiersMap;

/**
 The name of the multiplex program.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

@end

/**
 Placeholder documentation for DeleteMultiplexRequest
 Required parameters: [MultiplexId]
 */
@interface AWSMedialiveDeleteMultiplexRequest : AWSRequest


/**
 The ID of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

@end

/**
 Placeholder documentation for DeleteMultiplexResponse
 */
@interface AWSMedialiveDeleteMultiplexResponse : AWSModel


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
@property (nonatomic, strong) NSArray<AWSMedialiveMultiplexOutputDestination *> * _Nullable destinations;

/**
 The unique id of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexSettings * _Nullable multiplexSettings;

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
@property (nonatomic, assign) AWSMedialiveMultiplexState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for DeleteReservationRequest
 Required parameters: [ReservationId]
 */
@interface AWSMedialiveDeleteReservationRequest : AWSRequest


/**
 Unique reservation ID, e.g. '1234567'
 */
@property (nonatomic, strong) NSString * _Nullable reservationId;

@end

/**
 Placeholder documentation for DeleteReservationResponse
 */
@interface AWSMedialiveDeleteReservationResponse : AWSModel


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
@property (nonatomic, assign) AWSMedialiveOfferingDurationUnits durationUnits;

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
@property (nonatomic, assign) AWSMedialiveOfferingType offeringType;

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
@property (nonatomic, strong) AWSMedialiveReservationResourceSpecification * _Nullable resourceSpecification;

/**
 Reservation UTC start date and time in ISO-8601 format, e.g. '2018-03-01T00:00:00'
 */
@property (nonatomic, strong) NSString * _Nullable start;

/**
 Current state of reservation, e.g. 'ACTIVE'
 */
@property (nonatomic, assign) AWSMedialiveReservationState state;

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
@interface AWSMedialiveDeleteScheduleRequest : AWSRequest


/**
 Id of the channel whose schedule is being deleted.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

@end

/**
 Placeholder documentation for DeleteScheduleResponse
 */
@interface AWSMedialiveDeleteScheduleResponse : AWSModel


@end

/**
 Placeholder documentation for DeleteTagsRequest
 Required parameters: [TagKeys, ResourceArn]
 */
@interface AWSMedialiveDeleteTagsRequest : AWSRequest


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
@interface AWSMedialiveDescribeChannelRequest : AWSRequest


/**
 channel ID
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

@end

/**
 Placeholder documentation for DescribeChannelResponse
 */
@interface AWSMedialiveDescribeChannelResponse : AWSModel


/**
 The unique arn of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSMedialiveChannelClass channelClass;

/**
 A list of destinations of the channel. For UDP outputs, there is one destination per output. For other types (HLS, for example), there is one destination per packager. 
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestination *> * _Nullable destinations;

/**
 The endpoints where outgoing connections initiate from
 */
@property (nonatomic, strong) NSArray<AWSMedialiveChannelEgressEndpoint *> * _Nullable egressEndpoints;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSMedialiveEncoderSettings * _Nullable encoderSettings;

/**
 The unique id of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Placeholder documentation for InputSpecification
 */
@property (nonatomic, strong) AWSMedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level being written to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSMedialiveLogLevel logLevel;

/**
 The name of the channel. (user-mutable)
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Runtime details for the pipelines of a running channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialivePipelineDetail *> * _Nullable pipelineDetails;

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
@property (nonatomic, assign) AWSMedialiveChannelState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for DescribeInputDeviceRequest
 Required parameters: [InputDeviceId]
 */
@interface AWSMedialiveDescribeInputDeviceRequest : AWSRequest


/**
 The unique ID of this input device. For example, hd-123456789abcdef.
 */
@property (nonatomic, strong) NSString * _Nullable inputDeviceId;

@end

/**
 Placeholder documentation for DescribeInputDeviceResponse
 */
@interface AWSMedialiveDescribeInputDeviceResponse : AWSModel


/**
 The unique ARN of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The state of the connection between the input device and AWS.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceConnectionState connectionState;

/**
 The status of the action to synchronize the device configuration. If you change the configuration of the input device (for example, the maximum bitrate), MediaLive sends the new data to the device. The device might not update itself immediately. SYNCED means the device has updated its configuration. SYNCING means that it has not updated its configuration.
 */
@property (nonatomic, assign) AWSMedialiveDeviceSettingsSyncState deviceSettingsSyncState;

/**
 Settings that describe an input device that is type HD.
 */
@property (nonatomic, strong) AWSMedialiveInputDeviceHdSettings * _Nullable hdDeviceSettings;

/**
 The unique ID of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The network MAC address of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable macAddress;

/**
 A name that you specify for the input device.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The network settings for the input device.
 */
@property (nonatomic, strong) AWSMedialiveInputDeviceNetworkSettings * _Nullable networkSettings;

/**
 The unique serial number of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 The type of the input device.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceType types;

@end

/**
 Placeholder documentation for DescribeInputRequest
 Required parameters: [InputId]
 */
@interface AWSMedialiveDescribeInputRequest : AWSRequest


/**
 Unique ID of the input
 */
@property (nonatomic, strong) NSString * _Nullable inputId;

@end

/**
 Placeholder documentation for DescribeInputResponse
 */
@interface AWSMedialiveDescribeInputResponse : AWSModel


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
@property (nonatomic, strong) NSArray<AWSMedialiveInputDestination *> * _Nullable destinations;

/**
 The generated ID of the input (unique for user account, immutable).
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 STANDARD - MediaLive expects two sources to be connected to this input. If the channel is also STANDARD, both sources will be ingested. If the channel is SINGLE_PIPELINE, only the first source will be ingested; the second source will always be ignored, even if the first source fails. SINGLE_PIPELINE - You can connect only one source to this input. If the ChannelClass is alsoSINGLE_PIPELINE, this value is valid. If the ChannelClass is STANDARD, this value is not valid because the channel requires two sources in the input. 
 */
@property (nonatomic, assign) AWSMedialiveInputClass inputClass;

/**
 Settings for the input devices.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputDeviceSettings *> * _Nullable inputDevices;

/**
 Certain pull input sources can be dynamic, meaning that they can have their URL's dynamically changes during input switch actions. Presently, this functionality only works with MP4_FILE inputs. 
 */
@property (nonatomic, assign) AWSMedialiveInputSourceType inputSourceType;

/**
 A list of MediaConnect Flows for this input.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveMediaConnectFlow *> * _Nullable mediaConnectFlows;

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
@property (nonatomic, strong) NSArray<AWSMedialiveInputSource *> * _Nullable sources;

/**
 Placeholder documentation for InputState
 */
@property (nonatomic, assign) AWSMedialiveInputState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Placeholder documentation for InputType
 */
@property (nonatomic, assign) AWSMedialiveInputType types;

@end

/**
 Placeholder documentation for DescribeInputSecurityGroupRequest
 Required parameters: [InputSecurityGroupId]
 */
@interface AWSMedialiveDescribeInputSecurityGroupRequest : AWSRequest


/**
 The id of the Input Security Group to describe
 */
@property (nonatomic, strong) NSString * _Nullable inputSecurityGroupId;

@end

/**
 Placeholder documentation for DescribeInputSecurityGroupResponse
 */
@interface AWSMedialiveDescribeInputSecurityGroupResponse : AWSModel


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
@property (nonatomic, assign) AWSMedialiveInputSecurityGroupState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Whitelist rules and their sync status
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputWhitelistRule *> * _Nullable whitelistRules;

@end

/**
 Placeholder documentation for DescribeMultiplexProgramRequest
 Required parameters: [MultiplexId, ProgramName]
 */
@interface AWSMedialiveDescribeMultiplexProgramRequest : AWSRequest


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
@interface AWSMedialiveDescribeMultiplexProgramResponse : AWSModel


/**
 The MediaLive channel associated with the program.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 The settings for this multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

/**
 The packet identifier map for this multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgramPacketIdentifiersMap * _Nullable packetIdentifiersMap;

/**
 The name of the multiplex program.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

@end

/**
 Placeholder documentation for DescribeMultiplexRequest
 Required parameters: [MultiplexId]
 */
@interface AWSMedialiveDescribeMultiplexRequest : AWSRequest


/**
 The ID of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

@end

/**
 Placeholder documentation for DescribeMultiplexResponse
 */
@interface AWSMedialiveDescribeMultiplexResponse : AWSModel


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
@property (nonatomic, strong) NSArray<AWSMedialiveMultiplexOutputDestination *> * _Nullable destinations;

/**
 The unique id of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexSettings * _Nullable multiplexSettings;

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
@property (nonatomic, assign) AWSMedialiveMultiplexState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for DescribeOfferingRequest
 Required parameters: [OfferingId]
 */
@interface AWSMedialiveDescribeOfferingRequest : AWSRequest


/**
 Unique offering ID, e.g. '87654321'
 */
@property (nonatomic, strong) NSString * _Nullable offeringId;

@end

/**
 Placeholder documentation for DescribeOfferingResponse
 */
@interface AWSMedialiveDescribeOfferingResponse : AWSModel


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
@property (nonatomic, assign) AWSMedialiveOfferingDurationUnits durationUnits;

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
@property (nonatomic, assign) AWSMedialiveOfferingType offeringType;

/**
 AWS region, e.g. 'us-west-2'
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 Resource configuration details
 */
@property (nonatomic, strong) AWSMedialiveReservationResourceSpecification * _Nullable resourceSpecification;

/**
 Recurring usage charge for each reserved resource, e.g. '157.0'
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 Placeholder documentation for DescribeReservationRequest
 Required parameters: [ReservationId]
 */
@interface AWSMedialiveDescribeReservationRequest : AWSRequest


/**
 Unique reservation ID, e.g. '1234567'
 */
@property (nonatomic, strong) NSString * _Nullable reservationId;

@end

/**
 Placeholder documentation for DescribeReservationResponse
 */
@interface AWSMedialiveDescribeReservationResponse : AWSModel


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
@property (nonatomic, assign) AWSMedialiveOfferingDurationUnits durationUnits;

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
@property (nonatomic, assign) AWSMedialiveOfferingType offeringType;

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
@property (nonatomic, strong) AWSMedialiveReservationResourceSpecification * _Nullable resourceSpecification;

/**
 Reservation UTC start date and time in ISO-8601 format, e.g. '2018-03-01T00:00:00'
 */
@property (nonatomic, strong) NSString * _Nullable start;

/**
 Current state of reservation, e.g. 'ACTIVE'
 */
@property (nonatomic, assign) AWSMedialiveReservationState state;

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
@interface AWSMedialiveDescribeScheduleRequest : AWSRequest


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
@interface AWSMedialiveDescribeScheduleResponse : AWSModel


/**
 The next token; for use in pagination.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 The list of actions in the schedule.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveScheduleAction *> * _Nullable scheduleActions;

@end

/**
 DVB Network Information Table (NIT)
 Required parameters: [NetworkName, NetworkId]
 */
@interface AWSMedialiveDvbNitSettings : AWSModel


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
@interface AWSMedialiveDvbSdtSettings : AWSModel


/**
 Selects method of inserting SDT information into output stream. The sdtFollow setting copies SDT information from input stream to output stream. The sdtFollowIfPresent setting copies SDT information from input stream to output stream if SDT information is present in the input, otherwise it will fall back on the user-defined values. The sdtManual setting means user will enter the SDT information. The sdtNone setting means output stream will not contain SDT information.
 */
@property (nonatomic, assign) AWSMedialiveDvbSdtOutputSdt outputSdt;

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
@interface AWSMedialiveDvbSubDestinationSettings : AWSModel


/**
 If no explicit xPosition or yPosition is provided, setting alignment to centered will place the captions at the bottom center of the output. Similarly, setting a left alignment will align captions to the bottom left of the output. If x and y positions are given in conjunction with the alignment parameter, the font will be justified (either left or centered) relative to those coordinates. Selecting "smart" justification will left-justify live subtitles and center-justify pre-recorded subtitles.This option is not valid for source captions that are STL or 608/embedded.These source settings are already pre-defined by the caption stream.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMedialiveDvbSubDestinationAlignment alignment;

/**
 Specifies the color of the rectangle behind the captions.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMedialiveDvbSubDestinationBackgroundColor backgroundColor;

/**
 Specifies the opacity of the background rectangle. 255 is opaque; 0 is transparent. Leaving this parameter blank is equivalent to setting it to 0 (transparent).All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable backgroundOpacity;

/**
 External font file used for caption burn-in. File extension must be 'ttf' or 'tte'.Although the user can select output fonts for many different types of input captions, embedded, STL and teletext sources use a strict grid system. Using external fonts with these caption sources could cause unexpected display of proportional fonts.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) AWSMedialiveInputLocation * _Nullable font;

/**
 Specifies the color of the burned-in captions.This option is not valid for source captions that are STL, 608/embedded or teletext.These source settings are already pre-defined by the caption stream.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMedialiveDvbSubDestinationFontColor fontColor;

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
@property (nonatomic, assign) AWSMedialiveDvbSubDestinationOutlineColor outlineColor;

/**
 Specifies font outline size in pixels. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable outlineSize;

/**
 Specifies the color of the shadow cast by the captions.All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMedialiveDvbSubDestinationShadowColor shadowColor;

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
@property (nonatomic, assign) AWSMedialiveDvbSubDestinationTeletextGridControl teletextGridControl;

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
@interface AWSMedialiveDvbSubSourceSettings : AWSModel


/**
 When using DVB-Sub with Burn-In or SMPTE-TT, use this PID for the source content. Unused for DVB-Sub passthrough. All DVB-Sub content is passed through, regardless of selectors.
 */
@property (nonatomic, strong) NSNumber * _Nullable pid;

@end

/**
 DVB Time and Date Table (SDT)
 */
@interface AWSMedialiveDvbTdtSettings : AWSModel


/**
 The number of milliseconds between instances of this table in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable repInterval;

@end

/**
 Eac3 Settings
 */
@interface AWSMedialiveEac3Settings : AWSModel


/**
 When set to attenuate3Db, applies a 3 dB attenuation to the surround channels. Only used for 3/2 coding mode.
 */
@property (nonatomic, assign) AWSMedialiveEac3AttenuationControl attenuationControl;

/**
 Average bitrate in bits/second. Valid bitrates depend on the coding mode.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specifies the bitstream mode (bsmod) for the emitted E-AC-3 stream. See ATSC A/52-2012 (Annex E) for background on these values.
 */
@property (nonatomic, assign) AWSMedialiveEac3BitstreamMode bitstreamMode;

/**
 Dolby Digital Plus coding mode. Determines number of channels.
 */
@property (nonatomic, assign) AWSMedialiveEac3CodingMode codingMode;

/**
 When set to enabled, activates a DC highpass filter for all input channels.
 */
@property (nonatomic, assign) AWSMedialiveEac3DcFilter dcFilter;

/**
 Sets the dialnorm for the output. If blank and input audio is Dolby Digital Plus, dialnorm will be passed through.
 */
@property (nonatomic, strong) NSNumber * _Nullable dialnorm;

/**
 Sets the Dolby dynamic range compression profile.
 */
@property (nonatomic, assign) AWSMedialiveEac3DrcLine drcLine;

/**
 Sets the profile for heavy Dolby dynamic range compression, ensures that the instantaneous signal peaks do not exceed specified levels.
 */
@property (nonatomic, assign) AWSMedialiveEac3DrcRf drcRf;

/**
 When encoding 3/2 audio, setting to lfe enables the LFE channel
 */
@property (nonatomic, assign) AWSMedialiveEac3LfeControl lfeControl;

/**
 When set to enabled, applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid with codingMode32 coding mode.
 */
@property (nonatomic, assign) AWSMedialiveEac3LfeFilter lfeFilter;

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
@property (nonatomic, assign) AWSMedialiveEac3MetadataControl metadataControl;

/**
 When set to whenPossible, input DD+ audio will be passed through if it is present on the input. This detection is dynamic over the life of the transcode. Inputs that alternate between DD+ and non-DD+ content will have a consistent DD+ output as the system alternates between passthrough and encoding.
 */
@property (nonatomic, assign) AWSMedialiveEac3PassthroughControl passthroughControl;

/**
 When set to shift90Degrees, applies a 90-degree phase shift to the surround channels. Only used for 3/2 coding mode.
 */
@property (nonatomic, assign) AWSMedialiveEac3PhaseControl phaseControl;

/**
 Stereo downmix preference. Only used for 3/2 coding mode.
 */
@property (nonatomic, assign) AWSMedialiveEac3StereoDownmix stereoDownmix;

/**
 When encoding 3/2 audio, sets whether an extra center back surround channel is matrix encoded into the left and right surround channels.
 */
@property (nonatomic, assign) AWSMedialiveEac3SurroundExMode surroundExMode;

/**
 When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded into the two channels.
 */
@property (nonatomic, assign) AWSMedialiveEac3SurroundMode surroundMode;

@end

/**
 Embedded Destination Settings
 */
@interface AWSMedialiveEmbeddedDestinationSettings : AWSModel


@end

/**
 Embedded Plus Scte20 Destination Settings
 */
@interface AWSMedialiveEmbeddedPlusScte20DestinationSettings : AWSModel


@end

/**
 Embedded Source Settings
 */
@interface AWSMedialiveEmbeddedSourceSettings : AWSModel


/**
 If upconvert, 608 data is both passed through via the "608 compatibility bytes" fields of the 708 wrapper as well as translated into 708. 708 data present in the source content will be discarded.
 */
@property (nonatomic, assign) AWSMedialiveEmbeddedConvert608To708 convert608To708;

/**
 Set to "auto" to handle streams with intermittent and/or non-aligned SCTE-20 and Embedded captions.
 */
@property (nonatomic, assign) AWSMedialiveEmbeddedScte20Detection scte20Detection;

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
@interface AWSMedialiveEmpty : AWSModel


@end

/**
 Encoder Settings
 Required parameters: [VideoDescriptions, AudioDescriptions, OutputGroups, TimecodeConfig]
 */
@interface AWSMedialiveEncoderSettings : AWSModel


/**
 Placeholder documentation for __listOfAudioDescription
 */
@property (nonatomic, strong) NSArray<AWSMedialiveAudioDescription *> * _Nullable audioDescriptions;

/**
 Settings for ad avail blanking.
 */
@property (nonatomic, strong) AWSMedialiveAvailBlanking * _Nullable availBlanking;

/**
 Event-wide configuration settings for ad avail insertion.
 */
@property (nonatomic, strong) AWSMedialiveAvailConfiguration * _Nullable availConfiguration;

/**
 Settings for blackout slate.
 */
@property (nonatomic, strong) AWSMedialiveBlackoutSlate * _Nullable blackoutSlate;

/**
 Settings for caption decriptions
 */
@property (nonatomic, strong) NSArray<AWSMedialiveCaptionDescription *> * _Nullable captionDescriptions;

/**
 Configuration settings that apply to the event as a whole.
 */
@property (nonatomic, strong) AWSMedialiveGlobalConfiguration * _Nullable globalConfiguration;

/**
 Nielsen configuration settings.
 */
@property (nonatomic, strong) AWSMedialiveNielsenConfiguration * _Nullable nielsenConfiguration;

/**
 Placeholder documentation for __listOfOutputGroup
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputGroup *> * _Nullable outputGroups;

/**
 Contains settings used to acquire and adjust timecode information from inputs.
 */
@property (nonatomic, strong) AWSMedialiveTimecodeConfig * _Nullable timecodeConfig;

/**
 Placeholder documentation for __listOfVideoDescription
 */
@property (nonatomic, strong) NSArray<AWSMedialiveVideoDescription *> * _Nullable videoDescriptions;

@end

/**
 Fec Output Settings
 */
@interface AWSMedialiveFecOutputSettings : AWSModel


/**
 Parameter D from SMPTE 2022-1. The height of the FEC protection matrix.The number of transport stream packets per column error correction packet. Must be between 4 and 20, inclusive.
 */
@property (nonatomic, strong) NSNumber * _Nullable columnDepth;

/**
 Enables column only or column and row based FEC
 */
@property (nonatomic, assign) AWSMedialiveFecOutputIncludeFec includeFec;

/**
 Parameter L from SMPTE 2022-1. The width of the FEC protection matrix.Must be between 1 and 20, inclusive. If only Column FEC is used, then larger values increase robustness.If Row FEC is used, then this is the number of transport stream packets per row error correction packet, and the value must be between 4 and 20, inclusive, if includeFec is columnAndRow. If includeFec is column, this value must be 1 to 20, inclusive.
 */
@property (nonatomic, strong) NSNumber * _Nullable rowLength;

@end

/**
 Start time for the action.
 Required parameters: [Time]
 */
@interface AWSMedialiveFixedModeScheduleActionStartSettings : AWSModel


/**
 Start time for the action to start in the channel. (Not the time for the action to be added to the schedule: actions are always added to the schedule immediately.) UTC format: yyyy-mm-ddThh:mm:ss.nnnZ. All the letters are digits (for example, mm might be 01) except for the two constants "T" for time and "Z" for "UTC format".
 */
@property (nonatomic, strong) NSString * _Nullable time;

@end

/**
 Fmp4 Hls Settings
 */
@interface AWSMedialiveFmp4HlsSettings : AWSModel


/**
 List all the audio groups that are used with the video output stream. Input all the audio GROUP-IDs that are associated to the video, separate by ','.
 */
@property (nonatomic, strong) NSString * _Nullable audioRenditionSets;

/**
 If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input audio and an equivalent ID3 tag will be inserted in the output.
 */
@property (nonatomic, assign) AWSMedialiveFmp4NielsenId3Behavior nielsenId3Behavior;

/**
 When set to passthrough, timed metadata is passed through from input to output.
 */
@property (nonatomic, assign) AWSMedialiveFmp4TimedMetadataBehavior timedMetadataBehavior;

@end

/**
 Settings to specify if an action follows another.
 Required parameters: [ReferenceActionName, FollowPoint]
 */
@interface AWSMedialiveFollowModeScheduleActionStartSettings : AWSModel


/**
 Identifies whether this action starts relative to the start or relative to the end of the reference action.
 */
@property (nonatomic, assign) AWSMedialiveFollowPoint followPoint;

/**
 The action name of another action that this one refers to.
 */
@property (nonatomic, strong) NSString * _Nullable referenceActionName;

@end

/**
 Frame Capture Group Settings
 Required parameters: [Destination]
 */
@interface AWSMedialiveFrameCaptureGroupSettings : AWSModel


/**
 The destination for the frame capture files. Either the URI for an Amazon S3 bucket and object, plus a file name prefix (for example, s3ssl://sportsDelivery/highlights/20180820/curling_) or the URI for a MediaStore container, plus a file name prefix (for example, mediastoressl://sportsDelivery/20180820/curling_). The final file names consist of the prefix from the destination field (for example, "curling_") + name modifier + the counter (5 digits, starting from 00001) + extension (which is always .jpg).For example, curlingLow.00001.jpg
 */
@property (nonatomic, strong) AWSMedialiveOutputLocationRef * _Nullable destination;

@end

/**
 Frame Capture Output Settings
 */
@interface AWSMedialiveFrameCaptureOutputSettings : AWSModel


/**
 Required if the output group contains more than one output. This modifier forms part of the output file name.
 */
@property (nonatomic, strong) NSString * _Nullable nameModifier;

@end

/**
 Frame Capture Settings
 Required parameters: [CaptureInterval]
 */
@interface AWSMedialiveFrameCaptureSettings : AWSModel


/**
 The frequency at which to capture frames for inclusion in the output. May be specified in either seconds or milliseconds, as specified by captureIntervalUnits.
 */
@property (nonatomic, strong) NSNumber * _Nullable captureInterval;

/**
 Unit for the frame capture interval.
 */
@property (nonatomic, assign) AWSMedialiveFrameCaptureIntervalUnit captureIntervalUnits;

@end

/**
 Global Configuration
 */
@interface AWSMedialiveGlobalConfiguration : AWSModel


/**
 Value to set the initial audio gain for the Live Event.
 */
@property (nonatomic, strong) NSNumber * _Nullable initialAudioGain;

/**
 Indicates the action to take when the current input completes (e.g. end-of-file). When switchAndLoopInputs is configured the encoder will restart at the beginning of the first input.When "none" is configured the encoder will transcode either black, a solid color, or a user specified slate images per the "Input Loss Behavior" configuration until the next input switch occurs (which is controlled through the Channel Schedule API).
 */
@property (nonatomic, assign) AWSMedialiveGlobalConfigurationInputEndAction inputEndAction;

/**
 Settings for system actions when input is lost.
 */
@property (nonatomic, strong) AWSMedialiveInputLossBehavior * _Nullable inputLossBehavior;

/**
 Indicates how MediaLive pipelines are synchronized.PIPELINE_LOCKING - MediaLive will attempt to synchronize the output of each pipeline to the other. EPOCH_LOCKING - MediaLive will attempt to synchronize the output of each pipeline to the Unix epoch.
 */
@property (nonatomic, assign) AWSMedialiveGlobalConfigurationOutputLockingMode outputLockingMode;

/**
 Indicates whether the rate of frames emitted by the Live encoder should be paced by its system clock (which optionally may be locked to another source via NTP) or should be locked to the clock of the source that is providing the input stream.
 */
@property (nonatomic, assign) AWSMedialiveGlobalConfigurationOutputTimingSource outputTimingSource;

/**
 Adjusts video input buffer for streams with very low video framerates. This is commonly set to enabled for music channels with less than one video frame per second.
 */
@property (nonatomic, assign) AWSMedialiveGlobalConfigurationLowFramerateInputs supportLowFramerateInputs;

@end

/**
 H264 Color Space Settings
 */
@interface AWSMedialiveH264ColorSpaceSettings : AWSModel


/**
 Passthrough applies no color space conversion to the output
 */
@property (nonatomic, strong) AWSMedialiveColorSpacePassthroughSettings * _Nullable colorSpacePassthroughSettings;

/**
 Rec601 Settings
 */
@property (nonatomic, strong) AWSMedialiveRec601Settings * _Nullable rec601Settings;

/**
 Rec709 Settings
 */
@property (nonatomic, strong) AWSMedialiveRec709Settings * _Nullable rec709Settings;

@end

/**
 H264 Filter Settings
 */
@interface AWSMedialiveH264FilterSettings : AWSModel


/**
 Temporal Filter Settings
 */
@property (nonatomic, strong) AWSMedialiveTemporalFilterSettings * _Nullable temporalFilterSettings;

@end

/**
 H264 Settings
 */
@interface AWSMedialiveH264Settings : AWSModel


/**
 Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.
 */
@property (nonatomic, assign) AWSMedialiveH264AdaptiveQuantization adaptiveQuantization;

/**
 Indicates that AFD values will be written into the output stream.If afdSignaling is "auto", the system will try to preserve the input AFD value (in cases where multiple AFD values are valid). If set to "fixed", the AFD value will be the value configured in the fixedAfd parameter.
 */
@property (nonatomic, assign) AWSMedialiveAfdSignaling afdSignaling;

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
@property (nonatomic, assign) AWSMedialiveH264ColorMetadata colorMetadata;

/**
 Color Space settings
 */
@property (nonatomic, strong) AWSMedialiveH264ColorSpaceSettings * _Nullable colorSpaceSettings;

/**
 Entropy encoding mode.Use cabac (must be in Main or High profile) or cavlc.
 */
@property (nonatomic, assign) AWSMedialiveH264EntropyEncoding entropyEncoding;

/**
 Optional filters that you can apply to an encode.
 */
@property (nonatomic, strong) AWSMedialiveH264FilterSettings * _Nullable filterSettings;

/**
 Four bit AFD value to write on all frames of video in the output stream. Only valid when afdSignaling is set to 'Fixed'.
 */
@property (nonatomic, assign) AWSMedialiveFixedAfd fixedAfd;

/**
 If set to enabled, adjust quantization within each frame to reduce flicker or 'pop' on I-frames.
 */
@property (nonatomic, assign) AWSMedialiveH264FlickerAq flickerAq;

/**
 This setting applies only when scan type is "interlaced." It controls whether coding is performed on a field basis or on a frame basis. (When the video is progressive, the coding is always performed on a frame basis.) enabled: Force MediaLive to code on a field basis, so that odd and even sets of fields are coded separately. disabled: Code the two sets of fields separately (on a field basis) or together (on a frame basis using PAFF), depending on what is most appropriate for the content.
 */
@property (nonatomic, assign) AWSMedialiveH264ForceFieldPictures forceFieldPictures;

/**
 This field indicates how the output video frame rate is specified.If "specified" is selected then the output video frame rate is determined by framerateNumerator and framerateDenominator, else if "initializeFromSource" is selected then the output video frame rate will be set equal to the input video frame rate of the first input.
 */
@property (nonatomic, assign) AWSMedialiveH264FramerateControl framerateControl;

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
@property (nonatomic, assign) AWSMedialiveH264GopBReference gopBReference;

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
@property (nonatomic, assign) AWSMedialiveH264GopSizeUnits gopSizeUnits;

/**
 H.264 Level.
 */
@property (nonatomic, assign) AWSMedialiveH264Level level;

/**
 Amount of lookahead. A value of low can decrease latency and memory usage, while high can produce better quality for certain content.
 */
@property (nonatomic, assign) AWSMedialiveH264LookAheadRateControl lookAheadRateControl;

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
@property (nonatomic, assign) AWSMedialiveH264ParControl parControl;

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
@property (nonatomic, assign) AWSMedialiveH264Profile profile;

/**
 Leave as STANDARD_QUALITY or choose a different value (which might result in additional costs to run the channel). - ENHANCED_QUALITY: Produces a slightly better video quality without an increase in the bitrate. Has an effect only when the Rate control mode is QVBR or CBR. If this channel is in a MediaLive multiplex, the value must be ENHANCED_QUALITY. - STANDARD_QUALITY: Valid for any Rate control mode.
 */
@property (nonatomic, assign) AWSMedialiveH264QualityLevel qualityLevel;

/**
 Controls the target quality for the video encode. Applies only when the rate control mode is QVBR. Set values for the QVBR quality level field and Max bitrate field that suit your most important viewing devices. Recommended values are: - Primary screen: Quality level: 8 to 10. Max bitrate: 4M - PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M - Smartphone: Quality level: 6. Max bitrate: 1M to 1.5M
 */
@property (nonatomic, strong) NSNumber * _Nullable qvbrQualityLevel;

/**
 Rate control mode.QVBR: Quality will match the specified quality level except when it is constrained by the maximum bitrate.Recommended if you or your viewers pay for bandwidth.VBR: Quality and bitrate vary, depending on the video complexity. Recommended instead of QVBR if you want to maintain a specific average bitrate over the duration of the channel.CBR: Quality varies, depending on the video complexity. Recommended only if you distribute your assets to devices that cannot handle variable bitrates.Multiplex: This rate control mode is only supported (and is required) when the video is being delivered to a MediaLive Multiplex in which case the rate control configuration is controlled by the properties within the Multiplex Program.
 */
@property (nonatomic, assign) AWSMedialiveH264RateControlMode rateControlMode;

/**
 Sets the scan type of the output to progressive or top-field-first interlaced.
 */
@property (nonatomic, assign) AWSMedialiveH264ScanType scanType;

/**
 Scene change detection.- On: inserts I-frames when scene change is detected. - Off: does not force an I-frame when scene change is detected.
 */
@property (nonatomic, assign) AWSMedialiveH264SceneChangeDetect sceneChangeDetect;

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
@property (nonatomic, assign) AWSMedialiveH264SpatialAq spatialAq;

/**
 If set to fixed, use gopNumBFrames B-frames per sub-GOP. If set to dynamic, optimize the number of B-frames used for each sub-GOP to improve visual quality.
 */
@property (nonatomic, assign) AWSMedialiveH264SubGopLength subgopLength;

/**
 Produces a bitstream compliant with SMPTE RP-2027.
 */
@property (nonatomic, assign) AWSMedialiveH264Syntax syntax;

/**
 If set to enabled, adjust quantization within each frame based on temporal variation of content complexity.
 */
@property (nonatomic, assign) AWSMedialiveH264TemporalAq temporalAq;

/**
 Determines how timecodes should be inserted into the video elementary stream. - 'disabled': Do not include timecodes - 'picTimingSei': Pass through picture timing SEI messages from the source specified in Timecode Config
 */
@property (nonatomic, assign) AWSMedialiveH264TimecodeInsertionBehavior timecodeInsertion;

@end

/**
 H265 Color Space Settings
 */
@interface AWSMedialiveH265ColorSpaceSettings : AWSModel


/**
 Passthrough applies no color space conversion to the output
 */
@property (nonatomic, strong) AWSMedialiveColorSpacePassthroughSettings * _Nullable colorSpacePassthroughSettings;

/**
 Hdr10 Settings
 */
@property (nonatomic, strong) AWSMedialiveHdr10Settings * _Nullable hdr10Settings;

/**
 Rec601 Settings
 */
@property (nonatomic, strong) AWSMedialiveRec601Settings * _Nullable rec601Settings;

/**
 Rec709 Settings
 */
@property (nonatomic, strong) AWSMedialiveRec709Settings * _Nullable rec709Settings;

@end

/**
 H265 Settings
 Required parameters: [FramerateNumerator, FramerateDenominator]
 */
@interface AWSMedialiveH265Settings : AWSModel


/**
 Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.
 */
@property (nonatomic, assign) AWSMedialiveH265AdaptiveQuantization adaptiveQuantization;

/**
 Indicates that AFD values will be written into the output stream.If afdSignaling is "auto", the system will try to preserve the input AFD value (in cases where multiple AFD values are valid). If set to "fixed", the AFD value will be the value configured in the fixedAfd parameter.
 */
@property (nonatomic, assign) AWSMedialiveAfdSignaling afdSignaling;

/**
 Whether or not EML should insert an Alternative Transfer Function SEI message to support backwards compatibility with non-HDR decoders and displays.
 */
@property (nonatomic, assign) AWSMedialiveH265AlternativeTransferFunction alternativeTransferFunction;

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
@property (nonatomic, assign) AWSMedialiveH265ColorMetadata colorMetadata;

/**
 Color Space settings
 */
@property (nonatomic, strong) AWSMedialiveH265ColorSpaceSettings * _Nullable colorSpaceSettings;

/**
 Four bit AFD value to write on all frames of video in the output stream. Only valid when afdSignaling is set to 'Fixed'.
 */
@property (nonatomic, assign) AWSMedialiveFixedAfd fixedAfd;

/**
 If set to enabled, adjust quantization within each frame to reduce flicker or 'pop' on I-frames.
 */
@property (nonatomic, assign) AWSMedialiveH265FlickerAq flickerAq;

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
@property (nonatomic, assign) AWSMedialiveH265GopSizeUnits gopSizeUnits;

/**
 H.265 Level.
 */
@property (nonatomic, assign) AWSMedialiveH265Level level;

/**
 Amount of lookahead. A value of low can decrease latency and memory usage, while high can produce better quality for certain content.
 */
@property (nonatomic, assign) AWSMedialiveH265LookAheadRateControl lookAheadRateControl;

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
@property (nonatomic, assign) AWSMedialiveH265Profile profile;

/**
 Controls the target quality for the video encode. Applies only when the rate control mode is QVBR. Set values for the QVBR quality level field and Max bitrate field that suit your most important viewing devices. Recommended values are: - Primary screen: Quality level: 8 to 10. Max bitrate: 4M - PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M - Smartphone: Quality level: 6. Max bitrate: 1M to 1.5M
 */
@property (nonatomic, strong) NSNumber * _Nullable qvbrQualityLevel;

/**
 Rate control mode.QVBR: Quality will match the specified quality level except when it is constrained by the maximum bitrate.Recommended if you or your viewers pay for bandwidth.CBR: Quality varies, depending on the video complexity. Recommended only if you distribute your assets to devices that cannot handle variable bitrates.
 */
@property (nonatomic, assign) AWSMedialiveH265RateControlMode rateControlMode;

/**
 Sets the scan type of the output to progressive or top-field-first interlaced.
 */
@property (nonatomic, assign) AWSMedialiveH265ScanType scanType;

/**
 Scene change detection.
 */
@property (nonatomic, assign) AWSMedialiveH265SceneChangeDetect sceneChangeDetect;

/**
 Number of slices per picture. Must be less than or equal to the number of macroblock rows for progressive pictures, and less than or equal to half the number of macroblock rows for interlaced pictures. This field is optional; when no value is specified the encoder will choose the number of slices based on encode resolution.
 */
@property (nonatomic, strong) NSNumber * _Nullable slices;

/**
 H.265 Tier.
 */
@property (nonatomic, assign) AWSMedialiveH265Tier tier;

/**
 Determines how timecodes should be inserted into the video elementary stream. - 'disabled': Do not include timecodes - 'picTimingSei': Pass through picture timing SEI messages from the source specified in Timecode Config
 */
@property (nonatomic, assign) AWSMedialiveH265TimecodeInsertionBehavior timecodeInsertion;

@end

/**
 Hdr10 Settings
 */
@interface AWSMedialiveHdr10Settings : AWSModel


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
@interface AWSMedialiveHlsAkamaiSettings : AWSModel


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
@property (nonatomic, assign) AWSMedialiveHlsAkamaiHttpTransferMode httpTransferMode;

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
@interface AWSMedialiveHlsBasicPutSettings : AWSModel


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
@interface AWSMedialiveHlsCdnSettings : AWSModel


/**
 Hls Akamai Settings
 */
@property (nonatomic, strong) AWSMedialiveHlsAkamaiSettings * _Nullable hlsAkamaiSettings;

/**
 Hls Basic Put Settings
 */
@property (nonatomic, strong) AWSMedialiveHlsBasicPutSettings * _Nullable hlsBasicPutSettings;

/**
 Hls Media Store Settings
 */
@property (nonatomic, strong) AWSMedialiveHlsMediaStoreSettings * _Nullable hlsMediaStoreSettings;

/**
 Hls Webdav Settings
 */
@property (nonatomic, strong) AWSMedialiveHlsWebdavSettings * _Nullable hlsWebdavSettings;

@end

/**
 Hls Group Settings
 Required parameters: [Destination]
 */
@interface AWSMedialiveHlsGroupSettings : AWSModel


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
@property (nonatomic, strong) NSArray<AWSMedialiveCaptionLanguageMapping *> * _Nullable captionLanguageMappings;

/**
 Applies only to 608 Embedded output captions. insert: Include CLOSED-CAPTIONS lines in the manifest. Specify at least one language in the CC1 Language Code field. One CLOSED-CAPTION line is added for each Language Code you specify. Make sure to specify the languages in the order in which they appear in the original source (if the source is embedded format) or the order of the caption selectors (if the source is other than embedded). Otherwise, languages in the manifest will not match up properly with the output captions. none: Include CLOSED-CAPTIONS=NONE line in the manifest. omit: Omit any CLOSED-CAPTIONS line from the manifest.
 */
@property (nonatomic, assign) AWSMedialiveHlsCaptionLanguageSetting captionLanguageSetting;

/**
 When set to "disabled", sets the #EXT-X-ALLOW-CACHE:no tag in the manifest, which prevents clients from saving media segments for later replay.
 */
@property (nonatomic, assign) AWSMedialiveHlsClientCache clientCache;

/**
 Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist generation.
 */
@property (nonatomic, assign) AWSMedialiveHlsCodecSpecification codecSpecification;

/**
 For use with encryptionType. This is a 128-bit, 16-byte hex value represented by a 32-character text string. If ivSource is set to "explicit" then this parameter is required and is used as the IV for encryption.
 */
@property (nonatomic, strong) NSString * _Nullable constantIv;

/**
 A directory or HTTP destination for the HLS segments, manifest files, and encryption keys (if enabled).
 */
@property (nonatomic, strong) AWSMedialiveOutputLocationRef * _Nullable destination;

/**
 Place segments in subdirectories.
 */
@property (nonatomic, assign) AWSMedialiveHlsDirectoryStructure directoryStructure;

/**
 Encrypts the segments with the given encryption scheme.Exclude this parameter if no encryption is desired.
 */
@property (nonatomic, assign) AWSMedialiveHlsEncryptionType encryptionType;

/**
 Parameters that control interactions with the CDN.
 */
@property (nonatomic, strong) AWSMedialiveHlsCdnSettings * _Nullable hlsCdnSettings;

/**
 State of HLS ID3 Segment Tagging
 */
@property (nonatomic, assign) AWSMedialiveHlsId3SegmentTaggingState hlsId3SegmentTagging;

/**
 DISABLED: Do not create an I-frame-only manifest, but do create the master and media manifests (according to the Output Selection field).STANDARD: Create an I-frame-only manifest for each output that contains video, as well as the other manifests (according to the Output Selection field). The I-frame manifest contains a #EXT-X-I-FRAMES-ONLY tag to indicate it is I-frame only, and one or more #EXT-X-BYTERANGE entries identifying the I-frame position. For example, #EXT-X-BYTERANGE:160364@1461888"
 */
@property (nonatomic, assign) AWSMedialiveIFrameOnlyPlaylistType IFrameOnlyPlaylists;

/**
 Applies only if Mode field is LIVE. Specifies the maximum number of segments in the media manifest file. After this maximum, older segments are removed from the media manifest. This number must be less than or equal to the Keep Segments field.
 */
@property (nonatomic, strong) NSNumber * _Nullable indexNSegments;

/**
 Parameter that control output group behavior on input loss.
 */
@property (nonatomic, assign) AWSMedialiveInputLossActionForHlsOut inputLossAction;

/**
 For use with encryptionType. The IV (Initialization Vector) is a 128-bit number used in conjunction with the key for encrypting blocks. If set to "include", IV is listed in the manifest, otherwise the IV is not in the manifest.
 */
@property (nonatomic, assign) AWSMedialiveHlsIvInManifest ivInManifest;

/**
 For use with encryptionType. The IV (Initialization Vector) is a 128-bit number used in conjunction with the key for encrypting blocks. If this setting is "followsSegmentNumber", it will cause the IV to change every segment (to match the segment number). If this is set to "explicit", you must enter a constantIv value.
 */
@property (nonatomic, assign) AWSMedialiveHlsIvSource ivSource;

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
@property (nonatomic, strong) AWSMedialiveKeyProviderSettings * _Nullable keyProviderSettings;

/**
 When set to gzip, compresses HLS playlist.
 */
@property (nonatomic, assign) AWSMedialiveHlsManifestCompression manifestCompression;

/**
 Indicates whether the output manifest should use floating point or integer values for segment duration.
 */
@property (nonatomic, assign) AWSMedialiveHlsManifestDurationFormat manifestDurationFormat;

/**
 When set, minimumSegmentLength is enforced by looking ahead and back within the specified range for a nearby avail and extending the segment size if needed.
 */
@property (nonatomic, strong) NSNumber * _Nullable minSegmentLength;

/**
 If "vod", all segments are indexed and kept permanently in the destination and manifest. If "live", only the number segments specified in keepSegments and indexNSegments are kept; newer segments replace older segments, which may prevent players from rewinding all the way to the beginning of the event.VOD mode uses HLS EXT-X-PLAYLIST-TYPE of EVENT while the channel is running, converting it to a "VOD" type manifest on completion of the stream.
 */
@property (nonatomic, assign) AWSMedialiveHlsMode mode;

/**
 MANIFESTS_AND_SEGMENTS: Generates manifests (master manifest, if applicable, and media manifests) for this output group.VARIANT_MANIFESTS_AND_SEGMENTS: Generates media manifests for this output group, but not a master manifest.SEGMENTS_ONLY: Does not generate any manifests for this output group.
 */
@property (nonatomic, assign) AWSMedialiveHlsOutputSelection outputSelection;

/**
 Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files. The value is calculated as follows: either the program date and time are initialized using the input timecode source, or the time is initialized using the input timecode source and the date is initialized using the timestampOffset.
 */
@property (nonatomic, assign) AWSMedialiveHlsProgramDateTime programDateTime;

/**
 Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable programDateTimePeriod;

/**
 ENABLED: The master manifest (.m3u8 file) for each pipeline includes information about both pipelines: first its own media files, then the media files of the other pipeline. This feature allows playout device that support stale manifest detection to switch from one manifest to the other, when the current manifest seems to be stale. There are still two destinations and two master manifests, but both master manifests reference the media files from both pipelines.DISABLED: The master manifest (.m3u8 file) for each pipeline includes information about its own pipeline only.For an HLS output group with MediaPackage as the destination, the DISABLED behavior is always followed. MediaPackage regenerates the manifests it serves to players so a redundant manifest from MediaLive is irrelevant.
 */
@property (nonatomic, assign) AWSMedialiveHlsRedundantManifest redundantManifest;

/**
 Length of MPEG-2 Transport Stream segments to create (in seconds). Note that segments will end on the next keyframe after this number of seconds, so actual segment length may be longer.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentLength;

/**
 useInputSegmentation has been deprecated. The configured segment size is always used.
 */
@property (nonatomic, assign) AWSMedialiveHlsSegmentationMode segmentationMode;

/**
 Number of segments to write to a subdirectory before starting a new one. directoryStructure must be subdirectoryPerStream for this setting to have an effect.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentsPerSubdirectory;

/**
 Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of variant manifest.
 */
@property (nonatomic, assign) AWSMedialiveHlsStreamInfResolution streamInfResolution;

/**
 Indicates ID3 frame that has the timecode.
 */
@property (nonatomic, assign) AWSMedialiveHlsTimedMetadataId3Frame timedMetadataId3Frame;

/**
 Timed Metadata interval in seconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable timedMetadataId3Period;

/**
 Provides an extra millisecond delta offset to fine tune the timestamps.
 */
@property (nonatomic, strong) NSNumber * _Nullable timestampDeltaMilliseconds;

/**
 SEGMENTED_FILES: Emit the program as segments - multiple .ts media files.SINGLE_FILE: Applies only if Mode field is VOD. Emit the program as a single .ts media file. The media manifest includes #EXT-X-BYTERANGE tags to index segments for playback. A typical use for this value is when sending the output to AWS Elemental MediaConvert, which can accept only a single media file. Playback while the channel is running is not guaranteed due to HTTP server caching.
 */
@property (nonatomic, assign) AWSMedialiveHlsTsFileMode tsFileMode;

@end

/**
 Settings for the action to insert a user-defined ID3 tag in each HLS segment
 Required parameters: [Tag]
 */
@interface AWSMedialiveHlsId3SegmentTaggingScheduleActionSettings : AWSModel


/**
 ID3 tag to insert into each segment. Supports special keyword identifiers to substitute in segment-related values.\nSupported keyword identifiers: https://docs.aws.amazon.com/medialive/latest/ug/variable-data-identifiers.html
 */
@property (nonatomic, strong) NSString * _Nullable tag;

@end

/**
 Hls Input Settings
 */
@interface AWSMedialiveHlsInputSettings : AWSModel


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
@interface AWSMedialiveHlsMediaStoreSettings : AWSModel


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
@property (nonatomic, assign) AWSMedialiveHlsMediaStoreStorageClass mediaStoreStorageClass;

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
@interface AWSMedialiveHlsOutputSettings : AWSModel


/**
 Only applicable when this output is referencing an H.265 video description. Specifies whether MP4 segments should be packaged as HEV1 or HVC1.
 */
@property (nonatomic, assign) AWSMedialiveHlsH265PackagingType h265PackagingType;

/**
 Settings regarding the underlying stream. These settings are different for audio-only outputs.
 */
@property (nonatomic, strong) AWSMedialiveHlsSettings * _Nullable hlsSettings;

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
@interface AWSMedialiveHlsSettings : AWSModel


/**
 Audio Only Hls Settings
 */
@property (nonatomic, strong) AWSMedialiveAudioOnlyHlsSettings * _Nullable audioOnlyHlsSettings;

/**
 Fmp4 Hls Settings
 */
@property (nonatomic, strong) AWSMedialiveFmp4HlsSettings * _Nullable fmp4HlsSettings;

/**
 Standard Hls Settings
 */
@property (nonatomic, strong) AWSMedialiveStandardHlsSettings * _Nullable standardHlsSettings;

@end

/**
 Settings for the action to emit HLS metadata
 Required parameters: [Id3]
 */
@interface AWSMedialiveHlsTimedMetadataScheduleActionSettings : AWSModel


/**
 Base64 string formatted according to the ID3 specification: http://id3.org/id3v2.4.0-structure
 */
@property (nonatomic, strong) NSString * _Nullable id3;

@end

/**
 Hls Webdav Settings
 */
@interface AWSMedialiveHlsWebdavSettings : AWSModel


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
@property (nonatomic, assign) AWSMedialiveHlsWebdavHttpTransferMode httpTransferMode;

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
@interface AWSMedialiveImmediateModeScheduleActionStartSettings : AWSModel


@end

/**
 Placeholder documentation for Input
 */
@interface AWSMedialiveInput : AWSModel


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
@property (nonatomic, strong) NSArray<AWSMedialiveInputDestination *> * _Nullable destinations;

/**
 The generated ID of the input (unique for user account, immutable).
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 STANDARD - MediaLive expects two sources to be connected to this input. If the channel is also STANDARD, both sources will be ingested. If the channel is SINGLE_PIPELINE, only the first source will be ingested; the second source will always be ignored, even if the first source fails. SINGLE_PIPELINE - You can connect only one source to this input. If the ChannelClass is alsoSINGLE_PIPELINE, this value is valid. If the ChannelClass is STANDARD, this value is not valid because the channel requires two sources in the input. 
 */
@property (nonatomic, assign) AWSMedialiveInputClass inputClass;

/**
 Settings for the input devices.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputDeviceSettings *> * _Nullable inputDevices;

/**
 Certain pull input sources can be dynamic, meaning that they can have their URL's dynamically changes during input switch actions. Presently, this functionality only works with MP4_FILE inputs. 
 */
@property (nonatomic, assign) AWSMedialiveInputSourceType inputSourceType;

/**
 A list of MediaConnect Flows for this input.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveMediaConnectFlow *> * _Nullable mediaConnectFlows;

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
@property (nonatomic, strong) NSArray<AWSMedialiveInputSource *> * _Nullable sources;

/**
 Placeholder documentation for InputState
 */
@property (nonatomic, assign) AWSMedialiveInputState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Placeholder documentation for InputType
 */
@property (nonatomic, assign) AWSMedialiveInputType types;

@end

/**
 Placeholder documentation for InputAttachment
 */
@interface AWSMedialiveInputAttachment : AWSModel


/**
 User-specified settings for defining what the conditions are for declaring the input unhealthy and failing over to a different input.
 */
@property (nonatomic, strong) AWSMedialiveAutomaticInputFailoverSettings * _Nullable automaticInputFailoverSettings;

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
@property (nonatomic, strong) AWSMedialiveInputSettings * _Nullable inputSettings;

@end

/**
 Input Channel Level
 Required parameters: [InputChannel, Gain]
 */
@interface AWSMedialiveInputChannelLevel : AWSModel


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
@interface AWSMedialiveInputClippingSettings : AWSModel


/**
 The source of the timecodes in the source being clipped.
 */
@property (nonatomic, assign) AWSMedialiveInputTimecodeSource inputTimecodeSource;

/**
 Settings to identify the start of the clip.
 */
@property (nonatomic, strong) AWSMedialiveStartTimecode * _Nullable startTimecode;

/**
 Settings to identify the end of the clip.
 */
@property (nonatomic, strong) AWSMedialiveStopTimecode * _Nullable stopTimecode;

@end

/**
 The settings for a PUSH type input.
 */
@interface AWSMedialiveInputDestination : AWSModel


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
@property (nonatomic, strong) AWSMedialiveInputDestinationVpc * _Nullable vpc;

@end

/**
 Endpoint settings for a PUSH type input.
 */
@interface AWSMedialiveInputDestinationRequest : AWSModel


/**
 A unique name for the location the RTMP stream is being pushed to. 
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 The properties for a VPC type input destination.
 */
@interface AWSMedialiveInputDestinationVpc : AWSModel


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
 An input device.
 */
@interface AWSMedialiveInputDevice : AWSModel


/**
 The unique ARN of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The state of the connection between the input device and AWS.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceConnectionState connectionState;

/**
 The status of the action to synchronize the device configuration. If you change the configuration of the input device (for example, the maximum bitrate), MediaLive sends the new data to the device. The device might not update itself immediately. SYNCED means the device has updated its configuration. SYNCING means that it has not updated its configuration.
 */
@property (nonatomic, assign) AWSMedialiveDeviceSettingsSyncState deviceSettingsSyncState;

/**
 Settings that describe an input device that is type HD.
 */
@property (nonatomic, strong) AWSMedialiveInputDeviceHdSettings * _Nullable hdDeviceSettings;

/**
 The unique ID of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The network MAC address of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable macAddress;

/**
 A name that you specify for the input device.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The network settings for the input device.
 */
@property (nonatomic, strong) AWSMedialiveInputDeviceNetworkSettings * _Nullable networkSettings;

/**
 The unique serial number of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 The type of the input device.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceType types;

@end

/**
 Configurable settings for the input device.
 */
@interface AWSMedialiveInputDeviceConfigurableSettings : AWSModel


/**
 The input source that you want to use. If the device has a source connected to only one of its input ports, or if you don't care which source the device sends, specify Auto. If the device has sources connected to both its input ports, and you want to use a specific source, specify the source.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceConfiguredInput configuredInput;

/**
 The maximum bitrate in bits per second. Set a value here to throttle the bitrate of the source video.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxBitrate;

@end

/**
 Placeholder documentation for InputDeviceConfigurationValidationError
 */
@interface AWSMedialiveInputDeviceConfigurationValidationError : AWSModel


/**
 The error message.
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 A collection of validation error responses.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveValidationError *> * _Nullable validationErrors;

@end

/**
 Settings that describe the active source from the input device, and the video characteristics of that source.
 */
@interface AWSMedialiveInputDeviceHdSettings : AWSModel


/**
 If you specified Auto as the configured input, specifies which of the sources is currently active (SDI or HDMI).
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceActiveInput activeInput;

/**
 The source at the input device that is currently active. You can specify this source.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceConfiguredInput configuredInput;

/**
 The state of the input device.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceState deviceState;

/**
 The frame rate of the video source.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerate;

/**
 The height of the video source, in pixels.
 */
@property (nonatomic, strong) NSNumber * _Nullable height;

/**
 The current maximum bitrate for ingesting this source, in bits per second. You can specify this maximum.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxBitrate;

/**
 The scan type of the video source.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceScanType scanType;

/**
 The width of the video source, in pixels.
 */
@property (nonatomic, strong) NSNumber * _Nullable width;

@end

/**
 The network settings for the input device.
 */
@interface AWSMedialiveInputDeviceNetworkSettings : AWSModel


/**
 The DNS addresses of the input device.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable dnsAddresses;

/**
 The network gateway IP address.
 */
@property (nonatomic, strong) NSString * _Nullable gateway;

/**
 The IP address of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

/**
 Specifies whether the input device has been configured (outside of MediaLive) to use a dynamic IP address assignment (DHCP) or a static IP address.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceIpScheme ipScheme;

/**
 The subnet mask of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable subnetMask;

@end

/**
 Settings for an input device.
 */
@interface AWSMedialiveInputDeviceRequest : AWSModel


/**
 The unique ID for the device.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 Settings for an input device.
 */
@interface AWSMedialiveInputDeviceSettings : AWSModel


/**
 The unique ID for the device.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 Details of the input device.
 */
@interface AWSMedialiveInputDeviceSummary : AWSModel


/**
 The unique ARN of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The state of the connection between the input device and AWS.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceConnectionState connectionState;

/**
 The status of the action to synchronize the device configuration. If you change the configuration of the input device (for example, the maximum bitrate), MediaLive sends the new data to the device. The device might not update itself immediately. SYNCED means the device has updated its configuration. SYNCING means that it has not updated its configuration.
 */
@property (nonatomic, assign) AWSMedialiveDeviceSettingsSyncState deviceSettingsSyncState;

/**
 Settings that describe an input device that is type HD.
 */
@property (nonatomic, strong) AWSMedialiveInputDeviceHdSettings * _Nullable hdDeviceSettings;

/**
 The unique ID of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The network MAC address of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable macAddress;

/**
 A name that you specify for the input device.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Network settings for the input device.
 */
@property (nonatomic, strong) AWSMedialiveInputDeviceNetworkSettings * _Nullable networkSettings;

/**
 The unique serial number of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 The type of the input device.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceType types;

@end

/**
 Input Location
 Required parameters: [Uri]
 */
@interface AWSMedialiveInputLocation : AWSModel


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
@interface AWSMedialiveInputLossBehavior : AWSModel


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
@property (nonatomic, strong) AWSMedialiveInputLocation * _Nullable inputLossImageSlate;

/**
 Indicates whether to substitute a solid color or a slate into the output after input loss exceeds blackFrameMsec.
 */
@property (nonatomic, assign) AWSMedialiveInputLossImageType inputLossImageType;

/**
 Documentation update needed
 */
@property (nonatomic, strong) NSNumber * _Nullable repeatFrameMsec;

@end

/**
 An Input Security Group
 */
@interface AWSMedialiveInputSecurityGroup : AWSModel


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
@property (nonatomic, assign) AWSMedialiveInputSecurityGroupState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Whitelist rules and their sync status
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputWhitelistRule *> * _Nullable whitelistRules;

@end

/**
 Request of IPv4 CIDR addresses to whitelist in a security group.
 */
@interface AWSMedialiveInputSecurityGroupWhitelistRequest : AWSModel


/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 List of IPv4 CIDR addresses to whitelist
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputWhitelistRuleCidr *> * _Nullable whitelistRules;

@end

/**
 Live Event input parameters. There can be multiple inputs in a single Live Event.
 */
@interface AWSMedialiveInputSettings : AWSModel


/**
 Used to select the audio stream to decode for inputs that have multiple available.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveAudioSelector *> * _Nullable audioSelectors;

/**
 Used to select the caption input to use for inputs that have multiple available.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveCaptionSelector *> * _Nullable captionSelectors;

/**
 Enable or disable the deblock filter when filtering.
 */
@property (nonatomic, assign) AWSMedialiveInputDeblockFilter deblockFilter;

/**
 Enable or disable the denoise filter when filtering.
 */
@property (nonatomic, assign) AWSMedialiveInputDenoiseFilter denoiseFilter;

/**
 Adjusts the magnitude of filtering from 1 (minimal) to 5 (strongest).
 */
@property (nonatomic, strong) NSNumber * _Nullable filterStrength;

/**
 Turns on the filter for this input. MPEG-2 inputs have the deblocking filter enabled by default. 1) auto - filtering will be applied depending on input type/quality 2) disabled - no filtering will be applied to the input 3) forced - filtering will be applied regardless of input type
 */
@property (nonatomic, assign) AWSMedialiveInputFilter inputFilter;

/**
 Input settings.
 */
@property (nonatomic, strong) AWSMedialiveNetworkInputSettings * _Nullable networkInputSettings;

/**
 Specifies whether to extract applicable ancillary data from a SMPTE-2038 source in this input. Applicable data types are captions, timecode, AFD, and SCTE-104 messages. - PREFER: Extract from SMPTE-2038 if present in this input, otherwise extract from another source (if any). - IGNORE: Never extract any ancillary data from SMPTE-2038.
 */
@property (nonatomic, assign) AWSMedialiveSmpte2038DataPreference smpte2038DataPreference;

/**
 Loop input if it is a file. This allows a file input to be streamed indefinitely.
 */
@property (nonatomic, assign) AWSMedialiveInputSourceEndBehavior sourceEndBehavior;

/**
 Informs which video elementary stream to decode for input types that have multiple available.
 */
@property (nonatomic, strong) AWSMedialiveVideoSelector * _Nullable videoSelector;

@end

/**
 The settings for a PULL type input.
 */
@interface AWSMedialiveInputSource : AWSModel


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
@interface AWSMedialiveInputSourceRequest : AWSModel


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
@interface AWSMedialiveInputSpecification : AWSModel


/**
 Input codec
 */
@property (nonatomic, assign) AWSMedialiveInputCodec codec;

/**
 Maximum input bitrate, categorized coarsely
 */
@property (nonatomic, assign) AWSMedialiveInputMaximumBitrate maximumBitrate;

/**
 Input resolution, categorized coarsely
 */
@property (nonatomic, assign) AWSMedialiveInputResolution resolution;

@end

/**
 Settings for the "switch input" action: to switch from ingesting one input to ingesting another input.
 Required parameters: [InputAttachmentNameReference]
 */
@interface AWSMedialiveInputSwitchScheduleActionSettings : AWSModel


/**
 The name of the input attachment (not the name of the input!) to switch to. The name is specified in the channel configuration.
 */
@property (nonatomic, strong) NSString * _Nullable inputAttachmentNameReference;

/**
 Settings to let you create a clip of the file input, in order to set up the input to ingest only a portion of the file.
 */
@property (nonatomic, strong) AWSMedialiveInputClippingSettings * _Nullable inputClippingSettings;

/**
 The value for the variable portion of the URL for the dynamic input, for this instance of the input. Each time you use the same dynamic input in an input switch action, you can provide a different value, in order to connect the input to a different content source.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable urlPath;

@end

/**
 Settings for a private VPC Input. When this property is specified, the input destination addresses will be created in a VPC rather than with public Internet addresses. This property requires setting the roleArn property on Input creation. Not compatible with the inputSecurityGroups property. 
 Required parameters: [SubnetIds]
 */
@interface AWSMedialiveInputVpcRequest : AWSModel


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
@interface AWSMedialiveInputWhitelistRule : AWSModel


/**
 The IPv4 CIDR that's whitelisted.
 */
@property (nonatomic, strong) NSString * _Nullable cidr;

@end

/**
 An IPv4 CIDR to whitelist.
 */
@interface AWSMedialiveInputWhitelistRuleCidr : AWSModel


/**
 The IPv4 CIDR to whitelist.
 */
@property (nonatomic, strong) NSString * _Nullable cidr;

@end

/**
 Placeholder documentation for InternalServiceError
 */
@interface AWSMedialiveInternalServiceError : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Placeholder documentation for InvalidRequest
 */
@interface AWSMedialiveInvalidRequest : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Key Provider Settings
 */
@interface AWSMedialiveKeyProviderSettings : AWSModel


/**
 Static Key Settings
 */
@property (nonatomic, strong) AWSMedialiveStaticKeySettings * _Nullable staticKeySettings;

@end

/**
 Placeholder documentation for LimitExceeded
 */
@interface AWSMedialiveLimitExceeded : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Placeholder documentation for ListChannelsRequest
 */
@interface AWSMedialiveListChannelsRequest : AWSRequest


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
@interface AWSMedialiveListChannelsResponse : AWSModel


/**
 Placeholder documentation for __listOfChannelSummary
 */
@property (nonatomic, strong) NSArray<AWSMedialiveChannelSummary *> * _Nullable channels;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListChannelsResultModel
 */
@interface AWSMedialiveListChannelsResultModel : AWSModel


/**
 Placeholder documentation for __listOfChannelSummary
 */
@property (nonatomic, strong) NSArray<AWSMedialiveChannelSummary *> * _Nullable channels;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListInputDevicesRequest
 */
@interface AWSMedialiveListInputDevicesRequest : AWSRequest


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
 Placeholder documentation for ListInputDevicesResponse
 */
@interface AWSMedialiveListInputDevicesResponse : AWSModel


/**
 The list of input devices.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputDeviceSummary *> * _Nullable inputDevices;

/**
 A token to get additional list results.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 The list of input devices owned by the AWS account.
 */
@interface AWSMedialiveListInputDevicesResultModel : AWSModel


/**
 The list of input devices.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputDeviceSummary *> * _Nullable inputDevices;

/**
 A token to get additional list results.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListInputSecurityGroupsRequest
 */
@interface AWSMedialiveListInputSecurityGroupsRequest : AWSRequest


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
@interface AWSMedialiveListInputSecurityGroupsResponse : AWSModel


/**
 List of input security groups
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputSecurityGroup *> * _Nullable inputSecurityGroups;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Result of input security group list request
 */
@interface AWSMedialiveListInputSecurityGroupsResultModel : AWSModel


/**
 List of input security groups
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputSecurityGroup *> * _Nullable inputSecurityGroups;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListInputsRequest
 */
@interface AWSMedialiveListInputsRequest : AWSRequest


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
@interface AWSMedialiveListInputsResponse : AWSModel


/**
 Placeholder documentation for __listOfInput
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInput *> * _Nullable inputs;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListInputsResultModel
 */
@interface AWSMedialiveListInputsResultModel : AWSModel


/**
 Placeholder documentation for __listOfInput
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInput *> * _Nullable inputs;

/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListMultiplexProgramsRequest
 Required parameters: [MultiplexId]
 */
@interface AWSMedialiveListMultiplexProgramsRequest : AWSRequest


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
@interface AWSMedialiveListMultiplexProgramsResponse : AWSModel


/**
 List of multiplex programs.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveMultiplexProgramSummary *> * _Nullable multiplexPrograms;

/**
 Token for the next ListMultiplexProgram request.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListMultiplexProgramsResultModel
 */
@interface AWSMedialiveListMultiplexProgramsResultModel : AWSModel


/**
 List of multiplex programs.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveMultiplexProgramSummary *> * _Nullable multiplexPrograms;

/**
 Token for the next ListMultiplexProgram request.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListMultiplexesRequest
 */
@interface AWSMedialiveListMultiplexesRequest : AWSRequest


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
@interface AWSMedialiveListMultiplexesResponse : AWSModel


/**
 List of multiplexes.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveMultiplexSummary *> * _Nullable multiplexes;

/**
 Token for the next ListMultiplexes request.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListMultiplexesResultModel
 */
@interface AWSMedialiveListMultiplexesResultModel : AWSModel


/**
 List of multiplexes.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveMultiplexSummary *> * _Nullable multiplexes;

/**
 Token for the next ListMultiplexes request.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Placeholder documentation for ListOfferingsRequest
 */
@interface AWSMedialiveListOfferingsRequest : AWSRequest


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
@interface AWSMedialiveListOfferingsResponse : AWSModel


/**
 Token to retrieve the next page of results
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 List of offerings
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOffering *> * _Nullable offerings;

@end

/**
 ListOfferings response
 */
@interface AWSMedialiveListOfferingsResultModel : AWSModel


/**
 Token to retrieve the next page of results
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 List of offerings
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOffering *> * _Nullable offerings;

@end

/**
 Placeholder documentation for ListReservationsRequest
 */
@interface AWSMedialiveListReservationsRequest : AWSRequest


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
@interface AWSMedialiveListReservationsResponse : AWSModel


/**
 Token to retrieve the next page of results
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 List of reservations
 */
@property (nonatomic, strong) NSArray<AWSMedialiveReservation *> * _Nullable reservations;

@end

/**
 ListReservations response
 */
@interface AWSMedialiveListReservationsResultModel : AWSModel


/**
 Token to retrieve the next page of results
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 List of reservations
 */
@property (nonatomic, strong) NSArray<AWSMedialiveReservation *> * _Nullable reservations;

@end

/**
 Placeholder documentation for ListTagsForResourceRequest
 Required parameters: [ResourceArn]
 */
@interface AWSMedialiveListTagsForResourceRequest : AWSRequest


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 Placeholder documentation for ListTagsForResourceResponse
 */
@interface AWSMedialiveListTagsForResourceResponse : AWSModel


/**
 Placeholder documentation for Tags
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 M2ts Settings
 */
@interface AWSMedialiveM2tsSettings : AWSModel


/**
 When set to drop, output audio streams will be removed from the program if the selected input audio stream is removed from the input. This allows the output audio configuration to dynamically change based on input configuration. If this is set to encodeSilence, all output audio streams will output encoded silence when not connected to an active input stream.
 */
@property (nonatomic, assign) AWSMedialiveM2tsAbsentInputAudioBehavior absentInputAudioBehavior;

/**
 When set to enabled, uses ARIB-compliant field muxing and removes video descriptor.
 */
@property (nonatomic, assign) AWSMedialiveM2tsArib arib;

/**
 Packet Identifier (PID) for ARIB Captions in the transport stream. Can be entered as a decimal or hexadecimal value.Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable aribCaptionsPid;

/**
 If set to auto, pid number used for ARIB Captions will be auto-selected from unused pids.If set to useConfigured, ARIB Captions will be on the configured pid number.
 */
@property (nonatomic, assign) AWSMedialiveM2tsAribCaptionsPidControl aribCaptionsPidControl;

/**
 When set to dvb, uses DVB buffer model for Dolby Digital audio.When set to atsc, the ATSC model is used.
 */
@property (nonatomic, assign) AWSMedialiveM2tsAudioBufferModel audioBufferModel;

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
@property (nonatomic, assign) AWSMedialiveM2tsAudioStreamType audioStreamType;

/**
 The output bitrate of the transport stream in bits per second. Setting to 0 lets the muxer automatically determine the appropriate bitrate.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 If set to multiplex, use multiplex buffer model for accurate interleaving.Setting to bufferModel to none can lead to lower latency, but low-memory devices may not be able to play back the stream without interruptions.
 */
@property (nonatomic, assign) AWSMedialiveM2tsBufferModel bufferModel;

/**
 When set to enabled, generates captionServiceDescriptor in PMT.
 */
@property (nonatomic, assign) AWSMedialiveM2tsCcDescriptor ccDescriptor;

/**
 Inserts DVB Network Information Table (NIT) at the specified table repetition interval.
 */
@property (nonatomic, strong) AWSMedialiveDvbNitSettings * _Nullable dvbNitSettings;

/**
 Inserts DVB Service Description Table (SDT) at the specified table repetition interval.
 */
@property (nonatomic, strong) AWSMedialiveDvbSdtSettings * _Nullable dvbSdtSettings;

/**
 Packet Identifier (PID) for input source DVB Subtitle data to this output. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values.Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable dvbSubPids;

/**
 Inserts DVB Time and Date Table (TDT) at the specified table repetition interval.
 */
@property (nonatomic, strong) AWSMedialiveDvbTdtSettings * _Nullable dvbTdtSettings;

/**
 Packet Identifier (PID) for input source DVB Teletext data to this output. Can be entered as a decimal or hexadecimal value.Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable dvbTeletextPid;

/**
 If set to passthrough, passes any EBIF data from the input source to this output.
 */
@property (nonatomic, assign) AWSMedialiveM2tsEbifControl ebif;

/**
 When videoAndFixedIntervals is selected, audio EBP markers will be added to partitions 3 and 4. The interval between these additional markers will be fixed, and will be slightly shorter than the video EBP marker interval. Only available when EBP Cablelabs segmentation markers are selected.Partitions 1 and 2 will always follow the video interval.
 */
@property (nonatomic, assign) AWSMedialiveM2tsAudioInterval ebpAudioInterval;

/**
 When set, enforces that Encoder Boundary Points do not come within the specified time interval of each other by looking ahead at input video. If another EBP is going to come in within the specified time interval, the current EBP is not emitted, and the segment is "stretched" to the next marker.The lookahead value does not add latency to the system. The Live Event must be configured elsewhere to create sufficient latency to make the lookahead accurate.
 */
@property (nonatomic, strong) NSNumber * _Nullable ebpLookaheadMs;

/**
 Controls placement of EBP on Audio PIDs. If set to videoAndAudioPids, EBP markers will be placed on the video PID and all audio PIDs.If set to videoPid, EBP markers will be placed on only the video PID.
 */
@property (nonatomic, assign) AWSMedialiveM2tsEbpPlacement ebpPlacement;

/**
 This field is unused and deprecated.
 */
@property (nonatomic, strong) NSString * _Nullable ecmPid;

/**
 Include or exclude the ES Rate field in the PES header.
 */
@property (nonatomic, assign) AWSMedialiveM2tsEsRateInPes esRateInPes;

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
@property (nonatomic, assign) AWSMedialiveM2tsKlv klv;

/**
 Packet Identifier (PID) for input source KLV data to this output. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values.Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable klvDataPids;

/**
 If set to passthrough, Nielsen inaudible tones for media tracking will be detected in the input audio and an equivalent ID3 tag will be inserted in the output.
 */
@property (nonatomic, assign) AWSMedialiveM2tsNielsenId3Behavior nielsenId3Behavior;

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
@property (nonatomic, assign) AWSMedialiveM2tsPcrControl pcrControl;

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
@property (nonatomic, assign) AWSMedialiveM2tsRateMode rateMode;

/**
 Packet Identifier (PID) for input source SCTE-27 data to this output. Multiple values are accepted, and can be entered in ranges and/or by comma separation. Can be entered as decimal or hexadecimal values.Each PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable scte27Pids;

/**
 Optionally pass SCTE-35 signals from the input source to this output.
 */
@property (nonatomic, assign) AWSMedialiveM2tsScte35Control scte35Control;

/**
 Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can be entered as a decimal or hexadecimal value.Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
 */
@property (nonatomic, strong) NSString * _Nullable scte35Pid;

/**
 Inserts segmentation markers at each segmentationTime period. raiSegstart sets the Random Access Indicator bit in the adaptation field. raiAdapt sets the RAI bit and adds the current timecode in the private data bytes. psiSegstart inserts PAT and PMT tables at the start of segments. ebp adds Encoder Boundary Point information to the adaptation field as per OpenCable specification OC-SP-EBP-I01-130118. ebpLegacy adds Encoder Boundary Point information to the adaptation field using a legacy proprietary format.
 */
@property (nonatomic, assign) AWSMedialiveM2tsSegmentationMarkers segmentationMarkers;

/**
 The segmentation style parameter controls how segmentation markers are inserted into the transport stream. With avails, it is possible that segments may be truncated, which can influence where future segmentation markers are inserted.When a segmentation style of "resetCadence" is selected and a segment is truncated due to an avail, we will reset the segmentation cadence. This means the subsequent segment will have a duration of $segmentationTime seconds.When a segmentation style of "maintainCadence" is selected and a segment is truncated due to an avail, we will not reset the segmentation cadence. This means the subsequent segment will likely be truncated as well. However, all segments after that will have a duration of $segmentationTime seconds. Note that EBP lookahead is a slight exception to this rule.
 */
@property (nonatomic, assign) AWSMedialiveM2tsSegmentationStyle segmentationStyle;

/**
 The length in seconds of each segment. Required unless markers is set to _none_.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentationTime;

/**
 When set to passthrough, timed metadata will be passed through from input to output.
 */
@property (nonatomic, assign) AWSMedialiveM2tsTimedMetadataBehavior timedMetadataBehavior;

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
@interface AWSMedialiveM3u8Settings : AWSModel


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
@property (nonatomic, assign) AWSMedialiveM3u8NielsenId3Behavior nielsenId3Behavior;

/**
 The number of milliseconds between instances of this table in the output transport stream. A value of \"0\" writes out the PMT once per segment file.
 */
@property (nonatomic, strong) NSNumber * _Nullable patInterval;

/**
 When set to pcrEveryPesPacket, a Program Clock Reference value is inserted for every Packetized Elementary Stream (PES) header. This parameter is effective only when the PCR PID is the same as the video or audio elementary stream.
 */
@property (nonatomic, assign) AWSMedialiveM3u8PcrControl pcrControl;

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
@property (nonatomic, assign) AWSMedialiveM3u8Scte35Behavior scte35Behavior;

/**
 Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can be entered as a decimal or hexadecimal value.
 */
@property (nonatomic, strong) NSString * _Nullable scte35Pid;

/**
 When set to passthrough, timed metadata is passed through from input to output.
 */
@property (nonatomic, assign) AWSMedialiveM3u8TimedMetadataBehavior timedMetadataBehavior;

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
@interface AWSMedialiveMediaConnectFlow : AWSModel


/**
 The unique ARN of the MediaConnect Flow being used as a source.
 */
@property (nonatomic, strong) NSString * _Nullable flowArn;

@end

/**
 The settings for a MediaConnect Flow.
 */
@interface AWSMedialiveMediaConnectFlowRequest : AWSModel


/**
 The ARN of the MediaConnect Flow that you want to use as a source.
 */
@property (nonatomic, strong) NSString * _Nullable flowArn;

@end

/**
 Media Package Group Settings
 Required parameters: [Destination]
 */
@interface AWSMedialiveMediaPackageGroupSettings : AWSModel


/**
 MediaPackage channel destination.
 */
@property (nonatomic, strong) AWSMedialiveOutputLocationRef * _Nullable destination;

@end

/**
 MediaPackage Output Destination Settings
 */
@interface AWSMedialiveMediaPackageOutputDestinationSettings : AWSModel


/**
 ID of the channel in MediaPackage that is the destination for this output group. You do not need to specify the individual inputs in MediaPackage; MediaLive will handle the connection of the two MediaLive pipelines to the two MediaPackage inputs. The MediaPackage channel and MediaLive channel must be in the same region.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

@end

/**
 Media Package Output Settings
 */
@interface AWSMedialiveMediaPackageOutputSettings : AWSModel


@end

/**
 Mp2 Settings
 */
@interface AWSMedialiveMp2Settings : AWSModel


/**
 Average bitrate in bits/second.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 The MPEG2 Audio coding mode.Valid values are codingMode10 (for mono) or codingMode20 (for stereo).
 */
@property (nonatomic, assign) AWSMedialiveMp2CodingMode codingMode;

/**
 Sample rate in Hz.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

@end

/**
 Ms Smooth Group Settings
 Required parameters: [Destination]
 */
@interface AWSMedialiveMsSmoothGroupSettings : AWSModel


/**
 The ID to include in each message in the sparse track. Ignored if sparseTrackType is NONE.
 */
@property (nonatomic, strong) NSString * _Nullable acquisitionPointId;

/**
 If set to passthrough for an audio-only MS Smooth output, the fragment absolute time will be set to the current timecode. This option does not write timecodes to the audio elementary stream.
 */
@property (nonatomic, assign) AWSMedialiveSmoothGroupAudioOnlyTimecodeControl audioOnlyTimecodeControl;

/**
 If set to verifyAuthenticity, verify the https certificate chain to a trusted Certificate Authority (CA).This will cause https outputs to self-signed certificates to fail.
 */
@property (nonatomic, assign) AWSMedialiveSmoothGroupCertificateMode certificateMode;

/**
 Number of seconds to wait before retrying connection to the IIS server if the connection is lost. Content will be cached during this time and the cache will be be delivered to the IIS server once the connection is re-established.
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionRetryInterval;

/**
 Smooth Streaming publish point on an IIS server. Elemental Live acts as a "Push" encoder to IIS.
 */
@property (nonatomic, strong) AWSMedialiveOutputLocationRef * _Nullable destination;

/**
 MS Smooth event ID to be sent to the IIS server.Should only be specified if eventIdMode is set to useConfigured.
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 Specifies whether or not to send an event ID to the IIS server. If no event ID is sent and the same Live Event is used without changing the publishing point, clients might see cached video from the previous run.Options: - "useConfigured" - use the value provided in eventId - "useTimestamp" - generate and send an event ID based on the current timestamp - "noEventId" - do not send an event ID to the IIS server.
 */
@property (nonatomic, assign) AWSMedialiveSmoothGroupEventIdMode eventIdMode;

/**
 When set to sendEos, send EOS signal to IIS server when stopping the event
 */
@property (nonatomic, assign) AWSMedialiveSmoothGroupEventStopBehavior eventStopBehavior;

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
@property (nonatomic, assign) AWSMedialiveInputLossActionForMsSmoothOut inputLossAction;

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
@property (nonatomic, assign) AWSMedialiveSmoothGroupSegmentationMode segmentationMode;

/**
 Number of milliseconds to delay the output from the second pipeline.
 */
@property (nonatomic, strong) NSNumber * _Nullable sendDelayMs;

/**
 Identifies the type of data to place in the sparse track: - SCTE35: Insert SCTE-35 messages from the source content. With each message, insert an IDR frame to start a new segment. - SCTE35_WITHOUT_SEGMENTATION: Insert SCTE-35 messages from the source content. With each message, insert an IDR frame but don't start a new segment. - NONE: Don't generate a sparse track for any outputs in this output group.
 */
@property (nonatomic, assign) AWSMedialiveSmoothGroupSparseTrackType sparseTrackType;

/**
 When set to send, send stream manifest so publishing point doesn't start until all streams start.
 */
@property (nonatomic, assign) AWSMedialiveSmoothGroupStreamManifestBehavior streamManifestBehavior;

/**
 Timestamp offset for the event.Only used if timestampOffsetMode is set to useConfiguredOffset.
 */
@property (nonatomic, strong) NSString * _Nullable timestampOffset;

/**
 Type of timestamp date offset to use. - useEventStartDate: Use the date the event was started as the offset - useConfiguredOffset: Use an explicitly configured date as the offset
 */
@property (nonatomic, assign) AWSMedialiveSmoothGroupTimestampOffsetMode timestampOffsetMode;

@end

/**
 Ms Smooth Output Settings
 */
@interface AWSMedialiveMsSmoothOutputSettings : AWSModel


/**
 Only applicable when this output is referencing an H.265 video description. Specifies whether MP4 segments should be packaged as HEV1 or HVC1.
 */
@property (nonatomic, assign) AWSMedialiveMsSmoothH265PackagingType h265PackagingType;

/**
 String concatenated to the end of the destination filename.Required for multiple outputs of the same type.
 */
@property (nonatomic, strong) NSString * _Nullable nameModifier;

@end

/**
 The multiplex object.
 */
@interface AWSMedialiveMultiplex : AWSModel


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
@property (nonatomic, strong) NSArray<AWSMedialiveMultiplexOutputDestination *> * _Nullable destinations;

/**
 The unique id of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexSettings * _Nullable multiplexSettings;

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
@property (nonatomic, assign) AWSMedialiveMultiplexState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for MultiplexConfigurationValidationError
 */
@interface AWSMedialiveMultiplexConfigurationValidationError : AWSModel


/**
 The error message.
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 A collection of validation error responses.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveValidationError *> * _Nullable validationErrors;

@end

/**
 Multiplex Group Settings
 */
@interface AWSMedialiveMultiplexGroupSettings : AWSModel


@end

/**
 Multiplex MediaConnect output destination settings.
 */
@interface AWSMedialiveMultiplexMediaConnectOutputDestinationSettings : AWSModel


/**
 The MediaConnect entitlement ARN available as a Flow source.
 */
@property (nonatomic, strong) NSString * _Nullable entitlementArn;

@end

/**
 Multiplex output destination settings
 */
@interface AWSMedialiveMultiplexOutputDestination : AWSModel


/**
 Multiplex MediaConnect output destination settings.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexMediaConnectOutputDestinationSettings * _Nullable mediaConnectSettings;

@end

/**
 Multiplex Output Settings
 Required parameters: [Destination]
 */
@interface AWSMedialiveMultiplexOutputSettings : AWSModel


/**
 Destination is a Multiplex.
 */
@property (nonatomic, strong) AWSMedialiveOutputLocationRef * _Nullable destination;

@end

/**
 The multiplex program object.
 */
@interface AWSMedialiveMultiplexProgram : AWSModel


/**
 The MediaLive channel associated with the program.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 The settings for this multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

/**
 The packet identifier map for this multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgramPacketIdentifiersMap * _Nullable packetIdentifiersMap;

/**
 The name of the multiplex program.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

@end

/**
 Multiplex Program Input Destination Settings for outputting a Channel to a Multiplex
 */
@interface AWSMedialiveMultiplexProgramChannelDestinationSettings : AWSModel


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
@interface AWSMedialiveMultiplexProgramPacketIdentifiersMap : AWSModel


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
@interface AWSMedialiveMultiplexProgramServiceDescriptor : AWSModel


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
@interface AWSMedialiveMultiplexProgramSettings : AWSModel


/**
 Indicates which pipeline is preferred by the multiplex for program ingest.
 */
@property (nonatomic, assign) AWSMedialivePreferredChannelPipeline preferredChannelPipeline;

/**
 Unique program number.
 */
@property (nonatomic, strong) NSNumber * _Nullable programNumber;

/**
 Transport stream service descriptor configuration for the Multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgramServiceDescriptor * _Nullable serviceDescriptor;

/**
 Program video settings configuration.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexVideoSettings * _Nullable videoSettings;

@end

/**
 Placeholder documentation for MultiplexProgramSummary
 */
@interface AWSMedialiveMultiplexProgramSummary : AWSModel


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
@interface AWSMedialiveMultiplexSettings : AWSModel


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
@interface AWSMedialiveMultiplexSettingsSummary : AWSModel


/**
 Transport stream bit rate.
 */
@property (nonatomic, strong) NSNumber * _Nullable transportStreamBitrate;

@end

/**
 Statmux rate control settings
 */
@interface AWSMedialiveMultiplexStatmuxVideoSettings : AWSModel


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
@interface AWSMedialiveMultiplexSummary : AWSModel


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
@property (nonatomic, strong) AWSMedialiveMultiplexSettingsSummary * _Nullable multiplexSettings;

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
@property (nonatomic, assign) AWSMedialiveMultiplexState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 The video configuration for each program in a multiplex.
 */
@interface AWSMedialiveMultiplexVideoSettings : AWSModel


/**
 The constant bitrate configuration for the video encode. When this field is defined, StatmuxSettings must be undefined.
 */
@property (nonatomic, strong) NSNumber * _Nullable constantBitrate;

/**
 Statmux rate control settings. When this field is defined, ConstantBitrate must be undefined.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexStatmuxVideoSettings * _Nullable statmuxSettings;

@end

/**
 Network source to transcode. Must be accessible to the Elemental Live node that is running the live event through a network connection.
 */
@interface AWSMedialiveNetworkInputSettings : AWSModel


/**
 Specifies HLS input settings when the uri is for a HLS manifest.
 */
@property (nonatomic, strong) AWSMedialiveHlsInputSettings * _Nullable hlsInputSettings;

/**
 Check HTTPS server certificates. When set to checkCryptographyOnly, cryptography in the certificate will be checked, but not the server's name. Certain subdomains (notably S3 buckets that use dots in the bucket name) do not strictly match the corresponding certificate's wildcard pattern and would otherwise cause the event to error. This setting is ignored for protocols that do not use https.
 */
@property (nonatomic, assign) AWSMedialiveNetworkInputServerValidation serverValidation;

@end

/**
 Nielsen Configuration
 */
@interface AWSMedialiveNielsenConfiguration : AWSModel


/**
 Enter the Distributor ID assigned to your organization by Nielsen.
 */
@property (nonatomic, strong) NSString * _Nullable distributorId;

/**
 Enables Nielsen PCM to ID3 tagging
 */
@property (nonatomic, assign) AWSMedialiveNielsenPcmToId3TaggingState nielsenPcmToId3Tagging;

@end

/**
 Reserved resources available for purchase
 */
@interface AWSMedialiveOffering : AWSModel


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
@property (nonatomic, assign) AWSMedialiveOfferingDurationUnits durationUnits;

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
@property (nonatomic, assign) AWSMedialiveOfferingType offeringType;

/**
 AWS region, e.g. 'us-west-2'
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 Resource configuration details
 */
@property (nonatomic, strong) AWSMedialiveReservationResourceSpecification * _Nullable resourceSpecification;

/**
 Recurring usage charge for each reserved resource, e.g. '157.0'
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 Output settings. There can be multiple outputs within a group.
 Required parameters: [OutputSettings]
 */
@interface AWSMedialiveOutput : AWSModel


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
@property (nonatomic, strong) AWSMedialiveOutputSettings * _Nullable outputSettings;

/**
 The name of the VideoDescription used as the source for this output.
 */
@property (nonatomic, strong) NSString * _Nullable videoDescriptionName;

@end

/**
 Placeholder documentation for OutputDestination
 */
@interface AWSMedialiveOutputDestination : AWSModel


/**
 User-specified id. This is used in an output group or an output.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Destination settings for a MediaPackage output; one destination for both encoders.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveMediaPackageOutputDestinationSettings *> * _Nullable mediaPackageSettings;

/**
 Destination settings for a Multiplex output; one destination for both encoders.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgramChannelDestinationSettings * _Nullable multiplexSettings;

/**
 Destination settings for a standard output; one destination for each redundant encoder.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestinationSettings *> * _Nullable settings;

@end

/**
 Placeholder documentation for OutputDestinationSettings
 */
@interface AWSMedialiveOutputDestinationSettings : AWSModel


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
@interface AWSMedialiveOutputGroup : AWSModel


/**
 Custom output group name optionally defined by the user.Only letters, numbers, and the underscore character allowed; only 32 characters allowed.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Settings associated with the output group.
 */
@property (nonatomic, strong) AWSMedialiveOutputGroupSettings * _Nullable outputGroupSettings;

/**
 Placeholder documentation for __listOfOutput
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutput *> * _Nullable outputs;

@end

/**
 Output Group Settings
 */
@interface AWSMedialiveOutputGroupSettings : AWSModel


/**
 Archive Group Settings
 */
@property (nonatomic, strong) AWSMedialiveArchiveGroupSettings * _Nullable archiveGroupSettings;

/**
 Frame Capture Group Settings
 */
@property (nonatomic, strong) AWSMedialiveFrameCaptureGroupSettings * _Nullable frameCaptureGroupSettings;

/**
 Hls Group Settings
 */
@property (nonatomic, strong) AWSMedialiveHlsGroupSettings * _Nullable hlsGroupSettings;

/**
 Media Package Group Settings
 */
@property (nonatomic, strong) AWSMedialiveMediaPackageGroupSettings * _Nullable mediaPackageGroupSettings;

/**
 Ms Smooth Group Settings
 */
@property (nonatomic, strong) AWSMedialiveMsSmoothGroupSettings * _Nullable msSmoothGroupSettings;

/**
 Multiplex Group Settings
 */
@property (nonatomic, strong) AWSMedialiveMultiplexGroupSettings * _Nullable multiplexGroupSettings;

/**
 Rtmp Group Settings
 */
@property (nonatomic, strong) AWSMedialiveRtmpGroupSettings * _Nullable rtmpGroupSettings;

/**
 Udp Group Settings
 */
@property (nonatomic, strong) AWSMedialiveUdpGroupSettings * _Nullable udpGroupSettings;

@end

/**
 Reference to an OutputDestination ID defined in the channel
 */
@interface AWSMedialiveOutputLocationRef : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable destinationRefId;

@end

/**
 Output Settings
 */
@interface AWSMedialiveOutputSettings : AWSModel


/**
 Archive Output Settings
 */
@property (nonatomic, strong) AWSMedialiveArchiveOutputSettings * _Nullable archiveOutputSettings;

/**
 Frame Capture Output Settings
 */
@property (nonatomic, strong) AWSMedialiveFrameCaptureOutputSettings * _Nullable frameCaptureOutputSettings;

/**
 Hls Output Settings
 */
@property (nonatomic, strong) AWSMedialiveHlsOutputSettings * _Nullable hlsOutputSettings;

/**
 Media Package Output Settings
 */
@property (nonatomic, strong) AWSMedialiveMediaPackageOutputSettings * _Nullable mediaPackageOutputSettings;

/**
 Ms Smooth Output Settings
 */
@property (nonatomic, strong) AWSMedialiveMsSmoothOutputSettings * _Nullable msSmoothOutputSettings;

/**
 Multiplex Output Settings
 */
@property (nonatomic, strong) AWSMedialiveMultiplexOutputSettings * _Nullable multiplexOutputSettings;

/**
 Rtmp Output Settings
 */
@property (nonatomic, strong) AWSMedialiveRtmpOutputSettings * _Nullable rtmpOutputSettings;

/**
 Udp Output Settings
 */
@property (nonatomic, strong) AWSMedialiveUdpOutputSettings * _Nullable udpOutputSettings;

@end

/**
 Pass Through Settings
 */
@interface AWSMedialivePassThroughSettings : AWSModel


@end

/**
 Settings for the action to set pause state of a channel.
 */
@interface AWSMedialivePauseStateScheduleActionSettings : AWSModel


/**
 Placeholder documentation for __listOfPipelinePauseStateSettings
 */
@property (nonatomic, strong) NSArray<AWSMedialivePipelinePauseStateSettings *> * _Nullable pipelines;

@end

/**
 Runtime details of a pipeline when a channel is running.
 */
@interface AWSMedialivePipelineDetail : AWSModel


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
@interface AWSMedialivePipelinePauseStateSettings : AWSModel


/**
 Pipeline ID to pause ("PIPELINE_0" or "PIPELINE_1").
 */
@property (nonatomic, assign) AWSMedialivePipelineId pipelineId;

@end

/**
 PurchaseOffering request
 Required parameters: [Count]
 */
@interface AWSMedialivePurchaseOffering : AWSModel


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
@interface AWSMedialivePurchaseOfferingRequest : AWSRequest


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
@interface AWSMedialivePurchaseOfferingResponse : AWSModel


/**
 Reserved resources available to use
 */
@property (nonatomic, strong) AWSMedialiveReservation * _Nullable reservation;

@end

/**
 PurchaseOffering response
 */
@interface AWSMedialivePurchaseOfferingResultModel : AWSModel


/**
 Reserved resources available to use
 */
@property (nonatomic, strong) AWSMedialiveReservation * _Nullable reservation;

@end

/**
 Rec601 Settings
 */
@interface AWSMedialiveRec601Settings : AWSModel


@end

/**
 Rec709 Settings
 */
@interface AWSMedialiveRec709Settings : AWSModel


@end

/**
 Remix Settings
 Required parameters: [ChannelMappings]
 */
@interface AWSMedialiveRemixSettings : AWSModel


/**
 Mapping of input channels to output channels, with appropriate gain adjustments.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveAudioChannelMapping *> * _Nullable channelMappings;

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
@interface AWSMedialiveReservation : AWSModel


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
@property (nonatomic, assign) AWSMedialiveOfferingDurationUnits durationUnits;

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
@property (nonatomic, assign) AWSMedialiveOfferingType offeringType;

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
@property (nonatomic, strong) AWSMedialiveReservationResourceSpecification * _Nullable resourceSpecification;

/**
 Reservation UTC start date and time in ISO-8601 format, e.g. '2018-03-01T00:00:00'
 */
@property (nonatomic, strong) NSString * _Nullable start;

/**
 Current state of reservation, e.g. 'ACTIVE'
 */
@property (nonatomic, assign) AWSMedialiveReservationState state;

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
@interface AWSMedialiveReservationResourceSpecification : AWSModel


/**
 Channel class, e.g. 'STANDARD'
 */
@property (nonatomic, assign) AWSMedialiveChannelClass channelClass;

/**
 Codec, e.g. 'AVC'
 */
@property (nonatomic, assign) AWSMedialiveReservationCodec codec;

/**
 Maximum bitrate, e.g. 'MAX_20_MBPS'
 */
@property (nonatomic, assign) AWSMedialiveReservationMaximumBitrate maximumBitrate;

/**
 Maximum framerate, e.g. 'MAX_30_FPS' (Outputs only)
 */
@property (nonatomic, assign) AWSMedialiveReservationMaximumFramerate maximumFramerate;

/**
 Resolution, e.g. 'HD'
 */
@property (nonatomic, assign) AWSMedialiveReservationResolution resolution;

/**
 Resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'
 */
@property (nonatomic, assign) AWSMedialiveReservationResourceType resourceType;

/**
 Special feature, e.g. 'AUDIO_NORMALIZATION' (Channels only)
 */
@property (nonatomic, assign) AWSMedialiveReservationSpecialFeature specialFeature;

/**
 Video quality, e.g. 'STANDARD' (Outputs only)
 */
@property (nonatomic, assign) AWSMedialiveReservationVideoQuality videoQuality;

@end

/**
 Placeholder documentation for ResourceConflict
 */
@interface AWSMedialiveResourceConflict : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Placeholder documentation for ResourceNotFound
 */
@interface AWSMedialiveResourceNotFound : AWSModel


/**
 Placeholder documentation for __string
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Rtmp Caption Info Destination Settings
 */
@interface AWSMedialiveRtmpCaptionInfoDestinationSettings : AWSModel


@end

/**
 Rtmp Group Settings
 */
@interface AWSMedialiveRtmpGroupSettings : AWSModel


/**
 Authentication scheme to use when connecting with CDN
 */
@property (nonatomic, assign) AWSMedialiveAuthenticationScheme authenticationScheme;

/**
 Controls behavior when content cache fills up. If remote origin server stalls the RTMP connection and does not accept content fast enough the 'Media Cache' will fill up. When the cache reaches the duration specified by cacheLength the cache will stop accepting new content. If set to disconnectImmediately, the RTMP output will force a disconnect. Clear the media cache, and reconnect after restartDelay seconds. If set to waitForServer, the RTMP output will wait up to 5 minutes to allow the origin server to begin accepting data again.
 */
@property (nonatomic, assign) AWSMedialiveRtmpCacheFullBehavior cacheFullBehavior;

/**
 Cache length, in seconds, is used to calculate buffer size.
 */
@property (nonatomic, strong) NSNumber * _Nullable cacheLength;

/**
 Controls the types of data that passes to onCaptionInfo outputs.If set to 'all' then 608 and 708 carried DTVCC data will be passed.If set to 'field1AndField2608' then DTVCC data will be stripped out, but 608 data from both fields will be passed. If set to 'field1608' then only the data carried in 608 from field 1 video will be passed.
 */
@property (nonatomic, assign) AWSMedialiveRtmpCaptionData captionData;

/**
 Controls the behavior of this RTMP group if input becomes unavailable.- emitOutput: Emit a slate until input returns. - pauseOutput: Stop transmitting data until input returns. This does not close the underlying RTMP connection.
 */
@property (nonatomic, assign) AWSMedialiveInputLossActionForRtmpOut inputLossAction;

/**
 If a streaming output fails, number of seconds to wait until a restart is initiated. A value of 0 means never restart.
 */
@property (nonatomic, strong) NSNumber * _Nullable restartDelay;

@end

/**
 Rtmp Output Settings
 Required parameters: [Destination]
 */
@interface AWSMedialiveRtmpOutputSettings : AWSModel


/**
 If set to verifyAuthenticity, verify the tls certificate chain to a trusted Certificate Authority (CA).This will cause rtmps outputs with self-signed certificates to fail.
 */
@property (nonatomic, assign) AWSMedialiveRtmpOutputCertificateMode certificateMode;

/**
 Number of seconds to wait before retrying a connection to the Flash Media server if the connection is lost.
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionRetryInterval;

/**
 The RTMP endpoint excluding the stream name (eg. rtmp://host/appname). For connection to Akamai, a username and password must be supplied. URI fields accept format identifiers.
 */
@property (nonatomic, strong) AWSMedialiveOutputLocationRef * _Nullable destination;

/**
 Number of retry attempts.
 */
@property (nonatomic, strong) NSNumber * _Nullable numRetries;

@end

/**
 Contains information on a single schedule action.
 Required parameters: [ActionName, ScheduleActionStartSettings, ScheduleActionSettings]
 */
@interface AWSMedialiveScheduleAction : AWSModel


/**
 The name of the action, must be unique within the schedule. This name provides the main reference to an action once it is added to the schedule. A name is unique if it is no longer in the schedule. The schedule is automatically cleaned up to remove actions with a start time of more than 1 hour ago (approximately) so at that point a name can be reused.
 */
@property (nonatomic, strong) NSString * _Nullable actionName;

/**
 Settings for this schedule action.
 */
@property (nonatomic, strong) AWSMedialiveScheduleActionSettings * _Nullable scheduleActionSettings;

/**
 The time for the action to start in the channel.
 */
@property (nonatomic, strong) AWSMedialiveScheduleActionStartSettings * _Nullable scheduleActionStartSettings;

@end

/**
 Holds the settings for a single schedule action.
 */
@interface AWSMedialiveScheduleActionSettings : AWSModel


/**
 Action to insert HLS ID3 segment tagging
 */
@property (nonatomic, strong) AWSMedialiveHlsId3SegmentTaggingScheduleActionSettings * _Nullable hlsId3SegmentTaggingSettings;

/**
 Action to insert HLS metadata
 */
@property (nonatomic, strong) AWSMedialiveHlsTimedMetadataScheduleActionSettings * _Nullable hlsTimedMetadataSettings;

/**
 Action to switch the input
 */
@property (nonatomic, strong) AWSMedialiveInputSwitchScheduleActionSettings * _Nullable inputSwitchSettings;

/**
 Action to pause or unpause one or both channel pipelines
 */
@property (nonatomic, strong) AWSMedialivePauseStateScheduleActionSettings * _Nullable pauseStateSettings;

/**
 Action to insert SCTE-35 return_to_network message
 */
@property (nonatomic, strong) AWSMedialiveScte35ReturnToNetworkScheduleActionSettings * _Nullable scte35ReturnToNetworkSettings;

/**
 Action to insert SCTE-35 splice_insert message
 */
@property (nonatomic, strong) AWSMedialiveScte35SpliceInsertScheduleActionSettings * _Nullable scte35SpliceInsertSettings;

/**
 Action to insert SCTE-35 time_signal message
 */
@property (nonatomic, strong) AWSMedialiveScte35TimeSignalScheduleActionSettings * _Nullable scte35TimeSignalSettings;

/**
 Action to activate a static image overlay
 */
@property (nonatomic, strong) AWSMedialiveStaticImageActivateScheduleActionSettings * _Nullable staticImageActivateSettings;

/**
 Action to deactivate a static image overlay
 */
@property (nonatomic, strong) AWSMedialiveStaticImageDeactivateScheduleActionSettings * _Nullable staticImageDeactivateSettings;

@end

/**
 Settings to specify when an action should occur. Only one of the options must be selected.
 */
@interface AWSMedialiveScheduleActionStartSettings : AWSModel


/**
 Option for specifying the start time for an action.
 */
@property (nonatomic, strong) AWSMedialiveFixedModeScheduleActionStartSettings * _Nullable fixedModeScheduleActionStartSettings;

/**
 Option for specifying an action as relative to another action.
 */
@property (nonatomic, strong) AWSMedialiveFollowModeScheduleActionStartSettings * _Nullable followModeScheduleActionStartSettings;

/**
 Option for specifying an action that should be applied immediately.
 */
@property (nonatomic, strong) AWSMedialiveImmediateModeScheduleActionStartSettings * _Nullable immediateModeScheduleActionStartSettings;

@end

/**
 Result of a schedule deletion.
 */
@interface AWSMedialiveScheduleDeleteResultModel : AWSModel


@end

/**
 Results of a schedule describe.
 Required parameters: [ScheduleActions]
 */
@interface AWSMedialiveScheduleDescribeResultModel : AWSModel


/**
 The next token; for use in pagination.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 The list of actions in the schedule.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveScheduleAction *> * _Nullable scheduleActions;

@end

/**
 Scte20 Plus Embedded Destination Settings
 */
@interface AWSMedialiveScte20PlusEmbeddedDestinationSettings : AWSModel


@end

/**
 Scte20 Source Settings
 */
@interface AWSMedialiveScte20SourceSettings : AWSModel


/**
 If upconvert, 608 data is both passed through via the "608 compatibility bytes" fields of the 708 wrapper as well as translated into 708. 708 data present in the source content will be discarded.
 */
@property (nonatomic, assign) AWSMedialiveScte20Convert608To708 convert608To708;

/**
 Specifies the 608/708 channel number within the video track from which to extract captions. Unused for passthrough.
 */
@property (nonatomic, strong) NSNumber * _Nullable source608ChannelNumber;

@end

/**
 Scte27 Destination Settings
 */
@interface AWSMedialiveScte27DestinationSettings : AWSModel


@end

/**
 Scte27 Source Settings
 */
@interface AWSMedialiveScte27SourceSettings : AWSModel


/**
 The pid field is used in conjunction with the caption selector languageCode field as follows: - Specify PID and Language: Extracts captions from that PID; the language is "informational". - Specify PID and omit Language: Extracts the specified PID. - Omit PID and specify Language: Extracts the specified language, whichever PID that happens to be. - Omit PID and omit Language: Valid only if source is DVB-Sub that is being passed through; all languages will be passed through.
 */
@property (nonatomic, strong) NSNumber * _Nullable pid;

@end

/**
 Corresponds to SCTE-35 delivery_not_restricted_flag parameter. To declare delivery restrictions, include this element and its four "restriction" flags. To declare that there are no restrictions, omit this element.
 Required parameters: [DeviceRestrictions, ArchiveAllowedFlag, WebDeliveryAllowedFlag, NoRegionalBlackoutFlag]
 */
@interface AWSMedialiveScte35DeliveryRestrictions : AWSModel


/**
 Corresponds to SCTE-35 archive_allowed_flag.
 */
@property (nonatomic, assign) AWSMedialiveScte35ArchiveAllowedFlag archiveAllowedFlag;

/**
 Corresponds to SCTE-35 device_restrictions parameter.
 */
@property (nonatomic, assign) AWSMedialiveScte35DeviceRestrictions deviceRestrictions;

/**
 Corresponds to SCTE-35 no_regional_blackout_flag parameter.
 */
@property (nonatomic, assign) AWSMedialiveScte35NoRegionalBlackoutFlag noRegionalBlackoutFlag;

/**
 Corresponds to SCTE-35 web_delivery_allowed_flag parameter.
 */
@property (nonatomic, assign) AWSMedialiveScte35WebDeliveryAllowedFlag webDeliveryAllowedFlag;

@end

/**
 Holds one set of SCTE-35 Descriptor Settings.
 Required parameters: [Scte35DescriptorSettings]
 */
@interface AWSMedialiveScte35Descriptor : AWSModel


/**
 SCTE-35 Descriptor Settings.
 */
@property (nonatomic, strong) AWSMedialiveScte35DescriptorSettings * _Nullable scte35DescriptorSettings;

@end

/**
 SCTE-35 Descriptor settings.
 Required parameters: [SegmentationDescriptorScte35DescriptorSettings]
 */
@interface AWSMedialiveScte35DescriptorSettings : AWSModel


/**
 SCTE-35 Segmentation Descriptor.
 */
@property (nonatomic, strong) AWSMedialiveScte35SegmentationDescriptor * _Nullable segmentationDescriptorScte35DescriptorSettings;

@end

/**
 Settings for a SCTE-35 return_to_network message.
 Required parameters: [SpliceEventId]
 */
@interface AWSMedialiveScte35ReturnToNetworkScheduleActionSettings : AWSModel


/**
 The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.
 */
@property (nonatomic, strong) NSNumber * _Nullable spliceEventId;

@end

/**
 Corresponds to SCTE-35 segmentation_descriptor.
 Required parameters: [SegmentationEventId, SegmentationCancelIndicator]
 */
@interface AWSMedialiveScte35SegmentationDescriptor : AWSModel


/**
 Holds the four SCTE-35 delivery restriction parameters.
 */
@property (nonatomic, strong) AWSMedialiveScte35DeliveryRestrictions * _Nullable deliveryRestrictions;

/**
 Corresponds to SCTE-35 segment_num. A value that is valid for the specified segmentation_type_id.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentNum;

/**
 Corresponds to SCTE-35 segmentation_event_cancel_indicator.
 */
@property (nonatomic, assign) AWSMedialiveScte35SegmentationCancelIndicator segmentationCancelIndicator;

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
@interface AWSMedialiveScte35SpliceInsert : AWSModel


/**
 When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time. This only applies to embedded SCTE 104/35 messages and does not apply to OOB messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable adAvailOffset;

/**
 When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to 0 will no longer trigger blackouts or Ad Avail slates
 */
@property (nonatomic, assign) AWSMedialiveScte35SpliceInsertNoRegionalBlackoutBehavior noRegionalBlackoutFlag;

/**
 When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to 0 will no longer trigger blackouts or Ad Avail slates
 */
@property (nonatomic, assign) AWSMedialiveScte35SpliceInsertWebDeliveryAllowedBehavior webDeliveryAllowedFlag;

@end

/**
 Settings for a SCTE-35 splice_insert message.
 Required parameters: [SpliceEventId]
 */
@interface AWSMedialiveScte35SpliceInsertScheduleActionSettings : AWSModel


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
@interface AWSMedialiveScte35TimeSignalApos : AWSModel


/**
 When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time. This only applies to embedded SCTE 104/35 messages and does not apply to OOB messages.
 */
@property (nonatomic, strong) NSNumber * _Nullable adAvailOffset;

/**
 When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to 0 will no longer trigger blackouts or Ad Avail slates
 */
@property (nonatomic, assign) AWSMedialiveScte35AposNoRegionalBlackoutBehavior noRegionalBlackoutFlag;

/**
 When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to 0 will no longer trigger blackouts or Ad Avail slates
 */
@property (nonatomic, assign) AWSMedialiveScte35AposWebDeliveryAllowedBehavior webDeliveryAllowedFlag;

@end

/**
 Settings for a SCTE-35 time_signal.
 Required parameters: [Scte35Descriptors]
 */
@interface AWSMedialiveScte35TimeSignalScheduleActionSettings : AWSModel


/**
 The list of SCTE-35 descriptors accompanying the SCTE-35 time_signal.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveScte35Descriptor *> * _Nullable scte35Descriptors;

@end

/**
 Smpte Tt Destination Settings
 */
@interface AWSMedialiveSmpteTtDestinationSettings : AWSModel


@end

/**
 Standard Hls Settings
 Required parameters: [M3u8Settings]
 */
@interface AWSMedialiveStandardHlsSettings : AWSModel


/**
 List all the audio groups that are used with the video output stream. Input all the audio GROUP-IDs that are associated to the video, separate by ','.
 */
@property (nonatomic, strong) NSString * _Nullable audioRenditionSets;

/**
 Settings information for the .m3u8 container
 */
@property (nonatomic, strong) AWSMedialiveM3u8Settings * _Nullable m3u8Settings;

@end

/**
 Placeholder documentation for StartChannelRequest
 Required parameters: [ChannelId]
 */
@interface AWSMedialiveStartChannelRequest : AWSRequest


/**
 A request to start a channel
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

@end

/**
 Placeholder documentation for StartChannelResponse
 */
@interface AWSMedialiveStartChannelResponse : AWSModel


/**
 The unique arn of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSMedialiveChannelClass channelClass;

/**
 A list of destinations of the channel. For UDP outputs, there is one destination per output. For other types (HLS, for example), there is one destination per packager. 
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestination *> * _Nullable destinations;

/**
 The endpoints where outgoing connections initiate from
 */
@property (nonatomic, strong) NSArray<AWSMedialiveChannelEgressEndpoint *> * _Nullable egressEndpoints;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSMedialiveEncoderSettings * _Nullable encoderSettings;

/**
 The unique id of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Placeholder documentation for InputSpecification
 */
@property (nonatomic, strong) AWSMedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level being written to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSMedialiveLogLevel logLevel;

/**
 The name of the channel. (user-mutable)
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Runtime details for the pipelines of a running channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialivePipelineDetail *> * _Nullable pipelineDetails;

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
@property (nonatomic, assign) AWSMedialiveChannelState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for StartMultiplexRequest
 Required parameters: [MultiplexId]
 */
@interface AWSMedialiveStartMultiplexRequest : AWSRequest


/**
 The ID of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

@end

/**
 Placeholder documentation for StartMultiplexResponse
 */
@interface AWSMedialiveStartMultiplexResponse : AWSModel


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
@property (nonatomic, strong) NSArray<AWSMedialiveMultiplexOutputDestination *> * _Nullable destinations;

/**
 The unique id of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexSettings * _Nullable multiplexSettings;

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
@property (nonatomic, assign) AWSMedialiveMultiplexState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Settings to identify the start of the clip.
 */
@interface AWSMedialiveStartTimecode : AWSModel


/**
 The timecode for the frame where you want to start the clip. Optional; if not specified, the clip starts at first frame in the file. Enter the timecode as HH:MM:SS:FF or HH:MM:SS;FF.
 */
@property (nonatomic, strong) NSString * _Nullable timecode;

@end

/**
 Settings for the action to activate a static image.
 Required parameters: [Image]
 */
@interface AWSMedialiveStaticImageActivateScheduleActionSettings : AWSModel


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
@property (nonatomic, strong) AWSMedialiveInputLocation * _Nullable image;

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
@interface AWSMedialiveStaticImageDeactivateScheduleActionSettings : AWSModel


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
@interface AWSMedialiveStaticKeySettings : AWSModel


/**
 The URL of the license server used for protecting content.
 */
@property (nonatomic, strong) AWSMedialiveInputLocation * _Nullable keyProviderServer;

/**
 Static key value as a 32 character hexadecimal string.
 */
@property (nonatomic, strong) NSString * _Nullable staticKeyValue;

@end

/**
 Placeholder documentation for StopChannelRequest
 Required parameters: [ChannelId]
 */
@interface AWSMedialiveStopChannelRequest : AWSRequest


/**
 A request to stop a running channel
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

@end

/**
 Placeholder documentation for StopChannelResponse
 */
@interface AWSMedialiveStopChannelResponse : AWSModel


/**
 The unique arn of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The class for this channel. STANDARD for a channel with two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
 */
@property (nonatomic, assign) AWSMedialiveChannelClass channelClass;

/**
 A list of destinations of the channel. For UDP outputs, there is one destination per output. For other types (HLS, for example), there is one destination per packager. 
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestination *> * _Nullable destinations;

/**
 The endpoints where outgoing connections initiate from
 */
@property (nonatomic, strong) NSArray<AWSMedialiveChannelEgressEndpoint *> * _Nullable egressEndpoints;

/**
 Encoder Settings
 */
@property (nonatomic, strong) AWSMedialiveEncoderSettings * _Nullable encoderSettings;

/**
 The unique id of the channel.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 List of input attachments for channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Placeholder documentation for InputSpecification
 */
@property (nonatomic, strong) AWSMedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level being written to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSMedialiveLogLevel logLevel;

/**
 The name of the channel. (user-mutable)
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Runtime details for the pipelines of a running channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialivePipelineDetail *> * _Nullable pipelineDetails;

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
@property (nonatomic, assign) AWSMedialiveChannelState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Placeholder documentation for StopMultiplexRequest
 Required parameters: [MultiplexId]
 */
@interface AWSMedialiveStopMultiplexRequest : AWSRequest


/**
 The ID of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

@end

/**
 Placeholder documentation for StopMultiplexResponse
 */
@interface AWSMedialiveStopMultiplexResponse : AWSModel


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
@property (nonatomic, strong) NSArray<AWSMedialiveMultiplexOutputDestination *> * _Nullable destinations;

/**
 The unique id of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Configuration for a multiplex event.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexSettings * _Nullable multiplexSettings;

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
@property (nonatomic, assign) AWSMedialiveMultiplexState state;

/**
 A collection of key-value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Settings to identify the end of the clip.
 */
@interface AWSMedialiveStopTimecode : AWSModel


/**
 If you specify a StopTimecode in an input (in order to clip the file), you can specify if you want the clip to exclude (the default) or include the frame specified by the timecode.
 */
@property (nonatomic, assign) AWSMedialiveLastFrameClippingBehavior lastFrameClippingBehavior;

/**
 The timecode for the frame where you want to stop the clip. Optional; if not specified, the clip continues to the end of the file. Enter the timecode as HH:MM:SS:FF or HH:MM:SS;FF.
 */
@property (nonatomic, strong) NSString * _Nullable timecode;

@end

/**
 Placeholder documentation for TagsModel
 */
@interface AWSMedialiveTagsModel : AWSModel


/**
 Placeholder documentation for Tags
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Teletext Destination Settings
 */
@interface AWSMedialiveTeletextDestinationSettings : AWSModel


@end

/**
 Teletext Source Settings
 */
@interface AWSMedialiveTeletextSourceSettings : AWSModel


/**
 Specifies the teletext page number within the data stream from which to extract captions. Range of 0x100 (256) to 0x8FF (2303). Unused for passthrough. Should be specified as a hexadecimal string with no "0x" prefix.
 */
@property (nonatomic, strong) NSString * _Nullable pageNumber;

@end

/**
 Temporal Filter Settings
 */
@interface AWSMedialiveTemporalFilterSettings : AWSModel


/**
 If you enable this filter, the results are the following: - If the source content is noisy (it contains excessive digital artifacts), the filter cleans up the source. - If the source content is already clean, the filter tends to decrease the bitrate, especially when the rate control mode is QVBR.
 */
@property (nonatomic, assign) AWSMedialiveTemporalFilterPostFilterSharpening postFilterSharpening;

/**
 Choose a filter strength. We recommend a strength of 1 or 2. A higher strength might take out good information, resulting in an image that is overly soft.
 */
@property (nonatomic, assign) AWSMedialiveTemporalFilterStrength strength;

@end

/**
 Timecode Config
 Required parameters: [Source]
 */
@interface AWSMedialiveTimecodeConfig : AWSModel


/**
 Identifies the source for the timecode that will be associated with the events outputs. -Embedded (embedded): Initialize the output timecode with timecode from the the source.If no embedded timecode is detected in the source, the system falls back to using "Start at 0" (zerobased). -System Clock (systemclock): Use the UTC time. -Start at 0 (zerobased): The time of the first frame of the event will be 00:00:00:00.
 */
@property (nonatomic, assign) AWSMedialiveTimecodeConfigSource source;

/**
 Threshold in frames beyond which output timecode is resynchronized to the input timecode. Discrepancies below this threshold are permitted to avoid unnecessary discontinuities in the output timecode. No timecode sync when this is not specified.
 */
@property (nonatomic, strong) NSNumber * _Nullable syncThreshold;

@end

/**
 Ttml Destination Settings
 */
@interface AWSMedialiveTtmlDestinationSettings : AWSModel


/**
 When set to passthrough, passes through style and position information from a TTML-like input source (TTML, SMPTE-TT, CFF-TT) to the CFF-TT output or TTML output.
 */
@property (nonatomic, assign) AWSMedialiveTtmlDestinationStyleControl styleControl;

@end

/**
 Udp Container Settings
 */
@interface AWSMedialiveUdpContainerSettings : AWSModel


/**
 M2ts Settings
 */
@property (nonatomic, strong) AWSMedialiveM2tsSettings * _Nullable m2tsSettings;

@end

/**
 Udp Group Settings
 */
@interface AWSMedialiveUdpGroupSettings : AWSModel


/**
 Specifies behavior of last resort when input video is lost, and no more backup inputs are available. When dropTs is selected the entire transport stream will stop being emitted.When dropProgram is selected the program can be dropped from the transport stream (and replaced with null packets to meet the TS bitrate requirement).Or, when emitProgram is chosen the transport stream will continue to be produced normally with repeat frames, black frames, or slate frames substituted for the absent input video.
 */
@property (nonatomic, assign) AWSMedialiveInputLossActionForUdpOut inputLossAction;

/**
 Indicates ID3 frame that has the timecode.
 */
@property (nonatomic, assign) AWSMedialiveUdpTimedMetadataId3Frame timedMetadataId3Frame;

/**
 Timed Metadata interval in seconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable timedMetadataId3Period;

@end

/**
 Udp Output Settings
 Required parameters: [Destination, ContainerSettings]
 */
@interface AWSMedialiveUdpOutputSettings : AWSModel


/**
 UDP output buffering in milliseconds. Larger values increase latency through the transcoder but simultaneously assist the transcoder in maintaining a constant, low-jitter UDP/RTP output while accommodating clock recovery, input switching, input disruptions, picture reordering, etc.
 */
@property (nonatomic, strong) NSNumber * _Nullable bufferMsec;

/**
 Udp Container Settings
 */
@property (nonatomic, strong) AWSMedialiveUdpContainerSettings * _Nullable containerSettings;

/**
 Destination address and port number for RTP or UDP packets. Can be unicast or multicast RTP or UDP (eg. rtp://239.10.10.10:5001 or udp://10.100.100.100:5002).
 */
@property (nonatomic, strong) AWSMedialiveOutputLocationRef * _Nullable destination;

/**
 Settings for enabling and adjusting Forward Error Correction on UDP outputs.
 */
@property (nonatomic, strong) AWSMedialiveFecOutputSettings * _Nullable fecOutputSettings;

@end

/**
 Placeholder documentation for UpdateChannel
 */
@interface AWSMedialiveUpdateChannel : AWSModel


/**
 A list of output destinations for this channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestination *> * _Nullable destinations;

/**
 The encoder settings for this channel.
 */
@property (nonatomic, strong) AWSMedialiveEncoderSettings * _Nullable encoderSettings;

/**
 Placeholder documentation for __listOfInputAttachment
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Specification of input for this channel (max. bitrate, resolution, codec, etc.)
 */
@property (nonatomic, strong) AWSMedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level to write to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSMedialiveLogLevel logLevel;

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
@interface AWSMedialiveUpdateChannelClass : AWSModel


/**
 The channel class that you wish to update this channel to use.
 */
@property (nonatomic, assign) AWSMedialiveChannelClass channelClass;

/**
 A list of output destinations for this channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestination *> * _Nullable destinations;

@end

/**
 Channel class that the channel should be updated to.
 Required parameters: [ChannelId, ChannelClass]
 */
@interface AWSMedialiveUpdateChannelClassRequest : AWSRequest


/**
 The channel class that you wish to update this channel to use.
 */
@property (nonatomic, assign) AWSMedialiveChannelClass channelClass;

/**
 Channel Id of the channel whose class should be updated.
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 A list of output destinations for this channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestination *> * _Nullable destinations;

@end

/**
 Placeholder documentation for UpdateChannelClassResponse
 */
@interface AWSMedialiveUpdateChannelClassResponse : AWSModel


/**
 Placeholder documentation for Channel
 */
@property (nonatomic, strong) AWSMedialiveChannel * _Nullable channel;

@end

/**
 A request to update a channel.
 Required parameters: [ChannelId]
 */
@interface AWSMedialiveUpdateChannelRequest : AWSRequest


/**
 channel ID
 */
@property (nonatomic, strong) NSString * _Nullable channelId;

/**
 A list of output destinations for this channel.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveOutputDestination *> * _Nullable destinations;

/**
 The encoder settings for this channel.
 */
@property (nonatomic, strong) AWSMedialiveEncoderSettings * _Nullable encoderSettings;

/**
 Placeholder documentation for __listOfInputAttachment
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputAttachment *> * _Nullable inputAttachments;

/**
 Specification of input for this channel (max. bitrate, resolution, codec, etc.)
 */
@property (nonatomic, strong) AWSMedialiveInputSpecification * _Nullable inputSpecification;

/**
 The log level to write to CloudWatch Logs.
 */
@property (nonatomic, assign) AWSMedialiveLogLevel logLevel;

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
@interface AWSMedialiveUpdateChannelResponse : AWSModel


/**
 Placeholder documentation for Channel
 */
@property (nonatomic, strong) AWSMedialiveChannel * _Nullable channel;

@end

/**
 The updated channel's description.
 */
@interface AWSMedialiveUpdateChannelResultModel : AWSModel


/**
 Placeholder documentation for Channel
 */
@property (nonatomic, strong) AWSMedialiveChannel * _Nullable channel;

@end

/**
 Placeholder documentation for UpdateInput
 */
@interface AWSMedialiveUpdateInput : AWSModel


/**
 Destination settings for PUSH type inputs.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputDestinationRequest *> * _Nullable destinations;

/**
 Settings for the devices.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputDeviceRequest *> * _Nullable inputDevices;

/**
 A list of security groups referenced by IDs to attach to the input.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inputSecurityGroups;

/**
 A list of the MediaConnect Flow ARNs that you want to use as the source of the input. You can specify as few as one Flow and presently, as many as two. The only requirement is when you have more than one is that each Flow is in a separate Availability Zone as this ensures your EML input is redundant to AZ issues. 
 */
@property (nonatomic, strong) NSArray<AWSMedialiveMediaConnectFlowRequest *> * _Nullable mediaConnectFlows;

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
@property (nonatomic, strong) NSArray<AWSMedialiveInputSourceRequest *> * _Nullable sources;

@end

/**
 Updates an input device.
 */
@interface AWSMedialiveUpdateInputDevice : AWSModel


/**
 The settings that you want to apply to the input device.
 */
@property (nonatomic, strong) AWSMedialiveInputDeviceConfigurableSettings * _Nullable hdDeviceSettings;

/**
 The name that you assigned to this input device (not the unique ID).
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 A request to update an input device.
 Required parameters: [InputDeviceId]
 */
@interface AWSMedialiveUpdateInputDeviceRequest : AWSRequest


/**
 The settings that you want to apply to the input device.
 */
@property (nonatomic, strong) AWSMedialiveInputDeviceConfigurableSettings * _Nullable hdDeviceSettings;

/**
 The unique ID of the input device. For example, hd-123456789abcdef.
 */
@property (nonatomic, strong) NSString * _Nullable inputDeviceId;

/**
 The name that you assigned to this input device (not the unique ID).
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 Placeholder documentation for UpdateInputDeviceResponse
 */
@interface AWSMedialiveUpdateInputDeviceResponse : AWSModel


/**
 The unique ARN of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The state of the connection between the input device and AWS.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceConnectionState connectionState;

/**
 The status of the action to synchronize the device configuration. If you change the configuration of the input device (for example, the maximum bitrate), MediaLive sends the new data to the device. The device might not update itself immediately. SYNCED means the device has updated its configuration. SYNCING means that it has not updated its configuration.
 */
@property (nonatomic, assign) AWSMedialiveDeviceSettingsSyncState deviceSettingsSyncState;

/**
 Settings that describe an input device that is type HD.
 */
@property (nonatomic, strong) AWSMedialiveInputDeviceHdSettings * _Nullable hdDeviceSettings;

/**
 The unique ID of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The network MAC address of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable macAddress;

/**
 A name that you specify for the input device.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The network settings for the input device.
 */
@property (nonatomic, strong) AWSMedialiveInputDeviceNetworkSettings * _Nullable networkSettings;

/**
 The unique serial number of the input device.
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 The type of the input device.
 */
@property (nonatomic, assign) AWSMedialiveInputDeviceType types;

@end

/**
 A request to update an input.
 Required parameters: [InputId]
 */
@interface AWSMedialiveUpdateInputRequest : AWSRequest


/**
 Destination settings for PUSH type inputs.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputDestinationRequest *> * _Nullable destinations;

/**
 Settings for the devices.
 */
@property (nonatomic, strong) NSArray<AWSMedialiveInputDeviceRequest *> * _Nullable inputDevices;

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
@property (nonatomic, strong) NSArray<AWSMedialiveMediaConnectFlowRequest *> * _Nullable mediaConnectFlows;

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
@property (nonatomic, strong) NSArray<AWSMedialiveInputSourceRequest *> * _Nullable sources;

@end

/**
 Placeholder documentation for UpdateInputResponse
 */
@interface AWSMedialiveUpdateInputResponse : AWSModel


/**
 Placeholder documentation for Input
 */
@property (nonatomic, strong) AWSMedialiveInput * _Nullable input;

@end

/**
 Placeholder documentation for UpdateInputResultModel
 */
@interface AWSMedialiveUpdateInputResultModel : AWSModel


/**
 Placeholder documentation for Input
 */
@property (nonatomic, strong) AWSMedialiveInput * _Nullable input;

@end

/**
 The request to update some combination of the Input Security Group name and the IPv4 CIDRs the Input Security Group should allow.
 Required parameters: [InputSecurityGroupId]
 */
@interface AWSMedialiveUpdateInputSecurityGroupRequest : AWSRequest


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
@property (nonatomic, strong) NSArray<AWSMedialiveInputWhitelistRuleCidr *> * _Nullable whitelistRules;

@end

/**
 Placeholder documentation for UpdateInputSecurityGroupResponse
 */
@interface AWSMedialiveUpdateInputSecurityGroupResponse : AWSModel


/**
 An Input Security Group
 */
@property (nonatomic, strong) AWSMedialiveInputSecurityGroup * _Nullable securityGroup;

@end

/**
 Placeholder documentation for UpdateInputSecurityGroupResultModel
 */
@interface AWSMedialiveUpdateInputSecurityGroupResultModel : AWSModel


/**
 An Input Security Group
 */
@property (nonatomic, strong) AWSMedialiveInputSecurityGroup * _Nullable securityGroup;

@end

/**
 Placeholder documentation for UpdateMultiplex
 */
@interface AWSMedialiveUpdateMultiplex : AWSModel


/**
 The new settings for a multiplex.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexSettings * _Nullable multiplexSettings;

/**
 Name of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 Placeholder documentation for UpdateMultiplexProgram
 */
@interface AWSMedialiveUpdateMultiplexProgram : AWSModel


/**
 The new settings for a multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

@end

/**
 A request to update a program in a multiplex.
 Required parameters: [MultiplexId, ProgramName]
 */
@interface AWSMedialiveUpdateMultiplexProgramRequest : AWSRequest


/**
 The ID of the multiplex of the program to update.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

/**
 The new settings for a multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgramSettings * _Nullable multiplexProgramSettings;

/**
 The name of the program to update.
 */
@property (nonatomic, strong) NSString * _Nullable programName;

@end

/**
 Placeholder documentation for UpdateMultiplexProgramResponse
 */
@interface AWSMedialiveUpdateMultiplexProgramResponse : AWSModel


/**
 The updated multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgram * _Nullable multiplexProgram;

@end

/**
 Placeholder documentation for UpdateMultiplexProgramResultModel
 */
@interface AWSMedialiveUpdateMultiplexProgramResultModel : AWSModel


/**
 The updated multiplex program.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexProgram * _Nullable multiplexProgram;

@end

/**
 A request to update a multiplex.
 Required parameters: [MultiplexId]
 */
@interface AWSMedialiveUpdateMultiplexRequest : AWSRequest


/**
 ID of the multiplex to update.
 */
@property (nonatomic, strong) NSString * _Nullable multiplexId;

/**
 The new settings for a multiplex.
 */
@property (nonatomic, strong) AWSMedialiveMultiplexSettings * _Nullable multiplexSettings;

/**
 Name of the multiplex.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 Placeholder documentation for UpdateMultiplexResponse
 */
@interface AWSMedialiveUpdateMultiplexResponse : AWSModel


/**
 The updated multiplex.
 */
@property (nonatomic, strong) AWSMedialiveMultiplex * _Nullable multiplex;

@end

/**
 Placeholder documentation for UpdateMultiplexResultModel
 */
@interface AWSMedialiveUpdateMultiplexResultModel : AWSModel


/**
 The updated multiplex.
 */
@property (nonatomic, strong) AWSMedialiveMultiplex * _Nullable multiplex;

@end

/**
 UpdateReservation request
 */
@interface AWSMedialiveUpdateReservation : AWSModel


/**
 Name of the reservation
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 Request to update a reservation
 Required parameters: [ReservationId]
 */
@interface AWSMedialiveUpdateReservationRequest : AWSRequest


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
@interface AWSMedialiveUpdateReservationResponse : AWSModel


/**
 Reserved resources available to use
 */
@property (nonatomic, strong) AWSMedialiveReservation * _Nullable reservation;

@end

/**
 UpdateReservation response
 */
@interface AWSMedialiveUpdateReservationResultModel : AWSModel


/**
 Reserved resources available to use
 */
@property (nonatomic, strong) AWSMedialiveReservation * _Nullable reservation;

@end

/**
 Placeholder documentation for ValidationError
 */
@interface AWSMedialiveValidationError : AWSModel


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
@interface AWSMedialiveVideoCodecSettings : AWSModel


/**
 Frame Capture Settings
 */
@property (nonatomic, strong) AWSMedialiveFrameCaptureSettings * _Nullable frameCaptureSettings;

/**
 H264 Settings
 */
@property (nonatomic, strong) AWSMedialiveH264Settings * _Nullable h264Settings;

/**
 H265 Settings
 */
@property (nonatomic, strong) AWSMedialiveH265Settings * _Nullable h265Settings;

@end

/**
 Video settings for this stream.
 Required parameters: [Name]
 */
@interface AWSMedialiveVideoDescription : AWSModel


/**
 Video codec settings.
 */
@property (nonatomic, strong) AWSMedialiveVideoCodecSettings * _Nullable codecSettings;

/**
 Output video height, in pixels. Must be an even number. For most codecs, you can leave this field and width blank in order to use the height and width (resolution) from the source. Note, however, that leaving blank is not recommended. For the Frame Capture codec, height and width are required.
 */
@property (nonatomic, strong) NSNumber * _Nullable height;

/**
 The name of this VideoDescription. Outputs will use this name to uniquely identify this Description.Description names should be unique within this Live Event.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Indicates how to respond to the AFD values in the input stream. RESPOND causes input video to be clipped, depending on the AFD value, input display aspect ratio, and output display aspect ratio, and (except for FRAME_CAPTURE codec) includes the values in the output. PASSTHROUGH (does not apply to FRAME_CAPTURE codec) ignores the AFD values and includes the values in the output, so input video is not clipped. NONE ignores the AFD values and does not include the values through to the output, so input video is not clipped.
 */
@property (nonatomic, assign) AWSMedialiveVideoDescriptionRespondToAfd respondToAfd;

/**
 STRETCH_TO_OUTPUT configures the output position to stretch the video to the specified output resolution (height and width). This option will override any position value. DEFAULT may insert black boxes (pillar boxes or letter boxes) around the video to provide the specified output resolution.
 */
@property (nonatomic, assign) AWSMedialiveVideoDescriptionScalingBehavior scalingBehavior;

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
@interface AWSMedialiveVideoSelector : AWSModel


/**
 Specifies the color space of an input. This setting works in tandem with colorSpaceUsage and a video description's colorSpaceSettingsChoice to determine if any conversion will be performed.
 */
@property (nonatomic, assign) AWSMedialiveVideoSelectorColorSpace colorSpace;

/**
 Applies only if colorSpace is a value other than follow. This field controls how the value in the colorSpace field will be used. fallback means that when the input does include color space data, that data will be used, but when the input has no color space data, the value in colorSpace will be used. Choose fallback if your input is sometimes missing color space data, but when it does have color space data, that data is correct. force means to always use the value in colorSpace. Choose force if your input usually has no color space data or might have unreliable color space data.
 */
@property (nonatomic, assign) AWSMedialiveVideoSelectorColorSpaceUsage colorSpaceUsage;

/**
 The video selector settings.
 */
@property (nonatomic, strong) AWSMedialiveVideoSelectorSettings * _Nullable selectorSettings;

@end

/**
 Video Selector Pid
 */
@interface AWSMedialiveVideoSelectorPid : AWSModel


/**
 Selects a specific PID from within a video source.
 */
@property (nonatomic, strong) NSNumber * _Nullable pid;

@end

/**
 Video Selector Program Id
 */
@interface AWSMedialiveVideoSelectorProgramId : AWSModel


/**
 Selects a specific program from within a multi-program transport stream. If the program doesn't exist, the first program within the transport stream will be selected by default.
 */
@property (nonatomic, strong) NSNumber * _Nullable programId;

@end

/**
 Video Selector Settings
 */
@interface AWSMedialiveVideoSelectorSettings : AWSModel


/**
 Video Selector Pid
 */
@property (nonatomic, strong) AWSMedialiveVideoSelectorPid * _Nullable videoSelectorPid;

/**
 Video Selector Program Id
 */
@property (nonatomic, strong) AWSMedialiveVideoSelectorProgramId * _Nullable videoSelectorProgramId;

@end

/**
 Webvtt Destination Settings
 */
@interface AWSMedialiveWebvttDestinationSettings : AWSModel


@end

NS_ASSUME_NONNULL_END
