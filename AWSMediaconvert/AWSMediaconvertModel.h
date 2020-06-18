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

FOUNDATION_EXPORT NSString *const AWSMediaconvertErrorDomain;

typedef NS_ENUM(NSInteger, AWSMediaconvertErrorType) {
    AWSMediaconvertErrorUnknown,
    AWSMediaconvertErrorBadRequest,
    AWSMediaconvertErrorConflict,
    AWSMediaconvertErrorForbidden,
    AWSMediaconvertErrorInternalServerError,
    AWSMediaconvertErrorNotFound,
    AWSMediaconvertErrorTooManyRequests,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAacAudioDescriptionBroadcasterMix) {
    AWSMediaconvertAacAudioDescriptionBroadcasterMixUnknown,
    AWSMediaconvertAacAudioDescriptionBroadcasterMixBroadcasterMixedAd,
    AWSMediaconvertAacAudioDescriptionBroadcasterMixNormal,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAacCodecProfile) {
    AWSMediaconvertAacCodecProfileUnknown,
    AWSMediaconvertAacCodecProfileLc,
    AWSMediaconvertAacCodecProfileHev1,
    AWSMediaconvertAacCodecProfileHev2,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAacCodingMode) {
    AWSMediaconvertAacCodingModeUnknown,
    AWSMediaconvertAacCodingModeAdReceiverMix,
    AWSMediaconvertAacCodingModeCodingMode10,
    AWSMediaconvertAacCodingModeCodingMode11,
    AWSMediaconvertAacCodingModeCodingMode20,
    AWSMediaconvertAacCodingModeCodingMode51,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAacRateControlMode) {
    AWSMediaconvertAacRateControlModeUnknown,
    AWSMediaconvertAacRateControlModeCbr,
    AWSMediaconvertAacRateControlModeVbr,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAacRawFormat) {
    AWSMediaconvertAacRawFormatUnknown,
    AWSMediaconvertAacRawFormatLatmLoas,
    AWSMediaconvertAacRawFormatNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAacSpecification) {
    AWSMediaconvertAacSpecificationUnknown,
    AWSMediaconvertAacSpecificationMpeg2,
    AWSMediaconvertAacSpecificationMpeg4,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAacVbrQuality) {
    AWSMediaconvertAacVbrQualityUnknown,
    AWSMediaconvertAacVbrQualityLow,
    AWSMediaconvertAacVbrQualityMediumLow,
    AWSMediaconvertAacVbrQualityMediumHigh,
    AWSMediaconvertAacVbrQualityHigh,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAc3BitstreamMode) {
    AWSMediaconvertAc3BitstreamModeUnknown,
    AWSMediaconvertAc3BitstreamModeCompleteMain,
    AWSMediaconvertAc3BitstreamModeCommentary,
    AWSMediaconvertAc3BitstreamModeDialogue,
    AWSMediaconvertAc3BitstreamModeEmergency,
    AWSMediaconvertAc3BitstreamModeHearingImpaired,
    AWSMediaconvertAc3BitstreamModeMusicAndEffects,
    AWSMediaconvertAc3BitstreamModeVisuallyImpaired,
    AWSMediaconvertAc3BitstreamModeVoiceOver,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAc3CodingMode) {
    AWSMediaconvertAc3CodingModeUnknown,
    AWSMediaconvertAc3CodingModeCodingMode10,
    AWSMediaconvertAc3CodingModeCodingMode11,
    AWSMediaconvertAc3CodingModeCodingMode20,
    AWSMediaconvertAc3CodingModeCodingMode32Lfe,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAc3DynamicRangeCompressionProfile) {
    AWSMediaconvertAc3DynamicRangeCompressionProfileUnknown,
    AWSMediaconvertAc3DynamicRangeCompressionProfileFilmStandard,
    AWSMediaconvertAc3DynamicRangeCompressionProfileNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAc3LfeFilter) {
    AWSMediaconvertAc3LfeFilterUnknown,
    AWSMediaconvertAc3LfeFilterEnabled,
    AWSMediaconvertAc3LfeFilterDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAc3MetadataControl) {
    AWSMediaconvertAc3MetadataControlUnknown,
    AWSMediaconvertAc3MetadataControlFollowInput,
    AWSMediaconvertAc3MetadataControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAccelerationMode) {
    AWSMediaconvertAccelerationModeUnknown,
    AWSMediaconvertAccelerationModeDisabled,
    AWSMediaconvertAccelerationModeEnabled,
    AWSMediaconvertAccelerationModePreferred,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAccelerationStatus) {
    AWSMediaconvertAccelerationStatusUnknown,
    AWSMediaconvertAccelerationStatusNotApplicable,
    AWSMediaconvertAccelerationStatusInProgress,
    AWSMediaconvertAccelerationStatusAccelerated,
    AWSMediaconvertAccelerationStatusNotAccelerated,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAfdSignaling) {
    AWSMediaconvertAfdSignalingUnknown,
    AWSMediaconvertAfdSignalingNone,
    AWSMediaconvertAfdSignalingAuto,
    AWSMediaconvertAfdSignalingFixed,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAlphaBehavior) {
    AWSMediaconvertAlphaBehaviorUnknown,
    AWSMediaconvertAlphaBehaviorDiscard,
    AWSMediaconvertAlphaBehaviorRemapToLuma,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAncillaryConvert608To708) {
    AWSMediaconvertAncillaryConvert608To708Unknown,
    AWSMediaconvertAncillaryConvert608To708Upconvert,
    AWSMediaconvertAncillaryConvert608To708Disabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAncillaryTerminateCaptions) {
    AWSMediaconvertAncillaryTerminateCaptionsUnknown,
    AWSMediaconvertAncillaryTerminateCaptionsEndOfInput,
    AWSMediaconvertAncillaryTerminateCaptionsDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAntiAlias) {
    AWSMediaconvertAntiAliasUnknown,
    AWSMediaconvertAntiAliasDisabled,
    AWSMediaconvertAntiAliasEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAudioCodec) {
    AWSMediaconvertAudioCodecUnknown,
    AWSMediaconvertAudioCodecAac,
    AWSMediaconvertAudioCodecMp2,
    AWSMediaconvertAudioCodecMp3,
    AWSMediaconvertAudioCodecWav,
    AWSMediaconvertAudioCodecAiff,
    AWSMediaconvertAudioCodecAc3,
    AWSMediaconvertAudioCodecEac3,
    AWSMediaconvertAudioCodecEac3Atmos,
    AWSMediaconvertAudioCodecVorbis,
    AWSMediaconvertAudioCodecOpus,
    AWSMediaconvertAudioCodecPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAudioDefaultSelection) {
    AWSMediaconvertAudioDefaultSelectionUnknown,
    AWSMediaconvertAudioDefaultSelectionDefault,
    AWSMediaconvertAudioDefaultSelectionNotDefault,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAudioLanguageCodeControl) {
    AWSMediaconvertAudioLanguageCodeControlUnknown,
    AWSMediaconvertAudioLanguageCodeControlFollowInput,
    AWSMediaconvertAudioLanguageCodeControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAudioNormalizationAlgorithm) {
    AWSMediaconvertAudioNormalizationAlgorithmUnknown,
    AWSMediaconvertAudioNormalizationAlgorithmItuBs17701,
    AWSMediaconvertAudioNormalizationAlgorithmItuBs17702,
    AWSMediaconvertAudioNormalizationAlgorithmItuBs17703,
    AWSMediaconvertAudioNormalizationAlgorithmItuBs17704,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAudioNormalizationAlgorithmControl) {
    AWSMediaconvertAudioNormalizationAlgorithmControlUnknown,
    AWSMediaconvertAudioNormalizationAlgorithmControlCorrectAudio,
    AWSMediaconvertAudioNormalizationAlgorithmControlMeasureOnly,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAudioNormalizationLoudnessLogging) {
    AWSMediaconvertAudioNormalizationLoudnessLoggingUnknown,
    AWSMediaconvertAudioNormalizationLoudnessLoggingLog,
    AWSMediaconvertAudioNormalizationLoudnessLoggingDontLog,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAudioNormalizationPeakCalculation) {
    AWSMediaconvertAudioNormalizationPeakCalculationUnknown,
    AWSMediaconvertAudioNormalizationPeakCalculationTruePeak,
    AWSMediaconvertAudioNormalizationPeakCalculationNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAudioSelectorType) {
    AWSMediaconvertAudioSelectorTypeUnknown,
    AWSMediaconvertAudioSelectorTypePid,
    AWSMediaconvertAudioSelectorTypeTrack,
    AWSMediaconvertAudioSelectorTypeLanguageCode,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAudioTypeControl) {
    AWSMediaconvertAudioTypeControlUnknown,
    AWSMediaconvertAudioTypeControlFollowInput,
    AWSMediaconvertAudioTypeControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAv1AdaptiveQuantization) {
    AWSMediaconvertAv1AdaptiveQuantizationUnknown,
    AWSMediaconvertAv1AdaptiveQuantizationOff,
    AWSMediaconvertAv1AdaptiveQuantizationLow,
    AWSMediaconvertAv1AdaptiveQuantizationMedium,
    AWSMediaconvertAv1AdaptiveQuantizationHigh,
    AWSMediaconvertAv1AdaptiveQuantizationHigher,
    AWSMediaconvertAv1AdaptiveQuantizationMax,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAv1FramerateControl) {
    AWSMediaconvertAv1FramerateControlUnknown,
    AWSMediaconvertAv1FramerateControlInitializeFromSource,
    AWSMediaconvertAv1FramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAv1FramerateConversionAlgorithm) {
    AWSMediaconvertAv1FramerateConversionAlgorithmUnknown,
    AWSMediaconvertAv1FramerateConversionAlgorithmDuplicateDrop,
    AWSMediaconvertAv1FramerateConversionAlgorithmInterpolate,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAv1RateControlMode) {
    AWSMediaconvertAv1RateControlModeUnknown,
    AWSMediaconvertAv1RateControlModeQvbr,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertAv1SpatialAdaptiveQuantization) {
    AWSMediaconvertAv1SpatialAdaptiveQuantizationUnknown,
    AWSMediaconvertAv1SpatialAdaptiveQuantizationDisabled,
    AWSMediaconvertAv1SpatialAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertBillingTagsSource) {
    AWSMediaconvertBillingTagsSourceUnknown,
    AWSMediaconvertBillingTagsSourceQueue,
    AWSMediaconvertBillingTagsSourcePreset,
    AWSMediaconvertBillingTagsSourceJobTemplate,
    AWSMediaconvertBillingTagsSourceJob,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertBurninSubtitleAlignment) {
    AWSMediaconvertBurninSubtitleAlignmentUnknown,
    AWSMediaconvertBurninSubtitleAlignmentCentered,
    AWSMediaconvertBurninSubtitleAlignmentLeft,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertBurninSubtitleBackgroundColor) {
    AWSMediaconvertBurninSubtitleBackgroundColorUnknown,
    AWSMediaconvertBurninSubtitleBackgroundColorNone,
    AWSMediaconvertBurninSubtitleBackgroundColorBlack,
    AWSMediaconvertBurninSubtitleBackgroundColorWhite,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertBurninSubtitleFontColor) {
    AWSMediaconvertBurninSubtitleFontColorUnknown,
    AWSMediaconvertBurninSubtitleFontColorWhite,
    AWSMediaconvertBurninSubtitleFontColorBlack,
    AWSMediaconvertBurninSubtitleFontColorYellow,
    AWSMediaconvertBurninSubtitleFontColorRed,
    AWSMediaconvertBurninSubtitleFontColorGreen,
    AWSMediaconvertBurninSubtitleFontColorBlue,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertBurninSubtitleOutlineColor) {
    AWSMediaconvertBurninSubtitleOutlineColorUnknown,
    AWSMediaconvertBurninSubtitleOutlineColorBlack,
    AWSMediaconvertBurninSubtitleOutlineColorWhite,
    AWSMediaconvertBurninSubtitleOutlineColorYellow,
    AWSMediaconvertBurninSubtitleOutlineColorRed,
    AWSMediaconvertBurninSubtitleOutlineColorGreen,
    AWSMediaconvertBurninSubtitleOutlineColorBlue,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertBurninSubtitleShadowColor) {
    AWSMediaconvertBurninSubtitleShadowColorUnknown,
    AWSMediaconvertBurninSubtitleShadowColorNone,
    AWSMediaconvertBurninSubtitleShadowColorBlack,
    AWSMediaconvertBurninSubtitleShadowColorWhite,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertBurninSubtitleTeletextSpacing) {
    AWSMediaconvertBurninSubtitleTeletextSpacingUnknown,
    AWSMediaconvertBurninSubtitleTeletextSpacingFixedGrid,
    AWSMediaconvertBurninSubtitleTeletextSpacingProportional,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCaptionDestinationType) {
    AWSMediaconvertCaptionDestinationTypeUnknown,
    AWSMediaconvertCaptionDestinationTypeBurnIn,
    AWSMediaconvertCaptionDestinationTypeDvbSub,
    AWSMediaconvertCaptionDestinationTypeEmbedded,
    AWSMediaconvertCaptionDestinationTypeEmbeddedPlusScte20,
    AWSMediaconvertCaptionDestinationTypeImsc,
    AWSMediaconvertCaptionDestinationTypeScte20PlusEmbedded,
    AWSMediaconvertCaptionDestinationTypeScc,
    AWSMediaconvertCaptionDestinationTypeSrt,
    AWSMediaconvertCaptionDestinationTypeSmi,
    AWSMediaconvertCaptionDestinationTypeTeletext,
    AWSMediaconvertCaptionDestinationTypeTtml,
    AWSMediaconvertCaptionDestinationTypeWebvtt,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCaptionSourceType) {
    AWSMediaconvertCaptionSourceTypeUnknown,
    AWSMediaconvertCaptionSourceTypeAncillary,
    AWSMediaconvertCaptionSourceTypeDvbSub,
    AWSMediaconvertCaptionSourceTypeEmbedded,
    AWSMediaconvertCaptionSourceTypeScte20,
    AWSMediaconvertCaptionSourceTypeScc,
    AWSMediaconvertCaptionSourceTypeTtml,
    AWSMediaconvertCaptionSourceTypeStl,
    AWSMediaconvertCaptionSourceTypeSrt,
    AWSMediaconvertCaptionSourceTypeSmi,
    AWSMediaconvertCaptionSourceTypeTeletext,
    AWSMediaconvertCaptionSourceTypeNullSource,
    AWSMediaconvertCaptionSourceTypeImsc,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafClientCache) {
    AWSMediaconvertCmafClientCacheUnknown,
    AWSMediaconvertCmafClientCacheDisabled,
    AWSMediaconvertCmafClientCacheEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafCodecSpecification) {
    AWSMediaconvertCmafCodecSpecificationUnknown,
    AWSMediaconvertCmafCodecSpecificationRfc6381,
    AWSMediaconvertCmafCodecSpecificationRfc4281,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafEncryptionType) {
    AWSMediaconvertCmafEncryptionTypeUnknown,
    AWSMediaconvertCmafEncryptionTypeSampleAes,
    AWSMediaconvertCmafEncryptionTypeAesCtr,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafInitializationVectorInManifest) {
    AWSMediaconvertCmafInitializationVectorInManifestUnknown,
    AWSMediaconvertCmafInitializationVectorInManifestInclude,
    AWSMediaconvertCmafInitializationVectorInManifestExclude,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafKeyProviderType) {
    AWSMediaconvertCmafKeyProviderTypeUnknown,
    AWSMediaconvertCmafKeyProviderTypeSpeke,
    AWSMediaconvertCmafKeyProviderTypeStaticKey,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafManifestCompression) {
    AWSMediaconvertCmafManifestCompressionUnknown,
    AWSMediaconvertCmafManifestCompressionGzip,
    AWSMediaconvertCmafManifestCompressionNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafManifestDurationFormat) {
    AWSMediaconvertCmafManifestDurationFormatUnknown,
    AWSMediaconvertCmafManifestDurationFormatFloatingPoint,
    AWSMediaconvertCmafManifestDurationFormatInteger,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafMpdProfile) {
    AWSMediaconvertCmafMpdProfileUnknown,
    AWSMediaconvertCmafMpdProfileMainProfile,
    AWSMediaconvertCmafMpdProfileOnDemandProfile,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafSegmentControl) {
    AWSMediaconvertCmafSegmentControlUnknown,
    AWSMediaconvertCmafSegmentControlSingleFile,
    AWSMediaconvertCmafSegmentControlSegmentedFiles,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafStreamInfResolution) {
    AWSMediaconvertCmafStreamInfResolutionUnknown,
    AWSMediaconvertCmafStreamInfResolutionInclude,
    AWSMediaconvertCmafStreamInfResolutionExclude,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafWriteDASHManifest) {
    AWSMediaconvertCmafWriteDASHManifestUnknown,
    AWSMediaconvertCmafWriteDASHManifestDisabled,
    AWSMediaconvertCmafWriteDASHManifestEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafWriteHLSManifest) {
    AWSMediaconvertCmafWriteHLSManifestUnknown,
    AWSMediaconvertCmafWriteHLSManifestDisabled,
    AWSMediaconvertCmafWriteHLSManifestEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmafWriteSegmentTimelineInRepresentation) {
    AWSMediaconvertCmafWriteSegmentTimelineInRepresentationUnknown,
    AWSMediaconvertCmafWriteSegmentTimelineInRepresentationEnabled,
    AWSMediaconvertCmafWriteSegmentTimelineInRepresentationDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmfcScte35Esam) {
    AWSMediaconvertCmfcScte35EsamUnknown,
    AWSMediaconvertCmfcScte35EsamInsert,
    AWSMediaconvertCmfcScte35EsamNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCmfcScte35Source) {
    AWSMediaconvertCmfcScte35SourceUnknown,
    AWSMediaconvertCmfcScte35SourcePassthrough,
    AWSMediaconvertCmfcScte35SourceNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertColorMetadata) {
    AWSMediaconvertColorMetadataUnknown,
    AWSMediaconvertColorMetadataIgnore,
    AWSMediaconvertColorMetadataInsert,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertColorSpace) {
    AWSMediaconvertColorSpaceUnknown,
    AWSMediaconvertColorSpaceFollow,
    AWSMediaconvertColorSpaceRec601,
    AWSMediaconvertColorSpaceRec709,
    AWSMediaconvertColorSpaceHdr10,
    AWSMediaconvertColorSpaceHlg2020,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertColorSpaceConversion) {
    AWSMediaconvertColorSpaceConversionUnknown,
    AWSMediaconvertColorSpaceConversionNone,
    AWSMediaconvertColorSpaceConversionForce601,
    AWSMediaconvertColorSpaceConversionForce709,
    AWSMediaconvertColorSpaceConversionForceHdr10,
    AWSMediaconvertColorSpaceConversionForceHlg2020,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertColorSpaceUsage) {
    AWSMediaconvertColorSpaceUsageUnknown,
    AWSMediaconvertColorSpaceUsageForce,
    AWSMediaconvertColorSpaceUsageFallback,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertCommitment) {
    AWSMediaconvertCommitmentUnknown,
    AWSMediaconvertCommitmentOneYear,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertContainerType) {
    AWSMediaconvertContainerTypeUnknown,
    AWSMediaconvertContainerTypeF4v,
    AWSMediaconvertContainerTypeIsmv,
    AWSMediaconvertContainerTypeM2ts,
    AWSMediaconvertContainerTypeM3u8,
    AWSMediaconvertContainerTypeCmfc,
    AWSMediaconvertContainerTypeMov,
    AWSMediaconvertContainerTypeMp4,
    AWSMediaconvertContainerTypeMpd,
    AWSMediaconvertContainerTypeMxf,
    AWSMediaconvertContainerTypeWebm,
    AWSMediaconvertContainerTypeRAW,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDashIsoHbbtvCompliance) {
    AWSMediaconvertDashIsoHbbtvComplianceUnknown,
    AWSMediaconvertDashIsoHbbtvComplianceHbbtv15,
    AWSMediaconvertDashIsoHbbtvComplianceNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDashIsoMpdProfile) {
    AWSMediaconvertDashIsoMpdProfileUnknown,
    AWSMediaconvertDashIsoMpdProfileMainProfile,
    AWSMediaconvertDashIsoMpdProfileOnDemandProfile,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDashIsoPlaybackDeviceCompatibility) {
    AWSMediaconvertDashIsoPlaybackDeviceCompatibilityUnknown,
    AWSMediaconvertDashIsoPlaybackDeviceCompatibilityCencV1,
    AWSMediaconvertDashIsoPlaybackDeviceCompatibilityUnencryptedSei,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDashIsoSegmentControl) {
    AWSMediaconvertDashIsoSegmentControlUnknown,
    AWSMediaconvertDashIsoSegmentControlSingleFile,
    AWSMediaconvertDashIsoSegmentControlSegmentedFiles,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDashIsoWriteSegmentTimelineInRepresentation) {
    AWSMediaconvertDashIsoWriteSegmentTimelineInRepresentationUnknown,
    AWSMediaconvertDashIsoWriteSegmentTimelineInRepresentationEnabled,
    AWSMediaconvertDashIsoWriteSegmentTimelineInRepresentationDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDecryptionMode) {
    AWSMediaconvertDecryptionModeUnknown,
    AWSMediaconvertDecryptionModeAesCtr,
    AWSMediaconvertDecryptionModeAesCbc,
    AWSMediaconvertDecryptionModeAesGcm,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDeinterlaceAlgorithm) {
    AWSMediaconvertDeinterlaceAlgorithmUnknown,
    AWSMediaconvertDeinterlaceAlgorithmInterpolate,
    AWSMediaconvertDeinterlaceAlgorithmInterpolateTicker,
    AWSMediaconvertDeinterlaceAlgorithmBlend,
    AWSMediaconvertDeinterlaceAlgorithmBlendTicker,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDeinterlacerControl) {
    AWSMediaconvertDeinterlacerControlUnknown,
    AWSMediaconvertDeinterlacerControlForceAllFrames,
    AWSMediaconvertDeinterlacerControlNormal,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDeinterlacerMode) {
    AWSMediaconvertDeinterlacerModeUnknown,
    AWSMediaconvertDeinterlacerModeDeinterlace,
    AWSMediaconvertDeinterlacerModeInverseTelecine,
    AWSMediaconvertDeinterlacerModeAdaptive,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDescribeEndpointsMode) {
    AWSMediaconvertDescribeEndpointsModeUnknown,
    AWSMediaconvertDescribeEndpointsModeDefault,
    AWSMediaconvertDescribeEndpointsModeGetOnly,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDolbyVisionLevel6Mode) {
    AWSMediaconvertDolbyVisionLevel6ModeUnknown,
    AWSMediaconvertDolbyVisionLevel6ModePassthrough,
    AWSMediaconvertDolbyVisionLevel6ModeRecalculate,
    AWSMediaconvertDolbyVisionLevel6ModeSpecify,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDolbyVisionProfile) {
    AWSMediaconvertDolbyVisionProfileUnknown,
    AWSMediaconvertDolbyVisionProfileProfile5,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDropFrameTimecode) {
    AWSMediaconvertDropFrameTimecodeUnknown,
    AWSMediaconvertDropFrameTimecodeDisabled,
    AWSMediaconvertDropFrameTimecodeEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDvbSubtitleAlignment) {
    AWSMediaconvertDvbSubtitleAlignmentUnknown,
    AWSMediaconvertDvbSubtitleAlignmentCentered,
    AWSMediaconvertDvbSubtitleAlignmentLeft,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDvbSubtitleBackgroundColor) {
    AWSMediaconvertDvbSubtitleBackgroundColorUnknown,
    AWSMediaconvertDvbSubtitleBackgroundColorNone,
    AWSMediaconvertDvbSubtitleBackgroundColorBlack,
    AWSMediaconvertDvbSubtitleBackgroundColorWhite,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDvbSubtitleFontColor) {
    AWSMediaconvertDvbSubtitleFontColorUnknown,
    AWSMediaconvertDvbSubtitleFontColorWhite,
    AWSMediaconvertDvbSubtitleFontColorBlack,
    AWSMediaconvertDvbSubtitleFontColorYellow,
    AWSMediaconvertDvbSubtitleFontColorRed,
    AWSMediaconvertDvbSubtitleFontColorGreen,
    AWSMediaconvertDvbSubtitleFontColorBlue,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDvbSubtitleOutlineColor) {
    AWSMediaconvertDvbSubtitleOutlineColorUnknown,
    AWSMediaconvertDvbSubtitleOutlineColorBlack,
    AWSMediaconvertDvbSubtitleOutlineColorWhite,
    AWSMediaconvertDvbSubtitleOutlineColorYellow,
    AWSMediaconvertDvbSubtitleOutlineColorRed,
    AWSMediaconvertDvbSubtitleOutlineColorGreen,
    AWSMediaconvertDvbSubtitleOutlineColorBlue,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDvbSubtitleShadowColor) {
    AWSMediaconvertDvbSubtitleShadowColorUnknown,
    AWSMediaconvertDvbSubtitleShadowColorNone,
    AWSMediaconvertDvbSubtitleShadowColorBlack,
    AWSMediaconvertDvbSubtitleShadowColorWhite,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDvbSubtitleTeletextSpacing) {
    AWSMediaconvertDvbSubtitleTeletextSpacingUnknown,
    AWSMediaconvertDvbSubtitleTeletextSpacingFixedGrid,
    AWSMediaconvertDvbSubtitleTeletextSpacingProportional,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertDvbSubtitlingType) {
    AWSMediaconvertDvbSubtitlingTypeUnknown,
    AWSMediaconvertDvbSubtitlingTypeHearingImpaired,
    AWSMediaconvertDvbSubtitlingTypeStandard,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3AtmosBitstreamMode) {
    AWSMediaconvertEac3AtmosBitstreamModeUnknown,
    AWSMediaconvertEac3AtmosBitstreamModeCompleteMain,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3AtmosCodingMode) {
    AWSMediaconvertEac3AtmosCodingModeUnknown,
    AWSMediaconvertEac3AtmosCodingModeCodingMode916,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3AtmosDialogueIntelligence) {
    AWSMediaconvertEac3AtmosDialogueIntelligenceUnknown,
    AWSMediaconvertEac3AtmosDialogueIntelligenceEnabled,
    AWSMediaconvertEac3AtmosDialogueIntelligenceDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3AtmosDynamicRangeCompressionLine) {
    AWSMediaconvertEac3AtmosDynamicRangeCompressionLineUnknown,
    AWSMediaconvertEac3AtmosDynamicRangeCompressionLineNone,
    AWSMediaconvertEac3AtmosDynamicRangeCompressionLineFilmStandard,
    AWSMediaconvertEac3AtmosDynamicRangeCompressionLineFilmLight,
    AWSMediaconvertEac3AtmosDynamicRangeCompressionLineMusicStandard,
    AWSMediaconvertEac3AtmosDynamicRangeCompressionLineMusicLight,
    AWSMediaconvertEac3AtmosDynamicRangeCompressionLineSpeech,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3AtmosDynamicRangeCompressionRf) {
    AWSMediaconvertEac3AtmosDynamicRangeCompressionRfUnknown,
    AWSMediaconvertEac3AtmosDynamicRangeCompressionRfNone,
    AWSMediaconvertEac3AtmosDynamicRangeCompressionRfFilmStandard,
    AWSMediaconvertEac3AtmosDynamicRangeCompressionRfFilmLight,
    AWSMediaconvertEac3AtmosDynamicRangeCompressionRfMusicStandard,
    AWSMediaconvertEac3AtmosDynamicRangeCompressionRfMusicLight,
    AWSMediaconvertEac3AtmosDynamicRangeCompressionRfSpeech,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3AtmosMeteringMode) {
    AWSMediaconvertEac3AtmosMeteringModeUnknown,
    AWSMediaconvertEac3AtmosMeteringModeLeqA,
    AWSMediaconvertEac3AtmosMeteringModeItuBs17701,
    AWSMediaconvertEac3AtmosMeteringModeItuBs17702,
    AWSMediaconvertEac3AtmosMeteringModeItuBs17703,
    AWSMediaconvertEac3AtmosMeteringModeItuBs17704,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3AtmosStereoDownmix) {
    AWSMediaconvertEac3AtmosStereoDownmixUnknown,
    AWSMediaconvertEac3AtmosStereoDownmixNotIndicated,
    AWSMediaconvertEac3AtmosStereoDownmixStereo,
    AWSMediaconvertEac3AtmosStereoDownmixSurround,
    AWSMediaconvertEac3AtmosStereoDownmixDpl2,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3AtmosSurroundExMode) {
    AWSMediaconvertEac3AtmosSurroundExModeUnknown,
    AWSMediaconvertEac3AtmosSurroundExModeNotIndicated,
    AWSMediaconvertEac3AtmosSurroundExModeEnabled,
    AWSMediaconvertEac3AtmosSurroundExModeDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3AttenuationControl) {
    AWSMediaconvertEac3AttenuationControlUnknown,
    AWSMediaconvertEac3AttenuationControlAttenuate3Db,
    AWSMediaconvertEac3AttenuationControlNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3BitstreamMode) {
    AWSMediaconvertEac3BitstreamModeUnknown,
    AWSMediaconvertEac3BitstreamModeCompleteMain,
    AWSMediaconvertEac3BitstreamModeCommentary,
    AWSMediaconvertEac3BitstreamModeEmergency,
    AWSMediaconvertEac3BitstreamModeHearingImpaired,
    AWSMediaconvertEac3BitstreamModeVisuallyImpaired,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3CodingMode) {
    AWSMediaconvertEac3CodingModeUnknown,
    AWSMediaconvertEac3CodingModeCodingMode10,
    AWSMediaconvertEac3CodingModeCodingMode20,
    AWSMediaconvertEac3CodingModeCodingMode32,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3DcFilter) {
    AWSMediaconvertEac3DcFilterUnknown,
    AWSMediaconvertEac3DcFilterEnabled,
    AWSMediaconvertEac3DcFilterDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3DynamicRangeCompressionLine) {
    AWSMediaconvertEac3DynamicRangeCompressionLineUnknown,
    AWSMediaconvertEac3DynamicRangeCompressionLineNone,
    AWSMediaconvertEac3DynamicRangeCompressionLineFilmStandard,
    AWSMediaconvertEac3DynamicRangeCompressionLineFilmLight,
    AWSMediaconvertEac3DynamicRangeCompressionLineMusicStandard,
    AWSMediaconvertEac3DynamicRangeCompressionLineMusicLight,
    AWSMediaconvertEac3DynamicRangeCompressionLineSpeech,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3DynamicRangeCompressionRf) {
    AWSMediaconvertEac3DynamicRangeCompressionRfUnknown,
    AWSMediaconvertEac3DynamicRangeCompressionRfNone,
    AWSMediaconvertEac3DynamicRangeCompressionRfFilmStandard,
    AWSMediaconvertEac3DynamicRangeCompressionRfFilmLight,
    AWSMediaconvertEac3DynamicRangeCompressionRfMusicStandard,
    AWSMediaconvertEac3DynamicRangeCompressionRfMusicLight,
    AWSMediaconvertEac3DynamicRangeCompressionRfSpeech,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3LfeControl) {
    AWSMediaconvertEac3LfeControlUnknown,
    AWSMediaconvertEac3LfeControlLfe,
    AWSMediaconvertEac3LfeControlNoLfe,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3LfeFilter) {
    AWSMediaconvertEac3LfeFilterUnknown,
    AWSMediaconvertEac3LfeFilterEnabled,
    AWSMediaconvertEac3LfeFilterDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3MetadataControl) {
    AWSMediaconvertEac3MetadataControlUnknown,
    AWSMediaconvertEac3MetadataControlFollowInput,
    AWSMediaconvertEac3MetadataControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3PassthroughControl) {
    AWSMediaconvertEac3PassthroughControlUnknown,
    AWSMediaconvertEac3PassthroughControlWhenPossible,
    AWSMediaconvertEac3PassthroughControlNoPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3PhaseControl) {
    AWSMediaconvertEac3PhaseControlUnknown,
    AWSMediaconvertEac3PhaseControlShift90Degrees,
    AWSMediaconvertEac3PhaseControlNoShift,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3StereoDownmix) {
    AWSMediaconvertEac3StereoDownmixUnknown,
    AWSMediaconvertEac3StereoDownmixNotIndicated,
    AWSMediaconvertEac3StereoDownmixLoRo,
    AWSMediaconvertEac3StereoDownmixLtRt,
    AWSMediaconvertEac3StereoDownmixDpl2,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3SurroundExMode) {
    AWSMediaconvertEac3SurroundExModeUnknown,
    AWSMediaconvertEac3SurroundExModeNotIndicated,
    AWSMediaconvertEac3SurroundExModeEnabled,
    AWSMediaconvertEac3SurroundExModeDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEac3SurroundMode) {
    AWSMediaconvertEac3SurroundModeUnknown,
    AWSMediaconvertEac3SurroundModeNotIndicated,
    AWSMediaconvertEac3SurroundModeEnabled,
    AWSMediaconvertEac3SurroundModeDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEmbeddedConvert608To708) {
    AWSMediaconvertEmbeddedConvert608To708Unknown,
    AWSMediaconvertEmbeddedConvert608To708Upconvert,
    AWSMediaconvertEmbeddedConvert608To708Disabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertEmbeddedTerminateCaptions) {
    AWSMediaconvertEmbeddedTerminateCaptionsUnknown,
    AWSMediaconvertEmbeddedTerminateCaptionsEndOfInput,
    AWSMediaconvertEmbeddedTerminateCaptionsDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertF4vMoovPlacement) {
    AWSMediaconvertF4vMoovPlacementUnknown,
    AWSMediaconvertF4vMoovPlacementProgressiveDownload,
    AWSMediaconvertF4vMoovPlacementNormal,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertFileSourceConvert608To708) {
    AWSMediaconvertFileSourceConvert608To708Unknown,
    AWSMediaconvertFileSourceConvert608To708Upconvert,
    AWSMediaconvertFileSourceConvert608To708Disabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertFontScript) {
    AWSMediaconvertFontScriptUnknown,
    AWSMediaconvertFontScriptAutomatic,
    AWSMediaconvertFontScriptHans,
    AWSMediaconvertFontScriptHant,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264AdaptiveQuantization) {
    AWSMediaconvertH264AdaptiveQuantizationUnknown,
    AWSMediaconvertH264AdaptiveQuantizationOff,
    AWSMediaconvertH264AdaptiveQuantizationLow,
    AWSMediaconvertH264AdaptiveQuantizationMedium,
    AWSMediaconvertH264AdaptiveQuantizationHigh,
    AWSMediaconvertH264AdaptiveQuantizationHigher,
    AWSMediaconvertH264AdaptiveQuantizationMax,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264CodecLevel) {
    AWSMediaconvertH264CodecLevelUnknown,
    AWSMediaconvertH264CodecLevelAuto,
    AWSMediaconvertH264CodecLevelLevel1,
    AWSMediaconvertH264CodecLevelLevel11,
    AWSMediaconvertH264CodecLevelLevel12,
    AWSMediaconvertH264CodecLevelLevel13,
    AWSMediaconvertH264CodecLevelLevel2,
    AWSMediaconvertH264CodecLevelLevel21,
    AWSMediaconvertH264CodecLevelLevel22,
    AWSMediaconvertH264CodecLevelLevel3,
    AWSMediaconvertH264CodecLevelLevel31,
    AWSMediaconvertH264CodecLevelLevel32,
    AWSMediaconvertH264CodecLevelLevel4,
    AWSMediaconvertH264CodecLevelLevel41,
    AWSMediaconvertH264CodecLevelLevel42,
    AWSMediaconvertH264CodecLevelLevel5,
    AWSMediaconvertH264CodecLevelLevel51,
    AWSMediaconvertH264CodecLevelLevel52,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264CodecProfile) {
    AWSMediaconvertH264CodecProfileUnknown,
    AWSMediaconvertH264CodecProfileBaseline,
    AWSMediaconvertH264CodecProfileHigh,
    AWSMediaconvertH264CodecProfileHigh10bit,
    AWSMediaconvertH264CodecProfileHigh422,
    AWSMediaconvertH264CodecProfileHigh42210bit,
    AWSMediaconvertH264CodecProfileMain,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264DynamicSubGop) {
    AWSMediaconvertH264DynamicSubGopUnknown,
    AWSMediaconvertH264DynamicSubGopAdaptive,
    AWSMediaconvertH264DynamicSubGopStatic,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264EntropyEncoding) {
    AWSMediaconvertH264EntropyEncodingUnknown,
    AWSMediaconvertH264EntropyEncodingCabac,
    AWSMediaconvertH264EntropyEncodingCavlc,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264FieldEncoding) {
    AWSMediaconvertH264FieldEncodingUnknown,
    AWSMediaconvertH264FieldEncodingPaff,
    AWSMediaconvertH264FieldEncodingForceField,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264FlickerAdaptiveQuantization) {
    AWSMediaconvertH264FlickerAdaptiveQuantizationUnknown,
    AWSMediaconvertH264FlickerAdaptiveQuantizationDisabled,
    AWSMediaconvertH264FlickerAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264FramerateControl) {
    AWSMediaconvertH264FramerateControlUnknown,
    AWSMediaconvertH264FramerateControlInitializeFromSource,
    AWSMediaconvertH264FramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264FramerateConversionAlgorithm) {
    AWSMediaconvertH264FramerateConversionAlgorithmUnknown,
    AWSMediaconvertH264FramerateConversionAlgorithmDuplicateDrop,
    AWSMediaconvertH264FramerateConversionAlgorithmInterpolate,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264GopBReference) {
    AWSMediaconvertH264GopBReferenceUnknown,
    AWSMediaconvertH264GopBReferenceDisabled,
    AWSMediaconvertH264GopBReferenceEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264GopSizeUnits) {
    AWSMediaconvertH264GopSizeUnitsUnknown,
    AWSMediaconvertH264GopSizeUnitsFrames,
    AWSMediaconvertH264GopSizeUnitsSeconds,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264InterlaceMode) {
    AWSMediaconvertH264InterlaceModeUnknown,
    AWSMediaconvertH264InterlaceModeProgressive,
    AWSMediaconvertH264InterlaceModeTopField,
    AWSMediaconvertH264InterlaceModeBottomField,
    AWSMediaconvertH264InterlaceModeFollowTopField,
    AWSMediaconvertH264InterlaceModeFollowBottomField,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264ParControl) {
    AWSMediaconvertH264ParControlUnknown,
    AWSMediaconvertH264ParControlInitializeFromSource,
    AWSMediaconvertH264ParControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264QualityTuningLevel) {
    AWSMediaconvertH264QualityTuningLevelUnknown,
    AWSMediaconvertH264QualityTuningLevelSinglePass,
    AWSMediaconvertH264QualityTuningLevelSinglePassHq,
    AWSMediaconvertH264QualityTuningLevelMultiPassHq,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264RateControlMode) {
    AWSMediaconvertH264RateControlModeUnknown,
    AWSMediaconvertH264RateControlModeVbr,
    AWSMediaconvertH264RateControlModeCbr,
    AWSMediaconvertH264RateControlModeQvbr,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264RepeatPps) {
    AWSMediaconvertH264RepeatPpsUnknown,
    AWSMediaconvertH264RepeatPpsDisabled,
    AWSMediaconvertH264RepeatPpsEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264SceneChangeDetect) {
    AWSMediaconvertH264SceneChangeDetectUnknown,
    AWSMediaconvertH264SceneChangeDetectDisabled,
    AWSMediaconvertH264SceneChangeDetectEnabled,
    AWSMediaconvertH264SceneChangeDetectTransitionDetection,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264SlowPal) {
    AWSMediaconvertH264SlowPalUnknown,
    AWSMediaconvertH264SlowPalDisabled,
    AWSMediaconvertH264SlowPalEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264SpatialAdaptiveQuantization) {
    AWSMediaconvertH264SpatialAdaptiveQuantizationUnknown,
    AWSMediaconvertH264SpatialAdaptiveQuantizationDisabled,
    AWSMediaconvertH264SpatialAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264Syntax) {
    AWSMediaconvertH264SyntaxUnknown,
    AWSMediaconvertH264SyntaxDefault,
    AWSMediaconvertH264SyntaxRp2027,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264Telecine) {
    AWSMediaconvertH264TelecineUnknown,
    AWSMediaconvertH264TelecineNone,
    AWSMediaconvertH264TelecineSoft,
    AWSMediaconvertH264TelecineHard,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264TemporalAdaptiveQuantization) {
    AWSMediaconvertH264TemporalAdaptiveQuantizationUnknown,
    AWSMediaconvertH264TemporalAdaptiveQuantizationDisabled,
    AWSMediaconvertH264TemporalAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH264UnregisteredSeiTimecode) {
    AWSMediaconvertH264UnregisteredSeiTimecodeUnknown,
    AWSMediaconvertH264UnregisteredSeiTimecodeDisabled,
    AWSMediaconvertH264UnregisteredSeiTimecodeEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265AdaptiveQuantization) {
    AWSMediaconvertH265AdaptiveQuantizationUnknown,
    AWSMediaconvertH265AdaptiveQuantizationOff,
    AWSMediaconvertH265AdaptiveQuantizationLow,
    AWSMediaconvertH265AdaptiveQuantizationMedium,
    AWSMediaconvertH265AdaptiveQuantizationHigh,
    AWSMediaconvertH265AdaptiveQuantizationHigher,
    AWSMediaconvertH265AdaptiveQuantizationMax,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265AlternateTransferFunctionSei) {
    AWSMediaconvertH265AlternateTransferFunctionSeiUnknown,
    AWSMediaconvertH265AlternateTransferFunctionSeiDisabled,
    AWSMediaconvertH265AlternateTransferFunctionSeiEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265CodecLevel) {
    AWSMediaconvertH265CodecLevelUnknown,
    AWSMediaconvertH265CodecLevelAuto,
    AWSMediaconvertH265CodecLevelLevel1,
    AWSMediaconvertH265CodecLevelLevel2,
    AWSMediaconvertH265CodecLevelLevel21,
    AWSMediaconvertH265CodecLevelLevel3,
    AWSMediaconvertH265CodecLevelLevel31,
    AWSMediaconvertH265CodecLevelLevel4,
    AWSMediaconvertH265CodecLevelLevel41,
    AWSMediaconvertH265CodecLevelLevel5,
    AWSMediaconvertH265CodecLevelLevel51,
    AWSMediaconvertH265CodecLevelLevel52,
    AWSMediaconvertH265CodecLevelLevel6,
    AWSMediaconvertH265CodecLevelLevel61,
    AWSMediaconvertH265CodecLevelLevel62,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265CodecProfile) {
    AWSMediaconvertH265CodecProfileUnknown,
    AWSMediaconvertH265CodecProfileMainMain,
    AWSMediaconvertH265CodecProfileMainHigh,
    AWSMediaconvertH265CodecProfileMain10Main,
    AWSMediaconvertH265CodecProfileMain10High,
    AWSMediaconvertH265CodecProfileMain4228bitMain,
    AWSMediaconvertH265CodecProfileMain4228bitHigh,
    AWSMediaconvertH265CodecProfileMain42210bitMain,
    AWSMediaconvertH265CodecProfileMain42210bitHigh,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265DynamicSubGop) {
    AWSMediaconvertH265DynamicSubGopUnknown,
    AWSMediaconvertH265DynamicSubGopAdaptive,
    AWSMediaconvertH265DynamicSubGopStatic,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265FlickerAdaptiveQuantization) {
    AWSMediaconvertH265FlickerAdaptiveQuantizationUnknown,
    AWSMediaconvertH265FlickerAdaptiveQuantizationDisabled,
    AWSMediaconvertH265FlickerAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265FramerateControl) {
    AWSMediaconvertH265FramerateControlUnknown,
    AWSMediaconvertH265FramerateControlInitializeFromSource,
    AWSMediaconvertH265FramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265FramerateConversionAlgorithm) {
    AWSMediaconvertH265FramerateConversionAlgorithmUnknown,
    AWSMediaconvertH265FramerateConversionAlgorithmDuplicateDrop,
    AWSMediaconvertH265FramerateConversionAlgorithmInterpolate,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265GopBReference) {
    AWSMediaconvertH265GopBReferenceUnknown,
    AWSMediaconvertH265GopBReferenceDisabled,
    AWSMediaconvertH265GopBReferenceEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265GopSizeUnits) {
    AWSMediaconvertH265GopSizeUnitsUnknown,
    AWSMediaconvertH265GopSizeUnitsFrames,
    AWSMediaconvertH265GopSizeUnitsSeconds,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265InterlaceMode) {
    AWSMediaconvertH265InterlaceModeUnknown,
    AWSMediaconvertH265InterlaceModeProgressive,
    AWSMediaconvertH265InterlaceModeTopField,
    AWSMediaconvertH265InterlaceModeBottomField,
    AWSMediaconvertH265InterlaceModeFollowTopField,
    AWSMediaconvertH265InterlaceModeFollowBottomField,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265ParControl) {
    AWSMediaconvertH265ParControlUnknown,
    AWSMediaconvertH265ParControlInitializeFromSource,
    AWSMediaconvertH265ParControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265QualityTuningLevel) {
    AWSMediaconvertH265QualityTuningLevelUnknown,
    AWSMediaconvertH265QualityTuningLevelSinglePass,
    AWSMediaconvertH265QualityTuningLevelSinglePassHq,
    AWSMediaconvertH265QualityTuningLevelMultiPassHq,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265RateControlMode) {
    AWSMediaconvertH265RateControlModeUnknown,
    AWSMediaconvertH265RateControlModeVbr,
    AWSMediaconvertH265RateControlModeCbr,
    AWSMediaconvertH265RateControlModeQvbr,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265SampleAdaptiveOffsetFilterMode) {
    AWSMediaconvertH265SampleAdaptiveOffsetFilterModeUnknown,
    AWSMediaconvertH265SampleAdaptiveOffsetFilterModeDefault,
    AWSMediaconvertH265SampleAdaptiveOffsetFilterModeAdaptive,
    AWSMediaconvertH265SampleAdaptiveOffsetFilterModeOff,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265SceneChangeDetect) {
    AWSMediaconvertH265SceneChangeDetectUnknown,
    AWSMediaconvertH265SceneChangeDetectDisabled,
    AWSMediaconvertH265SceneChangeDetectEnabled,
    AWSMediaconvertH265SceneChangeDetectTransitionDetection,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265SlowPal) {
    AWSMediaconvertH265SlowPalUnknown,
    AWSMediaconvertH265SlowPalDisabled,
    AWSMediaconvertH265SlowPalEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265SpatialAdaptiveQuantization) {
    AWSMediaconvertH265SpatialAdaptiveQuantizationUnknown,
    AWSMediaconvertH265SpatialAdaptiveQuantizationDisabled,
    AWSMediaconvertH265SpatialAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265Telecine) {
    AWSMediaconvertH265TelecineUnknown,
    AWSMediaconvertH265TelecineNone,
    AWSMediaconvertH265TelecineSoft,
    AWSMediaconvertH265TelecineHard,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265TemporalAdaptiveQuantization) {
    AWSMediaconvertH265TemporalAdaptiveQuantizationUnknown,
    AWSMediaconvertH265TemporalAdaptiveQuantizationDisabled,
    AWSMediaconvertH265TemporalAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265TemporalIds) {
    AWSMediaconvertH265TemporalIdsUnknown,
    AWSMediaconvertH265TemporalIdsDisabled,
    AWSMediaconvertH265TemporalIdsEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265Tiles) {
    AWSMediaconvertH265TilesUnknown,
    AWSMediaconvertH265TilesDisabled,
    AWSMediaconvertH265TilesEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265UnregisteredSeiTimecode) {
    AWSMediaconvertH265UnregisteredSeiTimecodeUnknown,
    AWSMediaconvertH265UnregisteredSeiTimecodeDisabled,
    AWSMediaconvertH265UnregisteredSeiTimecodeEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertH265WriteMp4PackagingType) {
    AWSMediaconvertH265WriteMp4PackagingTypeUnknown,
    AWSMediaconvertH265WriteMp4PackagingTypeHvc1,
    AWSMediaconvertH265WriteMp4PackagingTypeHev1,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsAdMarkers) {
    AWSMediaconvertHlsAdMarkersUnknown,
    AWSMediaconvertHlsAdMarkersElemental,
    AWSMediaconvertHlsAdMarkersElementalScte35,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsAudioOnlyContainer) {
    AWSMediaconvertHlsAudioOnlyContainerUnknown,
    AWSMediaconvertHlsAudioOnlyContainerAutomatic,
    AWSMediaconvertHlsAudioOnlyContainerM2ts,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsAudioTrackType) {
    AWSMediaconvertHlsAudioTrackTypeUnknown,
    AWSMediaconvertHlsAudioTrackTypeAlternateAudioAutoSelectDefault,
    AWSMediaconvertHlsAudioTrackTypeAlternateAudioAutoSelect,
    AWSMediaconvertHlsAudioTrackTypeAlternateAudioNotAutoSelect,
    AWSMediaconvertHlsAudioTrackTypeAudioOnlyVariantStream,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsCaptionLanguageSetting) {
    AWSMediaconvertHlsCaptionLanguageSettingUnknown,
    AWSMediaconvertHlsCaptionLanguageSettingInsert,
    AWSMediaconvertHlsCaptionLanguageSettingOmit,
    AWSMediaconvertHlsCaptionLanguageSettingNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsClientCache) {
    AWSMediaconvertHlsClientCacheUnknown,
    AWSMediaconvertHlsClientCacheDisabled,
    AWSMediaconvertHlsClientCacheEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsCodecSpecification) {
    AWSMediaconvertHlsCodecSpecificationUnknown,
    AWSMediaconvertHlsCodecSpecificationRfc6381,
    AWSMediaconvertHlsCodecSpecificationRfc4281,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsDirectoryStructure) {
    AWSMediaconvertHlsDirectoryStructureUnknown,
    AWSMediaconvertHlsDirectoryStructureSingleDirectory,
    AWSMediaconvertHlsDirectoryStructureSubdirectoryPerStream,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsEncryptionType) {
    AWSMediaconvertHlsEncryptionTypeUnknown,
    AWSMediaconvertHlsEncryptionTypeAes128,
    AWSMediaconvertHlsEncryptionTypeSampleAes,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsIFrameOnlyManifest) {
    AWSMediaconvertHlsIFrameOnlyManifestUnknown,
    AWSMediaconvertHlsIFrameOnlyManifestInclude,
    AWSMediaconvertHlsIFrameOnlyManifestExclude,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsInitializationVectorInManifest) {
    AWSMediaconvertHlsInitializationVectorInManifestUnknown,
    AWSMediaconvertHlsInitializationVectorInManifestInclude,
    AWSMediaconvertHlsInitializationVectorInManifestExclude,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsKeyProviderType) {
    AWSMediaconvertHlsKeyProviderTypeUnknown,
    AWSMediaconvertHlsKeyProviderTypeSpeke,
    AWSMediaconvertHlsKeyProviderTypeStaticKey,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsManifestCompression) {
    AWSMediaconvertHlsManifestCompressionUnknown,
    AWSMediaconvertHlsManifestCompressionGzip,
    AWSMediaconvertHlsManifestCompressionNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsManifestDurationFormat) {
    AWSMediaconvertHlsManifestDurationFormatUnknown,
    AWSMediaconvertHlsManifestDurationFormatFloatingPoint,
    AWSMediaconvertHlsManifestDurationFormatInteger,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsOfflineEncrypted) {
    AWSMediaconvertHlsOfflineEncryptedUnknown,
    AWSMediaconvertHlsOfflineEncryptedEnabled,
    AWSMediaconvertHlsOfflineEncryptedDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsOutputSelection) {
    AWSMediaconvertHlsOutputSelectionUnknown,
    AWSMediaconvertHlsOutputSelectionManifestsAndSegments,
    AWSMediaconvertHlsOutputSelectionSegmentsOnly,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsProgramDateTime) {
    AWSMediaconvertHlsProgramDateTimeUnknown,
    AWSMediaconvertHlsProgramDateTimeInclude,
    AWSMediaconvertHlsProgramDateTimeExclude,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsSegmentControl) {
    AWSMediaconvertHlsSegmentControlUnknown,
    AWSMediaconvertHlsSegmentControlSingleFile,
    AWSMediaconvertHlsSegmentControlSegmentedFiles,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsStreamInfResolution) {
    AWSMediaconvertHlsStreamInfResolutionUnknown,
    AWSMediaconvertHlsStreamInfResolutionInclude,
    AWSMediaconvertHlsStreamInfResolutionExclude,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertHlsTimedMetadataId3Frame) {
    AWSMediaconvertHlsTimedMetadataId3FrameUnknown,
    AWSMediaconvertHlsTimedMetadataId3FrameNone,
    AWSMediaconvertHlsTimedMetadataId3FramePriv,
    AWSMediaconvertHlsTimedMetadataId3FrameTdrl,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertImscStylePassthrough) {
    AWSMediaconvertImscStylePassthroughUnknown,
    AWSMediaconvertImscStylePassthroughEnabled,
    AWSMediaconvertImscStylePassthroughDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertInputDeblockFilter) {
    AWSMediaconvertInputDeblockFilterUnknown,
    AWSMediaconvertInputDeblockFilterEnabled,
    AWSMediaconvertInputDeblockFilterDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertInputDenoiseFilter) {
    AWSMediaconvertInputDenoiseFilterUnknown,
    AWSMediaconvertInputDenoiseFilterEnabled,
    AWSMediaconvertInputDenoiseFilterDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertInputFilterEnable) {
    AWSMediaconvertInputFilterEnableUnknown,
    AWSMediaconvertInputFilterEnableAuto,
    AWSMediaconvertInputFilterEnableDisable,
    AWSMediaconvertInputFilterEnableForce,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertInputPsiControl) {
    AWSMediaconvertInputPsiControlUnknown,
    AWSMediaconvertInputPsiControlIgnorePsi,
    AWSMediaconvertInputPsiControlUsePsi,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertInputRotate) {
    AWSMediaconvertInputRotateUnknown,
    AWSMediaconvertInputRotateDegree0,
    AWSMediaconvertInputRotateDegrees90,
    AWSMediaconvertInputRotateDegrees180,
    AWSMediaconvertInputRotateDegrees270,
    AWSMediaconvertInputRotateAuto,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertInputTimecodeSource) {
    AWSMediaconvertInputTimecodeSourceUnknown,
    AWSMediaconvertInputTimecodeSourceEmbedded,
    AWSMediaconvertInputTimecodeSourceZerobased,
    AWSMediaconvertInputTimecodeSourceSpecifiedstart,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertJobPhase) {
    AWSMediaconvertJobPhaseUnknown,
    AWSMediaconvertJobPhaseProbing,
    AWSMediaconvertJobPhaseTranscoding,
    AWSMediaconvertJobPhaseUploading,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertJobStatus) {
    AWSMediaconvertJobStatusUnknown,
    AWSMediaconvertJobStatusSubmitted,
    AWSMediaconvertJobStatusProgressing,
    AWSMediaconvertJobStatusComplete,
    AWSMediaconvertJobStatusCanceled,
    AWSMediaconvertJobStatusError,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertJobTemplateListBy) {
    AWSMediaconvertJobTemplateListByUnknown,
    AWSMediaconvertJobTemplateListByName,
    AWSMediaconvertJobTemplateListByCreationDate,
    AWSMediaconvertJobTemplateListBySystem,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertLanguageCode) {
    AWSMediaconvertLanguageCodeUnknown,
    AWSMediaconvertLanguageCodeEng,
    AWSMediaconvertLanguageCodeSpa,
    AWSMediaconvertLanguageCodeFra,
    AWSMediaconvertLanguageCodeDeu,
    AWSMediaconvertLanguageCodeGer,
    AWSMediaconvertLanguageCodeZho,
    AWSMediaconvertLanguageCodeAra,
    AWSMediaconvertLanguageCodeHin,
    AWSMediaconvertLanguageCodeJpn,
    AWSMediaconvertLanguageCodeRus,
    AWSMediaconvertLanguageCodePor,
    AWSMediaconvertLanguageCodeIta,
    AWSMediaconvertLanguageCodeUrd,
    AWSMediaconvertLanguageCodeVie,
    AWSMediaconvertLanguageCodeKor,
    AWSMediaconvertLanguageCodePan,
    AWSMediaconvertLanguageCodeAbk,
    AWSMediaconvertLanguageCodeAar,
    AWSMediaconvertLanguageCodeAfr,
    AWSMediaconvertLanguageCodeAka,
    AWSMediaconvertLanguageCodeSqi,
    AWSMediaconvertLanguageCodeAmh,
    AWSMediaconvertLanguageCodeArg,
    AWSMediaconvertLanguageCodeHye,
    AWSMediaconvertLanguageCodeAsm,
    AWSMediaconvertLanguageCodeAva,
    AWSMediaconvertLanguageCodeAve,
    AWSMediaconvertLanguageCodeAym,
    AWSMediaconvertLanguageCodeAze,
    AWSMediaconvertLanguageCodeBam,
    AWSMediaconvertLanguageCodeBak,
    AWSMediaconvertLanguageCodeEus,
    AWSMediaconvertLanguageCodeBel,
    AWSMediaconvertLanguageCodeBen,
    AWSMediaconvertLanguageCodeBih,
    AWSMediaconvertLanguageCodeBis,
    AWSMediaconvertLanguageCodeBos,
    AWSMediaconvertLanguageCodeBre,
    AWSMediaconvertLanguageCodeBul,
    AWSMediaconvertLanguageCodeMya,
    AWSMediaconvertLanguageCodeCat,
    AWSMediaconvertLanguageCodeKhm,
    AWSMediaconvertLanguageCodeCha,
    AWSMediaconvertLanguageCodeChe,
    AWSMediaconvertLanguageCodeNya,
    AWSMediaconvertLanguageCodeChu,
    AWSMediaconvertLanguageCodeChv,
    AWSMediaconvertLanguageCodeCor,
    AWSMediaconvertLanguageCodeCos,
    AWSMediaconvertLanguageCodeCre,
    AWSMediaconvertLanguageCodeHrv,
    AWSMediaconvertLanguageCodeCes,
    AWSMediaconvertLanguageCodeDan,
    AWSMediaconvertLanguageCodeDiv,
    AWSMediaconvertLanguageCodeNld,
    AWSMediaconvertLanguageCodeDzo,
    AWSMediaconvertLanguageCodeEnm,
    AWSMediaconvertLanguageCodeEpo,
    AWSMediaconvertLanguageCodeEst,
    AWSMediaconvertLanguageCodeEwe,
    AWSMediaconvertLanguageCodeFao,
    AWSMediaconvertLanguageCodeFij,
    AWSMediaconvertLanguageCodeFin,
    AWSMediaconvertLanguageCodeFrm,
    AWSMediaconvertLanguageCodeFul,
    AWSMediaconvertLanguageCodeGla,
    AWSMediaconvertLanguageCodeGlg,
    AWSMediaconvertLanguageCodeLug,
    AWSMediaconvertLanguageCodeKat,
    AWSMediaconvertLanguageCodeEll,
    AWSMediaconvertLanguageCodeGrn,
    AWSMediaconvertLanguageCodeGuj,
    AWSMediaconvertLanguageCodeHat,
    AWSMediaconvertLanguageCodeHau,
    AWSMediaconvertLanguageCodeHeb,
    AWSMediaconvertLanguageCodeHer,
    AWSMediaconvertLanguageCodeHmo,
    AWSMediaconvertLanguageCodeHun,
    AWSMediaconvertLanguageCodeIsl,
    AWSMediaconvertLanguageCodeIdo,
    AWSMediaconvertLanguageCodeIbo,
    AWSMediaconvertLanguageCodeInd,
    AWSMediaconvertLanguageCodeIna,
    AWSMediaconvertLanguageCodeIle,
    AWSMediaconvertLanguageCodeIku,
    AWSMediaconvertLanguageCodeIpk,
    AWSMediaconvertLanguageCodeGle,
    AWSMediaconvertLanguageCodeJav,
    AWSMediaconvertLanguageCodeKal,
    AWSMediaconvertLanguageCodeKan,
    AWSMediaconvertLanguageCodeKau,
    AWSMediaconvertLanguageCodeKas,
    AWSMediaconvertLanguageCodeKaz,
    AWSMediaconvertLanguageCodeKik,
    AWSMediaconvertLanguageCodeKin,
    AWSMediaconvertLanguageCodeKir,
    AWSMediaconvertLanguageCodeKom,
    AWSMediaconvertLanguageCodeKon,
    AWSMediaconvertLanguageCodeKua,
    AWSMediaconvertLanguageCodeKur,
    AWSMediaconvertLanguageCodeLao,
    AWSMediaconvertLanguageCodeLat,
    AWSMediaconvertLanguageCodeLav,
    AWSMediaconvertLanguageCodeLim,
    AWSMediaconvertLanguageCodeLin,
    AWSMediaconvertLanguageCodeLit,
    AWSMediaconvertLanguageCodeLub,
    AWSMediaconvertLanguageCodeLtz,
    AWSMediaconvertLanguageCodeMkd,
    AWSMediaconvertLanguageCodeMlg,
    AWSMediaconvertLanguageCodeMsa,
    AWSMediaconvertLanguageCodeMal,
    AWSMediaconvertLanguageCodeMlt,
    AWSMediaconvertLanguageCodeGlv,
    AWSMediaconvertLanguageCodeMri,
    AWSMediaconvertLanguageCodeMar,
    AWSMediaconvertLanguageCodeMah,
    AWSMediaconvertLanguageCodeMon,
    AWSMediaconvertLanguageCodeNau,
    AWSMediaconvertLanguageCodeNav,
    AWSMediaconvertLanguageCodeNde,
    AWSMediaconvertLanguageCodeNbl,
    AWSMediaconvertLanguageCodeNdo,
    AWSMediaconvertLanguageCodeNep,
    AWSMediaconvertLanguageCodeSme,
    AWSMediaconvertLanguageCodeNor,
    AWSMediaconvertLanguageCodeNob,
    AWSMediaconvertLanguageCodeNno,
    AWSMediaconvertLanguageCodeOci,
    AWSMediaconvertLanguageCodeOji,
    AWSMediaconvertLanguageCodeOri,
    AWSMediaconvertLanguageCodeOrm,
    AWSMediaconvertLanguageCodeOss,
    AWSMediaconvertLanguageCodePli,
    AWSMediaconvertLanguageCodeFas,
    AWSMediaconvertLanguageCodePol,
    AWSMediaconvertLanguageCodePus,
    AWSMediaconvertLanguageCodeQue,
    AWSMediaconvertLanguageCodeQaa,
    AWSMediaconvertLanguageCodeRon,
    AWSMediaconvertLanguageCodeRoh,
    AWSMediaconvertLanguageCodeRun,
    AWSMediaconvertLanguageCodeSmo,
    AWSMediaconvertLanguageCodeSag,
    AWSMediaconvertLanguageCodeSan,
    AWSMediaconvertLanguageCodeSrd,
    AWSMediaconvertLanguageCodeSrb,
    AWSMediaconvertLanguageCodeSna,
    AWSMediaconvertLanguageCodeIii,
    AWSMediaconvertLanguageCodeSnd,
    AWSMediaconvertLanguageCodeSin,
    AWSMediaconvertLanguageCodeSlk,
    AWSMediaconvertLanguageCodeSlv,
    AWSMediaconvertLanguageCodeSom,
    AWSMediaconvertLanguageCodeSot,
    AWSMediaconvertLanguageCodeSun,
    AWSMediaconvertLanguageCodeSwa,
    AWSMediaconvertLanguageCodeSsw,
    AWSMediaconvertLanguageCodeSwe,
    AWSMediaconvertLanguageCodeTgl,
    AWSMediaconvertLanguageCodeTah,
    AWSMediaconvertLanguageCodeTgk,
    AWSMediaconvertLanguageCodeTam,
    AWSMediaconvertLanguageCodeTat,
    AWSMediaconvertLanguageCodeTel,
    AWSMediaconvertLanguageCodeTha,
    AWSMediaconvertLanguageCodeBod,
    AWSMediaconvertLanguageCodeTir,
    AWSMediaconvertLanguageCodeTon,
    AWSMediaconvertLanguageCodeTso,
    AWSMediaconvertLanguageCodeTsn,
    AWSMediaconvertLanguageCodeTur,
    AWSMediaconvertLanguageCodeTuk,
    AWSMediaconvertLanguageCodeTwi,
    AWSMediaconvertLanguageCodeUig,
    AWSMediaconvertLanguageCodeUkr,
    AWSMediaconvertLanguageCodeUzb,
    AWSMediaconvertLanguageCodeVen,
    AWSMediaconvertLanguageCodeVol,
    AWSMediaconvertLanguageCodeWln,
    AWSMediaconvertLanguageCodeCym,
    AWSMediaconvertLanguageCodeFry,
    AWSMediaconvertLanguageCodeWol,
    AWSMediaconvertLanguageCodeXho,
    AWSMediaconvertLanguageCodeYid,
    AWSMediaconvertLanguageCodeYor,
    AWSMediaconvertLanguageCodeZha,
    AWSMediaconvertLanguageCodeZul,
    AWSMediaconvertLanguageCodeOrj,
    AWSMediaconvertLanguageCodeQpc,
    AWSMediaconvertLanguageCodeTng,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM2tsAudioBufferModel) {
    AWSMediaconvertM2tsAudioBufferModelUnknown,
    AWSMediaconvertM2tsAudioBufferModelDvb,
    AWSMediaconvertM2tsAudioBufferModelAtsc,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM2tsBufferModel) {
    AWSMediaconvertM2tsBufferModelUnknown,
    AWSMediaconvertM2tsBufferModelMultiplex,
    AWSMediaconvertM2tsBufferModelNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM2tsEbpAudioInterval) {
    AWSMediaconvertM2tsEbpAudioIntervalUnknown,
    AWSMediaconvertM2tsEbpAudioIntervalVideoAndFixedIntervals,
    AWSMediaconvertM2tsEbpAudioIntervalVideoInterval,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM2tsEbpPlacement) {
    AWSMediaconvertM2tsEbpPlacementUnknown,
    AWSMediaconvertM2tsEbpPlacementVideoAndAudioPids,
    AWSMediaconvertM2tsEbpPlacementVideoPid,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM2tsEsRateInPes) {
    AWSMediaconvertM2tsEsRateInPesUnknown,
    AWSMediaconvertM2tsEsRateInPesInclude,
    AWSMediaconvertM2tsEsRateInPesExclude,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM2tsForceTsVideoEbpOrder) {
    AWSMediaconvertM2tsForceTsVideoEbpOrderUnknown,
    AWSMediaconvertM2tsForceTsVideoEbpOrderForce,
    AWSMediaconvertM2tsForceTsVideoEbpOrderDefault,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM2tsNielsenId3) {
    AWSMediaconvertM2tsNielsenId3Unknown,
    AWSMediaconvertM2tsNielsenId3Insert,
    AWSMediaconvertM2tsNielsenId3None,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM2tsPcrControl) {
    AWSMediaconvertM2tsPcrControlUnknown,
    AWSMediaconvertM2tsPcrControlPcrEveryPesPacket,
    AWSMediaconvertM2tsPcrControlConfiguredPcrPeriod,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM2tsRateMode) {
    AWSMediaconvertM2tsRateModeUnknown,
    AWSMediaconvertM2tsRateModeVbr,
    AWSMediaconvertM2tsRateModeCbr,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM2tsScte35Source) {
    AWSMediaconvertM2tsScte35SourceUnknown,
    AWSMediaconvertM2tsScte35SourcePassthrough,
    AWSMediaconvertM2tsScte35SourceNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM2tsSegmentationMarkers) {
    AWSMediaconvertM2tsSegmentationMarkersUnknown,
    AWSMediaconvertM2tsSegmentationMarkersNone,
    AWSMediaconvertM2tsSegmentationMarkersRaiSegstart,
    AWSMediaconvertM2tsSegmentationMarkersRaiAdapt,
    AWSMediaconvertM2tsSegmentationMarkersPsiSegstart,
    AWSMediaconvertM2tsSegmentationMarkersEbp,
    AWSMediaconvertM2tsSegmentationMarkersEbpLegacy,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM2tsSegmentationStyle) {
    AWSMediaconvertM2tsSegmentationStyleUnknown,
    AWSMediaconvertM2tsSegmentationStyleMaintainCadence,
    AWSMediaconvertM2tsSegmentationStyleResetCadence,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM3u8NielsenId3) {
    AWSMediaconvertM3u8NielsenId3Unknown,
    AWSMediaconvertM3u8NielsenId3Insert,
    AWSMediaconvertM3u8NielsenId3None,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM3u8PcrControl) {
    AWSMediaconvertM3u8PcrControlUnknown,
    AWSMediaconvertM3u8PcrControlPcrEveryPesPacket,
    AWSMediaconvertM3u8PcrControlConfiguredPcrPeriod,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertM3u8Scte35Source) {
    AWSMediaconvertM3u8Scte35SourceUnknown,
    AWSMediaconvertM3u8Scte35SourcePassthrough,
    AWSMediaconvertM3u8Scte35SourceNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMotionImageInsertionMode) {
    AWSMediaconvertMotionImageInsertionModeUnknown,
    AWSMediaconvertMotionImageInsertionModeMov,
    AWSMediaconvertMotionImageInsertionModePng,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMotionImagePlayback) {
    AWSMediaconvertMotionImagePlaybackUnknown,
    AWSMediaconvertMotionImagePlaybackOnce,
    AWSMediaconvertMotionImagePlaybackRepeat,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMovClapAtom) {
    AWSMediaconvertMovClapAtomUnknown,
    AWSMediaconvertMovClapAtomInclude,
    AWSMediaconvertMovClapAtomExclude,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMovCslgAtom) {
    AWSMediaconvertMovCslgAtomUnknown,
    AWSMediaconvertMovCslgAtomInclude,
    AWSMediaconvertMovCslgAtomExclude,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMovMpeg2FourCCControl) {
    AWSMediaconvertMovMpeg2FourCCControlUnknown,
    AWSMediaconvertMovMpeg2FourCCControlXdcam,
    AWSMediaconvertMovMpeg2FourCCControlMpeg,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMovPaddingControl) {
    AWSMediaconvertMovPaddingControlUnknown,
    AWSMediaconvertMovPaddingControlOmneon,
    AWSMediaconvertMovPaddingControlNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMovReference) {
    AWSMediaconvertMovReferenceUnknown,
    AWSMediaconvertMovReferenceSelfContained,
    AWSMediaconvertMovReferenceExternal,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMp3RateControlMode) {
    AWSMediaconvertMp3RateControlModeUnknown,
    AWSMediaconvertMp3RateControlModeCbr,
    AWSMediaconvertMp3RateControlModeVbr,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMp4CslgAtom) {
    AWSMediaconvertMp4CslgAtomUnknown,
    AWSMediaconvertMp4CslgAtomInclude,
    AWSMediaconvertMp4CslgAtomExclude,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMp4FreeSpaceBox) {
    AWSMediaconvertMp4FreeSpaceBoxUnknown,
    AWSMediaconvertMp4FreeSpaceBoxInclude,
    AWSMediaconvertMp4FreeSpaceBoxExclude,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMp4MoovPlacement) {
    AWSMediaconvertMp4MoovPlacementUnknown,
    AWSMediaconvertMp4MoovPlacementProgressiveDownload,
    AWSMediaconvertMp4MoovPlacementNormal,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpdCaptionContainerType) {
    AWSMediaconvertMpdCaptionContainerTypeUnknown,
    AWSMediaconvertMpdCaptionContainerTypeRAW,
    AWSMediaconvertMpdCaptionContainerTypeFragmentedMp4,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpdScte35Esam) {
    AWSMediaconvertMpdScte35EsamUnknown,
    AWSMediaconvertMpdScte35EsamInsert,
    AWSMediaconvertMpdScte35EsamNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpdScte35Source) {
    AWSMediaconvertMpdScte35SourceUnknown,
    AWSMediaconvertMpdScte35SourcePassthrough,
    AWSMediaconvertMpdScte35SourceNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2AdaptiveQuantization) {
    AWSMediaconvertMpeg2AdaptiveQuantizationUnknown,
    AWSMediaconvertMpeg2AdaptiveQuantizationOff,
    AWSMediaconvertMpeg2AdaptiveQuantizationLow,
    AWSMediaconvertMpeg2AdaptiveQuantizationMedium,
    AWSMediaconvertMpeg2AdaptiveQuantizationHigh,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2CodecLevel) {
    AWSMediaconvertMpeg2CodecLevelUnknown,
    AWSMediaconvertMpeg2CodecLevelAuto,
    AWSMediaconvertMpeg2CodecLevelLow,
    AWSMediaconvertMpeg2CodecLevelMain,
    AWSMediaconvertMpeg2CodecLevelHigh1440,
    AWSMediaconvertMpeg2CodecLevelHigh,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2CodecProfile) {
    AWSMediaconvertMpeg2CodecProfileUnknown,
    AWSMediaconvertMpeg2CodecProfileMain,
    AWSMediaconvertMpeg2CodecProfileProfile422,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2DynamicSubGop) {
    AWSMediaconvertMpeg2DynamicSubGopUnknown,
    AWSMediaconvertMpeg2DynamicSubGopAdaptive,
    AWSMediaconvertMpeg2DynamicSubGopStatic,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2FramerateControl) {
    AWSMediaconvertMpeg2FramerateControlUnknown,
    AWSMediaconvertMpeg2FramerateControlInitializeFromSource,
    AWSMediaconvertMpeg2FramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2FramerateConversionAlgorithm) {
    AWSMediaconvertMpeg2FramerateConversionAlgorithmUnknown,
    AWSMediaconvertMpeg2FramerateConversionAlgorithmDuplicateDrop,
    AWSMediaconvertMpeg2FramerateConversionAlgorithmInterpolate,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2GopSizeUnits) {
    AWSMediaconvertMpeg2GopSizeUnitsUnknown,
    AWSMediaconvertMpeg2GopSizeUnitsFrames,
    AWSMediaconvertMpeg2GopSizeUnitsSeconds,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2InterlaceMode) {
    AWSMediaconvertMpeg2InterlaceModeUnknown,
    AWSMediaconvertMpeg2InterlaceModeProgressive,
    AWSMediaconvertMpeg2InterlaceModeTopField,
    AWSMediaconvertMpeg2InterlaceModeBottomField,
    AWSMediaconvertMpeg2InterlaceModeFollowTopField,
    AWSMediaconvertMpeg2InterlaceModeFollowBottomField,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2IntraDcPrecision) {
    AWSMediaconvertMpeg2IntraDcPrecisionUnknown,
    AWSMediaconvertMpeg2IntraDcPrecisionAuto,
    AWSMediaconvertMpeg2IntraDcPrecisionIntraDcPrecision8,
    AWSMediaconvertMpeg2IntraDcPrecisionIntraDcPrecision9,
    AWSMediaconvertMpeg2IntraDcPrecisionIntraDcPrecision10,
    AWSMediaconvertMpeg2IntraDcPrecisionIntraDcPrecision11,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2ParControl) {
    AWSMediaconvertMpeg2ParControlUnknown,
    AWSMediaconvertMpeg2ParControlInitializeFromSource,
    AWSMediaconvertMpeg2ParControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2QualityTuningLevel) {
    AWSMediaconvertMpeg2QualityTuningLevelUnknown,
    AWSMediaconvertMpeg2QualityTuningLevelSinglePass,
    AWSMediaconvertMpeg2QualityTuningLevelMultiPass,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2RateControlMode) {
    AWSMediaconvertMpeg2RateControlModeUnknown,
    AWSMediaconvertMpeg2RateControlModeVbr,
    AWSMediaconvertMpeg2RateControlModeCbr,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2SceneChangeDetect) {
    AWSMediaconvertMpeg2SceneChangeDetectUnknown,
    AWSMediaconvertMpeg2SceneChangeDetectDisabled,
    AWSMediaconvertMpeg2SceneChangeDetectEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2SlowPal) {
    AWSMediaconvertMpeg2SlowPalUnknown,
    AWSMediaconvertMpeg2SlowPalDisabled,
    AWSMediaconvertMpeg2SlowPalEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2SpatialAdaptiveQuantization) {
    AWSMediaconvertMpeg2SpatialAdaptiveQuantizationUnknown,
    AWSMediaconvertMpeg2SpatialAdaptiveQuantizationDisabled,
    AWSMediaconvertMpeg2SpatialAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2Syntax) {
    AWSMediaconvertMpeg2SyntaxUnknown,
    AWSMediaconvertMpeg2SyntaxDefault,
    AWSMediaconvertMpeg2SyntaxD10,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2Telecine) {
    AWSMediaconvertMpeg2TelecineUnknown,
    AWSMediaconvertMpeg2TelecineNone,
    AWSMediaconvertMpeg2TelecineSoft,
    AWSMediaconvertMpeg2TelecineHard,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMpeg2TemporalAdaptiveQuantization) {
    AWSMediaconvertMpeg2TemporalAdaptiveQuantizationUnknown,
    AWSMediaconvertMpeg2TemporalAdaptiveQuantizationDisabled,
    AWSMediaconvertMpeg2TemporalAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMsSmoothAudioDeduplication) {
    AWSMediaconvertMsSmoothAudioDeduplicationUnknown,
    AWSMediaconvertMsSmoothAudioDeduplicationCombineDuplicateStreams,
    AWSMediaconvertMsSmoothAudioDeduplicationNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMsSmoothManifestEncoding) {
    AWSMediaconvertMsSmoothManifestEncodingUnknown,
    AWSMediaconvertMsSmoothManifestEncodingUtf8,
    AWSMediaconvertMsSmoothManifestEncodingUtf16,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertMxfAfdSignaling) {
    AWSMediaconvertMxfAfdSignalingUnknown,
    AWSMediaconvertMxfAfdSignalingNoCopy,
    AWSMediaconvertMxfAfdSignalingCopyFromVideo,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertNoiseFilterPostTemporalSharpening) {
    AWSMediaconvertNoiseFilterPostTemporalSharpeningUnknown,
    AWSMediaconvertNoiseFilterPostTemporalSharpeningDisabled,
    AWSMediaconvertNoiseFilterPostTemporalSharpeningEnabled,
    AWSMediaconvertNoiseFilterPostTemporalSharpeningAuto,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertNoiseReducerFilter) {
    AWSMediaconvertNoiseReducerFilterUnknown,
    AWSMediaconvertNoiseReducerFilterBilateral,
    AWSMediaconvertNoiseReducerFilterMean,
    AWSMediaconvertNoiseReducerFilterGaussian,
    AWSMediaconvertNoiseReducerFilterLanczos,
    AWSMediaconvertNoiseReducerFilterSharpen,
    AWSMediaconvertNoiseReducerFilterConserve,
    AWSMediaconvertNoiseReducerFilterSpatial,
    AWSMediaconvertNoiseReducerFilterTemporal,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertOrder) {
    AWSMediaconvertOrderUnknown,
    AWSMediaconvertOrderAscending,
    AWSMediaconvertOrderDescending,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertOutputGroupType) {
    AWSMediaconvertOutputGroupTypeUnknown,
    AWSMediaconvertOutputGroupTypeHlsGroupSettings,
    AWSMediaconvertOutputGroupTypeDashIsoGroupSettings,
    AWSMediaconvertOutputGroupTypeFileGroupSettings,
    AWSMediaconvertOutputGroupTypeMsSmoothGroupSettings,
    AWSMediaconvertOutputGroupTypeCmafGroupSettings,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertOutputSdt) {
    AWSMediaconvertOutputSdtUnknown,
    AWSMediaconvertOutputSdtSdtFollow,
    AWSMediaconvertOutputSdtSdtFollowIfPresent,
    AWSMediaconvertOutputSdtSdtManual,
    AWSMediaconvertOutputSdtSdtNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertPresetListBy) {
    AWSMediaconvertPresetListByUnknown,
    AWSMediaconvertPresetListByName,
    AWSMediaconvertPresetListByCreationDate,
    AWSMediaconvertPresetListBySystem,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertPricingPlan) {
    AWSMediaconvertPricingPlanUnknown,
    AWSMediaconvertPricingPlanOnDemand,
    AWSMediaconvertPricingPlanReserved,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertProresCodecProfile) {
    AWSMediaconvertProresCodecProfileUnknown,
    AWSMediaconvertProresCodecProfileAppleProres422,
    AWSMediaconvertProresCodecProfileAppleProres422Hq,
    AWSMediaconvertProresCodecProfileAppleProres422Lt,
    AWSMediaconvertProresCodecProfileAppleProres422Proxy,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertProresFramerateControl) {
    AWSMediaconvertProresFramerateControlUnknown,
    AWSMediaconvertProresFramerateControlInitializeFromSource,
    AWSMediaconvertProresFramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertProresFramerateConversionAlgorithm) {
    AWSMediaconvertProresFramerateConversionAlgorithmUnknown,
    AWSMediaconvertProresFramerateConversionAlgorithmDuplicateDrop,
    AWSMediaconvertProresFramerateConversionAlgorithmInterpolate,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertProresInterlaceMode) {
    AWSMediaconvertProresInterlaceModeUnknown,
    AWSMediaconvertProresInterlaceModeProgressive,
    AWSMediaconvertProresInterlaceModeTopField,
    AWSMediaconvertProresInterlaceModeBottomField,
    AWSMediaconvertProresInterlaceModeFollowTopField,
    AWSMediaconvertProresInterlaceModeFollowBottomField,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertProresParControl) {
    AWSMediaconvertProresParControlUnknown,
    AWSMediaconvertProresParControlInitializeFromSource,
    AWSMediaconvertProresParControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertProresSlowPal) {
    AWSMediaconvertProresSlowPalUnknown,
    AWSMediaconvertProresSlowPalDisabled,
    AWSMediaconvertProresSlowPalEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertProresTelecine) {
    AWSMediaconvertProresTelecineUnknown,
    AWSMediaconvertProresTelecineNone,
    AWSMediaconvertProresTelecineHard,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertQueueListBy) {
    AWSMediaconvertQueueListByUnknown,
    AWSMediaconvertQueueListByName,
    AWSMediaconvertQueueListByCreationDate,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertQueueStatus) {
    AWSMediaconvertQueueStatusUnknown,
    AWSMediaconvertQueueStatusActive,
    AWSMediaconvertQueueStatusPaused,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertRenewalType) {
    AWSMediaconvertRenewalTypeUnknown,
    AWSMediaconvertRenewalTypeAutoRenew,
    AWSMediaconvertRenewalTypeExpire,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertReservationPlanStatus) {
    AWSMediaconvertReservationPlanStatusUnknown,
    AWSMediaconvertReservationPlanStatusActive,
    AWSMediaconvertReservationPlanStatusExpired,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertRespondToAfd) {
    AWSMediaconvertRespondToAfdUnknown,
    AWSMediaconvertRespondToAfdNone,
    AWSMediaconvertRespondToAfdRespond,
    AWSMediaconvertRespondToAfdPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertS3ObjectCannedAcl) {
    AWSMediaconvertS3ObjectCannedAclUnknown,
    AWSMediaconvertS3ObjectCannedAclPublicRead,
    AWSMediaconvertS3ObjectCannedAclAuthenticatedRead,
    AWSMediaconvertS3ObjectCannedAclBucketOwnerRead,
    AWSMediaconvertS3ObjectCannedAclBucketOwnerFullControl,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertS3ServerSideEncryptionType) {
    AWSMediaconvertS3ServerSideEncryptionTypeUnknown,
    AWSMediaconvertS3ServerSideEncryptionTypeServerSideEncryptionS3,
    AWSMediaconvertS3ServerSideEncryptionTypeServerSideEncryptionKms,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertScalingBehavior) {
    AWSMediaconvertScalingBehaviorUnknown,
    AWSMediaconvertScalingBehaviorDefault,
    AWSMediaconvertScalingBehaviorStretchToOutput,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertSccDestinationFramerate) {
    AWSMediaconvertSccDestinationFramerateUnknown,
    AWSMediaconvertSccDestinationFramerateFramerate2397,
    AWSMediaconvertSccDestinationFramerateFramerate24,
    AWSMediaconvertSccDestinationFramerateFramerate25,
    AWSMediaconvertSccDestinationFramerateFramerate2997Dropframe,
    AWSMediaconvertSccDestinationFramerateFramerate2997NonDropframe,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertSimulateReservedQueue) {
    AWSMediaconvertSimulateReservedQueueUnknown,
    AWSMediaconvertSimulateReservedQueueDisabled,
    AWSMediaconvertSimulateReservedQueueEnabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertStatusUpdateInterval) {
    AWSMediaconvertStatusUpdateIntervalUnknown,
    AWSMediaconvertStatusUpdateIntervalSeconds10,
    AWSMediaconvertStatusUpdateIntervalSeconds12,
    AWSMediaconvertStatusUpdateIntervalSeconds15,
    AWSMediaconvertStatusUpdateIntervalSeconds20,
    AWSMediaconvertStatusUpdateIntervalSeconds30,
    AWSMediaconvertStatusUpdateIntervalSeconds60,
    AWSMediaconvertStatusUpdateIntervalSeconds120,
    AWSMediaconvertStatusUpdateIntervalSeconds180,
    AWSMediaconvertStatusUpdateIntervalSeconds240,
    AWSMediaconvertStatusUpdateIntervalSeconds300,
    AWSMediaconvertStatusUpdateIntervalSeconds360,
    AWSMediaconvertStatusUpdateIntervalSeconds420,
    AWSMediaconvertStatusUpdateIntervalSeconds480,
    AWSMediaconvertStatusUpdateIntervalSeconds540,
    AWSMediaconvertStatusUpdateIntervalSeconds600,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertTeletextPageType) {
    AWSMediaconvertTeletextPageTypeUnknown,
    AWSMediaconvertTeletextPageTypePageTypeInitial,
    AWSMediaconvertTeletextPageTypePageTypeSubtitle,
    AWSMediaconvertTeletextPageTypePageTypeAddlInfo,
    AWSMediaconvertTeletextPageTypePageTypeProgramSchedule,
    AWSMediaconvertTeletextPageTypePageTypeHearingImpairedSubtitle,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertTimecodeBurninPosition) {
    AWSMediaconvertTimecodeBurninPositionUnknown,
    AWSMediaconvertTimecodeBurninPositionTopCenter,
    AWSMediaconvertTimecodeBurninPositionTopLeft,
    AWSMediaconvertTimecodeBurninPositionTopRight,
    AWSMediaconvertTimecodeBurninPositionMiddleLeft,
    AWSMediaconvertTimecodeBurninPositionMiddleCenter,
    AWSMediaconvertTimecodeBurninPositionMiddleRight,
    AWSMediaconvertTimecodeBurninPositionBottomLeft,
    AWSMediaconvertTimecodeBurninPositionBottomCenter,
    AWSMediaconvertTimecodeBurninPositionBottomRight,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertTimecodeSource) {
    AWSMediaconvertTimecodeSourceUnknown,
    AWSMediaconvertTimecodeSourceEmbedded,
    AWSMediaconvertTimecodeSourceZerobased,
    AWSMediaconvertTimecodeSourceSpecifiedstart,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertTimedMetadata) {
    AWSMediaconvertTimedMetadataUnknown,
    AWSMediaconvertTimedMetadataPassthrough,
    AWSMediaconvertTimedMetadataNone,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertTtmlStylePassthrough) {
    AWSMediaconvertTtmlStylePassthroughUnknown,
    AWSMediaconvertTtmlStylePassthroughEnabled,
    AWSMediaconvertTtmlStylePassthroughDisabled,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertTypes) {
    AWSMediaconvertTypesUnknown,
    AWSMediaconvertTypesSystem,
    AWSMediaconvertTypesCustom,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertVideoCodec) {
    AWSMediaconvertVideoCodecUnknown,
    AWSMediaconvertVideoCodecFrameCapture,
    AWSMediaconvertVideoCodecAv1,
    AWSMediaconvertVideoCodecH264,
    AWSMediaconvertVideoCodecH265,
    AWSMediaconvertVideoCodecMpeg2,
    AWSMediaconvertVideoCodecProres,
    AWSMediaconvertVideoCodecVp8,
    AWSMediaconvertVideoCodecVp9,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertVideoTimecodeInsertion) {
    AWSMediaconvertVideoTimecodeInsertionUnknown,
    AWSMediaconvertVideoTimecodeInsertionDisabled,
    AWSMediaconvertVideoTimecodeInsertionPicTimingSei,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertVp8FramerateControl) {
    AWSMediaconvertVp8FramerateControlUnknown,
    AWSMediaconvertVp8FramerateControlInitializeFromSource,
    AWSMediaconvertVp8FramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertVp8FramerateConversionAlgorithm) {
    AWSMediaconvertVp8FramerateConversionAlgorithmUnknown,
    AWSMediaconvertVp8FramerateConversionAlgorithmDuplicateDrop,
    AWSMediaconvertVp8FramerateConversionAlgorithmInterpolate,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertVp8ParControl) {
    AWSMediaconvertVp8ParControlUnknown,
    AWSMediaconvertVp8ParControlInitializeFromSource,
    AWSMediaconvertVp8ParControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertVp8QualityTuningLevel) {
    AWSMediaconvertVp8QualityTuningLevelUnknown,
    AWSMediaconvertVp8QualityTuningLevelMultiPass,
    AWSMediaconvertVp8QualityTuningLevelMultiPassHq,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertVp8RateControlMode) {
    AWSMediaconvertVp8RateControlModeUnknown,
    AWSMediaconvertVp8RateControlModeVbr,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertVp9FramerateControl) {
    AWSMediaconvertVp9FramerateControlUnknown,
    AWSMediaconvertVp9FramerateControlInitializeFromSource,
    AWSMediaconvertVp9FramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertVp9FramerateConversionAlgorithm) {
    AWSMediaconvertVp9FramerateConversionAlgorithmUnknown,
    AWSMediaconvertVp9FramerateConversionAlgorithmDuplicateDrop,
    AWSMediaconvertVp9FramerateConversionAlgorithmInterpolate,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertVp9ParControl) {
    AWSMediaconvertVp9ParControlUnknown,
    AWSMediaconvertVp9ParControlInitializeFromSource,
    AWSMediaconvertVp9ParControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertVp9QualityTuningLevel) {
    AWSMediaconvertVp9QualityTuningLevelUnknown,
    AWSMediaconvertVp9QualityTuningLevelMultiPass,
    AWSMediaconvertVp9QualityTuningLevelMultiPassHq,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertVp9RateControlMode) {
    AWSMediaconvertVp9RateControlModeUnknown,
    AWSMediaconvertVp9RateControlModeVbr,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertWatermarkingStrength) {
    AWSMediaconvertWatermarkingStrengthUnknown,
    AWSMediaconvertWatermarkingStrengthLightest,
    AWSMediaconvertWatermarkingStrengthLighter,
    AWSMediaconvertWatermarkingStrengthDefault,
    AWSMediaconvertWatermarkingStrengthStronger,
    AWSMediaconvertWatermarkingStrengthStrongest,
};

typedef NS_ENUM(NSInteger, AWSMediaconvertWavFormat) {
    AWSMediaconvertWavFormatUnknown,
    AWSMediaconvertWavFormatRiff,
    AWSMediaconvertWavFormatRf64,
};

@class AWSMediaconvertAacSettings;
@class AWSMediaconvertAc3Settings;
@class AWSMediaconvertAccelerationSettings;
@class AWSMediaconvertAiffSettings;
@class AWSMediaconvertAncillarySourceSettings;
@class AWSMediaconvertAssociateCertificateRequest;
@class AWSMediaconvertAssociateCertificateResponse;
@class AWSMediaconvertAudioCodecSettings;
@class AWSMediaconvertAudioDescription;
@class AWSMediaconvertAudioNormalizationSettings;
@class AWSMediaconvertAudioSelector;
@class AWSMediaconvertAudioSelectorGroup;
@class AWSMediaconvertAv1QvbrSettings;
@class AWSMediaconvertAv1Settings;
@class AWSMediaconvertAvailBlanking;
@class AWSMediaconvertBurninDestinationSettings;
@class AWSMediaconvertCancelJobRequest;
@class AWSMediaconvertCancelJobResponse;
@class AWSMediaconvertCaptionDescription;
@class AWSMediaconvertCaptionDescriptionPreset;
@class AWSMediaconvertCaptionDestinationSettings;
@class AWSMediaconvertCaptionSelector;
@class AWSMediaconvertCaptionSourceFramerate;
@class AWSMediaconvertCaptionSourceSettings;
@class AWSMediaconvertChannelMapping;
@class AWSMediaconvertCmafAdditionalManifest;
@class AWSMediaconvertCmafEncryptionSettings;
@class AWSMediaconvertCmafGroupSettings;
@class AWSMediaconvertCmfcSettings;
@class AWSMediaconvertColorCorrector;
@class AWSMediaconvertContainerSettings;
@class AWSMediaconvertCreateJobRequest;
@class AWSMediaconvertCreateJobResponse;
@class AWSMediaconvertCreateJobTemplateRequest;
@class AWSMediaconvertCreateJobTemplateResponse;
@class AWSMediaconvertCreatePresetRequest;
@class AWSMediaconvertCreatePresetResponse;
@class AWSMediaconvertCreateQueueRequest;
@class AWSMediaconvertCreateQueueResponse;
@class AWSMediaconvertDashAdditionalManifest;
@class AWSMediaconvertDashIsoEncryptionSettings;
@class AWSMediaconvertDashIsoGroupSettings;
@class AWSMediaconvertDeinterlacer;
@class AWSMediaconvertDeleteJobTemplateRequest;
@class AWSMediaconvertDeleteJobTemplateResponse;
@class AWSMediaconvertDeletePresetRequest;
@class AWSMediaconvertDeletePresetResponse;
@class AWSMediaconvertDeleteQueueRequest;
@class AWSMediaconvertDeleteQueueResponse;
@class AWSMediaconvertDescribeEndpointsRequest;
@class AWSMediaconvertDescribeEndpointsResponse;
@class AWSMediaconvertDestinationSettings;
@class AWSMediaconvertDisassociateCertificateRequest;
@class AWSMediaconvertDisassociateCertificateResponse;
@class AWSMediaconvertDolbyVision;
@class AWSMediaconvertDolbyVisionLevel6Metadata;
@class AWSMediaconvertDvbNitSettings;
@class AWSMediaconvertDvbSdtSettings;
@class AWSMediaconvertDvbSubDestinationSettings;
@class AWSMediaconvertDvbSubSourceSettings;
@class AWSMediaconvertDvbTdtSettings;
@class AWSMediaconvertEac3AtmosSettings;
@class AWSMediaconvertEac3Settings;
@class AWSMediaconvertEmbeddedDestinationSettings;
@class AWSMediaconvertEmbeddedSourceSettings;
@class AWSMediaconvertEndpoint;
@class AWSMediaconvertEsamManifestConfirmConditionNotification;
@class AWSMediaconvertEsamSettings;
@class AWSMediaconvertEsamSignalProcessingNotification;
@class AWSMediaconvertExceptionBody;
@class AWSMediaconvertF4vSettings;
@class AWSMediaconvertFileGroupSettings;
@class AWSMediaconvertFileSourceSettings;
@class AWSMediaconvertFrameCaptureSettings;
@class AWSMediaconvertGetJobRequest;
@class AWSMediaconvertGetJobResponse;
@class AWSMediaconvertGetJobTemplateRequest;
@class AWSMediaconvertGetJobTemplateResponse;
@class AWSMediaconvertGetPresetRequest;
@class AWSMediaconvertGetPresetResponse;
@class AWSMediaconvertGetQueueRequest;
@class AWSMediaconvertGetQueueResponse;
@class AWSMediaconvertH264QvbrSettings;
@class AWSMediaconvertH264Settings;
@class AWSMediaconvertH265QvbrSettings;
@class AWSMediaconvertH265Settings;
@class AWSMediaconvertHdr10Metadata;
@class AWSMediaconvertHlsAdditionalManifest;
@class AWSMediaconvertHlsCaptionLanguageMapping;
@class AWSMediaconvertHlsEncryptionSettings;
@class AWSMediaconvertHlsGroupSettings;
@class AWSMediaconvertHlsSettings;
@class AWSMediaconvertHopDestination;
@class AWSMediaconvertId3Insertion;
@class AWSMediaconvertImageInserter;
@class AWSMediaconvertImscDestinationSettings;
@class AWSMediaconvertInput;
@class AWSMediaconvertInputClipping;
@class AWSMediaconvertInputDecryptionSettings;
@class AWSMediaconvertInputTemplate;
@class AWSMediaconvertInsertableImage;
@class AWSMediaconvertJob;
@class AWSMediaconvertJobMessages;
@class AWSMediaconvertJobSettings;
@class AWSMediaconvertJobTemplate;
@class AWSMediaconvertJobTemplateSettings;
@class AWSMediaconvertListJobTemplatesRequest;
@class AWSMediaconvertListJobTemplatesResponse;
@class AWSMediaconvertListJobsRequest;
@class AWSMediaconvertListJobsResponse;
@class AWSMediaconvertListPresetsRequest;
@class AWSMediaconvertListPresetsResponse;
@class AWSMediaconvertListQueuesRequest;
@class AWSMediaconvertListQueuesResponse;
@class AWSMediaconvertListTagsForResourceRequest;
@class AWSMediaconvertListTagsForResourceResponse;
@class AWSMediaconvertM2tsScte35Esam;
@class AWSMediaconvertM2tsSettings;
@class AWSMediaconvertM3u8Settings;
@class AWSMediaconvertMotionImageInserter;
@class AWSMediaconvertMotionImageInsertionFramerate;
@class AWSMediaconvertMotionImageInsertionOffset;
@class AWSMediaconvertMovSettings;
@class AWSMediaconvertMp2Settings;
@class AWSMediaconvertMp3Settings;
@class AWSMediaconvertMp4Settings;
@class AWSMediaconvertMpdSettings;
@class AWSMediaconvertMpeg2Settings;
@class AWSMediaconvertMsSmoothAdditionalManifest;
@class AWSMediaconvertMsSmoothEncryptionSettings;
@class AWSMediaconvertMsSmoothGroupSettings;
@class AWSMediaconvertMxfSettings;
@class AWSMediaconvertNexGuardFileMarkerSettings;
@class AWSMediaconvertNielsenConfiguration;
@class AWSMediaconvertNoiseReducer;
@class AWSMediaconvertNoiseReducerFilterSettings;
@class AWSMediaconvertNoiseReducerSpatialFilterSettings;
@class AWSMediaconvertNoiseReducerTemporalFilterSettings;
@class AWSMediaconvertOpusSettings;
@class AWSMediaconvertOutput;
@class AWSMediaconvertOutputChannelMapping;
@class AWSMediaconvertOutputDetail;
@class AWSMediaconvertOutputGroup;
@class AWSMediaconvertOutputGroupDetail;
@class AWSMediaconvertOutputGroupSettings;
@class AWSMediaconvertOutputSettings;
@class AWSMediaconvertPartnerWatermarking;
@class AWSMediaconvertPreset;
@class AWSMediaconvertPresetSettings;
@class AWSMediaconvertProresSettings;
@class AWSMediaconvertQueue;
@class AWSMediaconvertQueueTransition;
@class AWSMediaconvertRectangle;
@class AWSMediaconvertRemixSettings;
@class AWSMediaconvertReservationPlan;
@class AWSMediaconvertReservationPlanSettings;
@class AWSMediaconvertResourceTags;
@class AWSMediaconvertS3DestinationAccessControl;
@class AWSMediaconvertS3DestinationSettings;
@class AWSMediaconvertS3EncryptionSettings;
@class AWSMediaconvertSccDestinationSettings;
@class AWSMediaconvertSpekeKeyProvider;
@class AWSMediaconvertSpekeKeyProviderCmaf;
@class AWSMediaconvertStaticKeyProvider;
@class AWSMediaconvertTagResourceRequest;
@class AWSMediaconvertTagResourceResponse;
@class AWSMediaconvertTeletextDestinationSettings;
@class AWSMediaconvertTeletextSourceSettings;
@class AWSMediaconvertTimecodeBurnin;
@class AWSMediaconvertTimecodeConfig;
@class AWSMediaconvertTimedMetadataInsertion;
@class AWSMediaconvertTiming;
@class AWSMediaconvertTrackSourceSettings;
@class AWSMediaconvertTtmlDestinationSettings;
@class AWSMediaconvertUntagResourceRequest;
@class AWSMediaconvertUntagResourceResponse;
@class AWSMediaconvertUpdateJobTemplateRequest;
@class AWSMediaconvertUpdateJobTemplateResponse;
@class AWSMediaconvertUpdatePresetRequest;
@class AWSMediaconvertUpdatePresetResponse;
@class AWSMediaconvertUpdateQueueRequest;
@class AWSMediaconvertUpdateQueueResponse;
@class AWSMediaconvertVideoCodecSettings;
@class AWSMediaconvertVideoDescription;
@class AWSMediaconvertVideoDetail;
@class AWSMediaconvertVideoPreprocessor;
@class AWSMediaconvertVideoSelector;
@class AWSMediaconvertVorbisSettings;
@class AWSMediaconvertVp8Settings;
@class AWSMediaconvertVp9Settings;
@class AWSMediaconvertWavSettings;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value AAC. The service accepts one of two mutually exclusive groups of AAC settings--VBR and CBR. To select one of these modes, set the value of Bitrate control mode (rateControlMode) to "VBR" or "CBR".In VBR mode, you control the audio quality with the setting VBR quality (vbrQuality). In CBR mode, you use the setting Bitrate (bitrate). Defaults and valid values depend on the rate control mode.
 */
@interface AWSMediaconvertAacSettings : AWSModel


/**
 Choose BROADCASTER_MIXED_AD when the input contains pre-mixed main audio + audio description (AD) as a stereo pair. The value for AudioType will be set to 3, which signals to downstream systems that this stream contains "broadcaster mixed AD". Note that the input received by the encoder must contain pre-mixed audio; the encoder does not perform the mixing. When you choose BROADCASTER_MIXED_AD, the encoder ignores any values you provide in AudioType andFollowInputAudioType. Choose NORMAL when the input does not contain pre-mixed audio + audio description (AD). In this case, the encoder will use any values you provide for AudioType and FollowInputAudioType.
 */
@property (nonatomic, assign) AWSMediaconvertAacAudioDescriptionBroadcasterMix audioDescriptionBroadcasterMix;

/**
 Specify the average bitrate in bits per second. The set of valid values for this setting is: 6000, 8000, 10000, 12000, 14000, 16000, 20000, 24000, 28000, 32000, 40000, 48000, 56000, 64000, 80000, 96000, 112000, 128000, 160000, 192000, 224000, 256000, 288000, 320000, 384000, 448000, 512000, 576000, 640000, 768000, 896000, 1024000. The value you set is also constrained by the values that you choose for Profile (codecProfile), Bitrate control mode (codingMode), and Sample rate (sampleRate). Default values depend on Bitrate control mode and Profile.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 AAC Profile.
 */
@property (nonatomic, assign) AWSMediaconvertAacCodecProfile codecProfile;

/**
 Mono (Audio Description), Mono, Stereo, or 5.1 channel layout. Valid values depend on rate control mode and profile. "1.0 - Audio Description (Receiver Mix)" setting receives a stereo description plus control track and emits a mono AAC encode of the description track, with control data emitted in the PES header as per ETSI TS 101 154 Annex E.
 */
@property (nonatomic, assign) AWSMediaconvertAacCodingMode codingMode;

/**
 Rate Control Mode.
 */
@property (nonatomic, assign) AWSMediaconvertAacRateControlMode rateControlMode;

/**
 Enables LATM/LOAS AAC output. Note that if you use LATM/LOAS AAC in an output, you must choose "No container" for the output container.
 */
@property (nonatomic, assign) AWSMediaconvertAacRawFormat rawFormat;

/**
 Sample rate in Hz. Valid values depend on rate control mode and profile.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

/**
 Use MPEG-2 AAC instead of MPEG-4 AAC audio for raw or MPEG-2 Transport Stream containers.
 */
@property (nonatomic, assign) AWSMediaconvertAacSpecification specification;

/**
 VBR Quality Level - Only used if rate_control_mode is VBR.
 */
@property (nonatomic, assign) AWSMediaconvertAacVbrQuality vbrQuality;

@end

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value AC3.
 */
@interface AWSMediaconvertAc3Settings : AWSModel


/**
 Specify the average bitrate in bits per second. Valid bitrates depend on the coding mode.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specify the bitstream mode for the AC-3 stream that the encoder emits. For more information about the AC3 bitstream mode, see ATSC A/52-2012 (Annex E).
 */
@property (nonatomic, assign) AWSMediaconvertAc3BitstreamMode bitstreamMode;

/**
 Dolby Digital coding mode. Determines number of channels.
 */
@property (nonatomic, assign) AWSMediaconvertAc3CodingMode codingMode;

/**
 Sets the dialnorm for the output. If blank and input audio is Dolby Digital, dialnorm will be passed through.
 */
@property (nonatomic, strong) NSNumber * _Nullable dialnorm;

/**
 If set to FILM_STANDARD, adds dynamic range compression signaling to the output bitstream as defined in the Dolby Digital specification.
 */
@property (nonatomic, assign) AWSMediaconvertAc3DynamicRangeCompressionProfile dynamicRangeCompressionProfile;

/**
 Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid with 3_2_LFE coding mode.
 */
@property (nonatomic, assign) AWSMediaconvertAc3LfeFilter lfeFilter;

/**
 When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+, or DolbyE decoder that supplied this audio data. If audio was not supplied from one of these streams, then the static metadata settings will be used.
 */
@property (nonatomic, assign) AWSMediaconvertAc3MetadataControl metadataControl;

/**
 This value is always 48000. It represents the sample rate in Hz.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

@end

/**
 Accelerated transcoding can significantly speed up jobs with long, visually complex content.
 Required parameters: [Mode]
 */
@interface AWSMediaconvertAccelerationSettings : AWSModel


/**
 Specify the conditions when the service will run your job with accelerated transcoding.
 */
@property (nonatomic, assign) AWSMediaconvertAccelerationMode mode;

@end

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value AIFF.
 */
@interface AWSMediaconvertAiffSettings : AWSModel


/**
 Specify Bit depth (BitDepth), in bits per sample, to choose the encoding quality for this audio track.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitDepth;

/**
 Specify the number of channels in this output audio track. Valid values are 1 and even numbers up to 64. For example, 1, 2, 4, 6, and so on, up to 64.
 */
@property (nonatomic, strong) NSNumber * _Nullable channels;

/**
 Sample rate in hz.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

@end

/**
 Settings for ancillary captions source.
 */
@interface AWSMediaconvertAncillarySourceSettings : AWSModel


/**
 Specify whether this set of input captions appears in your outputs in both 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert includes the captions data in two ways: it passes the 608 data through using the 608 compatibility bytes fields of the 708 wrapper, and it also translates the 608 data into 708.
 */
@property (nonatomic, assign) AWSMediaconvertAncillaryConvert608To708 convert608To708;

/**
 Specifies the 608 channel number in the ancillary data track from which to extract captions. Unused for passthrough.
 */
@property (nonatomic, strong) NSNumber * _Nullable sourceAncillaryChannelNumber;

/**
 By default, the service terminates any unterminated captions at the end of each input. If you want the caption to continue onto your next input, disable this setting.
 */
@property (nonatomic, assign) AWSMediaconvertAncillaryTerminateCaptions terminateCaptions;

@end

/**
 
 */
@interface AWSMediaconvertAssociateCertificateRequest : AWSRequest


/**
 The ARN of the ACM certificate that you want to associate with your MediaConvert resource.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSMediaconvertAssociateCertificateResponse : AWSModel


@end

/**
 Audio codec settings (CodecSettings) under (AudioDescriptions) contains the group of settings related to audio encoding. The settings in this group vary depending on the value that you choose for Audio codec (Codec). For each codec enum that you choose, define the corresponding settings object. The following lists the codec enum, settings object pairs. * AAC, AacSettings * MP2, Mp2Settings * MP3, Mp3Settings * WAV, WavSettings * AIFF, AiffSettings * AC3, Ac3Settings * EAC3, Eac3Settings * EAC3_ATMOS, Eac3AtmosSettings * VORBIS, VorbisSettings * OPUS, OpusSettings
 */
@interface AWSMediaconvertAudioCodecSettings : AWSModel


/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value AAC. The service accepts one of two mutually exclusive groups of AAC settings--VBR and CBR. To select one of these modes, set the value of Bitrate control mode (rateControlMode) to "VBR" or "CBR".In VBR mode, you control the audio quality with the setting VBR quality (vbrQuality). In CBR mode, you use the setting Bitrate (bitrate). Defaults and valid values depend on the rate control mode.
 */
@property (nonatomic, strong) AWSMediaconvertAacSettings * _Nullable aacSettings;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value AC3.
 */
@property (nonatomic, strong) AWSMediaconvertAc3Settings * _Nullable ac3Settings;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value AIFF.
 */
@property (nonatomic, strong) AWSMediaconvertAiffSettings * _Nullable aiffSettings;

/**
 Type of Audio codec.
 */
@property (nonatomic, assign) AWSMediaconvertAudioCodec codec;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value EAC3_ATMOS.
 */
@property (nonatomic, strong) AWSMediaconvertEac3AtmosSettings * _Nullable eac3AtmosSettings;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value EAC3.
 */
@property (nonatomic, strong) AWSMediaconvertEac3Settings * _Nullable eac3Settings;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value MP2.
 */
@property (nonatomic, strong) AWSMediaconvertMp2Settings * _Nullable mp2Settings;

/**
 Required when you set Codec, under AudioDescriptions>CodecSettings, to the value MP3.
 */
@property (nonatomic, strong) AWSMediaconvertMp3Settings * _Nullable mp3Settings;

/**
 Required when you set Codec, under AudioDescriptions>CodecSettings, to the value OPUS.
 */
@property (nonatomic, strong) AWSMediaconvertOpusSettings * _Nullable opusSettings;

/**
 Required when you set Codec, under AudioDescriptions>CodecSettings, to the value Vorbis.
 */
@property (nonatomic, strong) AWSMediaconvertVorbisSettings * _Nullable vorbisSettings;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value WAV.
 */
@property (nonatomic, strong) AWSMediaconvertWavSettings * _Nullable wavSettings;

@end

/**
 Description of audio output
 */
@interface AWSMediaconvertAudioDescription : AWSModel


/**
 Advanced audio normalization settings. Ignore these settings unless you need to comply with a loudness standard.
 */
@property (nonatomic, strong) AWSMediaconvertAudioNormalizationSettings * _Nullable audioNormalizationSettings;

/**
 Specifies which audio data to use from each input. In the simplest case, specify an "Audio Selector":#inputs-audio_selector by name based on its order within each input. For example if you specify "Audio Selector 3", then the third audio selector will be used from each input. If an input does not have an "Audio Selector 3", then the audio selector marked as "default" in that input will be used. If there is no audio selector marked as "default", silence will be inserted for the duration of that input. Alternatively, an "Audio Selector Group":#inputs-audio_selector_group name may be specified, with similar default/silence behavior. If no audio_source_name is specified, then "Audio Selector 1" will be chosen automatically.
 */
@property (nonatomic, strong) NSString * _Nullable audioSourceName;

/**
 Applies only if Follow Input Audio Type is unchecked (false). A number between 0 and 255. The following are defined in ISO-IEC 13818-1: 0 = Undefined, 1 = Clean Effects, 2 = Hearing Impaired, 3 = Visually Impaired Commentary, 4-255 = Reserved.
 */
@property (nonatomic, strong) NSNumber * _Nullable audioType;

/**
 When set to FOLLOW_INPUT, if the input contains an ISO 639 audio_type, then that value is passed through to the output. If the input contains no ISO 639 audio_type, the value in Audio Type is included in the output. Otherwise the value in Audio Type is included in the output. Note that this field and audioType are both ignored if audioDescriptionBroadcasterMix is set to BROADCASTER_MIXED_AD.
 */
@property (nonatomic, assign) AWSMediaconvertAudioTypeControl audioTypeControl;

/**
 Audio codec settings (CodecSettings) under (AudioDescriptions) contains the group of settings related to audio encoding. The settings in this group vary depending on the value that you choose for Audio codec (Codec). For each codec enum that you choose, define the corresponding settings object. The following lists the codec enum, settings object pairs. * AAC, AacSettings * MP2, Mp2Settings * MP3, Mp3Settings * WAV, WavSettings * AIFF, AiffSettings * AC3, Ac3Settings * EAC3, Eac3Settings * EAC3_ATMOS, Eac3AtmosSettings * VORBIS, VorbisSettings * OPUS, OpusSettings
 */
@property (nonatomic, strong) AWSMediaconvertAudioCodecSettings * _Nullable codecSettings;

/**
 Specify the language for this audio output track. The service puts this language code into your output audio track when you set Language code control (AudioLanguageCodeControl) to Use configured (USE_CONFIGURED). The service also uses your specified custom language code when you set Language code control (AudioLanguageCodeControl) to Follow input (FOLLOW_INPUT), but your input file doesn't specify a language code. For all outputs, you can use an ISO 639-2 or ISO 639-3 code. For streaming outputs, you can also use any other code in the full RFC-5646 specification. Streaming outputs are those that are in one of the following output groups: CMAF, DASH ISO, Apple HLS, or Microsoft Smooth Streaming.
 */
@property (nonatomic, strong) NSString * _Nullable customLanguageCode;

/**
 Indicates the language of the audio output track. The ISO 639 language specified in the 'Language Code' drop down will be used when 'Follow Input Language Code' is not selected or when 'Follow Input Language Code' is selected but there is no ISO 639 language code specified by the input.
 */
@property (nonatomic, assign) AWSMediaconvertLanguageCode languageCode;

/**
 Specify which source for language code takes precedence for this audio track. When you choose Follow input (FOLLOW_INPUT), the service uses the language code from the input track if it's present. If there's no languge code on the input track, the service uses the code that you specify in the setting Language code (languageCode or customLanguageCode). When you choose Use configured (USE_CONFIGURED), the service uses the language code that you specify.
 */
@property (nonatomic, assign) AWSMediaconvertAudioLanguageCodeControl languageCodeControl;

/**
 Advanced audio remixing settings.
 */
@property (nonatomic, strong) AWSMediaconvertRemixSettings * _Nullable remixSettings;

/**
 Specify a label for this output audio stream. For example, "English", "Director commentary", or "track_2". For streaming outputs, MediaConvert passes this information into destination manifests for display on the end-viewer's player device. For outputs in other output groups, the service ignores this setting.
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 Advanced audio normalization settings. Ignore these settings unless you need to comply with a loudness standard.
 */
@interface AWSMediaconvertAudioNormalizationSettings : AWSModel


/**
 Choose one of the following audio normalization algorithms: ITU-R BS.1770-1: Ungated loudness. A measurement of ungated average loudness for an entire piece of content, suitable for measurement of short-form content under ATSC recommendation A/85. Supports up to 5.1 audio channels. ITU-R BS.1770-2: Gated loudness. A measurement of gated average loudness compliant with the requirements of EBU-R128. Supports up to 5.1 audio channels. ITU-R BS.1770-3: Modified peak. The same loudness measurement algorithm as 1770-2, with an updated true peak measurement. ITU-R BS.1770-4: Higher channel count. Allows for more audio channels than the other algorithms, including configurations such as 7.1.
 */
@property (nonatomic, assign) AWSMediaconvertAudioNormalizationAlgorithm algorithm;

/**
 When enabled the output audio is corrected using the chosen algorithm. If disabled, the audio will be measured but not adjusted.
 */
@property (nonatomic, assign) AWSMediaconvertAudioNormalizationAlgorithmControl algorithmControl;

/**
 Content measuring above this level will be corrected to the target level. Content measuring below this level will not be corrected.
 */
@property (nonatomic, strong) NSNumber * _Nullable correctionGateLevel;

/**
 If set to LOG, log each output's audio track loudness to a CSV file.
 */
@property (nonatomic, assign) AWSMediaconvertAudioNormalizationLoudnessLogging loudnessLogging;

/**
 If set to TRUE_PEAK, calculate and log the TruePeak for each output's audio track loudness.
 */
@property (nonatomic, assign) AWSMediaconvertAudioNormalizationPeakCalculation peakCalculation;

/**
 When you use Audio normalization (AudioNormalizationSettings), optionally use this setting to specify a target loudness. If you don't specify a value here, the encoder chooses a value for you, based on the algorithm that you choose for Algorithm (algorithm). If you choose algorithm 1770-1, the encoder will choose -24 LKFS; otherwise, the encoder will choose -23 LKFS.
 */
@property (nonatomic, strong) NSNumber * _Nullable targetLkfs;

@end

/**
 Selector for Audio
 */
@interface AWSMediaconvertAudioSelector : AWSModel


/**
 Selects a specific language code from within an audio source, using the ISO 639-2 or ISO 639-3 three-letter language code
 */
@property (nonatomic, strong) NSString * _Nullable customLanguageCode;

/**
 Enable this setting on one audio selector to set it as the default for the job. The service uses this default for outputs where it can't find the specified input audio. If you don't set a default, those outputs have no audio.
 */
@property (nonatomic, assign) AWSMediaconvertAudioDefaultSelection defaultSelection;

/**
 Specifies audio data from an external file source.
 */
@property (nonatomic, strong) NSString * _Nullable externalAudioFileInput;

/**
 Selects a specific language code from within an audio source.
 */
@property (nonatomic, assign) AWSMediaconvertLanguageCode languageCode;

/**
 Specifies a time delta in milliseconds to offset the audio from the input video.
 */
@property (nonatomic, strong) NSNumber * _Nullable offset;

/**
 Selects a specific PID from within an audio source (e.g. 257 selects PID 0x101).
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable pids;

/**
 Use this setting for input streams that contain Dolby E, to have the service extract specific program data from the track. To select multiple programs, create multiple selectors with the same Track and different Program numbers. In the console, this setting is visible when you set Selector type to Track. Choose the program number from the dropdown list. If you are sending a JSON file, provide the program ID, which is part of the audio metadata. If your input file has incorrect metadata, you can choose All channels instead of a program number to have the service ignore the program IDs and include all the programs in the track.
 */
@property (nonatomic, strong) NSNumber * _Nullable programSelection;

/**
 Use these settings to reorder the audio channels of one input to match those of another input. This allows you to combine the two files into a single output, one after the other.
 */
@property (nonatomic, strong) AWSMediaconvertRemixSettings * _Nullable remixSettings;

/**
 Specifies the type of the audio selector.
 */
@property (nonatomic, assign) AWSMediaconvertAudioSelectorType selectorType;

/**
 Identify a track from the input audio to include in this selector by entering the track index number. To include several tracks in a single audio selector, specify multiple tracks as follows. Using the console, enter a comma-separated list. For examle, type "1,2,3" to include tracks 1 through 3. Specifying directly in your JSON job file, provide the track numbers in an array. For example, "tracks": [1,2,3].
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable tracks;

@end

/**
 Group of Audio Selectors
 */
@interface AWSMediaconvertAudioSelectorGroup : AWSModel


/**
 Name of an Audio Selector within the same input to include in the group.Audio selector names are standardized, based on their order within the input (e.g., "Audio Selector 1"). The audio selector name parameter can be repeated to add any number of audio selectors to the group.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable audioSelectorNames;

@end

/**
 Settings for quality-defined variable bitrate encoding with the AV1 codec. Required when you set Rate control mode to QVBR. Not valid when you set Rate control mode to a value other than QVBR, or when you don't define Rate control mode.
 */
@interface AWSMediaconvertAv1QvbrSettings : AWSModel


/**
 Required when you use QVBR rate control mode. That is, when you specify qvbrSettings within av1Settings. Specify the general target quality level for this output, from 1 to 10. Use higher numbers for greater quality. Level 10 results in nearly lossless compression. The quality level for most broadcast-quality transcodes is between 6 and 9. Optionally, to specify a value between whole numbers, also provide a value for the setting qvbrQualityLevelFineTune. For example, if you want your QVBR quality level to be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33.
 */
@property (nonatomic, strong) NSNumber * _Nullable qvbrQualityLevel;

/**
 Optional. Specify a value here to set the QVBR quality to a level that is between whole numbers. For example, if you want your QVBR quality level to be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33. MediaConvert rounds your QVBR quality level to the nearest third of a whole number. For example, if you set qvbrQualityLevel to 7 and you set qvbrQualityLevelFineTune to .25, your actual QVBR quality level is 7.33.
 */
@property (nonatomic, strong) NSNumber * _Nullable qvbrQualityLevelFineTune;

@end

/**
 Required when you set Codec, under VideoDescription>CodecSettings to the value AV1.
 */
@interface AWSMediaconvertAv1Settings : AWSModel


/**
 Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.
 */
@property (nonatomic, assign) AWSMediaconvertAv1AdaptiveQuantization adaptiveQuantization;

/**
 If you are using the console, use the Framerate setting to specify the frame rate for this output. If you want to keep the same frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction. If you are creating your transcoding job specification as a JSON file without the console, use FramerateControl to specify which value the service uses for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the settings FramerateNumerator and FramerateDenominator.
 */
@property (nonatomic, assign) AWSMediaconvertAv1FramerateControl framerateControl;

/**
 Optional. Specify how the transcoder performs framerate conversion. The default behavior is to use duplicate drop conversion.
 */
@property (nonatomic, assign) AWSMediaconvertAv1FramerateConversionAlgorithm framerateConversionAlgorithm;

/**
 When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a fraction. For example,24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When you use the console for transcode jobs that use frame rate conversion, provide the value as a decimal number for Framerate. In this example, specify 23.976.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a fraction. For example,24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the console for transcode jobs that use frame rate conversion, provide the value as a decimal number for Framerate. In this example, specify 23.976.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

/**
 Specify the GOP length (keyframe interval) in frames. With AV1, MediaConvert doesn't support GOP length in seconds. This value must be greater than zero and preferably equal to 1 + ((numberBFrames + 1) * x), where x is an integer value.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopSize;

/**
 Maximum bitrate in bits/second. For example, enter five megabits per second as 5000000. Required when Rate control mode is QVBR.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxBitrate;

/**
 Specify the number of B-frames. With AV1, MediaConvert supports only 7 or 15.
 */
@property (nonatomic, strong) NSNumber * _Nullable numberBFramesBetweenReferenceFrames;

/**
 Settings for quality-defined variable bitrate encoding with the AV1 codec. Required when you set Rate control mode to QVBR. Not valid when you set Rate control mode to a value other than QVBR, or when you don't define Rate control mode.
 */
@property (nonatomic, strong) AWSMediaconvertAv1QvbrSettings * _Nullable qvbrSettings;

/**
 'With AV1 outputs, for rate control mode, MediaConvert supports only quality-defined variable bitrate (QVBR). You can''t use CBR or VBR.'
 */
@property (nonatomic, assign) AWSMediaconvertAv1RateControlMode rateControlMode;

/**
 Specify the number of slices per picture. This value must be 1, 2, 4, 8, 16, or 32. For progressive pictures, this value must be less than or equal to the number of macroblock rows. For interlaced pictures, this value must be less than or equal to half the number of macroblock rows.
 */
@property (nonatomic, strong) NSNumber * _Nullable slices;

/**
 Adjust quantization within each frame based on spatial variation of content complexity.
 */
@property (nonatomic, assign) AWSMediaconvertAv1SpatialAdaptiveQuantization spatialAdaptiveQuantization;

@end

/**
 Settings for Avail Blanking
 */
@interface AWSMediaconvertAvailBlanking : AWSModel


/**
 Blanking image to be used. Leave empty for solid black. Only bmp and png images are supported.
 */
@property (nonatomic, strong) NSString * _Nullable availBlankingImage;

@end

/**
 Burn-In Destination Settings.
 */
@interface AWSMediaconvertBurninDestinationSettings : AWSModel


/**
 If no explicit x_position or y_position is provided, setting alignment to centered will place the captions at the bottom center of the output. Similarly, setting a left alignment will align captions to the bottom left of the output. If x and y positions are given in conjunction with the alignment parameter, the font will be justified (either left or centered) relative to those coordinates. This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMediaconvertBurninSubtitleAlignment alignment;

/**
 Specifies the color of the rectangle behind the captions. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMediaconvertBurninSubtitleBackgroundColor backgroundColor;

/**
 Specifies the opacity of the background rectangle. 255 is opaque; 0 is transparent. Leaving this parameter blank is equivalent to setting it to 0 (transparent). All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable backgroundOpacity;

/**
 Specifies the color of the burned-in captions. This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMediaconvertBurninSubtitleFontColor fontColor;

/**
 Specifies the opacity of the burned-in captions. 255 is opaque; 0 is transparent. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontOpacity;

/**
 Font resolution in DPI (dots per inch); default is 96 dpi. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontResolution;

/**
 Provide the font script, using an ISO 15924 script code, if the LanguageCode is not sufficient for determining the script type. Where LanguageCode or CustomLanguageCode is sufficient, use "AUTOMATIC" or leave unset. This is used to help determine the appropriate font for rendering burn-in captions.
 */
@property (nonatomic, assign) AWSMediaconvertFontScript fontScript;

/**
 A positive integer indicates the exact font size in points. Set to 0 for automatic font size selection. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontSize;

/**
 Specifies font outline color. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMediaconvertBurninSubtitleOutlineColor outlineColor;

/**
 Specifies font outline size in pixels. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable outlineSize;

/**
 Specifies the color of the shadow cast by the captions. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMediaconvertBurninSubtitleShadowColor shadowColor;

/**
 Specifies the opacity of the shadow. 255 is opaque; 0 is transparent. Leaving this parameter blank is equivalent to setting it to 0 (transparent). All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable shadowOpacity;

/**
 Specifies the horizontal offset of the shadow relative to the captions in pixels. A value of -2 would result in a shadow offset 2 pixels to the left. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable shadowXOffset;

/**
 Specifies the vertical offset of the shadow relative to the captions in pixels. A value of -2 would result in a shadow offset 2 pixels above the text. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable shadowYOffset;

/**
 Only applies to jobs with input captions in Teletext or STL formats. Specify whether the spacing between letters in your captions is set by the captions grid or varies depending on letter width. Choose fixed grid to conform to the spacing specified in the captions file more accurately. Choose proportional to make the text easier to read if the captions are closed caption.
 */
@property (nonatomic, assign) AWSMediaconvertBurninSubtitleTeletextSpacing teletextSpacing;

/**
 Specifies the horizontal position of the caption relative to the left side of the output in pixels. A value of 10 would result in the captions starting 10 pixels from the left of the output. If no explicit x_position is provided, the horizontal caption position will be determined by the alignment parameter. This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable XPosition;

/**
 Specifies the vertical position of the caption relative to the top of the output in pixels. A value of 10 would result in the captions starting 10 pixels from the top of the output. If no explicit y_position is provided, the caption will be positioned towards the bottom of the output. This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable YPosition;

@end

/**
 
 */
@interface AWSMediaconvertCancelJobRequest : AWSRequest


/**
 The Job ID of the job to be cancelled.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSMediaconvertCancelJobResponse : AWSModel


@end

/**
 Description of Caption output
 */
@interface AWSMediaconvertCaptionDescription : AWSModel


/**
 Specifies which "Caption Selector":#inputs-caption_selector to use from each input when generating captions. The name should be of the format "Caption Selector <N>", which denotes that the Nth Caption Selector will be used from each input.
 */
@property (nonatomic, strong) NSString * _Nullable captionSelectorName;

/**
 Specify the language for this captions output track. For most captions output formats, the encoder puts this language information in the output captions metadata. If your output captions format is DVB-Sub or Burn in, the encoder uses this language information when automatically selecting the font script for rendering the captions text. For all outputs, you can use an ISO 639-2 or ISO 639-3 code. For streaming outputs, you can also use any other code in the full RFC-5646 specification. Streaming outputs are those that are in one of the following output groups: CMAF, DASH ISO, Apple HLS, or Microsoft Smooth Streaming.
 */
@property (nonatomic, strong) NSString * _Nullable customLanguageCode;

/**
 Specific settings required by destination type. Note that burnin_destination_settings are not available if the source of the caption data is Embedded or Teletext.
 */
@property (nonatomic, strong) AWSMediaconvertCaptionDestinationSettings * _Nullable destinationSettings;

/**
 Specify the language of this captions output track. For most captions output formats, the encoder puts this language information in the output captions metadata. If your output captions format is DVB-Sub or Burn in, the encoder uses this language information to choose the font language for rendering the captions text.
 */
@property (nonatomic, assign) AWSMediaconvertLanguageCode languageCode;

/**
 Specify a label for this set of output captions. For example, "English", "Director commentary", or "track_2". For streaming outputs, MediaConvert passes this information into destination manifests for display on the end-viewer's player device. For outputs in other output groups, the service ignores this setting.
 */
@property (nonatomic, strong) NSString * _Nullable languageDescription;

@end

/**
 Caption Description for preset
 */
@interface AWSMediaconvertCaptionDescriptionPreset : AWSModel


/**
 Specify the language for this captions output track. For most captions output formats, the encoder puts this language information in the output captions metadata. If your output captions format is DVB-Sub or Burn in, the encoder uses this language information when automatically selecting the font script for rendering the captions text. For all outputs, you can use an ISO 639-2 or ISO 639-3 code. For streaming outputs, you can also use any other code in the full RFC-5646 specification. Streaming outputs are those that are in one of the following output groups: CMAF, DASH ISO, Apple HLS, or Microsoft Smooth Streaming.
 */
@property (nonatomic, strong) NSString * _Nullable customLanguageCode;

/**
 Specific settings required by destination type. Note that burnin_destination_settings are not available if the source of the caption data is Embedded or Teletext.
 */
@property (nonatomic, strong) AWSMediaconvertCaptionDestinationSettings * _Nullable destinationSettings;

/**
 Specify the language of this captions output track. For most captions output formats, the encoder puts this language information in the output captions metadata. If your output captions format is DVB-Sub or Burn in, the encoder uses this language information to choose the font language for rendering the captions text.
 */
@property (nonatomic, assign) AWSMediaconvertLanguageCode languageCode;

/**
 Specify a label for this set of output captions. For example, "English", "Director commentary", or "track_2". For streaming outputs, MediaConvert passes this information into destination manifests for display on the end-viewer's player device. For outputs in other output groups, the service ignores this setting.
 */
@property (nonatomic, strong) NSString * _Nullable languageDescription;

@end

/**
 Specific settings required by destination type. Note that burnin_destination_settings are not available if the source of the caption data is Embedded or Teletext.
 */
@interface AWSMediaconvertCaptionDestinationSettings : AWSModel


/**
 Burn-In Destination Settings.
 */
@property (nonatomic, strong) AWSMediaconvertBurninDestinationSettings * _Nullable burninDestinationSettings;

/**
 Specify the format for this set of captions on this output. The default format is embedded without SCTE-20. Other options are embedded with SCTE-20, burn-in, DVB-sub, IMSC, SCC, SRT, teletext, TTML, and web-VTT. If you are using SCTE-20, choose SCTE-20 plus embedded (SCTE20_PLUS_EMBEDDED) to create an output that complies with the SCTE-43 spec. To create a non-compliant output where the embedded captions come first, choose Embedded plus SCTE-20 (EMBEDDED_PLUS_SCTE20).
 */
@property (nonatomic, assign) AWSMediaconvertCaptionDestinationType destinationType;

/**
 DVB-Sub Destination Settings
 */
@property (nonatomic, strong) AWSMediaconvertDvbSubDestinationSettings * _Nullable dvbSubDestinationSettings;

/**
 Settings specific to embedded/ancillary caption outputs, including 608/708 Channel destination number.
 */
@property (nonatomic, strong) AWSMediaconvertEmbeddedDestinationSettings * _Nullable embeddedDestinationSettings;

/**
 Settings specific to IMSC caption outputs.
 */
@property (nonatomic, strong) AWSMediaconvertImscDestinationSettings * _Nullable imscDestinationSettings;

/**
 Settings for SCC caption output.
 */
@property (nonatomic, strong) AWSMediaconvertSccDestinationSettings * _Nullable sccDestinationSettings;

/**
 Settings for Teletext caption output
 */
@property (nonatomic, strong) AWSMediaconvertTeletextDestinationSettings * _Nullable teletextDestinationSettings;

/**
 Settings specific to TTML caption outputs, including Pass style information (TtmlStylePassthrough).
 */
@property (nonatomic, strong) AWSMediaconvertTtmlDestinationSettings * _Nullable ttmlDestinationSettings;

@end

/**
 Set up captions in your outputs by first selecting them from your input here.
 */
@interface AWSMediaconvertCaptionSelector : AWSModel


/**
 The specific language to extract from source, using the ISO 639-2 or ISO 639-3 three-letter language code. If input is SCTE-27, complete this field and/or PID to select the caption language to extract. If input is DVB-Sub and output is Burn-in or SMPTE-TT, complete this field and/or PID to select the caption language to extract. If input is DVB-Sub that is being passed through, omit this field (and PID field); there is no way to extract a specific language with pass-through captions.
 */
@property (nonatomic, strong) NSString * _Nullable customLanguageCode;

/**
 The specific language to extract from source. If input is SCTE-27, complete this field and/or PID to select the caption language to extract. If input is DVB-Sub and output is Burn-in or SMPTE-TT, complete this field and/or PID to select the caption language to extract. If input is DVB-Sub that is being passed through, omit this field (and PID field); there is no way to extract a specific language with pass-through captions.
 */
@property (nonatomic, assign) AWSMediaconvertLanguageCode languageCode;

/**
 If your input captions are SCC, TTML, STL, SMI, SRT, or IMSC in an xml file, specify the URI of the input captions source file. If your input captions are IMSC in an IMF package, use TrackSourceSettings instead of FileSoureSettings.
 */
@property (nonatomic, strong) AWSMediaconvertCaptionSourceSettings * _Nullable sourceSettings;

@end

/**
 Ignore this setting unless your input captions format is SCC. To have the service compensate for differing frame rates between your input captions and input video, specify the frame rate of the captions file. Specify this value as a fraction, using the settings Framerate numerator (framerateNumerator) and Framerate denominator (framerateDenominator). For example, you might specify 24 / 1 for 24 fps, 25 / 1 for 25 fps, 24000 / 1001 for 23.976 fps, or 30000 / 1001 for 29.97 fps.
 */
@interface AWSMediaconvertCaptionSourceFramerate : AWSModel


/**
 Specify the denominator of the fraction that represents the frame rate for the setting Caption source frame rate (CaptionSourceFramerate). Use this setting along with the setting Framerate numerator (framerateNumerator).
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 Specify the numerator of the fraction that represents the frame rate for the setting Caption source frame rate (CaptionSourceFramerate). Use this setting along with the setting Framerate denominator (framerateDenominator).
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

@end

/**
 If your input captions are SCC, TTML, STL, SMI, SRT, or IMSC in an xml file, specify the URI of the input captions source file. If your input captions are IMSC in an IMF package, use TrackSourceSettings instead of FileSoureSettings.
 */
@interface AWSMediaconvertCaptionSourceSettings : AWSModel


/**
 Settings for ancillary captions source.
 */
@property (nonatomic, strong) AWSMediaconvertAncillarySourceSettings * _Nullable ancillarySourceSettings;

/**
 DVB Sub Source Settings
 */
@property (nonatomic, strong) AWSMediaconvertDvbSubSourceSettings * _Nullable dvbSubSourceSettings;

/**
 Settings for embedded captions Source
 */
@property (nonatomic, strong) AWSMediaconvertEmbeddedSourceSettings * _Nullable embeddedSourceSettings;

/**
 If your input captions are SCC, SMI, SRT, STL, TTML, or IMSC 1.1 in an xml file, specify the URI of the input caption source file. If your caption source is IMSC in an IMF package, use TrackSourceSettings instead of FileSoureSettings.
 */
@property (nonatomic, strong) AWSMediaconvertFileSourceSettings * _Nullable fileSourceSettings;

/**
 Use Source (SourceType) to identify the format of your input captions.The service cannot auto-detect caption format.
 */
@property (nonatomic, assign) AWSMediaconvertCaptionSourceType sourceType;

/**
 Settings specific to Teletext caption sources, including Page number.
 */
@property (nonatomic, strong) AWSMediaconvertTeletextSourceSettings * _Nullable teletextSourceSettings;

/**
 Settings specific to caption sources that are specified by track number. Currently, this is only IMSC captions in an IMF package. If your caption source is IMSC 1.1 in a separate xml file, use FileSourceSettings instead of TrackSourceSettings.
 */
@property (nonatomic, strong) AWSMediaconvertTrackSourceSettings * _Nullable trackSourceSettings;

@end

/**
 Channel mapping (ChannelMapping) contains the group of fields that hold the remixing value for each channel. Units are in dB. Acceptable values are within the range from -60 (mute) through 6. A setting of 0 passes the input channel unchanged to the output channel (no attenuation or amplification).
 */
@interface AWSMediaconvertChannelMapping : AWSModel


/**
 List of output channels
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertOutputChannelMapping *> * _Nullable outputChannels;

@end

/**
 Specify the details for each pair of HLS and DASH additional manifests that you want the service to generate for this CMAF output group. Each pair of manifests can reference a different subset of outputs in the group.
 */
@interface AWSMediaconvertCmafAdditionalManifest : AWSModel


/**
 Specify a name modifier that the service adds to the name of this manifest to make it different from the file names of the other main manifests in the output group. For example, say that the default main manifest for your HLS group is film-name.m3u8. If you enter "-no-premium" for this setting, then the file name the service generates for this top-level manifest is film-name-no-premium.m3u8. For HLS output groups, specify a manifestNameModifier that is different from the nameModifier of the output. The service uses the output name modifier to create unique names for the individual variant manifests.
 */
@property (nonatomic, strong) NSString * _Nullable manifestNameModifier;

/**
 Specify the outputs that you want this additional top-level manifest to reference.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable selectedOutputs;

@end

/**
 Settings for CMAF encryption
 */
@interface AWSMediaconvertCmafEncryptionSettings : AWSModel


/**
 This is a 128-bit, 16-byte hex value represented by a 32-character text string. If this parameter is not set then the Initialization Vector will follow the segment number by default.
 */
@property (nonatomic, strong) NSString * _Nullable constantInitializationVector;

/**
 Specify the encryption scheme that you want the service to use when encrypting your CMAF segments. Choose AES-CBC subsample (SAMPLE-AES) or AES_CTR (AES-CTR).
 */
@property (nonatomic, assign) AWSMediaconvertCmafEncryptionType encryptionMethod;

/**
 When you use DRM with CMAF outputs, choose whether the service writes the 128-bit encryption initialization vector in the HLS and DASH manifests.
 */
@property (nonatomic, assign) AWSMediaconvertCmafInitializationVectorInManifest initializationVectorInManifest;

/**
 If your output group type is CMAF, use these settings when doing DRM encryption with a SPEKE-compliant key provider. If your output group type is HLS, DASH, or Microsoft Smooth, use the SpekeKeyProvider settings instead.
 */
@property (nonatomic, strong) AWSMediaconvertSpekeKeyProviderCmaf * _Nullable spekeKeyProvider;

/**
 Use these settings to set up encryption with a static key provider.
 */
@property (nonatomic, strong) AWSMediaconvertStaticKeyProvider * _Nullable staticKeyProvider;

/**
 Specify whether your DRM encryption key is static or from a key provider that follows the SPEKE standard. For more information about SPEKE, see https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
 */
@property (nonatomic, assign) AWSMediaconvertCmafKeyProviderType types;

@end

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to CMAF_GROUP_SETTINGS. Each output in a CMAF Output Group may only contain a single video, audio, or caption output.
 */
@interface AWSMediaconvertCmafGroupSettings : AWSModel


/**
 By default, the service creates one top-level .m3u8 HLS manifest and one top -level .mpd DASH manifest for each CMAF output group in your job. These default manifests reference every output in the output group. To create additional top-level manifests that reference a subset of the outputs in the output group, specify a list of them here. For each additional manifest that you specify, the service creates one HLS manifest and one DASH manifest.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertCmafAdditionalManifest *> * _Nullable additionalManifests;

/**
 A partial URI prefix that will be put in the manifest file at the top level BaseURL element. Can be used if streams are delivered from a different URL than the manifest file.
 */
@property (nonatomic, strong) NSString * _Nullable baseUrl;

/**
 When set to ENABLED, sets #EXT-X-ALLOW-CACHE:no tag, which prevents client from saving media segments for later replay.
 */
@property (nonatomic, assign) AWSMediaconvertCmafClientCache clientCache;

/**
 Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist generation.
 */
@property (nonatomic, assign) AWSMediaconvertCmafCodecSpecification codecSpecification;

/**
 Use Destination (Destination) to specify the S3 output location and the output filename base. Destination accepts format identifiers. If you do not specify the base filename in the URI, the service will use the filename of the input file. If your job has multiple inputs, the service uses the filename of the first input file.
 */
@property (nonatomic, strong) NSString * _Nullable destination;

/**
 Settings associated with the destination. Will vary based on the type of destination
 */
@property (nonatomic, strong) AWSMediaconvertDestinationSettings * _Nullable destinationSettings;

/**
 DRM settings.
 */
@property (nonatomic, strong) AWSMediaconvertCmafEncryptionSettings * _Nullable encryption;

/**
 Length of fragments to generate (in seconds). Fragment length must be compatible with GOP size and Framerate. Note that fragments will end on the next keyframe after this number of seconds, so actual fragment length may be longer. When Emit Single File is checked, the fragmentation is internal to a single output file and it does not cause the creation of many output files as in other output types.
 */
@property (nonatomic, strong) NSNumber * _Nullable fragmentLength;

/**
 When set to GZIP, compresses HLS playlist.
 */
@property (nonatomic, assign) AWSMediaconvertCmafManifestCompression manifestCompression;

/**
 Indicates whether the output manifest should use floating point values for segment duration.
 */
@property (nonatomic, assign) AWSMediaconvertCmafManifestDurationFormat manifestDurationFormat;

/**
 Minimum time of initially buffered media that is needed to ensure smooth playout.
 */
@property (nonatomic, strong) NSNumber * _Nullable minBufferTime;

/**
 Keep this setting at the default value of 0, unless you are troubleshooting a problem with how devices play back the end of your video asset. If you know that player devices are hanging on the final segment of your video because the length of your final segment is too short, use this setting to specify a minimum final segment length, in seconds. Choose a value that is greater than or equal to 1 and less than your segment length. When you specify a value for this setting, the encoder will combine any final segment that is shorter than the length that you specify with the previous segment. For example, your segment length is 3 seconds and your final segment is .5 seconds without a minimum final segment length; when you set the minimum final segment length to 1, your final segment is 3.5 seconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable minFinalSegmentLength;

/**
 Specify whether your DASH profile is on-demand or main. When you choose Main profile (MAIN_PROFILE), the service signalsurn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you choose On-demand (ON_DEMAND_PROFILE), the service signals urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose On-demand, you must also set the output group setting Segment control (SegmentControl) to Single file (SINGLE_FILE).
 */
@property (nonatomic, assign) AWSMediaconvertCmafMpdProfile mpdProfile;

/**
 When set to SINGLE_FILE, a single output file is generated, which is internally segmented using the Fragment Length and Segment Length. When set to SEGMENTED_FILES, separate segment files will be created.
 */
@property (nonatomic, assign) AWSMediaconvertCmafSegmentControl segmentControl;

/**
 Use this setting to specify the length, in seconds, of each individual CMAF segment. This value applies to the whole package; that is, to every output in the output group. Note that segments end on the first keyframe after this number of seconds, so the actual segment length might be slightly longer. If you set Segment control (CmafSegmentControl) to single file, the service puts the content of each output in a single file that has metadata that marks these segments. If you set it to segmented files, the service creates multiple files for each output, each with the content of one segment.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentLength;

/**
 Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of variant manifest.
 */
@property (nonatomic, assign) AWSMediaconvertCmafStreamInfResolution streamInfResolution;

/**
 When set to ENABLED, a DASH MPD manifest will be generated for this output.
 */
@property (nonatomic, assign) AWSMediaconvertCmafWriteDASHManifest writeDashManifest;

/**
 When set to ENABLED, an Apple HLS manifest will be generated for this output.
 */
@property (nonatomic, assign) AWSMediaconvertCmafWriteHLSManifest writeHlsManifest;

/**
 When you enable Precise segment duration in DASH manifests (writeSegmentTimelineInRepresentation), your DASH manifest shows precise segment durations. The segment duration information appears inside the SegmentTimeline element, inside SegmentTemplate at the Representation level. When this feature isn't enabled, the segment durations in your DASH manifest are approximate. The segment duration information appears in the duration attribute of the SegmentTemplate element.
 */
@property (nonatomic, assign) AWSMediaconvertCmafWriteSegmentTimelineInRepresentation writeSegmentTimelineInRepresentation;

@end

/**
 Settings for MP4 segments in CMAF
 */
@interface AWSMediaconvertCmfcSettings : AWSModel


/**
 Use this setting only when you specify SCTE-35 markers from ESAM. Choose INSERT to put SCTE-35 markers in this output at the insertion points that you specify in an ESAM XML document. Provide the document in the setting SCC XML (sccXml).
 */
@property (nonatomic, assign) AWSMediaconvertCmfcScte35Esam scte35Esam;

/**
 Ignore this setting unless you have SCTE-35 markers in your input video file. Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that appear in your input to also appear in this output. Choose None (NONE) if you don't want those SCTE-35 markers in this output.
 */
@property (nonatomic, assign) AWSMediaconvertCmfcScte35Source scte35Source;

@end

/**
 Settings for color correction.
 */
@interface AWSMediaconvertColorCorrector : AWSModel


/**
 Brightness level.
 */
@property (nonatomic, strong) NSNumber * _Nullable brightness;

/**
 Specify the color space you want for this output. The service supports conversion between HDR formats, between SDR formats, from SDR to HDR, and from HDR to SDR. SDR to HDR conversion doesn't upgrade the dynamic range. The converted video has an HDR format, but visually appears the same as an unconverted output. HDR to SDR conversion uses Elemental tone mapping technology to approximate the outcome of manually regrading from HDR to SDR.
 */
@property (nonatomic, assign) AWSMediaconvertColorSpaceConversion colorSpaceConversion;

/**
 Contrast level.
 */
@property (nonatomic, strong) NSNumber * _Nullable contrast;

/**
 Use these settings when you convert to the HDR 10 color space. Specify the SMPTE ST 2086 Mastering Display Color Volume static metadata that you want signaled in the output. These values don't affect the pixel values that are encoded in the video stream. They are intended to help the downstream video player display content in a way that reflects the intentions of the the content creator. When you set Color space conversion (ColorSpaceConversion) to HDR 10 (FORCE_HDR10), these settings are required. You must set values for Max frame average light level (maxFrameAverageLightLevel) and Max content light level (maxContentLightLevel); these settings don't have a default value. The default values for the other HDR 10 metadata settings are defined by the P3D65 color space. For more information about MediaConvert HDR jobs, see https://docs.aws.amazon.com/console/mediaconvert/hdr.
 */
@property (nonatomic, strong) AWSMediaconvertHdr10Metadata * _Nullable hdr10Metadata;

/**
 Hue in degrees.
 */
@property (nonatomic, strong) NSNumber * _Nullable hue;

/**
 Saturation level.
 */
@property (nonatomic, strong) NSNumber * _Nullable saturation;

@end

/**
 Container specific settings.
 */
@interface AWSMediaconvertContainerSettings : AWSModel


/**
 Settings for MP4 segments in CMAF
 */
@property (nonatomic, strong) AWSMediaconvertCmfcSettings * _Nullable cmfcSettings;

/**
 Container for this output. Some containers require a container settings object. If not specified, the default object will be created.
 */
@property (nonatomic, assign) AWSMediaconvertContainerType container;

/**
 Settings for F4v container
 */
@property (nonatomic, strong) AWSMediaconvertF4vSettings * _Nullable f4vSettings;

/**
 MPEG-2 TS container settings. These apply to outputs in a File output group when the output's container (ContainerType) is MPEG-2 Transport Stream (M2TS). In these assets, data is organized by the program map table (PMT). Each transport stream program contains subsets of data, including audio, video, and metadata. Each of these subsets of data has a numerical label called a packet identifier (PID). Each transport stream program corresponds to one MediaConvert output. The PMT lists the types of data in a program along with their PID. Downstream systems and players use the program map table to look up the PID for each type of data it accesses and then uses the PIDs to locate specific data within the asset.
 */
@property (nonatomic, strong) AWSMediaconvertM2tsSettings * _Nullable m2tsSettings;

/**
 Settings for TS segments in HLS
 */
@property (nonatomic, strong) AWSMediaconvertM3u8Settings * _Nullable m3u8Settings;

/**
 Settings for MOV Container.
 */
@property (nonatomic, strong) AWSMediaconvertMovSettings * _Nullable movSettings;

/**
 Settings for MP4 container. You can create audio-only AAC outputs with this container.
 */
@property (nonatomic, strong) AWSMediaconvertMp4Settings * _Nullable mp4Settings;

/**
 Settings for MP4 segments in DASH
 */
@property (nonatomic, strong) AWSMediaconvertMpdSettings * _Nullable mpdSettings;

/**
 MXF settings
 */
@property (nonatomic, strong) AWSMediaconvertMxfSettings * _Nullable mxfSettings;

@end

/**
 
 */
@interface AWSMediaconvertCreateJobRequest : AWSRequest


/**
 Optional. Accelerated transcoding can significantly speed up jobs with long, visually complex content. Outputs that use this feature incur pro-tier pricing. For information about feature limitations, see the AWS Elemental MediaConvert User Guide.
 */
@property (nonatomic, strong) AWSMediaconvertAccelerationSettings * _Nullable accelerationSettings;

/**
 Optional. Choose a tag type that AWS Billing and Cost Management will use to sort your AWS Elemental MediaConvert costs on any billing report that you set up. Any transcoding outputs that don't have an associated tag will appear in your billing report unsorted. If you don't choose a valid value for this field, your job outputs will appear on the billing report unsorted.
 */
@property (nonatomic, assign) AWSMediaconvertBillingTagsSource billingTagsSource;

/**
 Optional. Idempotency token for CreateJob operation.
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 Optional. Use queue hopping to avoid overly long waits in the backlog of the queue that you submit your job to. Specify an alternate queue and the maximum time that your job will wait in the initial queue before hopping. For more information about this feature, see the AWS Elemental MediaConvert User Guide.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertHopDestination *> * _Nullable hopDestinations;

/**
 Optional. When you create a job, you can either specify a job template or specify the transcoding settings individually.
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplate;

/**
 Optional. Specify the relative priority for this job. In any given queue, the service begins processing the job with the highest value first. When more than one job has the same priority, the service begins processing the job that you submitted first. If you don't specify a priority, the service uses the default value 0.
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 Optional. When you create a job, you can specify a queue to send it to. If you don't specify, the job will go to the default queue. For more about queues, see the User Guide topic at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html.
 */
@property (nonatomic, strong) NSString * _Nullable queue;

/**
 Required. The IAM role you use for creating this job. For details about permissions, see the User Guide topic at the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/iam-role.html.
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 JobSettings contains all the transcode settings for a job.
 */
@property (nonatomic, strong) AWSMediaconvertJobSettings * _Nullable settings;

/**
 Optional. Enable this setting when you run a test job to estimate how many reserved transcoding slots (RTS) you need. When this is enabled, MediaConvert runs your job from an on-demand queue with similar performance to what you will see with one RTS in a reserved queue. This setting is disabled by default.
 */
@property (nonatomic, assign) AWSMediaconvertSimulateReservedQueue simulateReservedQueue;

/**
 Optional. Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the interval, in seconds, between status updates. MediaConvert sends an update at this interval from the time the service begins processing your job to the time it completes the transcode or encounters an error.
 */
@property (nonatomic, assign) AWSMediaconvertStatusUpdateInterval statusUpdateInterval;

/**
 Optional. The tags that you want to add to the resource. You can tag resources with a key-value pair or with only a key.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 Optional. User-defined metadata that you want to associate with an MediaConvert job. You specify metadata in key/value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable userMetadata;

@end

/**
 
 */
@interface AWSMediaconvertCreateJobResponse : AWSModel


/**
 Each job converts an input file into an output file or files. For more information, see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 */
@property (nonatomic, strong) AWSMediaconvertJob * _Nullable job;

@end

/**
 
 */
@interface AWSMediaconvertCreateJobTemplateRequest : AWSRequest


/**
 Accelerated transcoding can significantly speed up jobs with long, visually complex content. Outputs that use this feature incur pro-tier pricing. For information about feature limitations, see the AWS Elemental MediaConvert User Guide.
 */
@property (nonatomic, strong) AWSMediaconvertAccelerationSettings * _Nullable accelerationSettings;

/**
 Optional. A category for the job template you are creating
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 Optional. A description of the job template you are creating.
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 Optional. Use queue hopping to avoid overly long waits in the backlog of the queue that you submit your job to. Specify an alternate queue and the maximum time that your job will wait in the initial queue before hopping. For more information about this feature, see the AWS Elemental MediaConvert User Guide.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertHopDestination *> * _Nullable hopDestinations;

/**
 The name of the job template you are creating.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Specify the relative priority for this job. In any given queue, the service begins processing the job with the highest value first. When more than one job has the same priority, the service begins processing the job that you submitted first. If you don't specify a priority, the service uses the default value 0.
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 Optional. The queue that jobs created from this template are assigned to. If you don't specify this, jobs will go to the default queue.
 */
@property (nonatomic, strong) NSString * _Nullable queue;

/**
 JobTemplateSettings contains all the transcode settings saved in the template that will be applied to jobs created from it.
 */
@property (nonatomic, strong) AWSMediaconvertJobTemplateSettings * _Nullable settings;

/**
 Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the interval, in seconds, between status updates. MediaConvert sends an update at this interval from the time the service begins processing your job to the time it completes the transcode or encounters an error.
 */
@property (nonatomic, assign) AWSMediaconvertStatusUpdateInterval statusUpdateInterval;

/**
 The tags that you want to add to the resource. You can tag resources with a key-value pair or with only a key.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSMediaconvertCreateJobTemplateResponse : AWSModel


/**
 A job template is a pre-made set of encoding instructions that you can use to quickly create a job.
 */
@property (nonatomic, strong) AWSMediaconvertJobTemplate * _Nullable jobTemplate;

@end

/**
 
 */
@interface AWSMediaconvertCreatePresetRequest : AWSRequest


/**
 Optional. A category for the preset you are creating.
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 Optional. A description of the preset you are creating.
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 The name of the preset you are creating.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Settings for preset
 */
@property (nonatomic, strong) AWSMediaconvertPresetSettings * _Nullable settings;

/**
 The tags that you want to add to the resource. You can tag resources with a key-value pair or with only a key.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSMediaconvertCreatePresetResponse : AWSModel


/**
 A preset is a collection of preconfigured media conversion settings that you want MediaConvert to apply to the output during the conversion process.
 */
@property (nonatomic, strong) AWSMediaconvertPreset * _Nullable preset;

@end

/**
 
 */
@interface AWSMediaconvertCreateQueueRequest : AWSRequest


/**
 Optional. A description of the queue that you are creating.
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 The name of the queue that you are creating.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Specifies whether the pricing plan for the queue is on-demand or reserved. For on-demand, you pay per minute, billed in increments of .01 minute. For reserved, you pay for the transcoding capacity of the entire queue, regardless of how much or how little you use it. Reserved pricing requires a 12-month commitment. When you use the API to create a queue, the default is on-demand.
 */
@property (nonatomic, assign) AWSMediaconvertPricingPlan pricingPlan;

/**
 Details about the pricing plan for your reserved queue. Required for reserved queues and not applicable to on-demand queues.
 */
@property (nonatomic, strong) AWSMediaconvertReservationPlanSettings * _Nullable reservationPlanSettings;

/**
 Initial state of the queue. If you create a paused queue, then jobs in that queue won't begin.
 */
@property (nonatomic, assign) AWSMediaconvertQueueStatus status;

/**
 The tags that you want to add to the resource. You can tag resources with a key-value pair or with only a key.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSMediaconvertCreateQueueResponse : AWSModel


/**
 You can use queues to manage the resources that are available to your AWS account for running multiple transcoding jobs at the same time. If you don't specify a queue, the service sends all jobs through the default queue. For more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
 */
@property (nonatomic, strong) AWSMediaconvertQueue * _Nullable queue;

@end

/**
 Specify the details for each additional DASH manifest that you want the service to generate for this output group. Each manifest can reference a different subset of outputs in the group.
 */
@interface AWSMediaconvertDashAdditionalManifest : AWSModel


/**
 Specify a name modifier that the service adds to the name of this manifest to make it different from the file names of the other main manifests in the output group. For example, say that the default main manifest for your DASH group is film-name.mpd. If you enter "-no-premium" for this setting, then the file name the service generates for this top-level manifest is film-name-no-premium.mpd.
 */
@property (nonatomic, strong) NSString * _Nullable manifestNameModifier;

/**
 Specify the outputs that you want this additional top-level manifest to reference.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable selectedOutputs;

@end

/**
 Specifies DRM settings for DASH outputs.
 */
@interface AWSMediaconvertDashIsoEncryptionSettings : AWSModel


/**
 This setting can improve the compatibility of your output with video players on obsolete devices. It applies only to DASH H.264 outputs with DRM encryption. Choose Unencrypted SEI (UNENCRYPTED_SEI) only to correct problems with playback on older devices. Otherwise, keep the default setting CENC v1 (CENC_V1). If you choose Unencrypted SEI, for that output, the service will exclude the access unit delimiter and will leave the SEI NAL units unencrypted.
 */
@property (nonatomic, assign) AWSMediaconvertDashIsoPlaybackDeviceCompatibility playbackDeviceCompatibility;

/**
 If your output group type is HLS, DASH, or Microsoft Smooth, use these settings when doing DRM encryption with a SPEKE-compliant key provider.If your output group type is CMAF, use the SpekeKeyProviderCmaf settings instead.
 */
@property (nonatomic, strong) AWSMediaconvertSpekeKeyProvider * _Nullable spekeKeyProvider;

@end

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to DASH_ISO_GROUP_SETTINGS.
 */
@interface AWSMediaconvertDashIsoGroupSettings : AWSModel


/**
 By default, the service creates one .mpd DASH manifest for each DASH ISO output group in your job. This default manifest references every output in the output group. To create additional DASH manifests that reference a subset of the outputs in the output group, specify a list of them here.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertDashAdditionalManifest *> * _Nullable additionalManifests;

/**
 A partial URI prefix that will be put in the manifest (.mpd) file at the top level BaseURL element. Can be used if streams are delivered from a different URL than the manifest file.
 */
@property (nonatomic, strong) NSString * _Nullable baseUrl;

/**
 Use Destination (Destination) to specify the S3 output location and the output filename base. Destination accepts format identifiers. If you do not specify the base filename in the URI, the service will use the filename of the input file. If your job has multiple inputs, the service uses the filename of the first input file.
 */
@property (nonatomic, strong) NSString * _Nullable destination;

/**
 Settings associated with the destination. Will vary based on the type of destination
 */
@property (nonatomic, strong) AWSMediaconvertDestinationSettings * _Nullable destinationSettings;

/**
 DRM settings.
 */
@property (nonatomic, strong) AWSMediaconvertDashIsoEncryptionSettings * _Nullable encryption;

/**
 Length of fragments to generate (in seconds). Fragment length must be compatible with GOP size and Framerate. Note that fragments will end on the next keyframe after this number of seconds, so actual fragment length may be longer. When Emit Single File is checked, the fragmentation is internal to a single output file and it does not cause the creation of many output files as in other output types.
 */
@property (nonatomic, strong) NSNumber * _Nullable fragmentLength;

/**
 Supports HbbTV specification as indicated
 */
@property (nonatomic, assign) AWSMediaconvertDashIsoHbbtvCompliance hbbtvCompliance;

/**
 Minimum time of initially buffered media that is needed to ensure smooth playout.
 */
@property (nonatomic, strong) NSNumber * _Nullable minBufferTime;

/**
 Specify whether your DASH profile is on-demand or main. When you choose Main profile (MAIN_PROFILE), the service signalsurn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you choose On-demand (ON_DEMAND_PROFILE), the service signals urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose On-demand, you must also set the output group setting Segment control (SegmentControl) to Single file (SINGLE_FILE).
 */
@property (nonatomic, assign) AWSMediaconvertDashIsoMpdProfile mpdProfile;

/**
 When set to SINGLE_FILE, a single output file is generated, which is internally segmented using the Fragment Length and Segment Length. When set to SEGMENTED_FILES, separate segment files will be created.
 */
@property (nonatomic, assign) AWSMediaconvertDashIsoSegmentControl segmentControl;

/**
 Length of mpd segments to create (in seconds). Note that segments will end on the next keyframe after this number of seconds, so actual segment length may be longer. When Emit Single File is checked, the segmentation is internal to a single output file and it does not cause the creation of many output files as in other output types.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentLength;

/**
 If you get an HTTP error in the 400 range when you play back your DASH output, enable this setting and run your transcoding job again. When you enable this setting, the service writes precise segment durations in the DASH manifest. The segment duration information appears inside the SegmentTimeline element, inside SegmentTemplate at the Representation level. When you don't enable this setting, the service writes approximate segment durations in your DASH manifest.
 */
@property (nonatomic, assign) AWSMediaconvertDashIsoWriteSegmentTimelineInRepresentation writeSegmentTimelineInRepresentation;

@end

/**
 Settings for deinterlacer
 */
@interface AWSMediaconvertDeinterlacer : AWSModel


/**
 Only applies when you set Deinterlacer (DeinterlaceMode) to Deinterlace (DEINTERLACE) or Adaptive (ADAPTIVE). Motion adaptive interpolate (INTERPOLATE) produces sharper pictures, while blend (BLEND) produces smoother motion. Use (INTERPOLATE_TICKER) OR (BLEND_TICKER) if your source file includes a ticker, such as a scrolling headline at the bottom of the frame.
 */
@property (nonatomic, assign) AWSMediaconvertDeinterlaceAlgorithm algorithm;

/**
 - When set to NORMAL (default), the deinterlacer does not convert frames that are taggedin metadata as progressive. It will only convert those that are tagged as some other type. - When set to FORCE_ALL_FRAMES, the deinterlacer converts every frame to progressive - even those that are already tagged as progressive. Turn Force mode on only if there isa good chance that the metadata has tagged frames as progressive when they are notprogressive. Do not turn on otherwise; processing frames that are already progressiveinto progressive will probably result in lower quality video.
 */
@property (nonatomic, assign) AWSMediaconvertDeinterlacerControl control;

/**
 Use Deinterlacer (DeinterlaceMode) to choose how the service will do deinterlacing. Default is Deinterlace. - Deinterlace converts interlaced to progressive. - Inverse telecine converts Hard Telecine 29.97i to progressive 23.976p. - Adaptive auto-detects and converts to progressive.
 */
@property (nonatomic, assign) AWSMediaconvertDeinterlacerMode mode;

@end

/**
 
 */
@interface AWSMediaconvertDeleteJobTemplateRequest : AWSRequest


/**
 The name of the job template to be deleted.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSMediaconvertDeleteJobTemplateResponse : AWSModel


@end

/**
 
 */
@interface AWSMediaconvertDeletePresetRequest : AWSRequest


/**
 The name of the preset to be deleted.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSMediaconvertDeletePresetResponse : AWSModel


@end

/**
 
 */
@interface AWSMediaconvertDeleteQueueRequest : AWSRequest


/**
 The name of the queue that you want to delete.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSMediaconvertDeleteQueueResponse : AWSModel


@end

/**
 DescribeEndpointsRequest
 */
@interface AWSMediaconvertDescribeEndpointsRequest : AWSRequest


/**
 Optional. Max number of endpoints, up to twenty, that will be returned at one time.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 Optional field, defaults to DEFAULT. Specify DEFAULT for this operation to return your endpoints if any exist, or to create an endpoint for you and return it if one doesn't already exist. Specify GET_ONLY to return your endpoints if any exist, or an empty list if none exist.
 */
@property (nonatomic, assign) AWSMediaconvertDescribeEndpointsMode mode;

/**
 Use this string, provided with the response to a previous request, to request the next batch of endpoints.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSMediaconvertDescribeEndpointsResponse : AWSModel


/**
 List of endpoints
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertEndpoint *> * _Nullable endpoints;

/**
 Use this string to request the next batch of endpoints.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Settings associated with the destination. Will vary based on the type of destination
 */
@interface AWSMediaconvertDestinationSettings : AWSModel


/**
 Settings associated with S3 destination
 */
@property (nonatomic, strong) AWSMediaconvertS3DestinationSettings * _Nullable s3Settings;

@end

/**
 
 */
@interface AWSMediaconvertDisassociateCertificateRequest : AWSRequest


/**
 The ARN of the ACM certificate that you want to disassociate from your MediaConvert resource.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSMediaconvertDisassociateCertificateResponse : AWSModel


@end

/**
 Settings for Dolby Vision
 */
@interface AWSMediaconvertDolbyVision : AWSModel


/**
 Use these settings when you set DolbyVisionLevel6Mode to SPECIFY to override the MaxCLL and MaxFALL values in your input with new values.
 */
@property (nonatomic, strong) AWSMediaconvertDolbyVisionLevel6Metadata * _Nullable l6Metadata;

/**
 Use Dolby Vision Mode to choose how the service will handle Dolby Vision MaxCLL and MaxFALL properies.
 */
@property (nonatomic, assign) AWSMediaconvertDolbyVisionLevel6Mode l6Mode;

/**
 In the current MediaConvert implementation, the Dolby Vision profile is always 5 (PROFILE_5). Therefore, all of your inputs must contain Dolby Vision frame interleaved data.
 */
@property (nonatomic, assign) AWSMediaconvertDolbyVisionProfile profile;

@end

/**
 Use these settings when you set DolbyVisionLevel6Mode to SPECIFY to override the MaxCLL and MaxFALL values in your input with new values.
 */
@interface AWSMediaconvertDolbyVisionLevel6Metadata : AWSModel


/**
 Maximum Content Light Level. Static HDR metadata that corresponds to the brightest pixel in the entire stream. Measured in nits.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCll;

/**
 Maximum Frame-Average Light Level. Static HDR metadata that corresponds to the highest frame-average brightness in the entire stream. Measured in nits.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxFall;

@end

/**
 Inserts DVB Network Information Table (NIT) at the specified table repetition interval.
 */
@interface AWSMediaconvertDvbNitSettings : AWSModel


/**
 The numeric value placed in the Network Information Table (NIT).
 */
@property (nonatomic, strong) NSNumber * _Nullable networkId;

/**
 The network name text placed in the network_name_descriptor inside the Network Information Table. Maximum length is 256 characters.
 */
@property (nonatomic, strong) NSString * _Nullable networkName;

/**
 The number of milliseconds between instances of this table in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable nitInterval;

@end

/**
 Inserts DVB Service Description Table (NIT) at the specified table repetition interval.
 */
@interface AWSMediaconvertDvbSdtSettings : AWSModel


/**
 Selects method of inserting SDT information into output stream."Follow input SDT" copies SDT information from input stream tooutput stream. "Follow input SDT if present" copies SDT information frominput stream to output stream if SDT information is present in the input, otherwise it will fall back on the user-defined values. Enter "SDTManually" means user will enter the SDT information. "No SDT" means outputstream will not contain SDT information.
 */
@property (nonatomic, assign) AWSMediaconvertOutputSdt outputSdt;

/**
 The number of milliseconds between instances of this table in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable sdtInterval;

/**
 The service name placed in the service_descriptor in the Service Description Table. Maximum length is 256 characters.
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

/**
 The service provider name placed in the service_descriptor in the Service Description Table. Maximum length is 256 characters.
 */
@property (nonatomic, strong) NSString * _Nullable serviceProviderName;

@end

/**
 DVB-Sub Destination Settings
 */
@interface AWSMediaconvertDvbSubDestinationSettings : AWSModel


/**
 If no explicit x_position or y_position is provided, setting alignment to centered will place the captions at the bottom center of the output. Similarly, setting a left alignment will align captions to the bottom left of the output. If x and y positions are given in conjunction with the alignment parameter, the font will be justified (either left or centered) relative to those coordinates. This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMediaconvertDvbSubtitleAlignment alignment;

/**
 Specifies the color of the rectangle behind the captions. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMediaconvertDvbSubtitleBackgroundColor backgroundColor;

/**
 Specifies the opacity of the background rectangle. 255 is opaque; 0 is transparent. Leaving this parameter blank is equivalent to setting it to 0 (transparent). All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable backgroundOpacity;

/**
 Specifies the color of the burned-in captions. This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMediaconvertDvbSubtitleFontColor fontColor;

/**
 Specifies the opacity of the burned-in captions. 255 is opaque; 0 is transparent. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontOpacity;

/**
 Font resolution in DPI (dots per inch); default is 96 dpi. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontResolution;

/**
 Provide the font script, using an ISO 15924 script code, if the LanguageCode is not sufficient for determining the script type. Where LanguageCode or CustomLanguageCode is sufficient, use "AUTOMATIC" or leave unset. This is used to help determine the appropriate font for rendering DVB-Sub captions.
 */
@property (nonatomic, assign) AWSMediaconvertFontScript fontScript;

/**
 A positive integer indicates the exact font size in points. Set to 0 for automatic font size selection. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontSize;

/**
 Specifies font outline color. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMediaconvertDvbSubtitleOutlineColor outlineColor;

/**
 Specifies font outline size in pixels. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable outlineSize;

/**
 Specifies the color of the shadow cast by the captions. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSMediaconvertDvbSubtitleShadowColor shadowColor;

/**
 Specifies the opacity of the shadow. 255 is opaque; 0 is transparent. Leaving this parameter blank is equivalent to setting it to 0 (transparent). All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable shadowOpacity;

/**
 Specifies the horizontal offset of the shadow relative to the captions in pixels. A value of -2 would result in a shadow offset 2 pixels to the left. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable shadowXOffset;

/**
 Specifies the vertical offset of the shadow relative to the captions in pixels. A value of -2 would result in a shadow offset 2 pixels above the text. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable shadowYOffset;

/**
 Specify whether your DVB subtitles are standard or for hearing impaired. Choose hearing impaired if your subtitles include audio descriptions and dialogue. Choose standard if your subtitles include only dialogue.
 */
@property (nonatomic, assign) AWSMediaconvertDvbSubtitlingType subtitlingType;

/**
 Only applies to jobs with input captions in Teletext or STL formats. Specify whether the spacing between letters in your captions is set by the captions grid or varies depending on letter width. Choose fixed grid to conform to the spacing specified in the captions file more accurately. Choose proportional to make the text easier to read if the captions are closed caption.
 */
@property (nonatomic, assign) AWSMediaconvertDvbSubtitleTeletextSpacing teletextSpacing;

/**
 Specifies the horizontal position of the caption relative to the left side of the output in pixels. A value of 10 would result in the captions starting 10 pixels from the left of the output. If no explicit x_position is provided, the horizontal caption position will be determined by the alignment parameter. This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable XPosition;

/**
 Specifies the vertical position of the caption relative to the top of the output in pixels. A value of 10 would result in the captions starting 10 pixels from the top of the output. If no explicit y_position is provided, the caption will be positioned towards the bottom of the output. This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable YPosition;

@end

/**
 DVB Sub Source Settings
 */
@interface AWSMediaconvertDvbSubSourceSettings : AWSModel


/**
 When using DVB-Sub with Burn-In or SMPTE-TT, use this PID for the source content. Unused for DVB-Sub passthrough. All DVB-Sub content is passed through, regardless of selectors.
 */
@property (nonatomic, strong) NSNumber * _Nullable pid;

@end

/**
 Inserts DVB Time and Date Table (TDT) at the specified table repetition interval.
 */
@interface AWSMediaconvertDvbTdtSettings : AWSModel


/**
 The number of milliseconds between instances of this table in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable tdtInterval;

@end

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value EAC3_ATMOS.
 */
@interface AWSMediaconvertEac3AtmosSettings : AWSModel


/**
 Specify the average bitrate in bits per second. Valid values: 384k, 448k, 640k, 768k
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For more information about the EAC3 bitstream mode, see ATSC A/52-2012 (Annex E).
 */
@property (nonatomic, assign) AWSMediaconvertEac3AtmosBitstreamMode bitstreamMode;

/**
 The coding mode for Dolby Digital Plus JOC (Atmos) is always 9.1.6 (CODING_MODE_9_1_6).
 */
@property (nonatomic, assign) AWSMediaconvertEac3AtmosCodingMode codingMode;

/**
 Enable Dolby Dialogue Intelligence to adjust loudness based on dialogue analysis.
 */
@property (nonatomic, assign) AWSMediaconvertEac3AtmosDialogueIntelligence dialogueIntelligence;

/**
 Specify the absolute peak level for a signal with dynamic range compression.
 */
@property (nonatomic, assign) AWSMediaconvertEac3AtmosDynamicRangeCompressionLine dynamicRangeCompressionLine;

/**
 Specify how the service limits the audio dynamic range when compressing the audio.
 */
@property (nonatomic, assign) AWSMediaconvertEac3AtmosDynamicRangeCompressionRf dynamicRangeCompressionRf;

/**
 Specify a value for the following Dolby Atmos setting: Left only/Right only center mix (Lo/Ro center). MediaConvert uses this value for downmixing. How the service uses this value depends on the value that you choose for Stereo downmix (Eac3AtmosStereoDownmix). Valid values: 3.0, 1.5, 0.0, -1.5, -3.0, -4.5, and -6.0.
 */
@property (nonatomic, strong) NSNumber * _Nullable loRoCenterMixLevel;

/**
 Specify a value for the following Dolby Atmos setting: Left only/Right only (Lo/Ro surround). MediaConvert uses this value for downmixing. How the service uses this value depends on the value that you choose for Stereo downmix (Eac3AtmosStereoDownmix). Valid values: -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel.
 */
@property (nonatomic, strong) NSNumber * _Nullable loRoSurroundMixLevel;

/**
 Specify a value for the following Dolby Atmos setting: Left total/Right total center mix (Lt/Rt center). MediaConvert uses this value for downmixing. How the service uses this value depends on the value that you choose for Stereo downmix (Eac3AtmosStereoDownmix). Valid values: 3.0, 1.5, 0.0, -1.5, -3.0, -4.5, and -6.0.
 */
@property (nonatomic, strong) NSNumber * _Nullable ltRtCenterMixLevel;

/**
 Specify a value for the following Dolby Atmos setting: Left total/Right total surround mix (Lt/Rt surround). MediaConvert uses this value for downmixing. How the service uses this value depends on the value that you choose for Stereo downmix (Eac3AtmosStereoDownmix). Valid values: -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel.
 */
@property (nonatomic, strong) NSNumber * _Nullable ltRtSurroundMixLevel;

/**
 Choose how the service meters the loudness of your audio.
 */
@property (nonatomic, assign) AWSMediaconvertEac3AtmosMeteringMode meteringMode;

/**
 This value is always 48000. It represents the sample rate in Hz.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

/**
 Specify the percentage of audio content that must be speech before the encoder uses the measured speech loudness as the overall program loudness.
 */
@property (nonatomic, strong) NSNumber * _Nullable speechThreshold;

/**
 Choose how the service does stereo downmixing.
 */
@property (nonatomic, assign) AWSMediaconvertEac3AtmosStereoDownmix stereoDownmix;

/**
 Specify whether your input audio has an additional center rear surround channel matrix encoded into your left and right surround channels.
 */
@property (nonatomic, assign) AWSMediaconvertEac3AtmosSurroundExMode surroundExMode;

@end

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value EAC3.
 */
@interface AWSMediaconvertEac3Settings : AWSModel


/**
 If set to ATTENUATE_3_DB, applies a 3 dB attenuation to the surround channels. Only used for 3/2 coding mode.
 */
@property (nonatomic, assign) AWSMediaconvertEac3AttenuationControl attenuationControl;

/**
 Specify the average bitrate in bits per second. Valid bitrates depend on the coding mode.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For more information about the EAC3 bitstream mode, see ATSC A/52-2012 (Annex E).
 */
@property (nonatomic, assign) AWSMediaconvertEac3BitstreamMode bitstreamMode;

/**
 Dolby Digital Plus coding mode. Determines number of channels.
 */
@property (nonatomic, assign) AWSMediaconvertEac3CodingMode codingMode;

/**
 Activates a DC highpass filter for all input channels.
 */
@property (nonatomic, assign) AWSMediaconvertEac3DcFilter dcFilter;

/**
 Sets the dialnorm for the output. If blank and input audio is Dolby Digital Plus, dialnorm will be passed through.
 */
@property (nonatomic, strong) NSNumber * _Nullable dialnorm;

/**
 Specify the absolute peak level for a signal with dynamic range compression.
 */
@property (nonatomic, assign) AWSMediaconvertEac3DynamicRangeCompressionLine dynamicRangeCompressionLine;

/**
 Specify how the service limits the audio dynamic range when compressing the audio.
 */
@property (nonatomic, assign) AWSMediaconvertEac3DynamicRangeCompressionRf dynamicRangeCompressionRf;

/**
 When encoding 3/2 audio, controls whether the LFE channel is enabled
 */
@property (nonatomic, assign) AWSMediaconvertEac3LfeControl lfeControl;

/**
 Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid with 3_2_LFE coding mode.
 */
@property (nonatomic, assign) AWSMediaconvertEac3LfeFilter lfeFilter;

/**
 Specify a value for the following Dolby Digital Plus setting: Left only/Right only center mix (Lo/Ro center). MediaConvert uses this value for downmixing. How the service uses this value depends on the value that you choose for Stereo downmix (Eac3StereoDownmix). Valid values: 3.0, 1.5, 0.0, -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel. This setting applies only if you keep the default value of 3/2 - L, R, C, Ls, Rs (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you choose a different value for Coding mode, the service ignores Left only/Right only center (loRoCenterMixLevel).
 */
@property (nonatomic, strong) NSNumber * _Nullable loRoCenterMixLevel;

/**
 Specify a value for the following Dolby Digital Plus setting: Left only/Right only (Lo/Ro surround). MediaConvert uses this value for downmixing. How the service uses this value depends on the value that you choose for Stereo downmix (Eac3StereoDownmix). Valid values: -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel. This setting applies only if you keep the default value of 3/2 - L, R, C, Ls, Rs (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you choose a different value for Coding mode, the service ignores Left only/Right only surround (loRoSurroundMixLevel).
 */
@property (nonatomic, strong) NSNumber * _Nullable loRoSurroundMixLevel;

/**
 Specify a value for the following Dolby Digital Plus setting: Left total/Right total center mix (Lt/Rt center). MediaConvert uses this value for downmixing. How the service uses this value depends on the value that you choose for Stereo downmix (Eac3StereoDownmix). Valid values: 3.0, 1.5, 0.0, -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel. This setting applies only if you keep the default value of 3/2 - L, R, C, Ls, Rs (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you choose a different value for Coding mode, the service ignores Left total/Right total center (ltRtCenterMixLevel).
 */
@property (nonatomic, strong) NSNumber * _Nullable ltRtCenterMixLevel;

/**
 Specify a value for the following Dolby Digital Plus setting: Left total/Right total surround mix (Lt/Rt surround). MediaConvert uses this value for downmixing. How the service uses this value depends on the value that you choose for Stereo downmix (Eac3StereoDownmix). Valid values: -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel. This setting applies only if you keep the default value of 3/2 - L, R, C, Ls, Rs (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you choose a different value for Coding mode, the service ignores Left total/Right total surround (ltRtSurroundMixLevel).
 */
@property (nonatomic, strong) NSNumber * _Nullable ltRtSurroundMixLevel;

/**
 When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+, or DolbyE decoder that supplied this audio data. If audio was not supplied from one of these streams, then the static metadata settings will be used.
 */
@property (nonatomic, assign) AWSMediaconvertEac3MetadataControl metadataControl;

/**
 When set to WHEN_POSSIBLE, input DD+ audio will be passed through if it is present on the input. this detection is dynamic over the life of the transcode. Inputs that alternate between DD+ and non-DD+ content will have a consistent DD+ output as the system alternates between passthrough and encoding.
 */
@property (nonatomic, assign) AWSMediaconvertEac3PassthroughControl passthroughControl;

/**
 Controls the amount of phase-shift applied to the surround channels. Only used for 3/2 coding mode.
 */
@property (nonatomic, assign) AWSMediaconvertEac3PhaseControl phaseControl;

/**
 This value is always 48000. It represents the sample rate in Hz.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

/**
 Choose how the service does stereo downmixing. This setting only applies if you keep the default value of 3/2 - L, R, C, Ls, Rs (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you choose a different value for Coding mode, the service ignores Stereo downmix (Eac3StereoDownmix).
 */
@property (nonatomic, assign) AWSMediaconvertEac3StereoDownmix stereoDownmix;

/**
 When encoding 3/2 audio, sets whether an extra center back surround channel is matrix encoded into the left and right surround channels.
 */
@property (nonatomic, assign) AWSMediaconvertEac3SurroundExMode surroundExMode;

/**
 When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded into the two channels.
 */
@property (nonatomic, assign) AWSMediaconvertEac3SurroundMode surroundMode;

@end

/**
 Settings specific to embedded/ancillary caption outputs, including 608/708 Channel destination number.
 */
@interface AWSMediaconvertEmbeddedDestinationSettings : AWSModel


/**
 Ignore this setting unless your input captions are SCC format and your output captions are embedded in the video stream. Specify a CC number for each captions channel in this output. If you have two channels, choose CC numbers that aren't in the same field. For example, choose 1 and 3. For more information, see https://docs.aws.amazon.com/console/mediaconvert/dual-scc-to-embedded.
 */
@property (nonatomic, strong) NSNumber * _Nullable destination608ChannelNumber;

/**
 Ignore this setting unless your input captions are SCC format and you want both 608 and 708 captions embedded in your output stream. Optionally, specify the 708 service number for each output captions channel. Choose a different number for each channel. To use this setting, also set Force 608 to 708 upconvert (Convert608To708) to Upconvert (UPCONVERT) in your input captions selector settings. If you choose to upconvert but don't specify a 708 service number, MediaConvert uses the number that you specify for CC channel number (destination608ChannelNumber) for the 708 service number. For more information, see https://docs.aws.amazon.com/console/mediaconvert/dual-scc-to-embedded.
 */
@property (nonatomic, strong) NSNumber * _Nullable destination708ServiceNumber;

@end

/**
 Settings for embedded captions Source
 */
@interface AWSMediaconvertEmbeddedSourceSettings : AWSModel


/**
 Specify whether this set of input captions appears in your outputs in both 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert includes the captions data in two ways: it passes the 608 data through using the 608 compatibility bytes fields of the 708 wrapper, and it also translates the 608 data into 708.
 */
@property (nonatomic, assign) AWSMediaconvertEmbeddedConvert608To708 convert608To708;

/**
 Specifies the 608/708 channel number within the video track from which to extract captions. Unused for passthrough.
 */
@property (nonatomic, strong) NSNumber * _Nullable source608ChannelNumber;

/**
 Specifies the video track index used for extracting captions. The system only supports one input video track, so this should always be set to '1'.
 */
@property (nonatomic, strong) NSNumber * _Nullable source608TrackNumber;

/**
 By default, the service terminates any unterminated captions at the end of each input. If you want the caption to continue onto your next input, disable this setting.
 */
@property (nonatomic, assign) AWSMediaconvertEmbeddedTerminateCaptions terminateCaptions;

@end

/**
 Describes an account-specific API endpoint.
 */
@interface AWSMediaconvertEndpoint : AWSModel


/**
 URL of endpoint
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 ESAM ManifestConfirmConditionNotification defined by OC-SP-ESAM-API-I03-131025.
 */
@interface AWSMediaconvertEsamManifestConfirmConditionNotification : AWSModel


/**
 Provide your ESAM ManifestConfirmConditionNotification XML document inside your JSON job settings. Form the XML document as per OC-SP-ESAM-API-I03-131025. The transcoder will use the Manifest Conditioning instructions in the message that you supply.
 */
@property (nonatomic, strong) NSString * _Nullable mccXml;

@end

/**
 Settings for Event Signaling And Messaging (ESAM). If you don't do ad insertion, you can ignore these settings.
 */
@interface AWSMediaconvertEsamSettings : AWSModel


/**
 Specifies an ESAM ManifestConfirmConditionNotification XML as per OC-SP-ESAM-API-I03-131025. The transcoder uses the manifest conditioning instructions that you provide in the setting MCC XML (mccXml).
 */
@property (nonatomic, strong) AWSMediaconvertEsamManifestConfirmConditionNotification * _Nullable manifestConfirmConditionNotification;

/**
 Specifies the stream distance, in milliseconds, between the SCTE 35 messages that the transcoder places and the splice points that they refer to. If the time between the start of the asset and the SCTE-35 message is less than this value, then the transcoder places the SCTE-35 marker at the beginning of the stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable responseSignalPreroll;

/**
 Specifies an ESAM SignalProcessingNotification XML as per OC-SP-ESAM-API-I03-131025. The transcoder uses the signal processing instructions that you provide in the setting SCC XML (sccXml).
 */
@property (nonatomic, strong) AWSMediaconvertEsamSignalProcessingNotification * _Nullable signalProcessingNotification;

@end

/**
 ESAM SignalProcessingNotification data defined by OC-SP-ESAM-API-I03-131025.
 */
@interface AWSMediaconvertEsamSignalProcessingNotification : AWSModel


/**
 Provide your ESAM SignalProcessingNotification XML document inside your JSON job settings. Form the XML document as per OC-SP-ESAM-API-I03-131025. The transcoder will use the signal processing instructions in the message that you supply. Provide your ESAM SignalProcessingNotification XML document inside your JSON job settings. For your MPEG2-TS file outputs, if you want the service to place SCTE-35 markers at the insertion points you specify in the XML document, you must also enable SCTE-35 ESAM (scte35Esam). Note that you can either specify an ESAM XML document or enable SCTE-35 passthrough. You can't do both.
 */
@property (nonatomic, strong) NSString * _Nullable sccXml;

@end

/**
 
 */
@interface AWSMediaconvertExceptionBody : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Settings for F4v container
 */
@interface AWSMediaconvertF4vSettings : AWSModel


/**
 If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the beginning of the archive as required for progressive downloading. Otherwise it is placed normally at the end.
 */
@property (nonatomic, assign) AWSMediaconvertF4vMoovPlacement moovPlacement;

@end

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to FILE_GROUP_SETTINGS.
 */
@interface AWSMediaconvertFileGroupSettings : AWSModel


/**
 Use Destination (Destination) to specify the S3 output location and the output filename base. Destination accepts format identifiers. If you do not specify the base filename in the URI, the service will use the filename of the input file. If your job has multiple inputs, the service uses the filename of the first input file.
 */
@property (nonatomic, strong) NSString * _Nullable destination;

/**
 Settings associated with the destination. Will vary based on the type of destination
 */
@property (nonatomic, strong) AWSMediaconvertDestinationSettings * _Nullable destinationSettings;

@end

/**
 If your input captions are SCC, SMI, SRT, STL, TTML, or IMSC 1.1 in an xml file, specify the URI of the input caption source file. If your caption source is IMSC in an IMF package, use TrackSourceSettings instead of FileSoureSettings.
 */
@interface AWSMediaconvertFileSourceSettings : AWSModel


/**
 Specify whether this set of input captions appears in your outputs in both 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert includes the captions data in two ways: it passes the 608 data through using the 608 compatibility bytes fields of the 708 wrapper, and it also translates the 608 data into 708.
 */
@property (nonatomic, assign) AWSMediaconvertFileSourceConvert608To708 convert608To708;

/**
 Ignore this setting unless your input captions format is SCC. To have the service compensate for differing frame rates between your input captions and input video, specify the frame rate of the captions file. Specify this value as a fraction, using the settings Framerate numerator (framerateNumerator) and Framerate denominator (framerateDenominator). For example, you might specify 24 / 1 for 24 fps, 25 / 1 for 25 fps, 24000 / 1001 for 23.976 fps, or 30000 / 1001 for 29.97 fps.
 */
@property (nonatomic, strong) AWSMediaconvertCaptionSourceFramerate * _Nullable framerate;

/**
 External caption file used for loading captions. Accepted file extensions are 'scc', 'ttml', 'dfxp', 'stl', 'srt', 'xml', and 'smi'.
 */
@property (nonatomic, strong) NSString * _Nullable sourceFile;

/**
 Specifies a time delta in seconds to offset the captions from the source file.
 */
@property (nonatomic, strong) NSNumber * _Nullable timeDelta;

@end

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value FRAME_CAPTURE.
 */
@interface AWSMediaconvertFrameCaptureSettings : AWSModel


/**
 Frame capture will encode the first frame of the output stream, then one frame every framerateDenominator/framerateNumerator seconds. For example, settings of framerateNumerator = 1 and framerateDenominator = 3 (a rate of 1/3 frame per second) will capture the first frame, then 1 frame every 3s. Files will be named as filename.n.jpg where n is the 0-based sequence number of each Capture.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 Frame capture will encode the first frame of the output stream, then one frame every framerateDenominator/framerateNumerator seconds. For example, settings of framerateNumerator = 1 and framerateDenominator = 3 (a rate of 1/3 frame per second) will capture the first frame, then 1 frame every 3s. Files will be named as filename.NNNNNNN.jpg where N is the 0-based frame sequence number zero padded to 7 decimal places.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

/**
 Maximum number of captures (encoded jpg output files).
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCaptures;

/**
 JPEG Quality - a higher value equals higher quality.
 */
@property (nonatomic, strong) NSNumber * _Nullable quality;

@end

/**
 
 */
@interface AWSMediaconvertGetJobRequest : AWSRequest


/**
 the job ID of the job.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSMediaconvertGetJobResponse : AWSModel


/**
 Each job converts an input file into an output file or files. For more information, see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 */
@property (nonatomic, strong) AWSMediaconvertJob * _Nullable job;

@end

/**
 
 */
@interface AWSMediaconvertGetJobTemplateRequest : AWSRequest


/**
 The name of the job template.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSMediaconvertGetJobTemplateResponse : AWSModel


/**
 A job template is a pre-made set of encoding instructions that you can use to quickly create a job.
 */
@property (nonatomic, strong) AWSMediaconvertJobTemplate * _Nullable jobTemplate;

@end

/**
 
 */
@interface AWSMediaconvertGetPresetRequest : AWSRequest


/**
 The name of the preset.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSMediaconvertGetPresetResponse : AWSModel


/**
 A preset is a collection of preconfigured media conversion settings that you want MediaConvert to apply to the output during the conversion process.
 */
@property (nonatomic, strong) AWSMediaconvertPreset * _Nullable preset;

@end

/**
 
 */
@interface AWSMediaconvertGetQueueRequest : AWSRequest


/**
 The name of the queue that you want information about.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSMediaconvertGetQueueResponse : AWSModel


/**
 You can use queues to manage the resources that are available to your AWS account for running multiple transcoding jobs at the same time. If you don't specify a queue, the service sends all jobs through the default queue. For more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
 */
@property (nonatomic, strong) AWSMediaconvertQueue * _Nullable queue;

@end

/**
 Settings for quality-defined variable bitrate encoding with the H.264 codec. Required when you set Rate control mode to QVBR. Not valid when you set Rate control mode to a value other than QVBR, or when you don't define Rate control mode.
 */
@interface AWSMediaconvertH264QvbrSettings : AWSModel


/**
 Use this setting only when Rate control mode is QVBR and Quality tuning level is Multi-pass HQ. For Max average bitrate values suited to the complexity of your input video, the service limits the average bitrate of the video part of this output to the value that you choose. That is, the total size of the video element is less than or equal to the value you set multiplied by the number of seconds of encoded output.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAverageBitrate;

/**
 Required when you use QVBR rate control mode. That is, when you specify qvbrSettings within h264Settings. Specify the general target quality level for this output, from 1 to 10. Use higher numbers for greater quality. Level 10 results in nearly lossless compression. The quality level for most broadcast-quality transcodes is between 6 and 9. Optionally, to specify a value between whole numbers, also provide a value for the setting qvbrQualityLevelFineTune. For example, if you want your QVBR quality level to be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33.
 */
@property (nonatomic, strong) NSNumber * _Nullable qvbrQualityLevel;

/**
 Optional. Specify a value here to set the QVBR quality to a level that is between whole numbers. For example, if you want your QVBR quality level to be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33. MediaConvert rounds your QVBR quality level to the nearest third of a whole number. For example, if you set qvbrQualityLevel to 7 and you set qvbrQualityLevelFineTune to .25, your actual QVBR quality level is 7.33.
 */
@property (nonatomic, strong) NSNumber * _Nullable qvbrQualityLevelFineTune;

@end

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value H_264.
 */
@interface AWSMediaconvertH264Settings : AWSModel


/**
 Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.
 */
@property (nonatomic, assign) AWSMediaconvertH264AdaptiveQuantization adaptiveQuantization;

/**
 Specify the average bitrate in bits per second. Required for VBR and CBR. For MS Smooth outputs, bitrates must be unique when rounded down to the nearest multiple of 1000.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specify an H.264 level that is consistent with your output video settings. If you aren't sure what level to specify, choose Auto (AUTO).
 */
@property (nonatomic, assign) AWSMediaconvertH264CodecLevel codecLevel;

/**
 H.264 Profile. High 4:2:2 and 10-bit profiles are only available with the AVC-I License.
 */
@property (nonatomic, assign) AWSMediaconvertH264CodecProfile codecProfile;

/**
 Choose Adaptive to improve subjective video quality for high-motion content. This will cause the service to use fewer B-frames (which infer information based on other frames) for high-motion portions of the video and more B-frames for low-motion portions. The maximum number of B-frames is limited by the value you provide for the setting B frames between reference frames (numberBFramesBetweenReferenceFrames).
 */
@property (nonatomic, assign) AWSMediaconvertH264DynamicSubGop dynamicSubGop;

/**
 Entropy encoding mode. Use CABAC (must be in Main or High profile) or CAVLC.
 */
@property (nonatomic, assign) AWSMediaconvertH264EntropyEncoding entropyEncoding;

/**
 Choosing FORCE_FIELD disables PAFF encoding for interlaced outputs.
 */
@property (nonatomic, assign) AWSMediaconvertH264FieldEncoding fieldEncoding;

/**
 Adjust quantization within each frame to reduce flicker or 'pop' on I-frames.
 */
@property (nonatomic, assign) AWSMediaconvertH264FlickerAdaptiveQuantization flickerAdaptiveQuantization;

/**
 If you are using the console, use the Framerate setting to specify the frame rate for this output. If you want to keep the same frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction. If you are creating your transcoding job specification as a JSON file without the console, use FramerateControl to specify which value the service uses for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the settings FramerateNumerator and FramerateDenominator.
 */
@property (nonatomic, assign) AWSMediaconvertH264FramerateControl framerateControl;

/**
 Optional. Specify how the transcoder performs framerate conversion. The default behavior is to use duplicate drop conversion.
 */
@property (nonatomic, assign) AWSMediaconvertH264FramerateConversionAlgorithm framerateConversionAlgorithm;

/**
 When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a fraction. For example,24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When you use the console for transcode jobs that use frame rate conversion, provide the value as a decimal number for Framerate. In this example, specify 23.976.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 Frame rate numerator - frame rate is a fraction, e.g. 24000 / 1001 = 23.976 fps.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

/**
 If enable, use reference B frames for GOP structures that have B frames > 1.
 */
@property (nonatomic, assign) AWSMediaconvertH264GopBReference gopBReference;

/**
 Frequency of closed GOPs. In streaming applications, it is recommended that this be set to 1 so a decoder joining mid-stream will receive an IDR frame as quickly as possible. Setting this value to 0 will break output segmenting.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopClosedCadence;

/**
 GOP Length (keyframe interval) in frames or seconds. Must be greater than zero.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopSize;

/**
 Indicates if the GOP Size in H264 is specified in frames or seconds. If seconds the system will convert the GOP Size into a frame count at run time.
 */
@property (nonatomic, assign) AWSMediaconvertH264GopSizeUnits gopSizeUnits;

/**
 Percentage of the buffer that should initially be filled (HRD buffer model).
 */
@property (nonatomic, strong) NSNumber * _Nullable hrdBufferInitialFillPercentage;

/**
 Size of buffer (HRD buffer model) in bits. For example, enter five megabits as 5000000.
 */
@property (nonatomic, strong) NSNumber * _Nullable hrdBufferSize;

/**
 Use Interlace mode (InterlaceMode) to choose the scan line type for the output. * Top Field First (TOP_FIELD) and Bottom Field First (BOTTOM_FIELD) produce interlaced output with the entire output having the same field polarity (top or bottom first). * Follow, Default Top (FOLLOW_TOP_FIELD) and Follow, Default Bottom (FOLLOW_BOTTOM_FIELD) use the same field polarity as the source. Therefore, behavior depends on the input scan type, as follows. - If the source is interlaced, the output will be interlaced with the same polarity as the source (it will follow the source). The output could therefore be a mix of "top field first" and "bottom field first". - If the source is progressive, the output will be interlaced with "top field first" or "bottom field first" polarity, depending on which of the Follow options you chose.
 */
@property (nonatomic, assign) AWSMediaconvertH264InterlaceMode interlaceMode;

/**
 Maximum bitrate in bits/second. For example, enter five megabits per second as 5000000. Required when Rate control mode is QVBR.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxBitrate;

/**
 Enforces separation between repeated (cadence) I-frames and I-frames inserted by Scene Change Detection. If a scene change I-frame is within I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched to the scene change I-frame. GOP stretch requires enabling lookahead as well as setting I-interval. The normal cadence resumes for the next GOP. This setting is only used when Scene Change Detect is enabled. Note: Maximum GOP stretch = GOP size + Min-I-interval - 1
 */
@property (nonatomic, strong) NSNumber * _Nullable minIInterval;

/**
 Number of B-frames between reference frames.
 */
@property (nonatomic, strong) NSNumber * _Nullable numberBFramesBetweenReferenceFrames;

/**
 Number of reference frames to use. The encoder may use more than requested if using B-frames and/or interlaced encoding.
 */
@property (nonatomic, strong) NSNumber * _Nullable numberReferenceFrames;

/**
 Optional. Specify how the service determines the pixel aspect ratio (PAR) for this output. The default behavior, Follow source (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your output. To specify a different PAR in the console, choose any value other than Follow source. To specify a different PAR by editing the JSON job specification, choose SPECIFIED. When you choose SPECIFIED for this setting, you must also specify values for the parNumerator and parDenominator settings.
 */
@property (nonatomic, assign) AWSMediaconvertH264ParControl parControl;

/**
 Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the console, this corresponds to any value other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen, you would specify the ratio 40:33. In this example, the value for parDenominator is 33.
 */
@property (nonatomic, strong) NSNumber * _Nullable parDenominator;

/**
 Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the console, this corresponds to any value other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen, you would specify the ratio 40:33. In this example, the value for parNumerator is 40.
 */
@property (nonatomic, strong) NSNumber * _Nullable parNumerator;

/**
 Optional. Use Quality tuning level (qualityTuningLevel) to choose how you want to trade off encoding speed for output video quality. The default behavior is faster, lower quality, single-pass encoding.
 */
@property (nonatomic, assign) AWSMediaconvertH264QualityTuningLevel qualityTuningLevel;

/**
 Settings for quality-defined variable bitrate encoding with the H.264 codec. Required when you set Rate control mode to QVBR. Not valid when you set Rate control mode to a value other than QVBR, or when you don't define Rate control mode.
 */
@property (nonatomic, strong) AWSMediaconvertH264QvbrSettings * _Nullable qvbrSettings;

/**
 Use this setting to specify whether this output has a variable bitrate (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
 */
@property (nonatomic, assign) AWSMediaconvertH264RateControlMode rateControlMode;

/**
 Places a PPS header on each encoded picture, even if repeated.
 */
@property (nonatomic, assign) AWSMediaconvertH264RepeatPps repeatPps;

/**
 Enable this setting to insert I-frames at scene changes that the service automatically detects. This improves video quality and is enabled by default. If this output uses QVBR, choose Transition detection (TRANSITION_DETECTION) for further video quality improvement. For more information about QVBR, see https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
 */
@property (nonatomic, assign) AWSMediaconvertH264SceneChangeDetect sceneChangeDetect;

/**
 Number of slices per picture. Must be less than or equal to the number of macroblock rows for progressive pictures, and less than or equal to half the number of macroblock rows for interlaced pictures.
 */
@property (nonatomic, strong) NSNumber * _Nullable slices;

/**
 Enables Slow PAL rate conversion. 23.976fps and 24fps input is relabeled as 25fps, and audio is sped up correspondingly.
 */
@property (nonatomic, assign) AWSMediaconvertH264SlowPal slowPal;

/**
 Softness. Selects quantizer matrix, larger values reduce high-frequency content in the encoded image.
 */
@property (nonatomic, strong) NSNumber * _Nullable softness;

/**
 Adjust quantization within each frame based on spatial variation of content complexity.
 */
@property (nonatomic, assign) AWSMediaconvertH264SpatialAdaptiveQuantization spatialAdaptiveQuantization;

/**
 Produces a bitstream compliant with SMPTE RP-2027.
 */
@property (nonatomic, assign) AWSMediaconvertH264Syntax syntax;

/**
 This field applies only if the Streams > Advanced > Framerate (framerate) fieldis set to 29.970. This field works with the Streams > Advanced > Preprocessors > Deinterlacerfield (deinterlace_mode) and the Streams > Advanced > Interlaced Mode field (interlace_mode)to identify the scan type for the output: Progressive, Interlaced, Hard Telecine or Soft Telecine. - Hard: produces 29.97i output from 23.976 input. - Soft: produces 23.976; the player converts this output to 29.97i.
 */
@property (nonatomic, assign) AWSMediaconvertH264Telecine telecine;

/**
 Adjust quantization within each frame based on temporal variation of content complexity.
 */
@property (nonatomic, assign) AWSMediaconvertH264TemporalAdaptiveQuantization temporalAdaptiveQuantization;

/**
 Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
 */
@property (nonatomic, assign) AWSMediaconvertH264UnregisteredSeiTimecode unregisteredSeiTimecode;

@end

/**
 Settings for quality-defined variable bitrate encoding with the H.265 codec. Required when you set Rate control mode to QVBR. Not valid when you set Rate control mode to a value other than QVBR, or when you don't define Rate control mode.
 */
@interface AWSMediaconvertH265QvbrSettings : AWSModel


/**
 Use this setting only when Rate control mode is QVBR and Quality tuning level is Multi-pass HQ. For Max average bitrate values suited to the complexity of your input video, the service limits the average bitrate of the video part of this output to the value that you choose. That is, the total size of the video element is less than or equal to the value you set multiplied by the number of seconds of encoded output.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAverageBitrate;

/**
 Required when you use QVBR rate control mode. That is, when you specify qvbrSettings within h265Settings. Specify the general target quality level for this output, from 1 to 10. Use higher numbers for greater quality. Level 10 results in nearly lossless compression. The quality level for most broadcast-quality transcodes is between 6 and 9. Optionally, to specify a value between whole numbers, also provide a value for the setting qvbrQualityLevelFineTune. For example, if you want your QVBR quality level to be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33.
 */
@property (nonatomic, strong) NSNumber * _Nullable qvbrQualityLevel;

/**
 Optional. Specify a value here to set the QVBR quality to a level that is between whole numbers. For example, if you want your QVBR quality level to be 7.33, set qvbrQualityLevel to 7 and set qvbrQualityLevelFineTune to .33. MediaConvert rounds your QVBR quality level to the nearest third of a whole number. For example, if you set qvbrQualityLevel to 7 and you set qvbrQualityLevelFineTune to .25, your actual QVBR quality level is 7.33.
 */
@property (nonatomic, strong) NSNumber * _Nullable qvbrQualityLevelFineTune;

@end

/**
 Settings for H265 codec
 */
@interface AWSMediaconvertH265Settings : AWSModel


/**
 Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.
 */
@property (nonatomic, assign) AWSMediaconvertH265AdaptiveQuantization adaptiveQuantization;

/**
 Enables Alternate Transfer Function SEI message for outputs using Hybrid Log Gamma (HLG) Electro-Optical Transfer Function (EOTF).
 */
@property (nonatomic, assign) AWSMediaconvertH265AlternateTransferFunctionSei alternateTransferFunctionSei;

/**
 Specify the average bitrate in bits per second. Required for VBR and CBR. For MS Smooth outputs, bitrates must be unique when rounded down to the nearest multiple of 1000.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 H.265 Level.
 */
@property (nonatomic, assign) AWSMediaconvertH265CodecLevel codecLevel;

/**
 Represents the Profile and Tier, per the HEVC (H.265) specification. Selections are grouped as [Profile] / [Tier], so "Main/High" represents Main Profile with High Tier. 4:2:2 profiles are only available with the HEVC 4:2:2 License.
 */
@property (nonatomic, assign) AWSMediaconvertH265CodecProfile codecProfile;

/**
 Choose Adaptive to improve subjective video quality for high-motion content. This will cause the service to use fewer B-frames (which infer information based on other frames) for high-motion portions of the video and more B-frames for low-motion portions. The maximum number of B-frames is limited by the value you provide for the setting B frames between reference frames (numberBFramesBetweenReferenceFrames).
 */
@property (nonatomic, assign) AWSMediaconvertH265DynamicSubGop dynamicSubGop;

/**
 Adjust quantization within each frame to reduce flicker or 'pop' on I-frames.
 */
@property (nonatomic, assign) AWSMediaconvertH265FlickerAdaptiveQuantization flickerAdaptiveQuantization;

/**
 If you are using the console, use the Framerate setting to specify the frame rate for this output. If you want to keep the same frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction. If you are creating your transcoding job specification as a JSON file without the console, use FramerateControl to specify which value the service uses for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the settings FramerateNumerator and FramerateDenominator.
 */
@property (nonatomic, assign) AWSMediaconvertH265FramerateControl framerateControl;

/**
 Optional. Specify how the transcoder performs framerate conversion. The default behavior is to use duplicate drop conversion.
 */
@property (nonatomic, assign) AWSMediaconvertH265FramerateConversionAlgorithm framerateConversionAlgorithm;

/**
 Frame rate denominator.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 Frame rate numerator - frame rate is a fraction, e.g. 24000 / 1001 = 23.976 fps.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

/**
 If enable, use reference B frames for GOP structures that have B frames > 1.
 */
@property (nonatomic, assign) AWSMediaconvertH265GopBReference gopBReference;

/**
 Frequency of closed GOPs. In streaming applications, it is recommended that this be set to 1 so a decoder joining mid-stream will receive an IDR frame as quickly as possible. Setting this value to 0 will break output segmenting.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopClosedCadence;

/**
 GOP Length (keyframe interval) in frames or seconds. Must be greater than zero.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopSize;

/**
 Indicates if the GOP Size in H265 is specified in frames or seconds. If seconds the system will convert the GOP Size into a frame count at run time.
 */
@property (nonatomic, assign) AWSMediaconvertH265GopSizeUnits gopSizeUnits;

/**
 Percentage of the buffer that should initially be filled (HRD buffer model).
 */
@property (nonatomic, strong) NSNumber * _Nullable hrdBufferInitialFillPercentage;

/**
 Size of buffer (HRD buffer model) in bits. For example, enter five megabits as 5000000.
 */
@property (nonatomic, strong) NSNumber * _Nullable hrdBufferSize;

/**
 Choose the scan line type for the output. Choose Progressive (PROGRESSIVE) to create a progressive output, regardless of the scan type of your input. Choose Top Field First (TOP_FIELD) or Bottom Field First (BOTTOM_FIELD) to create an output that's interlaced with the same field polarity throughout. Choose Follow, Default Top (FOLLOW_TOP_FIELD) or Follow, Default Bottom (FOLLOW_BOTTOM_FIELD) to create an interlaced output with the same field polarity as the source. If the source is interlaced, the output will be interlaced with the same polarity as the source (it will follow the source). The output could therefore be a mix of "top field first" and "bottom field first". If the source is progressive, your output will be interlaced with "top field first" or "bottom field first" polarity, depending on which of the Follow options you chose. If you don't choose a value, the service will default to Progressive (PROGRESSIVE).
 */
@property (nonatomic, assign) AWSMediaconvertH265InterlaceMode interlaceMode;

/**
 Maximum bitrate in bits/second. For example, enter five megabits per second as 5000000. Required when Rate control mode is QVBR.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxBitrate;

/**
 Enforces separation between repeated (cadence) I-frames and I-frames inserted by Scene Change Detection. If a scene change I-frame is within I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched to the scene change I-frame. GOP stretch requires enabling lookahead as well as setting I-interval. The normal cadence resumes for the next GOP. This setting is only used when Scene Change Detect is enabled. Note: Maximum GOP stretch = GOP size + Min-I-interval - 1
 */
@property (nonatomic, strong) NSNumber * _Nullable minIInterval;

/**
 Number of B-frames between reference frames.
 */
@property (nonatomic, strong) NSNumber * _Nullable numberBFramesBetweenReferenceFrames;

/**
 Number of reference frames to use. The encoder may use more than requested if using B-frames and/or interlaced encoding.
 */
@property (nonatomic, strong) NSNumber * _Nullable numberReferenceFrames;

/**
 Optional. Specify how the service determines the pixel aspect ratio (PAR) for this output. The default behavior, Follow source (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your output. To specify a different PAR in the console, choose any value other than Follow source. To specify a different PAR by editing the JSON job specification, choose SPECIFIED. When you choose SPECIFIED for this setting, you must also specify values for the parNumerator and parDenominator settings.
 */
@property (nonatomic, assign) AWSMediaconvertH265ParControl parControl;

/**
 Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the console, this corresponds to any value other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen, you would specify the ratio 40:33. In this example, the value for parDenominator is 33.
 */
@property (nonatomic, strong) NSNumber * _Nullable parDenominator;

/**
 Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the console, this corresponds to any value other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen, you would specify the ratio 40:33. In this example, the value for parNumerator is 40.
 */
@property (nonatomic, strong) NSNumber * _Nullable parNumerator;

/**
 Optional. Use Quality tuning level (qualityTuningLevel) to choose how you want to trade off encoding speed for output video quality. The default behavior is faster, lower quality, single-pass encoding.
 */
@property (nonatomic, assign) AWSMediaconvertH265QualityTuningLevel qualityTuningLevel;

/**
 Settings for quality-defined variable bitrate encoding with the H.265 codec. Required when you set Rate control mode to QVBR. Not valid when you set Rate control mode to a value other than QVBR, or when you don't define Rate control mode.
 */
@property (nonatomic, strong) AWSMediaconvertH265QvbrSettings * _Nullable qvbrSettings;

/**
 Use this setting to specify whether this output has a variable bitrate (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
 */
@property (nonatomic, assign) AWSMediaconvertH265RateControlMode rateControlMode;

/**
 Specify Sample Adaptive Offset (SAO) filter strength.Adaptive mode dynamically selects best strength based on content
 */
@property (nonatomic, assign) AWSMediaconvertH265SampleAdaptiveOffsetFilterMode sampleAdaptiveOffsetFilterMode;

/**
 Enable this setting to insert I-frames at scene changes that the service automatically detects. This improves video quality and is enabled by default. If this output uses QVBR, choose Transition detection (TRANSITION_DETECTION) for further video quality improvement. For more information about QVBR, see https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
 */
@property (nonatomic, assign) AWSMediaconvertH265SceneChangeDetect sceneChangeDetect;

/**
 Number of slices per picture. Must be less than or equal to the number of macroblock rows for progressive pictures, and less than or equal to half the number of macroblock rows for interlaced pictures.
 */
@property (nonatomic, strong) NSNumber * _Nullable slices;

/**
 Enables Slow PAL rate conversion. 23.976fps and 24fps input is relabeled as 25fps, and audio is sped up correspondingly.
 */
@property (nonatomic, assign) AWSMediaconvertH265SlowPal slowPal;

/**
 Adjust quantization within each frame based on spatial variation of content complexity.
 */
@property (nonatomic, assign) AWSMediaconvertH265SpatialAdaptiveQuantization spatialAdaptiveQuantization;

/**
 This field applies only if the Streams > Advanced > Framerate (framerate) fieldis set to 29.970. This field works with the Streams > Advanced > Preprocessors > Deinterlacerfield (deinterlace_mode) and the Streams > Advanced > Interlaced Mode field (interlace_mode)to identify the scan type for the output: Progressive, Interlaced, Hard Telecine or Soft Telecine. - Hard: produces 29.97i output from 23.976 input. - Soft: produces 23.976; the player converts this output to 29.97i.
 */
@property (nonatomic, assign) AWSMediaconvertH265Telecine telecine;

/**
 Adjust quantization within each frame based on temporal variation of content complexity.
 */
@property (nonatomic, assign) AWSMediaconvertH265TemporalAdaptiveQuantization temporalAdaptiveQuantization;

/**
 Enables temporal layer identifiers in the encoded bitstream. Up to 3 layers are supported depending on GOP structure: I- and P-frames form one layer, reference B-frames can form a second layer and non-reference b-frames can form a third layer. Decoders can optionally decode only the lower temporal layers to generate a lower frame rate output. For example, given a bitstream with temporal IDs and with b-frames = 1 (i.e. IbPbPb display order), a decoder could decode all the frames for full frame rate output or only the I and P frames (lowest temporal layer) for a half frame rate output.
 */
@property (nonatomic, assign) AWSMediaconvertH265TemporalIds temporalIds;

/**
 Enable use of tiles, allowing horizontal as well as vertical subdivision of the encoded pictures.
 */
@property (nonatomic, assign) AWSMediaconvertH265Tiles tiles;

/**
 Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
 */
@property (nonatomic, assign) AWSMediaconvertH265UnregisteredSeiTimecode unregisteredSeiTimecode;

/**
 If the location of parameter set NAL units doesn't matter in your workflow, ignore this setting. Use this setting only with CMAF or DASH outputs, or with standalone file outputs in an MPEG-4 container (MP4 outputs). Choose HVC1 to mark your output as HVC1. This makes your output compliant with the following specification: ISO IECJTC1 SC29 N13798 Text ISO/IEC FDIS 14496-15 3rd Edition. For these outputs, the service stores parameter set NAL units in the sample headers but not in the samples directly. For MP4 outputs, when you choose HVC1, your output video might not work properly with some downstream systems and video players. The service defaults to marking your output as HEV1. For these outputs, the service writes parameter set NAL units directly into the samples.
 */
@property (nonatomic, assign) AWSMediaconvertH265WriteMp4PackagingType writeMp4PackagingType;

@end

/**
 Use these settings to specify static color calibration metadata, as defined by SMPTE ST 2086. These values don't affect the pixel values that are encoded in the video stream. They are intended to help the downstream video player display content in a way that reflects the intentions of the the content creator.
 */
@interface AWSMediaconvertHdr10Metadata : AWSModel


/**
 HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
 */
@property (nonatomic, strong) NSNumber * _Nullable bluePrimaryX;

/**
 HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
 */
@property (nonatomic, strong) NSNumber * _Nullable bluePrimaryY;

/**
 HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
 */
@property (nonatomic, strong) NSNumber * _Nullable greenPrimaryX;

/**
 HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
 */
@property (nonatomic, strong) NSNumber * _Nullable greenPrimaryY;

/**
 Maximum light level among all samples in the coded video sequence, in units of candelas per square meter.This setting doesn't have a default value; you must specify a value that is suitable for the content.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxContentLightLevel;

/**
 Maximum average light level of any frame in the coded video sequence, in units of candelas per square meter. This setting doesn't have a default value; you must specify a value that is suitable for the content.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxFrameAverageLightLevel;

/**
 Nominal maximum mastering display luminance in units of of 0.0001 candelas per square meter.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxLuminance;

/**
 Nominal minimum mastering display luminance in units of of 0.0001 candelas per square meter
 */
@property (nonatomic, strong) NSNumber * _Nullable minLuminance;

/**
 HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
 */
@property (nonatomic, strong) NSNumber * _Nullable redPrimaryX;

/**
 HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
 */
@property (nonatomic, strong) NSNumber * _Nullable redPrimaryY;

/**
 HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
 */
@property (nonatomic, strong) NSNumber * _Nullable whitePointX;

/**
 HDR Master Display Information must be provided by a color grader, using color grading tools. Range is 0 to 50,000, each increment represents 0.00002 in CIE1931 color coordinate. Note that this setting is not for color correction.
 */
@property (nonatomic, strong) NSNumber * _Nullable whitePointY;

@end

/**
 Specify the details for each additional HLS manifest that you want the service to generate for this output group. Each manifest can reference a different subset of outputs in the group.
 */
@interface AWSMediaconvertHlsAdditionalManifest : AWSModel


/**
 Specify a name modifier that the service adds to the name of this manifest to make it different from the file names of the other main manifests in the output group. For example, say that the default main manifest for your HLS group is film-name.m3u8. If you enter "-no-premium" for this setting, then the file name the service generates for this top-level manifest is film-name-no-premium.m3u8. For HLS output groups, specify a manifestNameModifier that is different from the nameModifier of the output. The service uses the output name modifier to create unique names for the individual variant manifests.
 */
@property (nonatomic, strong) NSString * _Nullable manifestNameModifier;

/**
 Specify the outputs that you want this additional top-level manifest to reference.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable selectedOutputs;

@end

/**
 Caption Language Mapping
 */
@interface AWSMediaconvertHlsCaptionLanguageMapping : AWSModel


/**
 Caption channel.
 */
@property (nonatomic, strong) NSNumber * _Nullable captionChannel;

/**
 Specify the language for this captions channel, using the ISO 639-2 or ISO 639-3 three-letter language code
 */
@property (nonatomic, strong) NSString * _Nullable customLanguageCode;

/**
 Specify the language, using the ISO 639-2 three-letter code listed at https://www.loc.gov/standards/iso639-2/php/code_list.php.
 */
@property (nonatomic, assign) AWSMediaconvertLanguageCode languageCode;

/**
 Caption language description.
 */
@property (nonatomic, strong) NSString * _Nullable languageDescription;

@end

/**
 Settings for HLS encryption
 */
@interface AWSMediaconvertHlsEncryptionSettings : AWSModel


/**
 This is a 128-bit, 16-byte hex value represented by a 32-character text string. If this parameter is not set then the Initialization Vector will follow the segment number by default.
 */
@property (nonatomic, strong) NSString * _Nullable constantInitializationVector;

/**
 Encrypts the segments with the given encryption scheme. Leave blank to disable. Selecting 'Disabled' in the web interface also disables encryption.
 */
@property (nonatomic, assign) AWSMediaconvertHlsEncryptionType encryptionMethod;

/**
 The Initialization Vector is a 128-bit number used in conjunction with the key for encrypting blocks. If set to INCLUDE, Initialization Vector is listed in the manifest. Otherwise Initialization Vector is not in the manifest.
 */
@property (nonatomic, assign) AWSMediaconvertHlsInitializationVectorInManifest initializationVectorInManifest;

/**
 Enable this setting to insert the EXT-X-SESSION-KEY element into the master playlist. This allows for offline Apple HLS FairPlay content protection.
 */
@property (nonatomic, assign) AWSMediaconvertHlsOfflineEncrypted offlineEncrypted;

/**
 If your output group type is HLS, DASH, or Microsoft Smooth, use these settings when doing DRM encryption with a SPEKE-compliant key provider.If your output group type is CMAF, use the SpekeKeyProviderCmaf settings instead.
 */
@property (nonatomic, strong) AWSMediaconvertSpekeKeyProvider * _Nullable spekeKeyProvider;

/**
 Use these settings to set up encryption with a static key provider.
 */
@property (nonatomic, strong) AWSMediaconvertStaticKeyProvider * _Nullable staticKeyProvider;

/**
 Specify whether your DRM encryption key is static or from a key provider that follows the SPEKE standard. For more information about SPEKE, see https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
 */
@property (nonatomic, assign) AWSMediaconvertHlsKeyProviderType types;

@end

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to HLS_GROUP_SETTINGS.
 */
@interface AWSMediaconvertHlsGroupSettings : AWSModel


/**
 Choose one or more ad marker types to decorate your Apple HLS manifest. This setting does not determine whether SCTE-35 markers appear in the outputs themselves.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable adMarkers;

/**
 By default, the service creates one top-level .m3u8 HLS manifest for each HLS output group in your job. This default manifest references every output in the output group. To create additional top-level manifests that reference a subset of the outputs in the output group, specify a list of them here.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertHlsAdditionalManifest *> * _Nullable additionalManifests;

/**
 A partial URI prefix that will be prepended to each output in the media .m3u8 file. Can be used if base manifest is delivered from a different URL than the main .m3u8 file.
 */
@property (nonatomic, strong) NSString * _Nullable baseUrl;

/**
 Language to be used on Caption outputs
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertHlsCaptionLanguageMapping *> * _Nullable captionLanguageMappings;

/**
 Applies only to 608 Embedded output captions. Insert: Include CLOSED-CAPTIONS lines in the manifest. Specify at least one language in the CC1 Language Code field. One CLOSED-CAPTION line is added for each Language Code you specify. Make sure to specify the languages in the order in which they appear in the original source (if the source is embedded format) or the order of the caption selectors (if the source is other than embedded). Otherwise, languages in the manifest will not match up properly with the output captions. None: Include CLOSED-CAPTIONS=NONE line in the manifest. Omit: Omit any CLOSED-CAPTIONS line from the manifest.
 */
@property (nonatomic, assign) AWSMediaconvertHlsCaptionLanguageSetting captionLanguageSetting;

/**
 When set to ENABLED, sets #EXT-X-ALLOW-CACHE:no tag, which prevents client from saving media segments for later replay.
 */
@property (nonatomic, assign) AWSMediaconvertHlsClientCache clientCache;

/**
 Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist generation.
 */
@property (nonatomic, assign) AWSMediaconvertHlsCodecSpecification codecSpecification;

/**
 Use Destination (Destination) to specify the S3 output location and the output filename base. Destination accepts format identifiers. If you do not specify the base filename in the URI, the service will use the filename of the input file. If your job has multiple inputs, the service uses the filename of the first input file.
 */
@property (nonatomic, strong) NSString * _Nullable destination;

/**
 Settings associated with the destination. Will vary based on the type of destination
 */
@property (nonatomic, strong) AWSMediaconvertDestinationSettings * _Nullable destinationSettings;

/**
 Indicates whether segments should be placed in subdirectories.
 */
@property (nonatomic, assign) AWSMediaconvertHlsDirectoryStructure directoryStructure;

/**
 DRM settings.
 */
@property (nonatomic, strong) AWSMediaconvertHlsEncryptionSettings * _Nullable encryption;

/**
 When set to GZIP, compresses HLS playlist.
 */
@property (nonatomic, assign) AWSMediaconvertHlsManifestCompression manifestCompression;

/**
 Indicates whether the output manifest should use floating point values for segment duration.
 */
@property (nonatomic, assign) AWSMediaconvertHlsManifestDurationFormat manifestDurationFormat;

/**
 Keep this setting at the default value of 0, unless you are troubleshooting a problem with how devices play back the end of your video asset. If you know that player devices are hanging on the final segment of your video because the length of your final segment is too short, use this setting to specify a minimum final segment length, in seconds. Choose a value that is greater than or equal to 1 and less than your segment length. When you specify a value for this setting, the encoder will combine any final segment that is shorter than the length that you specify with the previous segment. For example, your segment length is 3 seconds and your final segment is .5 seconds without a minimum final segment length; when you set the minimum final segment length to 1, your final segment is 3.5 seconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable minFinalSegmentLength;

/**
 When set, Minimum Segment Size is enforced by looking ahead and back within the specified range for a nearby avail and extending the segment size if needed.
 */
@property (nonatomic, strong) NSNumber * _Nullable minSegmentLength;

/**
 Indicates whether the .m3u8 manifest file should be generated for this HLS output group.
 */
@property (nonatomic, assign) AWSMediaconvertHlsOutputSelection outputSelection;

/**
 Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files. The value is calculated as follows: either the program date and time are initialized using the input timecode source, or the time is initialized using the input timecode source and the date is initialized using the timestamp_offset.
 */
@property (nonatomic, assign) AWSMediaconvertHlsProgramDateTime programDateTime;

/**
 Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable programDateTimePeriod;

/**
 When set to SINGLE_FILE, emits program as a single media resource (.ts) file, uses #EXT-X-BYTERANGE tags to index segment for playback.
 */
@property (nonatomic, assign) AWSMediaconvertHlsSegmentControl segmentControl;

/**
 Length of MPEG-2 Transport Stream segments to create (in seconds). Note that segments will end on the next keyframe after this number of seconds, so actual segment length may be longer.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentLength;

/**
 Number of segments to write to a subdirectory before starting a new one. directoryStructure must be SINGLE_DIRECTORY for this setting to have an effect.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentsPerSubdirectory;

/**
 Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of variant manifest.
 */
@property (nonatomic, assign) AWSMediaconvertHlsStreamInfResolution streamInfResolution;

/**
 Indicates ID3 frame that has the timecode.
 */
@property (nonatomic, assign) AWSMediaconvertHlsTimedMetadataId3Frame timedMetadataId3Frame;

/**
 Timed Metadata interval in seconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable timedMetadataId3Period;

/**
 Provides an extra millisecond delta offset to fine tune the timestamps.
 */
@property (nonatomic, strong) NSNumber * _Nullable timestampDeltaMilliseconds;

@end

/**
 Settings for HLS output groups
 */
@interface AWSMediaconvertHlsSettings : AWSModel


/**
 Specifies the group to which the audio Rendition belongs.
 */
@property (nonatomic, strong) NSString * _Nullable audioGroupId;

/**
 Use this setting only in audio-only outputs. Choose MPEG-2 Transport Stream (M2TS) to create a file in an MPEG2-TS container. Keep the default value Automatic (AUTOMATIC) to create an audio-only file in a raw container. Regardless of the value that you specify here, if this output has video, the service will place the output into an MPEG2-TS container.
 */
@property (nonatomic, assign) AWSMediaconvertHlsAudioOnlyContainer audioOnlyContainer;

/**
 List all the audio groups that are used with the video output stream. Input all the audio GROUP-IDs that are associated to the video, separate by ','.
 */
@property (nonatomic, strong) NSString * _Nullable audioRenditionSets;

/**
 Four types of audio-only tracks are supported: Audio-Only Variant Stream The client can play back this audio-only stream instead of video in low-bandwidth scenarios. Represented as an EXT-X-STREAM-INF in the HLS manifest. Alternate Audio, Auto Select, Default Alternate rendition that the client should try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=YES, AUTOSELECT=YES Alternate Audio, Auto Select, Not Default Alternate rendition that the client may try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO, AUTOSELECT=YES Alternate Audio, not Auto Select Alternate rendition that the client will not try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO, AUTOSELECT=NO
 */
@property (nonatomic, assign) AWSMediaconvertHlsAudioTrackType audioTrackType;

/**
 When set to INCLUDE, writes I-Frame Only Manifest in addition to the HLS manifest
 */
@property (nonatomic, assign) AWSMediaconvertHlsIFrameOnlyManifest IFrameOnlyManifest;

/**
 Use this setting to add an identifying string to the filename of each segment. The service adds this string between the name modifier and segment index number. You can use format identifiers in the string. For more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/using-variables-in-your-job-settings.html
 */
@property (nonatomic, strong) NSString * _Nullable segmentModifier;

@end

/**
 Optional. Configuration for a destination queue to which the job can hop once a customer-defined minimum wait time has passed.
 */
@interface AWSMediaconvertHopDestination : AWSModel


/**
 Optional. When you set up a job to use queue hopping, you can specify a different relative priority for the job in the destination queue. If you don't specify, the relative priority will remain the same as in the previous queue.
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 Optional unless the job is submitted on the default queue. When you set up a job to use queue hopping, you can specify a destination queue. This queue cannot be the original queue to which the job is submitted. If the original queue isn't the default queue and you don't specify the destination queue, the job will move to the default queue.
 */
@property (nonatomic, strong) NSString * _Nullable queue;

/**
 Required for setting up a job to use queue hopping. Minimum wait time in minutes until the job can hop to the destination queue. Valid range is 1 to 1440 minutes, inclusive.
 */
@property (nonatomic, strong) NSNumber * _Nullable waitMinutes;

@end

/**
 To insert ID3 tags in your output, specify two values. Use ID3 tag (Id3) to specify the base 64 encoded string and use Timecode (TimeCode) to specify the time when the tag should be inserted. To insert multiple ID3 tags in your output, create multiple instances of ID3 insertion (Id3Insertion).
 */
@interface AWSMediaconvertId3Insertion : AWSModel


/**
 Use ID3 tag (Id3) to provide a tag value in base64-encode format.
 */
@property (nonatomic, strong) NSString * _Nullable id3;

/**
 Provide a Timecode (TimeCode) in HH:MM:SS:FF or HH:MM:SS;FF format.
 */
@property (nonatomic, strong) NSString * _Nullable timecode;

@end

/**
 Enable the image inserter feature to include a graphic overlay on your video. Enable or disable this feature for each input or output individually. This setting is disabled by default.
 */
@interface AWSMediaconvertImageInserter : AWSModel


/**
 Specify the images that you want to overlay on your video. The images must be PNG or TGA files.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertInsertableImage *> * _Nullable insertableImages;

@end

/**
 Settings specific to IMSC caption outputs.
 */
@interface AWSMediaconvertImscDestinationSettings : AWSModel


/**
 Keep this setting enabled to have MediaConvert use the font style and position information from the captions source in the output. This option is available only when your input captions are IMSC, SMPTE-TT, or TTML. Disable this setting for simplified output captions.
 */
@property (nonatomic, assign) AWSMediaconvertImscStylePassthrough stylePassthrough;

@end

/**
 Specifies media input
 */
@interface AWSMediaconvertInput : AWSModel


/**
 Specifies set of audio selectors within an input to combine. An input may have multiple audio selector groups. See "Audio Selector Group":#inputs-audio_selector_group for more information.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSMediaconvertAudioSelectorGroup *> * _Nullable audioSelectorGroups;

/**
 Use Audio selectors (AudioSelectors) to specify a track or set of tracks from the input that you will use in your outputs. You can use multiple Audio selectors per input.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSMediaconvertAudioSelector *> * _Nullable audioSelectors;

/**
 Use captions selectors to specify the captions data from your input that you use in your outputs. You can use up to 20 captions selectors per input.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSMediaconvertCaptionSelector *> * _Nullable captionSelectors;

/**
 Use Cropping selection (crop) to specify the video area that the service will include in the output video frame. If you specify a value here, it will override any value that you specify in the output setting Cropping selection (crop).
 */
@property (nonatomic, strong) AWSMediaconvertRectangle * _Nullable crop;

/**
 Enable Deblock (InputDeblockFilter) to produce smoother motion in the output. Default is disabled. Only manually controllable for MPEG2 and uncompressed video inputs.
 */
@property (nonatomic, assign) AWSMediaconvertInputDeblockFilter deblockFilter;

/**
 Settings for decrypting any input files that you encrypt before you upload them to Amazon S3. MediaConvert can decrypt files only when you use AWS Key Management Service (KMS) to encrypt the data key that you use to encrypt your content.
 */
@property (nonatomic, strong) AWSMediaconvertInputDecryptionSettings * _Nullable decryptionSettings;

/**
 Enable Denoise (InputDenoiseFilter) to filter noise from the input.Default is disabled. Only applicable to MPEG2, H.264, H.265, and uncompressed video inputs.
 */
@property (nonatomic, assign) AWSMediaconvertInputDenoiseFilter denoiseFilter;

/**
 Specify the source file for your transcoding job. You can use multiple inputs in a single job. The service concatenates these inputs, in the order that you specify them in the job, to create the outputs. If your input format is IMF, specify your input by providing the path to your CPL. For example, "s3://bucket/vf/cpl.xml". If the CPL is in an incomplete IMP, make sure to use *Supplemental IMPs* (SupplementalImps) to specify any supplemental IMPs that contain assets referenced by the CPL.
 */
@property (nonatomic, strong) NSString * _Nullable fileInput;

/**
 Use Filter enable (InputFilterEnable) to specify how the transcoding service applies the denoise and deblock filters. You must also enable the filters separately, with Denoise (InputDenoiseFilter) and Deblock (InputDeblockFilter). * Auto - The transcoding service determines whether to apply filtering, depending on input type and quality. * Disable - The input is not filtered. This is true even if you use the API to enable them in (InputDeblockFilter) and (InputDeblockFilter). * Force - The in put is filtered regardless of input type.
 */
@property (nonatomic, assign) AWSMediaconvertInputFilterEnable filterEnable;

/**
 Use Filter strength (FilterStrength) to adjust the magnitude the input filter settings (Deblock and Denoise). The range is -5 to 5. Default is 0.
 */
@property (nonatomic, strong) NSNumber * _Nullable filterStrength;

/**
 Enable the image inserter feature to include a graphic overlay on your video. Enable or disable this feature for each input individually. This setting is disabled by default.
 */
@property (nonatomic, strong) AWSMediaconvertImageInserter * _Nullable imageInserter;

/**
 (InputClippings) contains sets of start and end times that together specify a portion of the input to be used in the outputs. If you provide only a start time, the clip will be the entire input from that point to the end. If you provide only an end time, it will be the entire input up to that point. When you specify more than one input clip, the transcoding service creates the job outputs by stringing the clips together in the order you specify them.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertInputClipping *> * _Nullable inputClippings;

/**
 Use Selection placement (position) to define the video area in your output frame. The area outside of the rectangle that you specify here is black. If you specify a value here, it will override any value that you specify in the output setting Selection placement (position). If you specify a value here, this will override any AFD values in your input, even if you set Respond to AFD (RespondToAfd) to Respond (RESPOND). If you specify a value here, this will ignore anything that you specify for the setting Scaling Behavior (scalingBehavior).
 */
@property (nonatomic, strong) AWSMediaconvertRectangle * _Nullable position;

/**
 Use Program (programNumber) to select a specific program from within a multi-program transport stream. Note that Quad 4K is not currently supported. Default is the first program within the transport stream. If the program you specify doesn't exist, the transcoding service will use this default.
 */
@property (nonatomic, strong) NSNumber * _Nullable programNumber;

/**
 Set PSI control (InputPsiControl) for transport stream inputs to specify which data the demux process to scans. * Ignore PSI - Scan all PIDs for audio and video. * Use PSI - Scan only PSI data.
 */
@property (nonatomic, assign) AWSMediaconvertInputPsiControl psiControl;

/**
 Provide a list of any necessary supplemental IMPs. You need supplemental IMPs if the CPL that you're using for your input is in an incomplete IMP. Specify either the supplemental IMP directories with a trailing slash or the ASSETMAP.xml files. For example ["s3://bucket/ov/", "s3://bucket/vf2/ASSETMAP.xml"]. You don't need to specify the IMP that contains your input CPL, because the service automatically detects it.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supplementalImps;

/**
 Use this Timecode source setting, located under the input settings (InputTimecodeSource), to specify how the service counts input video frames. This input frame count affects only the behavior of features that apply to a single input at a time, such as input clipping and synchronizing some captions formats. Choose Embedded (EMBEDDED) to use the timecodes in your input video. Choose Start at zero (ZEROBASED) to start the first frame at zero. Choose Specified start (SPECIFIEDSTART) to start the first frame at the timecode that you specify in the setting Start timecode (timecodeStart). If you don't specify a value for Timecode source, the service will use Embedded by default. For more information about timecodes, see https://docs.aws.amazon.com/console/mediaconvert/timecode.
 */
@property (nonatomic, assign) AWSMediaconvertInputTimecodeSource timecodeSource;

/**
 Specify the timecode that you want the service to use for this input's initial frame. To use this setting, you must set the Timecode source setting, located under the input settings (InputTimecodeSource), to Specified start (SPECIFIEDSTART). For more information about timecodes, see https://docs.aws.amazon.com/console/mediaconvert/timecode.
 */
@property (nonatomic, strong) NSString * _Nullable timecodeStart;

/**
 Selector for video.
 */
@property (nonatomic, strong) AWSMediaconvertVideoSelector * _Nullable videoSelector;

@end

/**
 To transcode only portions of your input (clips), include one Input clipping (one instance of InputClipping in the JSON job file) for each input clip. All input clips you specify will be included in every output of the job.
 */
@interface AWSMediaconvertInputClipping : AWSModel


/**
 Set End timecode (EndTimecode) to the end of the portion of the input you are clipping. The frame corresponding to the End timecode value is included in the clip. Start timecode or End timecode may be left blank, but not both. Use the format HH:MM:SS:FF or HH:MM:SS;FF, where HH is the hour, MM is the minute, SS is the second, and FF is the frame number. When choosing this value, take into account your setting for timecode source under input settings (InputTimecodeSource). For example, if you have embedded timecodes that start at 01:00:00:00 and you want your clip to end six minutes into the video, use 01:06:00:00.
 */
@property (nonatomic, strong) NSString * _Nullable endTimecode;

/**
 Set Start timecode (StartTimecode) to the beginning of the portion of the input you are clipping. The frame corresponding to the Start timecode value is included in the clip. Start timecode or End timecode may be left blank, but not both. Use the format HH:MM:SS:FF or HH:MM:SS;FF, where HH is the hour, MM is the minute, SS is the second, and FF is the frame number. When choosing this value, take into account your setting for Input timecode source. For example, if you have embedded timecodes that start at 01:00:00:00 and you want your clip to begin five minutes into the video, use 01:05:00:00.
 */
@property (nonatomic, strong) NSString * _Nullable startTimecode;

@end

/**
 Settings for decrypting any input files that you encrypt before you upload them to Amazon S3. MediaConvert can decrypt files only when you use AWS Key Management Service (KMS) to encrypt the data key that you use to encrypt your content.
 */
@interface AWSMediaconvertInputDecryptionSettings : AWSModel


/**
 Specify the encryption mode that you used to encrypt your input files.
 */
@property (nonatomic, assign) AWSMediaconvertDecryptionMode decryptionMode;

/**
 Warning! Don't provide your encryption key in plaintext. Your job settings could be intercepted, making your encrypted content vulnerable. Specify the encrypted version of the data key that you used to encrypt your content. The data key must be encrypted by AWS Key Management Service (KMS). The key can be 128, 192, or 256 bits.
 */
@property (nonatomic, strong) NSString * _Nullable encryptedDecryptionKey;

/**
 Specify the initialization vector that you used when you encrypted your content before uploading it to Amazon S3. You can use a 16-byte initialization vector with any encryption mode. Or, you can use a 12-byte initialization vector with GCM or CTR. MediaConvert accepts only initialization vectors that are base64-encoded.
 */
@property (nonatomic, strong) NSString * _Nullable initializationVector;

/**
 Specify the AWS Region for AWS Key Management Service (KMS) that you used to encrypt your data key, if that Region is different from the one you are using for AWS Elemental MediaConvert.
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyRegion;

@end

/**
 Specified video input in a template.
 */
@interface AWSMediaconvertInputTemplate : AWSModel


/**
 Specifies set of audio selectors within an input to combine. An input may have multiple audio selector groups. See "Audio Selector Group":#inputs-audio_selector_group for more information.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSMediaconvertAudioSelectorGroup *> * _Nullable audioSelectorGroups;

/**
 Use Audio selectors (AudioSelectors) to specify a track or set of tracks from the input that you will use in your outputs. You can use multiple Audio selectors per input.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSMediaconvertAudioSelector *> * _Nullable audioSelectors;

/**
 Use captions selectors to specify the captions data from your input that you use in your outputs. You can use up to 20 captions selectors per input.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSMediaconvertCaptionSelector *> * _Nullable captionSelectors;

/**
 Use Cropping selection (crop) to specify the video area that the service will include in the output video frame. If you specify a value here, it will override any value that you specify in the output setting Cropping selection (crop).
 */
@property (nonatomic, strong) AWSMediaconvertRectangle * _Nullable crop;

/**
 Enable Deblock (InputDeblockFilter) to produce smoother motion in the output. Default is disabled. Only manually controllable for MPEG2 and uncompressed video inputs.
 */
@property (nonatomic, assign) AWSMediaconvertInputDeblockFilter deblockFilter;

/**
 Enable Denoise (InputDenoiseFilter) to filter noise from the input.Default is disabled. Only applicable to MPEG2, H.264, H.265, and uncompressed video inputs.
 */
@property (nonatomic, assign) AWSMediaconvertInputDenoiseFilter denoiseFilter;

/**
 Use Filter enable (InputFilterEnable) to specify how the transcoding service applies the denoise and deblock filters. You must also enable the filters separately, with Denoise (InputDenoiseFilter) and Deblock (InputDeblockFilter). * Auto - The transcoding service determines whether to apply filtering, depending on input type and quality. * Disable - The input is not filtered. This is true even if you use the API to enable them in (InputDeblockFilter) and (InputDeblockFilter). * Force - The in put is filtered regardless of input type.
 */
@property (nonatomic, assign) AWSMediaconvertInputFilterEnable filterEnable;

/**
 Use Filter strength (FilterStrength) to adjust the magnitude the input filter settings (Deblock and Denoise). The range is -5 to 5. Default is 0.
 */
@property (nonatomic, strong) NSNumber * _Nullable filterStrength;

/**
 Enable the image inserter feature to include a graphic overlay on your video. Enable or disable this feature for each input individually. This setting is disabled by default.
 */
@property (nonatomic, strong) AWSMediaconvertImageInserter * _Nullable imageInserter;

/**
 (InputClippings) contains sets of start and end times that together specify a portion of the input to be used in the outputs. If you provide only a start time, the clip will be the entire input from that point to the end. If you provide only an end time, it will be the entire input up to that point. When you specify more than one input clip, the transcoding service creates the job outputs by stringing the clips together in the order you specify them.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertInputClipping *> * _Nullable inputClippings;

/**
 Use Selection placement (position) to define the video area in your output frame. The area outside of the rectangle that you specify here is black. If you specify a value here, it will override any value that you specify in the output setting Selection placement (position). If you specify a value here, this will override any AFD values in your input, even if you set Respond to AFD (RespondToAfd) to Respond (RESPOND). If you specify a value here, this will ignore anything that you specify for the setting Scaling Behavior (scalingBehavior).
 */
@property (nonatomic, strong) AWSMediaconvertRectangle * _Nullable position;

/**
 Use Program (programNumber) to select a specific program from within a multi-program transport stream. Note that Quad 4K is not currently supported. Default is the first program within the transport stream. If the program you specify doesn't exist, the transcoding service will use this default.
 */
@property (nonatomic, strong) NSNumber * _Nullable programNumber;

/**
 Set PSI control (InputPsiControl) for transport stream inputs to specify which data the demux process to scans. * Ignore PSI - Scan all PIDs for audio and video. * Use PSI - Scan only PSI data.
 */
@property (nonatomic, assign) AWSMediaconvertInputPsiControl psiControl;

/**
 Use this Timecode source setting, located under the input settings (InputTimecodeSource), to specify how the service counts input video frames. This input frame count affects only the behavior of features that apply to a single input at a time, such as input clipping and synchronizing some captions formats. Choose Embedded (EMBEDDED) to use the timecodes in your input video. Choose Start at zero (ZEROBASED) to start the first frame at zero. Choose Specified start (SPECIFIEDSTART) to start the first frame at the timecode that you specify in the setting Start timecode (timecodeStart). If you don't specify a value for Timecode source, the service will use Embedded by default. For more information about timecodes, see https://docs.aws.amazon.com/console/mediaconvert/timecode.
 */
@property (nonatomic, assign) AWSMediaconvertInputTimecodeSource timecodeSource;

/**
 Specify the timecode that you want the service to use for this input's initial frame. To use this setting, you must set the Timecode source setting, located under the input settings (InputTimecodeSource), to Specified start (SPECIFIEDSTART). For more information about timecodes, see https://docs.aws.amazon.com/console/mediaconvert/timecode.
 */
@property (nonatomic, strong) NSString * _Nullable timecodeStart;

/**
 Selector for video.
 */
@property (nonatomic, strong) AWSMediaconvertVideoSelector * _Nullable videoSelector;

@end

/**
 Settings that specify how your still graphic overlay appears.
 */
@interface AWSMediaconvertInsertableImage : AWSModel


/**
 Specify the time, in milliseconds, for the image to remain on the output video. This duration includes fade-in time but not fade-out time.
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 Specify the length of time, in milliseconds, between the Start time that you specify for the image insertion and the time that the image appears at full opacity. Full opacity is the level that you specify for the opacity setting. If you don't specify a value for Fade-in, the image will appear abruptly at the overlay start time.
 */
@property (nonatomic, strong) NSNumber * _Nullable fadeIn;

/**
 Specify the length of time, in milliseconds, between the end of the time that you have specified for the image overlay Duration and when the overlaid image has faded to total transparency. If you don't specify a value for Fade-out, the image will disappear abruptly at the end of the inserted image duration.
 */
@property (nonatomic, strong) NSNumber * _Nullable fadeOut;

/**
 Specify the height of the inserted image in pixels. If you specify a value that's larger than the video resolution height, the service will crop your overlaid image to fit. To use the native height of the image, keep this setting blank.
 */
@property (nonatomic, strong) NSNumber * _Nullable height;

/**
 Specify the HTTP, HTTPS, or Amazon S3 location of the image that you want to overlay on the video. Use a PNG or TGA file.
 */
@property (nonatomic, strong) NSString * _Nullable imageInserterInput;

/**
 Specify the distance, in pixels, between the inserted image and the left edge of the video frame. Required for any image overlay that you specify.
 */
@property (nonatomic, strong) NSNumber * _Nullable imageX;

/**
 Specify the distance, in pixels, between the overlaid image and the top edge of the video frame. Required for any image overlay that you specify.
 */
@property (nonatomic, strong) NSNumber * _Nullable imageY;

/**
 Specify how overlapping inserted images appear. Images with higher values for Layer appear on top of images with lower values for Layer.
 */
@property (nonatomic, strong) NSNumber * _Nullable layer;

/**
 Use Opacity (Opacity) to specify how much of the underlying video shows through the inserted image. 0 is transparent and 100 is fully opaque. Default is 50.
 */
@property (nonatomic, strong) NSNumber * _Nullable opacity;

/**
 Specify the timecode of the frame that you want the overlay to first appear on. This must be in timecode (HH:MM:SS:FF or HH:MM:SS;FF) format. Remember to take into account your timecode source settings.
 */
@property (nonatomic, strong) NSString * _Nullable startTime;

/**
 Specify the width of the inserted image in pixels. If you specify a value that's larger than the video resolution width, the service will crop your overlaid image to fit. To use the native width of the image, keep this setting blank.
 */
@property (nonatomic, strong) NSNumber * _Nullable width;

@end

/**
 Each job converts an input file into an output file or files. For more information, see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 Required parameters: [Role, Settings]
 */
@interface AWSMediaconvertJob : AWSModel


/**
 Accelerated transcoding can significantly speed up jobs with long, visually complex content.
 */
@property (nonatomic, strong) AWSMediaconvertAccelerationSettings * _Nullable accelerationSettings;

/**
 Describes whether the current job is running with accelerated transcoding. For jobs that have Acceleration (AccelerationMode) set to DISABLED, AccelerationStatus is always NOT_APPLICABLE. For jobs that have Acceleration (AccelerationMode) set to ENABLED or PREFERRED, AccelerationStatus is one of the other states. AccelerationStatus is IN_PROGRESS initially, while the service determines whether the input files and job settings are compatible with accelerated transcoding. If they are, AcclerationStatus is ACCELERATED. If your input files and job settings aren't compatible with accelerated transcoding, the service either fails your job or runs it without accelerated transcoding, depending on how you set Acceleration (AccelerationMode). When the service runs your job without accelerated transcoding, AccelerationStatus is NOT_ACCELERATED.
 */
@property (nonatomic, assign) AWSMediaconvertAccelerationStatus accelerationStatus;

/**
 An identifier for this resource that is unique within all of AWS.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The tag type that AWS Billing and Cost Management will use to sort your AWS Elemental MediaConvert costs on any billing report that you set up.
 */
@property (nonatomic, assign) AWSMediaconvertBillingTagsSource billingTagsSource;

/**
 The time, in Unix epoch format in seconds, when the job got created.
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 A job's phase can be PROBING, TRANSCODING OR UPLOADING
 */
@property (nonatomic, assign) AWSMediaconvertJobPhase currentPhase;

/**
 Error code for the job
 */
@property (nonatomic, strong) NSNumber * _Nullable errorCode;

/**
 Error message of Job
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 Optional list of hop destinations.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertHopDestination *> * _Nullable hopDestinations;

/**
 A portion of the job's ARN, unique within your AWS Elemental MediaConvert resources
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 An estimate of how far your job has progressed. This estimate is shown as a percentage of the total time from when your job leaves its queue to when your output files appear in your output Amazon S3 bucket. AWS Elemental MediaConvert provides jobPercentComplete in CloudWatch STATUS_UPDATE events and in the response to GetJob and ListJobs requests. The jobPercentComplete estimate is reliable for the following input containers: Quicktime, Transport Stream, MP4, and MXF. For some jobs, the service can't provide information about job progress. In those cases, jobPercentComplete returns a null value.
 */
@property (nonatomic, strong) NSNumber * _Nullable jobPercentComplete;

/**
 The job template that the job is created from, if it is created from a job template.
 */
@property (nonatomic, strong) NSString * _Nullable jobTemplate;

/**
 Provides messages from the service about jobs that you have already successfully submitted.
 */
@property (nonatomic, strong) AWSMediaconvertJobMessages * _Nullable messages;

/**
 List of output group details
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertOutputGroupDetail *> * _Nullable outputGroupDetails;

/**
 Relative priority on the job.
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 When you create a job, you can specify a queue to send it to. If you don't specify, the job will go to the default queue. For more about queues, see the User Guide topic at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 */
@property (nonatomic, strong) NSString * _Nullable queue;

/**
 The job's queue hopping history.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertQueueTransition *> * _Nullable queueTransitions;

/**
 The number of times that the service automatically attempted to process your job after encountering an error.
 */
@property (nonatomic, strong) NSNumber * _Nullable retryCount;

/**
 The IAM role you use for creating this job. For details about permissions, see the User Guide topic at the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/iam-role.html
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 JobSettings contains all the transcode settings for a job.
 */
@property (nonatomic, strong) AWSMediaconvertJobSettings * _Nullable settings;

/**
 Enable this setting when you run a test job to estimate how many reserved transcoding slots (RTS) you need. When this is enabled, MediaConvert runs your job from an on-demand queue with similar performance to what you will see with one RTS in a reserved queue. This setting is disabled by default.
 */
@property (nonatomic, assign) AWSMediaconvertSimulateReservedQueue simulateReservedQueue;

/**
 A job's status can be SUBMITTED, PROGRESSING, COMPLETE, CANCELED, or ERROR.
 */
@property (nonatomic, assign) AWSMediaconvertJobStatus status;

/**
 Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the interval, in seconds, between status updates. MediaConvert sends an update at this interval from the time the service begins processing your job to the time it completes the transcode or encounters an error.
 */
@property (nonatomic, assign) AWSMediaconvertStatusUpdateInterval statusUpdateInterval;

/**
 Information about when jobs are submitted, started, and finished is specified in Unix epoch format in seconds.
 */
@property (nonatomic, strong) AWSMediaconvertTiming * _Nullable timing;

/**
 User-defined metadata that you want to associate with an MediaConvert job. You specify metadata in key/value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable userMetadata;

@end

/**
 Provides messages from the service about jobs that you have already successfully submitted.
 */
@interface AWSMediaconvertJobMessages : AWSModel


/**
 List of messages that are informational only and don't indicate a problem with your job.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable info;

/**
 List of messages that warn about conditions that might cause your job not to run or to fail.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable warning;

@end

/**
 JobSettings contains all the transcode settings for a job.
 */
@interface AWSMediaconvertJobSettings : AWSModel


/**
 When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time.
 */
@property (nonatomic, strong) NSNumber * _Nullable adAvailOffset;

/**
 Settings for ad avail blanking.Video can be blanked or overlaid with an image, and audio muted during SCTE-35 triggered ad avails.
 */
@property (nonatomic, strong) AWSMediaconvertAvailBlanking * _Nullable availBlanking;

/**
 Settings for Event Signaling And Messaging (ESAM).
 */
@property (nonatomic, strong) AWSMediaconvertEsamSettings * _Nullable esam;

/**
 Use Inputs (inputs) to define source file used in the transcode job. There can be multiple inputs add in a job. These inputs will be concantenated together to create the output.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertInput *> * _Nullable inputs;

/**
 Overlay motion graphics on top of your video. The motion graphics that you specify here appear on all outputs in all output groups.
 */
@property (nonatomic, strong) AWSMediaconvertMotionImageInserter * _Nullable motionImageInserter;

/**
 Settings for your Nielsen configuration. If you don't do Nielsen measurement and analytics, ignore these settings. When you enable Nielsen configuration (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all outputs in the job. To enable Nielsen configuration programmatically, include an instance of nielsenConfiguration in your JSON job specification. Even if you don't include any children of nielsenConfiguration, you still enable the setting.
 */
@property (nonatomic, strong) AWSMediaconvertNielsenConfiguration * _Nullable nielsenConfiguration;

/**
 (OutputGroups) contains one group of settings for each set of outputs that share a common package type. All unpackaged files (MPEG-4, MPEG-2 TS, Quicktime, MXF, and no container) are grouped in a single output group as well. Required in (OutputGroups) is a group of settings that apply to the whole group. This required object depends on the value you set for (Type) under (OutputGroups)>(OutputGroupSettings). Type, settings object pairs are as follows. * FILE_GROUP_SETTINGS, FileGroupSettings * HLS_GROUP_SETTINGS, HlsGroupSettings * DASH_ISO_GROUP_SETTINGS, DashIsoGroupSettings * MS_SMOOTH_GROUP_SETTINGS, MsSmoothGroupSettings * CMAF_GROUP_SETTINGS, CmafGroupSettings
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertOutputGroup *> * _Nullable outputGroups;

/**
 Contains settings used to acquire and adjust timecode information from inputs.
 */
@property (nonatomic, strong) AWSMediaconvertTimecodeConfig * _Nullable timecodeConfig;

/**
 Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3 tags in your job. To include timed metadata, you must enable it here, enable it in each output container, and specify tags and timecodes in ID3 insertion (Id3Insertion) objects.
 */
@property (nonatomic, strong) AWSMediaconvertTimedMetadataInsertion * _Nullable timedMetadataInsertion;

@end

/**
 A job template is a pre-made set of encoding instructions that you can use to quickly create a job.
 Required parameters: [Settings, Name]
 */
@interface AWSMediaconvertJobTemplate : AWSModel


/**
 Accelerated transcoding can significantly speed up jobs with long, visually complex content.
 */
@property (nonatomic, strong) AWSMediaconvertAccelerationSettings * _Nullable accelerationSettings;

/**
 An identifier for this resource that is unique within all of AWS.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 An optional category you create to organize your job templates.
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 The timestamp in epoch seconds for Job template creation.
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 An optional description you create for each job template.
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 Optional list of hop destinations.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertHopDestination *> * _Nullable hopDestinations;

/**
 The timestamp in epoch seconds when the Job template was last updated.
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdated;

/**
 A name you create for each job template. Each name must be unique within your account.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Relative priority on the job.
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 Optional. The queue that jobs created from this template are assigned to. If you don't specify this, jobs will go to the default queue.
 */
@property (nonatomic, strong) NSString * _Nullable queue;

/**
 JobTemplateSettings contains all the transcode settings saved in the template that will be applied to jobs created from it.
 */
@property (nonatomic, strong) AWSMediaconvertJobTemplateSettings * _Nullable settings;

/**
 Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the interval, in seconds, between status updates. MediaConvert sends an update at this interval from the time the service begins processing your job to the time it completes the transcode or encounters an error.
 */
@property (nonatomic, assign) AWSMediaconvertStatusUpdateInterval statusUpdateInterval;

/**
 A job template can be of two types: system or custom. System or built-in job templates can't be modified or deleted by the user.
 */
@property (nonatomic, assign) AWSMediaconvertTypes types;

@end

/**
 JobTemplateSettings contains all the transcode settings saved in the template that will be applied to jobs created from it.
 */
@interface AWSMediaconvertJobTemplateSettings : AWSModel


/**
 When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time.
 */
@property (nonatomic, strong) NSNumber * _Nullable adAvailOffset;

/**
 Settings for ad avail blanking.Video can be blanked or overlaid with an image, and audio muted during SCTE-35 triggered ad avails.
 */
@property (nonatomic, strong) AWSMediaconvertAvailBlanking * _Nullable availBlanking;

/**
 Settings for Event Signaling And Messaging (ESAM).
 */
@property (nonatomic, strong) AWSMediaconvertEsamSettings * _Nullable esam;

/**
 Use Inputs (inputs) to define the source file used in the transcode job. There can only be one input in a job template.Using the API, you can include multiple inputs when referencing a job template.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertInputTemplate *> * _Nullable inputs;

/**
 Overlay motion graphics on top of your video. The motion graphics that you specify here appear on all outputs in all output groups.
 */
@property (nonatomic, strong) AWSMediaconvertMotionImageInserter * _Nullable motionImageInserter;

/**
 Settings for your Nielsen configuration. If you don't do Nielsen measurement and analytics, ignore these settings. When you enable Nielsen configuration (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all outputs in the job. To enable Nielsen configuration programmatically, include an instance of nielsenConfiguration in your JSON job specification. Even if you don't include any children of nielsenConfiguration, you still enable the setting.
 */
@property (nonatomic, strong) AWSMediaconvertNielsenConfiguration * _Nullable nielsenConfiguration;

/**
 (OutputGroups) contains one group of settings for each set of outputs that share a common package type. All unpackaged files (MPEG-4, MPEG-2 TS, Quicktime, MXF, and no container) are grouped in a single output group as well. Required in (OutputGroups) is a group of settings that apply to the whole group. This required object depends on the value you set for (Type) under (OutputGroups)>(OutputGroupSettings). Type, settings object pairs are as follows. * FILE_GROUP_SETTINGS, FileGroupSettings * HLS_GROUP_SETTINGS, HlsGroupSettings * DASH_ISO_GROUP_SETTINGS, DashIsoGroupSettings * MS_SMOOTH_GROUP_SETTINGS, MsSmoothGroupSettings * CMAF_GROUP_SETTINGS, CmafGroupSettings
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertOutputGroup *> * _Nullable outputGroups;

/**
 Contains settings used to acquire and adjust timecode information from inputs.
 */
@property (nonatomic, strong) AWSMediaconvertTimecodeConfig * _Nullable timecodeConfig;

/**
 Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3 tags in your job. To include timed metadata, you must enable it here, enable it in each output container, and specify tags and timecodes in ID3 insertion (Id3Insertion) objects.
 */
@property (nonatomic, strong) AWSMediaconvertTimedMetadataInsertion * _Nullable timedMetadataInsertion;

@end

/**
 
 */
@interface AWSMediaconvertListJobTemplatesRequest : AWSRequest


/**
 Optionally, specify a job template category to limit responses to only job templates from that category.
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 Optional. When you request a list of job templates, you can choose to list them alphabetically by NAME or chronologically by CREATION_DATE. If you don't specify, the service will list them by name.
 */
@property (nonatomic, assign) AWSMediaconvertJobTemplateListBy listBy;

/**
 Optional. Number of job templates, up to twenty, that will be returned at one time.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 Use this string, provided with the response to a previous request, to request the next batch of job templates.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 Optional. When you request lists of resources, you can specify whether they are sorted in ASCENDING or DESCENDING order. Default varies by resource.
 */
@property (nonatomic, assign) AWSMediaconvertOrder order;

@end

/**
 
 */
@interface AWSMediaconvertListJobTemplatesResponse : AWSModel


/**
 List of Job templates.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertJobTemplate *> * _Nullable jobTemplates;

/**
 Use this string to request the next batch of job templates.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSMediaconvertListJobsRequest : AWSRequest


/**
 Optional. Number of jobs, up to twenty, that will be returned at one time.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 Optional. Use this string, provided with the response to a previous request, to request the next batch of jobs.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 Optional. When you request lists of resources, you can specify whether they are sorted in ASCENDING or DESCENDING order. Default varies by resource.
 */
@property (nonatomic, assign) AWSMediaconvertOrder order;

/**
 Optional. Provide a queue name to get back only jobs from that queue.
 */
@property (nonatomic, strong) NSString * _Nullable queue;

/**
 Optional. A job's status can be SUBMITTED, PROGRESSING, COMPLETE, CANCELED, or ERROR.
 */
@property (nonatomic, assign) AWSMediaconvertJobStatus status;

@end

/**
 
 */
@interface AWSMediaconvertListJobsResponse : AWSModel


/**
 List of jobs
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertJob *> * _Nullable jobs;

/**
 Use this string to request the next batch of jobs.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSMediaconvertListPresetsRequest : AWSRequest


/**
 Optionally, specify a preset category to limit responses to only presets from that category.
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 Optional. When you request a list of presets, you can choose to list them alphabetically by NAME or chronologically by CREATION_DATE. If you don't specify, the service will list them by name.
 */
@property (nonatomic, assign) AWSMediaconvertPresetListBy listBy;

/**
 Optional. Number of presets, up to twenty, that will be returned at one time
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 Use this string, provided with the response to a previous request, to request the next batch of presets.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 Optional. When you request lists of resources, you can specify whether they are sorted in ASCENDING or DESCENDING order. Default varies by resource.
 */
@property (nonatomic, assign) AWSMediaconvertOrder order;

@end

/**
 
 */
@interface AWSMediaconvertListPresetsResponse : AWSModel


/**
 Use this string to request the next batch of presets.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 List of presets
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertPreset *> * _Nullable presets;

@end

/**
 
 */
@interface AWSMediaconvertListQueuesRequest : AWSRequest


/**
 Optional. When you request a list of queues, you can choose to list them alphabetically by NAME or chronologically by CREATION_DATE. If you don't specify, the service will list them by creation date.
 */
@property (nonatomic, assign) AWSMediaconvertQueueListBy listBy;

/**
 Optional. Number of queues, up to twenty, that will be returned at one time.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 Use this string, provided with the response to a previous request, to request the next batch of queues.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 Optional. When you request lists of resources, you can specify whether they are sorted in ASCENDING or DESCENDING order. Default varies by resource.
 */
@property (nonatomic, assign) AWSMediaconvertOrder order;

@end

/**
 
 */
@interface AWSMediaconvertListQueuesResponse : AWSModel


/**
 Use this string to request the next batch of queues.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 List of queues.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertQueue *> * _Nullable queues;

@end

/**
 
 */
@interface AWSMediaconvertListTagsForResourceRequest : AWSRequest


/**
 The Amazon Resource Name (ARN) of the resource that you want to list tags for. To get the ARN, send a GET request with the resource name.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSMediaconvertListTagsForResourceResponse : AWSModel


/**
 The Amazon Resource Name (ARN) and tags for an AWS Elemental MediaConvert resource.
 */
@property (nonatomic, strong) AWSMediaconvertResourceTags * _Nullable resourceTags;

@end

/**
 Settings for SCTE-35 signals from ESAM. Include this in your job settings to put SCTE-35 markers in your HLS and transport stream outputs at the insertion points that you specify in an ESAM XML document. Provide the document in the setting SCC XML (sccXml).
 */
@interface AWSMediaconvertM2tsScte35Esam : AWSModel


/**
 Packet Identifier (PID) of the SCTE-35 stream in the transport stream generated by ESAM.
 */
@property (nonatomic, strong) NSNumber * _Nullable scte35EsamPid;

@end

/**
 MPEG-2 TS container settings. These apply to outputs in a File output group when the output's container (ContainerType) is MPEG-2 Transport Stream (M2TS). In these assets, data is organized by the program map table (PMT). Each transport stream program contains subsets of data, including audio, video, and metadata. Each of these subsets of data has a numerical label called a packet identifier (PID). Each transport stream program corresponds to one MediaConvert output. The PMT lists the types of data in a program along with their PID. Downstream systems and players use the program map table to look up the PID for each type of data it accesses and then uses the PIDs to locate specific data within the asset.
 */
@interface AWSMediaconvertM2tsSettings : AWSModel


/**
 Selects between the DVB and ATSC buffer models for Dolby Digital audio.
 */
@property (nonatomic, assign) AWSMediaconvertM2tsAudioBufferModel audioBufferModel;

/**
 The number of audio frames to insert for each PES packet.
 */
@property (nonatomic, strong) NSNumber * _Nullable audioFramesPerPes;

/**
 Specify the packet identifiers (PIDs) for any elementary audio streams you include in this output. Specify multiple PIDs as a JSON array. Default is the range 482-492.
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable audioPids;

/**
 Specify the output bitrate of the transport stream in bits per second. Setting to 0 lets the muxer automatically determine the appropriate bitrate. Other common values are 3750000, 7500000, and 15000000.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Controls what buffer model to use for accurate interleaving. If set to MULTIPLEX, use multiplexbuffer model. If set to NONE, this can lead to lower latency, but low-memory devices may not be able to play back the stream without interruptions.
 */
@property (nonatomic, assign) AWSMediaconvertM2tsBufferModel bufferModel;

/**
 Inserts DVB Network Information Table (NIT) at the specified table repetition interval.
 */
@property (nonatomic, strong) AWSMediaconvertDvbNitSettings * _Nullable dvbNitSettings;

/**
 Inserts DVB Service Description Table (NIT) at the specified table repetition interval.
 */
@property (nonatomic, strong) AWSMediaconvertDvbSdtSettings * _Nullable dvbSdtSettings;

/**
 Specify the packet identifiers (PIDs) for DVB subtitle data included in this output. Specify multiple PIDs as a JSON array. Default is the range 460-479.
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable dvbSubPids;

/**
 Inserts DVB Time and Date Table (TDT) at the specified table repetition interval.
 */
@property (nonatomic, strong) AWSMediaconvertDvbTdtSettings * _Nullable dvbTdtSettings;

/**
 Specify the packet identifier (PID) for DVB teletext data you include in this output. Default is 499.
 */
@property (nonatomic, strong) NSNumber * _Nullable dvbTeletextPid;

/**
 When set to VIDEO_AND_FIXED_INTERVALS, audio EBP markers will be added to partitions 3 and 4. The interval between these additional markers will be fixed, and will be slightly shorter than the video EBP marker interval. When set to VIDEO_INTERVAL, these additional markers will not be inserted. Only applicable when EBP segmentation markers are is selected (segmentationMarkers is EBP or EBP_LEGACY).
 */
@property (nonatomic, assign) AWSMediaconvertM2tsEbpAudioInterval ebpAudioInterval;

/**
 Selects which PIDs to place EBP markers on. They can either be placed only on the video PID, or on both the video PID and all audio PIDs. Only applicable when EBP segmentation markers are is selected (segmentationMarkers is EBP or EBP_LEGACY).
 */
@property (nonatomic, assign) AWSMediaconvertM2tsEbpPlacement ebpPlacement;

/**
 Controls whether to include the ES Rate field in the PES header.
 */
@property (nonatomic, assign) AWSMediaconvertM2tsEsRateInPes esRateInPes;

/**
 Keep the default value (DEFAULT) unless you know that your audio EBP markers are incorrectly appearing before your video EBP markers. To correct this problem, set this value to Force (FORCE).
 */
@property (nonatomic, assign) AWSMediaconvertM2tsForceTsVideoEbpOrder forceTsVideoEbpOrder;

/**
 The length, in seconds, of each fragment. Only used with EBP markers.
 */
@property (nonatomic, strong) NSNumber * _Nullable fragmentTime;

/**
 Specify the maximum time, in milliseconds, between Program Clock References (PCRs) inserted into the transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxPcrInterval;

/**
 When set, enforces that Encoder Boundary Points do not come within the specified time interval of each other by looking ahead at input video. If another EBP is going to come in within the specified time interval, the current EBP is not emitted, and the segment is "stretched" to the next marker. The lookahead value does not add latency to the system. The Live Event must be configured elsewhere to create sufficient latency to make the lookahead accurate.
 */
@property (nonatomic, strong) NSNumber * _Nullable minEbpInterval;

/**
 If INSERT, Nielsen inaudible tones for media tracking will be detected in the input audio and an equivalent ID3 tag will be inserted in the output.
 */
@property (nonatomic, assign) AWSMediaconvertM2tsNielsenId3 nielsenId3;

/**
 Value in bits per second of extra null packets to insert into the transport stream. This can be used if a downstream encryption system requires periodic null packets.
 */
@property (nonatomic, strong) NSNumber * _Nullable nullPacketBitrate;

/**
 The number of milliseconds between instances of this table in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable patInterval;

/**
 When set to PCR_EVERY_PES_PACKET, a Program Clock Reference value is inserted for every Packetized Elementary Stream (PES) header. This is effective only when the PCR PID is the same as the video or audio elementary stream.
 */
@property (nonatomic, assign) AWSMediaconvertM2tsPcrControl pcrControl;

/**
 Specify the packet identifier (PID) for the program clock reference (PCR) in this output. If you do not specify a value, the service will use the value for Video PID (VideoPid).
 */
@property (nonatomic, strong) NSNumber * _Nullable pcrPid;

/**
 Specify the number of milliseconds between instances of the program map table (PMT) in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable pmtInterval;

/**
 Specify the packet identifier (PID) for the program map table (PMT) itself. Default is 480.
 */
@property (nonatomic, strong) NSNumber * _Nullable pmtPid;

/**
 Specify the packet identifier (PID) of the private metadata stream. Default is 503.
 */
@property (nonatomic, strong) NSNumber * _Nullable privateMetadataPid;

/**
 Use Program number (programNumber) to specify the program number used in the program map table (PMT) for this output. Default is 1. Program numbers and program map tables are parts of MPEG-2 transport stream containers, used for organizing data.
 */
@property (nonatomic, strong) NSNumber * _Nullable programNumber;

/**
 When set to CBR, inserts null packets into transport stream to fill specified bitrate. When set to VBR, the bitrate setting acts as the maximum bitrate, but the output will not be padded up to that bitrate.
 */
@property (nonatomic, assign) AWSMediaconvertM2tsRateMode rateMode;

/**
 Include this in your job settings to put SCTE-35 markers in your HLS and transport stream outputs at the insertion points that you specify in an ESAM XML document. Provide the document in the setting SCC XML (sccXml).
 */
@property (nonatomic, strong) AWSMediaconvertM2tsScte35Esam * _Nullable scte35Esam;

/**
 Specify the packet identifier (PID) of the SCTE-35 stream in the transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable scte35Pid;

/**
 For SCTE-35 markers from your input-- Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that appear in your input to also appear in this output. Choose None (NONE) if you don't want SCTE-35 markers in this output. For SCTE-35 markers from an ESAM XML document-- Choose None (NONE). Also provide the ESAM XML as a string in the setting Signal processing notification XML (sccXml). Also enable ESAM SCTE-35 (include the property scte35Esam).
 */
@property (nonatomic, assign) AWSMediaconvertM2tsScte35Source scte35Source;

/**
 Inserts segmentation markers at each segmentation_time period. rai_segstart sets the Random Access Indicator bit in the adaptation field. rai_adapt sets the RAI bit and adds the current timecode in the private data bytes. psi_segstart inserts PAT and PMT tables at the start of segments. ebp adds Encoder Boundary Point information to the adaptation field as per OpenCable specification OC-SP-EBP-I01-130118. ebp_legacy adds Encoder Boundary Point information to the adaptation field using a legacy proprietary format.
 */
@property (nonatomic, assign) AWSMediaconvertM2tsSegmentationMarkers segmentationMarkers;

/**
 The segmentation style parameter controls how segmentation markers are inserted into the transport stream. With avails, it is possible that segments may be truncated, which can influence where future segmentation markers are inserted. When a segmentation style of "reset_cadence" is selected and a segment is truncated due to an avail, we will reset the segmentation cadence. This means the subsequent segment will have a duration of of $segmentation_time seconds. When a segmentation style of "maintain_cadence" is selected and a segment is truncated due to an avail, we will not reset the segmentation cadence. This means the subsequent segment will likely be truncated as well. However, all segments after that will have a duration of $segmentation_time seconds. Note that EBP lookahead is a slight exception to this rule.
 */
@property (nonatomic, assign) AWSMediaconvertM2tsSegmentationStyle segmentationStyle;

/**
 Specify the length, in seconds, of each segment. Required unless markers is set to _none_.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentationTime;

/**
 Specify the packet identifier (PID) for timed metadata in this output. Default is 502.
 */
@property (nonatomic, strong) NSNumber * _Nullable timedMetadataPid;

/**
 Specify the ID for the transport stream itself in the program map table for this output. Transport stream IDs and program map tables are parts of MPEG-2 transport stream containers, used for organizing data.
 */
@property (nonatomic, strong) NSNumber * _Nullable transportStreamId;

/**
 Specify the packet identifier (PID) of the elementary video stream in the transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable videoPid;

@end

/**
 Settings for TS segments in HLS
 */
@interface AWSMediaconvertM3u8Settings : AWSModel


/**
 The number of audio frames to insert for each PES packet.
 */
@property (nonatomic, strong) NSNumber * _Nullable audioFramesPerPes;

/**
 Packet Identifier (PID) of the elementary audio stream(s) in the transport stream. Multiple values are accepted, and can be entered in ranges and/or by comma separation.
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable audioPids;

/**
 If INSERT, Nielsen inaudible tones for media tracking will be detected in the input audio and an equivalent ID3 tag will be inserted in the output.
 */
@property (nonatomic, assign) AWSMediaconvertM3u8NielsenId3 nielsenId3;

/**
 The number of milliseconds between instances of this table in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable patInterval;

/**
 When set to PCR_EVERY_PES_PACKET a Program Clock Reference value is inserted for every Packetized Elementary Stream (PES) header. This parameter is effective only when the PCR PID is the same as the video or audio elementary stream.
 */
@property (nonatomic, assign) AWSMediaconvertM3u8PcrControl pcrControl;

/**
 Packet Identifier (PID) of the Program Clock Reference (PCR) in the transport stream. When no value is given, the encoder will assign the same value as the Video PID.
 */
@property (nonatomic, strong) NSNumber * _Nullable pcrPid;

/**
 The number of milliseconds between instances of this table in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable pmtInterval;

/**
 Packet Identifier (PID) for the Program Map Table (PMT) in the transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable pmtPid;

/**
 Packet Identifier (PID) of the private metadata stream in the transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable privateMetadataPid;

/**
 The value of the program number field in the Program Map Table.
 */
@property (nonatomic, strong) NSNumber * _Nullable programNumber;

/**
 Packet Identifier (PID) of the SCTE-35 stream in the transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable scte35Pid;

/**
 For SCTE-35 markers from your input-- Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that appear in your input to also appear in this output. Choose None (NONE) if you don't want SCTE-35 markers in this output. For SCTE-35 markers from an ESAM XML document-- Choose None (NONE) if you don't want manifest conditioning. Choose Passthrough (PASSTHROUGH) and choose Ad markers (adMarkers) if you do want manifest conditioning. In both cases, also provide the ESAM XML as a string in the setting Signal processing notification XML (sccXml).
 */
@property (nonatomic, assign) AWSMediaconvertM3u8Scte35Source scte35Source;

/**
 Applies only to HLS outputs. Use this setting to specify whether the service inserts the ID3 timed metadata from the input in this output.
 */
@property (nonatomic, assign) AWSMediaconvertTimedMetadata timedMetadata;

/**
 Packet Identifier (PID) of the timed metadata stream in the transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable timedMetadataPid;

/**
 The value of the transport stream ID field in the Program Map Table.
 */
@property (nonatomic, strong) NSNumber * _Nullable transportStreamId;

/**
 Packet Identifier (PID) of the elementary video stream in the transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable videoPid;

@end

/**
 Overlay motion graphics on top of your video at the time that you specify.
 */
@interface AWSMediaconvertMotionImageInserter : AWSModel


/**
 If your motion graphic asset is a .mov file, keep this setting unspecified. If your motion graphic asset is a series of .png files, specify the frame rate of the overlay in frames per second, as a fraction. For example, specify 24 fps as 24/1. Make sure that the number of images in your series matches the frame rate and your intended overlay duration. For example, if you want a 30-second overlay at 30 fps, you should have 900 .png images. This overlay frame rate doesn't need to match the frame rate of the underlying video.
 */
@property (nonatomic, strong) AWSMediaconvertMotionImageInsertionFramerate * _Nullable framerate;

/**
 Specify the .mov file or series of .png files that you want to overlay on your video. For .png files, provide the file name of the first file in the series. Make sure that the names of the .png files end with sequential numbers that specify the order that they are played in. For example, overlay_000.png, overlay_001.png, overlay_002.png, and so on. The sequence must start at zero, and each image file name must have the same number of digits. Pad your initial file names with enough zeros to complete the sequence. For example, if the first image is overlay_0.png, there can be only 10 images in the sequence, with the last image being overlay_9.png. But if the first image is overlay_00.png, there can be 100 images in the sequence.
 */
@property (nonatomic, strong) NSString * _Nullable input;

/**
 Choose the type of motion graphic asset that you are providing for your overlay. You can choose either a .mov file or a series of .png files.
 */
@property (nonatomic, assign) AWSMediaconvertMotionImageInsertionMode insertionMode;

/**
 Use Offset to specify the placement of your motion graphic overlay on the video frame. Specify in pixels, from the upper-left corner of the frame. If you don't specify an offset, the service scales your overlay to the full size of the frame. Otherwise, the service inserts the overlay at its native resolution and scales the size up or down with any video scaling.
 */
@property (nonatomic, strong) AWSMediaconvertMotionImageInsertionOffset * _Nullable offset;

/**
 Specify whether your motion graphic overlay repeats on a loop or plays only once.
 */
@property (nonatomic, assign) AWSMediaconvertMotionImagePlayback playback;

/**
 Specify when the motion overlay begins. Use timecode format (HH:MM:SS:FF or HH:MM:SS;FF). Make sure that the timecode you provide here takes into account how you have set up your timecode configuration under both job settings and input settings. The simplest way to do that is to set both to start at 0. If you need to set up your job to follow timecodes embedded in your source that don't start at zero, make sure that you specify a start time that is after the first embedded timecode. For more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/setting-up-timecode.html Find job-wide and input timecode configuration settings in your JSON job settings specification at settings>timecodeConfig>source and settings>inputs>timecodeSource.
 */
@property (nonatomic, strong) NSString * _Nullable startTime;

@end

/**
 For motion overlays that don't have a built-in frame rate, specify the frame rate of the overlay in frames per second, as a fraction. For example, specify 24 fps as 24/1. The overlay frame rate doesn't need to match the frame rate of the underlying video.
 */
@interface AWSMediaconvertMotionImageInsertionFramerate : AWSModel


/**
 The bottom of the fraction that expresses your overlay frame rate. For example, if your frame rate is 24 fps, set this value to 1.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 The top of the fraction that expresses your overlay frame rate. For example, if your frame rate is 24 fps, set this value to 24.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

@end

/**
 Specify the offset between the upper-left corner of the video frame and the top left corner of the overlay.
 */
@interface AWSMediaconvertMotionImageInsertionOffset : AWSModel


/**
 Set the distance, in pixels, between the overlay and the left edge of the video frame.
 */
@property (nonatomic, strong) NSNumber * _Nullable imageX;

/**
 Set the distance, in pixels, between the overlay and the top edge of the video frame.
 */
@property (nonatomic, strong) NSNumber * _Nullable imageY;

@end

/**
 Settings for MOV Container.
 */
@interface AWSMediaconvertMovSettings : AWSModel


/**
 When enabled, include 'clap' atom if appropriate for the video output settings.
 */
@property (nonatomic, assign) AWSMediaconvertMovClapAtom clapAtom;

/**
 When enabled, file composition times will start at zero, composition times in the 'ctts' (composition time to sample) box for B-frames will be negative, and a 'cslg' (composition shift least greatest) box will be included per 14496-1 amendment 1. This improves compatibility with Apple players and tools.
 */
@property (nonatomic, assign) AWSMediaconvertMovCslgAtom cslgAtom;

/**
 When set to XDCAM, writes MPEG2 video streams into the QuickTime file using XDCAM fourcc codes. This increases compatibility with Apple editors and players, but may decrease compatibility with other players. Only applicable when the video codec is MPEG2.
 */
@property (nonatomic, assign) AWSMediaconvertMovMpeg2FourCCControl mpeg2FourCCControl;

/**
 If set to OMNEON, inserts Omneon-compatible padding
 */
@property (nonatomic, assign) AWSMediaconvertMovPaddingControl paddingControl;

/**
 Always keep the default value (SELF_CONTAINED) for this setting.
 */
@property (nonatomic, assign) AWSMediaconvertMovReference reference;

@end

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value MP2.
 */
@interface AWSMediaconvertMp2Settings : AWSModel


/**
 Specify the average bitrate in bits per second.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Set Channels to specify the number of channels in this output audio track. Choosing Mono in the console will give you 1 output channel; choosing Stereo will give you 2. In the API, valid values are 1 and 2.
 */
@property (nonatomic, strong) NSNumber * _Nullable channels;

/**
 Sample rate in hz.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

@end

/**
 Required when you set Codec, under AudioDescriptions>CodecSettings, to the value MP3.
 */
@interface AWSMediaconvertMp3Settings : AWSModel


/**
 Specify the average bitrate in bits per second.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specify the number of channels in this output audio track. Choosing Mono on the console gives you 1 output channel; choosing Stereo gives you 2. In the API, valid values are 1 and 2.
 */
@property (nonatomic, strong) NSNumber * _Nullable channels;

/**
 Specify whether the service encodes this MP3 audio output with a constant bitrate (CBR) or a variable bitrate (VBR).
 */
@property (nonatomic, assign) AWSMediaconvertMp3RateControlMode rateControlMode;

/**
 Sample rate in hz.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

/**
 Required when you set Bitrate control mode (rateControlMode) to VBR. Specify the audio quality of this MP3 output from 0 (highest quality) to 9 (lowest quality).
 */
@property (nonatomic, strong) NSNumber * _Nullable vbrQuality;

@end

/**
 Settings for MP4 container. You can create audio-only AAC outputs with this container.
 */
@interface AWSMediaconvertMp4Settings : AWSModel


/**
 When enabled, file composition times will start at zero, composition times in the 'ctts' (composition time to sample) box for B-frames will be negative, and a 'cslg' (composition shift least greatest) box will be included per 14496-1 amendment 1. This improves compatibility with Apple players and tools.
 */
@property (nonatomic, assign) AWSMediaconvertMp4CslgAtom cslgAtom;

/**
 Ignore this setting unless compliance to the CTTS box version specification matters in your workflow. Specify a value of 1 to set your CTTS box version to 1 and make your output compliant with the specification. When you specify a value of 1, you must also set CSLG atom (cslgAtom) to the value INCLUDE. Keep the default value 0 to set your CTTS box version to 0. This can provide backward compatibility for some players and packagers.
 */
@property (nonatomic, strong) NSNumber * _Nullable cttsVersion;

/**
 Inserts a free-space box immediately after the moov box.
 */
@property (nonatomic, assign) AWSMediaconvertMp4FreeSpaceBox freeSpaceBox;

/**
 If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the beginning of the archive as required for progressive downloading. Otherwise it is placed normally at the end.
 */
@property (nonatomic, assign) AWSMediaconvertMp4MoovPlacement moovPlacement;

/**
 Overrides the "Major Brand" field in the output file. Usually not necessary to specify.
 */
@property (nonatomic, strong) NSString * _Nullable mp4MajorBrand;

@end

/**
 Settings for MP4 segments in DASH
 */
@interface AWSMediaconvertMpdSettings : AWSModel


/**
 Use this setting only in DASH output groups that include sidecar TTML or IMSC captions.You specify sidecar captions in a separate output from your audio and video. Choose Raw (RAW) for captions in a single XML file in a raw container. Choose Fragmented MPEG-4 (FRAGMENTED_MP4) for captions in XML format contained within fragmented MP4 files. This set of fragmented MP4 files is separate from your video and audio fragmented MP4 files.
 */
@property (nonatomic, assign) AWSMediaconvertMpdCaptionContainerType captionContainerType;

/**
 Use this setting only when you specify SCTE-35 markers from ESAM. Choose INSERT to put SCTE-35 markers in this output at the insertion points that you specify in an ESAM XML document. Provide the document in the setting SCC XML (sccXml).
 */
@property (nonatomic, assign) AWSMediaconvertMpdScte35Esam scte35Esam;

/**
 Ignore this setting unless you have SCTE-35 markers in your input video file. Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that appear in your input to also appear in this output. Choose None (NONE) if you don't want those SCTE-35 markers in this output.
 */
@property (nonatomic, assign) AWSMediaconvertMpdScte35Source scte35Source;

@end

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value MPEG2.
 */
@interface AWSMediaconvertMpeg2Settings : AWSModel


/**
 Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2AdaptiveQuantization adaptiveQuantization;

/**
 Specify the average bitrate in bits per second. Required for VBR and CBR. For MS Smooth outputs, bitrates must be unique when rounded down to the nearest multiple of 1000.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Use Level (Mpeg2CodecLevel) to set the MPEG-2 level for the video output.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2CodecLevel codecLevel;

/**
 Use Profile (Mpeg2CodecProfile) to set the MPEG-2 profile for the video output.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2CodecProfile codecProfile;

/**
 Choose Adaptive to improve subjective video quality for high-motion content. This will cause the service to use fewer B-frames (which infer information based on other frames) for high-motion portions of the video and more B-frames for low-motion portions. The maximum number of B-frames is limited by the value you provide for the setting B frames between reference frames (numberBFramesBetweenReferenceFrames).
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2DynamicSubGop dynamicSubGop;

/**
 If you are using the console, use the Framerate setting to specify the frame rate for this output. If you want to keep the same frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction. If you are creating your transcoding job specification as a JSON file without the console, use FramerateControl to specify which value the service uses for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the settings FramerateNumerator and FramerateDenominator.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2FramerateControl framerateControl;

/**
 Optional. Specify how the transcoder performs framerate conversion. The default behavior is to use duplicate drop conversion.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2FramerateConversionAlgorithm framerateConversionAlgorithm;

/**
 Frame rate denominator.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 Frame rate numerator - frame rate is a fraction, e.g. 24000 / 1001 = 23.976 fps.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

/**
 Frequency of closed GOPs. In streaming applications, it is recommended that this be set to 1 so a decoder joining mid-stream will receive an IDR frame as quickly as possible. Setting this value to 0 will break output segmenting.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopClosedCadence;

/**
 GOP Length (keyframe interval) in frames or seconds. Must be greater than zero.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopSize;

/**
 Indicates if the GOP Size in MPEG2 is specified in frames or seconds. If seconds the system will convert the GOP Size into a frame count at run time.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2GopSizeUnits gopSizeUnits;

/**
 Percentage of the buffer that should initially be filled (HRD buffer model).
 */
@property (nonatomic, strong) NSNumber * _Nullable hrdBufferInitialFillPercentage;

/**
 Size of buffer (HRD buffer model) in bits. For example, enter five megabits as 5000000.
 */
@property (nonatomic, strong) NSNumber * _Nullable hrdBufferSize;

/**
 Use Interlace mode (InterlaceMode) to choose the scan line type for the output. * Top Field First (TOP_FIELD) and Bottom Field First (BOTTOM_FIELD) produce interlaced output with the entire output having the same field polarity (top or bottom first). * Follow, Default Top (FOLLOW_TOP_FIELD) and Follow, Default Bottom (FOLLOW_BOTTOM_FIELD) use the same field polarity as the source. Therefore, behavior depends on the input scan type. - If the source is interlaced, the output will be interlaced with the same polarity as the source (it will follow the source). The output could therefore be a mix of "top field first" and "bottom field first". - If the source is progressive, the output will be interlaced with "top field first" or "bottom field first" polarity, depending on which of the Follow options you chose.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2InterlaceMode interlaceMode;

/**
 Use Intra DC precision (Mpeg2IntraDcPrecision) to set quantization precision for intra-block DC coefficients. If you choose the value auto, the service will automatically select the precision based on the per-frame compression ratio.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2IntraDcPrecision intraDcPrecision;

/**
 Maximum bitrate in bits/second. For example, enter five megabits per second as 5000000.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxBitrate;

/**
 Enforces separation between repeated (cadence) I-frames and I-frames inserted by Scene Change Detection. If a scene change I-frame is within I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched to the scene change I-frame. GOP stretch requires enabling lookahead as well as setting I-interval. The normal cadence resumes for the next GOP. This setting is only used when Scene Change Detect is enabled. Note: Maximum GOP stretch = GOP size + Min-I-interval - 1
 */
@property (nonatomic, strong) NSNumber * _Nullable minIInterval;

/**
 Number of B-frames between reference frames.
 */
@property (nonatomic, strong) NSNumber * _Nullable numberBFramesBetweenReferenceFrames;

/**
 Optional. Specify how the service determines the pixel aspect ratio (PAR) for this output. The default behavior, Follow source (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your output. To specify a different PAR in the console, choose any value other than Follow source. To specify a different PAR by editing the JSON job specification, choose SPECIFIED. When you choose SPECIFIED for this setting, you must also specify values for the parNumerator and parDenominator settings.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2ParControl parControl;

/**
 Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the console, this corresponds to any value other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen, you would specify the ratio 40:33. In this example, the value for parDenominator is 33.
 */
@property (nonatomic, strong) NSNumber * _Nullable parDenominator;

/**
 Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the console, this corresponds to any value other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen, you would specify the ratio 40:33. In this example, the value for parNumerator is 40.
 */
@property (nonatomic, strong) NSNumber * _Nullable parNumerator;

/**
 Optional. Use Quality tuning level (qualityTuningLevel) to choose how you want to trade off encoding speed for output video quality. The default behavior is faster, lower quality, single-pass encoding.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2QualityTuningLevel qualityTuningLevel;

/**
 Use Rate control mode (Mpeg2RateControlMode) to specifiy whether the bitrate is variable (vbr) or constant (cbr).
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2RateControlMode rateControlMode;

/**
 Enable this setting to insert I-frames at scene changes that the service automatically detects. This improves video quality and is enabled by default.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2SceneChangeDetect sceneChangeDetect;

/**
 Enables Slow PAL rate conversion. 23.976fps and 24fps input is relabeled as 25fps, and audio is sped up correspondingly.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2SlowPal slowPal;

/**
 Softness. Selects quantizer matrix, larger values reduce high-frequency content in the encoded image.
 */
@property (nonatomic, strong) NSNumber * _Nullable softness;

/**
 Adjust quantization within each frame based on spatial variation of content complexity.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2SpatialAdaptiveQuantization spatialAdaptiveQuantization;

/**
 Produces a Type D-10 compatible bitstream (SMPTE 356M-2001).
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2Syntax syntax;

/**
 Only use Telecine (Mpeg2Telecine) when you set Framerate (Framerate) to 29.970. Set Telecine (Mpeg2Telecine) to Hard (hard) to produce a 29.97i output from a 23.976 input. Set it to Soft (soft) to produce 23.976 output and leave converstion to the player.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2Telecine telecine;

/**
 Adjust quantization within each frame based on temporal variation of content complexity.
 */
@property (nonatomic, assign) AWSMediaconvertMpeg2TemporalAdaptiveQuantization temporalAdaptiveQuantization;

@end

/**
 Specify the details for each additional Microsoft Smooth Streaming manifest that you want the service to generate for this output group. Each manifest can reference a different subset of outputs in the group.
 */
@interface AWSMediaconvertMsSmoothAdditionalManifest : AWSModel


/**
 Specify a name modifier that the service adds to the name of this manifest to make it different from the file names of the other main manifests in the output group. For example, say that the default main manifest for your Microsoft Smooth group is film-name.ismv. If you enter "-no-premium" for this setting, then the file name the service generates for this top-level manifest is film-name-no-premium.ismv.
 */
@property (nonatomic, strong) NSString * _Nullable manifestNameModifier;

/**
 Specify the outputs that you want this additional top-level manifest to reference.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable selectedOutputs;

@end

/**
 If you are using DRM, set DRM System (MsSmoothEncryptionSettings) to specify the value SpekeKeyProvider.
 */
@interface AWSMediaconvertMsSmoothEncryptionSettings : AWSModel


/**
 If your output group type is HLS, DASH, or Microsoft Smooth, use these settings when doing DRM encryption with a SPEKE-compliant key provider.If your output group type is CMAF, use the SpekeKeyProviderCmaf settings instead.
 */
@property (nonatomic, strong) AWSMediaconvertSpekeKeyProvider * _Nullable spekeKeyProvider;

@end

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to MS_SMOOTH_GROUP_SETTINGS.
 */
@interface AWSMediaconvertMsSmoothGroupSettings : AWSModel


/**
 By default, the service creates one .ism Microsoft Smooth Streaming manifest for each Microsoft Smooth Streaming output group in your job. This default manifest references every output in the output group. To create additional manifests that reference a subset of the outputs in the output group, specify a list of them here.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertMsSmoothAdditionalManifest *> * _Nullable additionalManifests;

/**
 COMBINE_DUPLICATE_STREAMS combines identical audio encoding settings across a Microsoft Smooth output group into a single audio stream.
 */
@property (nonatomic, assign) AWSMediaconvertMsSmoothAudioDeduplication audioDeduplication;

/**
 Use Destination (Destination) to specify the S3 output location and the output filename base. Destination accepts format identifiers. If you do not specify the base filename in the URI, the service will use the filename of the input file. If your job has multiple inputs, the service uses the filename of the first input file.
 */
@property (nonatomic, strong) NSString * _Nullable destination;

/**
 Settings associated with the destination. Will vary based on the type of destination
 */
@property (nonatomic, strong) AWSMediaconvertDestinationSettings * _Nullable destinationSettings;

/**
 If you are using DRM, set DRM System (MsSmoothEncryptionSettings) to specify the value SpekeKeyProvider.
 */
@property (nonatomic, strong) AWSMediaconvertMsSmoothEncryptionSettings * _Nullable encryption;

/**
 Use Fragment length (FragmentLength) to specify the mp4 fragment sizes in seconds. Fragment length must be compatible with GOP size and frame rate.
 */
@property (nonatomic, strong) NSNumber * _Nullable fragmentLength;

/**
 Use Manifest encoding (MsSmoothManifestEncoding) to specify the encoding format for the server and client manifest. Valid options are utf8 and utf16.
 */
@property (nonatomic, assign) AWSMediaconvertMsSmoothManifestEncoding manifestEncoding;

@end

/**
 MXF settings
 */
@interface AWSMediaconvertMxfSettings : AWSModel


/**
 Optional. When you have AFD signaling set up in your output video stream, use this setting to choose whether to also include it in the MXF wrapper. Choose Don't copy (NO_COPY) to exclude AFD signaling from the MXF wrapper. Choose Copy from video stream (COPY_FROM_VIDEO) to copy the AFD values from the video stream for this output to the MXF wrapper. Regardless of which option you choose, the AFD values remain in the video stream. Related settings: To set up your output to include or exclude AFD values, see AfdSignaling, under VideoDescription. On the console, find AFD signaling under the output's video encoding settings.
 */
@property (nonatomic, assign) AWSMediaconvertMxfAfdSignaling afdSignaling;

@end

/**
 For forensic video watermarking, MediaConvert supports Nagra NexGuard File Marker watermarking. MediaConvert supports both PreRelease Content (NGPR/G2) and OTT Streaming workflows.
 */
@interface AWSMediaconvertNexGuardFileMarkerSettings : AWSModel


/**
 Use the base64 license string that Nagra provides you. Enter it directly in your JSON job specification or in the console. Required when you include Nagra NexGuard File Marker watermarking (NexGuardWatermarkingSettings) in your job.
 */
@property (nonatomic, strong) NSString * _Nullable license;

/**
 Specify the payload ID that you want associated with this output. Valid values vary depending on your Nagra NexGuard forensic watermarking workflow. Required when you include Nagra NexGuard File Marker watermarking (NexGuardWatermarkingSettings) in your job. For PreRelease Content (NGPR/G2), specify an integer from 1 through 4,194,303. You must generate a unique ID for each asset you watermark, and keep a record of which ID you have assigned to each asset. Neither Nagra nor MediaConvert keep track of the relationship between output files and your IDs. For OTT Streaming, create two adaptive bitrate (ABR) stacks for each asset. Do this by setting up two output groups. For one output group, set the value of Payload ID (payload) to 0 in every output. For the other output group, set Payload ID (payload) to 1 in every output.
 */
@property (nonatomic, strong) NSNumber * _Nullable payload;

/**
 Enter one of the watermarking preset strings that Nagra provides you. Required when you include Nagra NexGuard File Marker watermarking (NexGuardWatermarkingSettings) in your job.
 */
@property (nonatomic, strong) NSString * _Nullable preset;

/**
 Optional. Ignore this setting unless Nagra support directs you to specify a value. When you don't specify a value here, the Nagra NexGuard library uses its default value.
 */
@property (nonatomic, assign) AWSMediaconvertWatermarkingStrength strength;

@end

/**
 Settings for your Nielsen configuration. If you don't do Nielsen measurement and analytics, ignore these settings. When you enable Nielsen configuration (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all outputs in the job. To enable Nielsen configuration programmatically, include an instance of nielsenConfiguration in your JSON job specification. Even if you don't include any children of nielsenConfiguration, you still enable the setting.
 */
@interface AWSMediaconvertNielsenConfiguration : AWSModel


/**
 Nielsen has discontinued the use of breakout code functionality. If you must include this property, set the value to zero.
 */
@property (nonatomic, strong) NSNumber * _Nullable breakoutCode;

/**
 Use Distributor ID (DistributorID) to specify the distributor ID that is assigned to your organization by Neilsen.
 */
@property (nonatomic, strong) NSString * _Nullable distributorId;

@end

/**
 Enable the Noise reducer (NoiseReducer) feature to remove noise from your video output if necessary. Enable or disable this feature for each output individually. This setting is disabled by default. When you enable Noise reducer (NoiseReducer), you must also select a value for Noise reducer filter (NoiseReducerFilter).
 */
@interface AWSMediaconvertNoiseReducer : AWSModel


/**
 Use Noise reducer filter (NoiseReducerFilter) to select one of the following spatial image filtering functions. To use this setting, you must also enable Noise reducer (NoiseReducer). * Bilateral preserves edges while reducing noise. * Mean (softest), Gaussian, Lanczos, and Sharpen (sharpest) do convolution filtering. * Conserve does min/max noise reduction. * Spatial does frequency-domain filtering based on JND principles. * Temporal optimizes video quality for complex motion.
 */
@property (nonatomic, assign) AWSMediaconvertNoiseReducerFilter filter;

/**
 Settings for a noise reducer filter
 */
@property (nonatomic, strong) AWSMediaconvertNoiseReducerFilterSettings * _Nullable filterSettings;

/**
 Noise reducer filter settings for spatial filter.
 */
@property (nonatomic, strong) AWSMediaconvertNoiseReducerSpatialFilterSettings * _Nullable spatialFilterSettings;

/**
 Noise reducer filter settings for temporal filter.
 */
@property (nonatomic, strong) AWSMediaconvertNoiseReducerTemporalFilterSettings * _Nullable temporalFilterSettings;

@end

/**
 Settings for a noise reducer filter
 */
@interface AWSMediaconvertNoiseReducerFilterSettings : AWSModel


/**
 Relative strength of noise reducing filter. Higher values produce stronger filtering.
 */
@property (nonatomic, strong) NSNumber * _Nullable strength;

@end

/**
 Noise reducer filter settings for spatial filter.
 */
@interface AWSMediaconvertNoiseReducerSpatialFilterSettings : AWSModel


/**
 Specify strength of post noise reduction sharpening filter, with 0 disabling the filter and 3 enabling it at maximum strength.
 */
@property (nonatomic, strong) NSNumber * _Nullable postFilterSharpenStrength;

/**
 The speed of the filter, from -2 (lower speed) to 3 (higher speed), with 0 being the nominal value.
 */
@property (nonatomic, strong) NSNumber * _Nullable speed;

/**
 Relative strength of noise reducing filter. Higher values produce stronger filtering.
 */
@property (nonatomic, strong) NSNumber * _Nullable strength;

@end

/**
 Noise reducer filter settings for temporal filter.
 */
@interface AWSMediaconvertNoiseReducerTemporalFilterSettings : AWSModel


/**
 Use Aggressive mode for content that has complex motion. Higher values produce stronger temporal filtering. This filters highly complex scenes more aggressively and creates better VQ for low bitrate outputs.
 */
@property (nonatomic, strong) NSNumber * _Nullable aggressiveMode;

/**
 Optional. When you set Noise reducer (noiseReducer) to Temporal (TEMPORAL), you can optionally use this setting to apply additional sharpening. The default behavior, Auto (AUTO) allows the transcoder to determine whether to apply filtering, depending on input type and quality.
 */
@property (nonatomic, assign) AWSMediaconvertNoiseFilterPostTemporalSharpening postTemporalSharpening;

/**
 The speed of the filter (higher number is faster). Low setting reduces bit rate at the cost of transcode time, high setting improves transcode time at the cost of bit rate.
 */
@property (nonatomic, strong) NSNumber * _Nullable speed;

/**
 Specify the strength of the noise reducing filter on this output. Higher values produce stronger filtering. We recommend the following value ranges, depending on the result that you want: * 0-2 for complexity reduction with minimal sharpness loss * 2-8 for complexity reduction with image preservation * 8-16 for a high level of complexity reduction
 */
@property (nonatomic, strong) NSNumber * _Nullable strength;

@end

/**
 Required when you set Codec, under AudioDescriptions>CodecSettings, to the value OPUS.
 */
@interface AWSMediaconvertOpusSettings : AWSModel


/**
 Optional. Specify the average bitrate in bits per second. Valid values are multiples of 8000, from 32000 through 192000. The default value is 96000, which we recommend for quality and bandwidth.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specify the number of channels in this output audio track. Choosing Mono on the console gives you 1 output channel; choosing Stereo gives you 2. In the API, valid values are 1 and 2.
 */
@property (nonatomic, strong) NSNumber * _Nullable channels;

/**
 Optional. Sample rate in hz. Valid values are 16000, 24000, and 48000. The default value is 48000.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

@end

/**
 An output object describes the settings for a single output file or stream in an output group.
 */
@interface AWSMediaconvertOutput : AWSModel


/**
 (AudioDescriptions) contains groups of audio encoding settings organized by audio codec. Include one instance of (AudioDescriptions) per output. (AudioDescriptions) can contain multiple groups of encoding settings.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertAudioDescription *> * _Nullable audioDescriptions;

/**
 (CaptionDescriptions) contains groups of captions settings. For each output that has captions, include one instance of (CaptionDescriptions). (CaptionDescriptions) can contain multiple groups of captions settings.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertCaptionDescription *> * _Nullable captionDescriptions;

/**
 Container specific settings.
 */
@property (nonatomic, strong) AWSMediaconvertContainerSettings * _Nullable containerSettings;

/**
 Use Extension (Extension) to specify the file extension for outputs in File output groups. If you do not specify a value, the service will use default extensions by container type as follows * MPEG-2 transport stream, m2ts * Quicktime, mov * MXF container, mxf * MPEG-4 container, mp4 * WebM container, webm * No Container, the service will use codec extensions (e.g. AAC, H265, H265, AC3)
 */
@property (nonatomic, strong) NSString * _Nullable extension;

/**
 Use Name modifier (NameModifier) to have the service add a string to the end of each output filename. You specify the base filename as part of your destination URI. When you create multiple outputs in the same output group, Name modifier (NameModifier) is required. Name modifier also accepts format identifiers. For DASH ISO outputs, if you use the format identifiers $Number$ or $Time$ in one output, you must use them in the same way in all outputs of the output group.
 */
@property (nonatomic, strong) NSString * _Nullable nameModifier;

/**
 Specific settings for this type of output.
 */
@property (nonatomic, strong) AWSMediaconvertOutputSettings * _Nullable outputSettings;

/**
 Use Preset (Preset) to specifiy a preset for your transcoding settings. Provide the system or custom preset name. You can specify either Preset (Preset) or Container settings (ContainerSettings), but not both.
 */
@property (nonatomic, strong) NSString * _Nullable preset;

/**
 (VideoDescription) contains a group of video encoding settings. The specific video settings depend on the video codec that you choose when you specify a value for Video codec (codec). Include one instance of (VideoDescription) per output.
 */
@property (nonatomic, strong) AWSMediaconvertVideoDescription * _Nullable videoDescription;

@end

/**
 OutputChannel mapping settings.
 */
@interface AWSMediaconvertOutputChannelMapping : AWSModel


/**
 List of input channels
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable inputChannels;

@end

/**
 Details regarding output
 */
@interface AWSMediaconvertOutputDetail : AWSModel


/**
 Duration in milliseconds
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInMs;

/**
 Contains details about the output's video stream
 */
@property (nonatomic, strong) AWSMediaconvertVideoDetail * _Nullable videoDetails;

@end

/**
 Group of outputs
 */
@interface AWSMediaconvertOutputGroup : AWSModel


/**
 Use Custom Group Name (CustomName) to specify a name for the output group. This value is displayed on the console and can make your job settings JSON more human-readable. It does not affect your outputs. Use up to twelve characters that are either letters, numbers, spaces, or underscores.
 */
@property (nonatomic, strong) NSString * _Nullable customName;

/**
 Name of the output group
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Output Group settings, including type
 */
@property (nonatomic, strong) AWSMediaconvertOutputGroupSettings * _Nullable outputGroupSettings;

/**
 This object holds groups of encoding settings, one group of settings per output.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertOutput *> * _Nullable outputs;

@end

/**
 Contains details about the output groups specified in the job settings.
 */
@interface AWSMediaconvertOutputGroupDetail : AWSModel


/**
 Details about the output
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertOutputDetail *> * _Nullable outputDetails;

@end

/**
 Output Group settings, including type
 */
@interface AWSMediaconvertOutputGroupSettings : AWSModel


/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to CMAF_GROUP_SETTINGS. Each output in a CMAF Output Group may only contain a single video, audio, or caption output.
 */
@property (nonatomic, strong) AWSMediaconvertCmafGroupSettings * _Nullable cmafGroupSettings;

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to DASH_ISO_GROUP_SETTINGS.
 */
@property (nonatomic, strong) AWSMediaconvertDashIsoGroupSettings * _Nullable dashIsoGroupSettings;

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to FILE_GROUP_SETTINGS.
 */
@property (nonatomic, strong) AWSMediaconvertFileGroupSettings * _Nullable fileGroupSettings;

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to HLS_GROUP_SETTINGS.
 */
@property (nonatomic, strong) AWSMediaconvertHlsGroupSettings * _Nullable hlsGroupSettings;

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to MS_SMOOTH_GROUP_SETTINGS.
 */
@property (nonatomic, strong) AWSMediaconvertMsSmoothGroupSettings * _Nullable msSmoothGroupSettings;

/**
 Type of output group (File group, Apple HLS, DASH ISO, Microsoft Smooth Streaming, CMAF)
 */
@property (nonatomic, assign) AWSMediaconvertOutputGroupType types;

@end

/**
 Specific settings for this type of output.
 */
@interface AWSMediaconvertOutputSettings : AWSModel


/**
 Settings for HLS output groups
 */
@property (nonatomic, strong) AWSMediaconvertHlsSettings * _Nullable hlsSettings;

@end

/**
 If you work with a third party video watermarking partner, use the group of settings that correspond with your watermarking partner to include watermarks in your output.
 */
@interface AWSMediaconvertPartnerWatermarking : AWSModel


/**
 For forensic video watermarking, MediaConvert supports Nagra NexGuard File Marker watermarking. MediaConvert supports both PreRelease Content (NGPR/G2) and OTT Streaming workflows.
 */
@property (nonatomic, strong) AWSMediaconvertNexGuardFileMarkerSettings * _Nullable nexguardFileMarkerSettings;

@end

/**
 A preset is a collection of preconfigured media conversion settings that you want MediaConvert to apply to the output during the conversion process.
 Required parameters: [Settings, Name]
 */
@interface AWSMediaconvertPreset : AWSModel


/**
 An identifier for this resource that is unique within all of AWS.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 An optional category you create to organize your presets.
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 The timestamp in epoch seconds for preset creation.
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 An optional description you create for each preset.
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 The timestamp in epoch seconds when the preset was last updated.
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdated;

/**
 A name you create for each preset. Each name must be unique within your account.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Settings for preset
 */
@property (nonatomic, strong) AWSMediaconvertPresetSettings * _Nullable settings;

/**
 A preset can be of two types: system or custom. System or built-in preset can't be modified or deleted by the user.
 */
@property (nonatomic, assign) AWSMediaconvertTypes types;

@end

/**
 Settings for preset
 */
@interface AWSMediaconvertPresetSettings : AWSModel


/**
 (AudioDescriptions) contains groups of audio encoding settings organized by audio codec. Include one instance of (AudioDescriptions) per output. (AudioDescriptions) can contain multiple groups of encoding settings.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertAudioDescription *> * _Nullable audioDescriptions;

/**
 Caption settings for this preset. There can be multiple caption settings in a single output.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertCaptionDescriptionPreset *> * _Nullable captionDescriptions;

/**
 Container specific settings.
 */
@property (nonatomic, strong) AWSMediaconvertContainerSettings * _Nullable containerSettings;

/**
 (VideoDescription) contains a group of video encoding settings. The specific video settings depend on the video codec that you choose when you specify a value for Video codec (codec). Include one instance of (VideoDescription) per output.
 */
@property (nonatomic, strong) AWSMediaconvertVideoDescription * _Nullable videoDescription;

@end

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value PRORES.
 */
@interface AWSMediaconvertProresSettings : AWSModel


/**
 Use Profile (ProResCodecProfile) to specifiy the type of Apple ProRes codec to use for this output.
 */
@property (nonatomic, assign) AWSMediaconvertProresCodecProfile codecProfile;

/**
 If you are using the console, use the Framerate setting to specify the frame rate for this output. If you want to keep the same frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction. If you are creating your transcoding job specification as a JSON file without the console, use FramerateControl to specify which value the service uses for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the settings FramerateNumerator and FramerateDenominator.
 */
@property (nonatomic, assign) AWSMediaconvertProresFramerateControl framerateControl;

/**
 Optional. Specify how the transcoder performs framerate conversion. The default behavior is to use duplicate drop conversion.
 */
@property (nonatomic, assign) AWSMediaconvertProresFramerateConversionAlgorithm framerateConversionAlgorithm;

/**
 Frame rate denominator.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a fraction. For example,24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of this fraction. In this example, use 24000 for the value of FramerateNumerator.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

/**
 Use Interlace mode (InterlaceMode) to choose the scan line type for the output. * Top Field First (TOP_FIELD) and Bottom Field First (BOTTOM_FIELD) produce interlaced output with the entire output having the same field polarity (top or bottom first). * Follow, Default Top (FOLLOW_TOP_FIELD) and Follow, Default Bottom (FOLLOW_BOTTOM_FIELD) use the same field polarity as the source. Therefore, behavior depends on the input scan type. - If the source is interlaced, the output will be interlaced with the same polarity as the source (it will follow the source). The output could therefore be a mix of "top field first" and "bottom field first". - If the source is progressive, the output will be interlaced with "top field first" or "bottom field first" polarity, depending on which of the Follow options you chose.
 */
@property (nonatomic, assign) AWSMediaconvertProresInterlaceMode interlaceMode;

/**
 Optional. Specify how the service determines the pixel aspect ratio (PAR) for this output. The default behavior, Follow source (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your output. To specify a different PAR in the console, choose any value other than Follow source. To specify a different PAR by editing the JSON job specification, choose SPECIFIED. When you choose SPECIFIED for this setting, you must also specify values for the parNumerator and parDenominator settings.
 */
@property (nonatomic, assign) AWSMediaconvertProresParControl parControl;

/**
 Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the console, this corresponds to any value other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen, you would specify the ratio 40:33. In this example, the value for parDenominator is 33.
 */
@property (nonatomic, strong) NSNumber * _Nullable parDenominator;

/**
 Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the console, this corresponds to any value other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen, you would specify the ratio 40:33. In this example, the value for parNumerator is 40.
 */
@property (nonatomic, strong) NSNumber * _Nullable parNumerator;

/**
 Enables Slow PAL rate conversion. 23.976fps and 24fps input is relabeled as 25fps, and audio is sped up correspondingly.
 */
@property (nonatomic, assign) AWSMediaconvertProresSlowPal slowPal;

/**
 Only use Telecine (ProresTelecine) when you set Framerate (Framerate) to 29.970. Set Telecine (ProresTelecine) to Hard (hard) to produce a 29.97i output from a 23.976 input. Set it to Soft (soft) to produce 23.976 output and leave converstion to the player.
 */
@property (nonatomic, assign) AWSMediaconvertProresTelecine telecine;

@end

/**
 You can use queues to manage the resources that are available to your AWS account for running multiple transcoding jobs at the same time. If you don't specify a queue, the service sends all jobs through the default queue. For more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
 Required parameters: [Name]
 */
@interface AWSMediaconvertQueue : AWSModel


/**
 An identifier for this resource that is unique within all of AWS.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The timestamp in epoch seconds for when you created the queue.
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 An optional description that you create for each queue.
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 The timestamp in epoch seconds for when you most recently updated the queue.
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdated;

/**
 A name that you create for each queue. Each name must be unique within your account.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Specifies whether the pricing plan for the queue is on-demand or reserved. For on-demand, you pay per minute, billed in increments of .01 minute. For reserved, you pay for the transcoding capacity of the entire queue, regardless of how much or how little you use it. Reserved pricing requires a 12-month commitment.
 */
@property (nonatomic, assign) AWSMediaconvertPricingPlan pricingPlan;

/**
 The estimated number of jobs with a PROGRESSING status.
 */
@property (nonatomic, strong) NSNumber * _Nullable progressingJobsCount;

/**
 Details about the pricing plan for your reserved queue. Required for reserved queues and not applicable to on-demand queues.
 */
@property (nonatomic, strong) AWSMediaconvertReservationPlan * _Nullable reservationPlan;

/**
 Queues can be ACTIVE or PAUSED. If you pause a queue, the service won't begin processing jobs in that queue. Jobs that are running when you pause the queue continue to run until they finish or result in an error.
 */
@property (nonatomic, assign) AWSMediaconvertQueueStatus status;

/**
 The estimated number of jobs with a SUBMITTED status.
 */
@property (nonatomic, strong) NSNumber * _Nullable submittedJobsCount;

/**
 Specifies whether this on-demand queue is system or custom. System queues are built in. You can't modify or delete system queues. You can create and modify custom queues.
 */
@property (nonatomic, assign) AWSMediaconvertTypes types;

@end

/**
 Description of the source and destination queues between which the job has moved, along with the timestamp of the move
 */
@interface AWSMediaconvertQueueTransition : AWSModel


/**
 The queue that the job was on after the transition.
 */
@property (nonatomic, strong) NSString * _Nullable destinationQueue;

/**
 The queue that the job was on before the transition.
 */
@property (nonatomic, strong) NSString * _Nullable sourceQueue;

/**
 The time, in Unix epoch format, that the job moved from the source queue to the destination queue.
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 Use Rectangle to identify a specific area of the video frame.
 */
@interface AWSMediaconvertRectangle : AWSModel


/**
 Height of rectangle in pixels. Specify only even numbers.
 */
@property (nonatomic, strong) NSNumber * _Nullable height;

/**
 Width of rectangle in pixels. Specify only even numbers.
 */
@property (nonatomic, strong) NSNumber * _Nullable width;

/**
 The distance, in pixels, between the rectangle and the left edge of the video frame. Specify only even numbers.
 */
@property (nonatomic, strong) NSNumber * _Nullable X;

/**
 The distance, in pixels, between the rectangle and the top edge of the video frame. Specify only even numbers.
 */
@property (nonatomic, strong) NSNumber * _Nullable Y;

@end

/**
 Use Manual audio remixing (RemixSettings) to adjust audio levels for each audio channel in each output of your job. With audio remixing, you can output more or fewer audio channels than your input audio source provides.
 */
@interface AWSMediaconvertRemixSettings : AWSModel


/**
 Channel mapping (ChannelMapping) contains the group of fields that hold the remixing value for each channel. Units are in dB. Acceptable values are within the range from -60 (mute) through 6. A setting of 0 passes the input channel unchanged to the output channel (no attenuation or amplification).
 */
@property (nonatomic, strong) AWSMediaconvertChannelMapping * _Nullable channelMapping;

/**
 Specify the number of audio channels from your input that you want to use in your output. With remixing, you might combine or split the data in these channels, so the number of channels in your final output might be different.
 */
@property (nonatomic, strong) NSNumber * _Nullable channelsIn;

/**
 Specify the number of channels in this output after remixing. Valid values: 1, 2, 4, 6, 8... 64. (1 and even numbers to 64.)
 */
@property (nonatomic, strong) NSNumber * _Nullable channelsOut;

@end

/**
 Details about the pricing plan for your reserved queue. Required for reserved queues and not applicable to on-demand queues.
 */
@interface AWSMediaconvertReservationPlan : AWSModel


/**
 The length of the term of your reserved queue pricing plan commitment.
 */
@property (nonatomic, assign) AWSMediaconvertCommitment commitment;

/**
 The timestamp in epoch seconds for when the current pricing plan term for this reserved queue expires.
 */
@property (nonatomic, strong) NSDate * _Nullable expiresAt;

/**
 The timestamp in epoch seconds for when you set up the current pricing plan for this reserved queue.
 */
@property (nonatomic, strong) NSDate * _Nullable purchasedAt;

/**
 Specifies whether the term of your reserved queue pricing plan is automatically extended (AUTO_RENEW) or expires (EXPIRE) at the end of the term.
 */
@property (nonatomic, assign) AWSMediaconvertRenewalType renewalType;

/**
 Specifies the number of reserved transcode slots (RTS) for this queue. The number of RTS determines how many jobs the queue can process in parallel; each RTS can process one job at a time. When you increase this number, you extend your existing commitment with a new 12-month commitment for a larger number of RTS. The new commitment begins when you purchase the additional capacity. You can't decrease the number of RTS in your reserved queue.
 */
@property (nonatomic, strong) NSNumber * _Nullable reservedSlots;

/**
 Specifies whether the pricing plan for your reserved queue is ACTIVE or EXPIRED.
 */
@property (nonatomic, assign) AWSMediaconvertReservationPlanStatus status;

@end

/**
 Details about the pricing plan for your reserved queue. Required for reserved queues and not applicable to on-demand queues.
 Required parameters: [Commitment, ReservedSlots, RenewalType]
 */
@interface AWSMediaconvertReservationPlanSettings : AWSModel


/**
 The length of the term of your reserved queue pricing plan commitment.
 */
@property (nonatomic, assign) AWSMediaconvertCommitment commitment;

/**
 Specifies whether the term of your reserved queue pricing plan is automatically extended (AUTO_RENEW) or expires (EXPIRE) at the end of the term. When your term is auto renewed, you extend your commitment by 12 months from the auto renew date. You can cancel this commitment.
 */
@property (nonatomic, assign) AWSMediaconvertRenewalType renewalType;

/**
 Specifies the number of reserved transcode slots (RTS) for this queue. The number of RTS determines how many jobs the queue can process in parallel; each RTS can process one job at a time. You can't decrease the number of RTS in your reserved queue. You can increase the number of RTS by extending your existing commitment with a new 12-month commitment for the larger number. The new commitment begins when you purchase the additional capacity. You can't cancel your commitment or revert to your original commitment after you increase the capacity.
 */
@property (nonatomic, strong) NSNumber * _Nullable reservedSlots;

@end

/**
 The Amazon Resource Name (ARN) and tags for an AWS Elemental MediaConvert resource.
 */
@interface AWSMediaconvertResourceTags : AWSModel


/**
 The Amazon Resource Name (ARN) of the resource.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The tags for the resource.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Optional. Have MediaConvert automatically apply Amazon S3 access control for the outputs in this output group. When you don't use this setting, S3 automatically applies the default access control list PRIVATE.
 */
@interface AWSMediaconvertS3DestinationAccessControl : AWSModel


/**
 Choose an Amazon S3 canned ACL for MediaConvert to apply to this output.
 */
@property (nonatomic, assign) AWSMediaconvertS3ObjectCannedAcl cannedAcl;

@end

/**
 Settings associated with S3 destination
 */
@interface AWSMediaconvertS3DestinationSettings : AWSModel


/**
 Optional. Have MediaConvert automatically apply Amazon S3 access control for the outputs in this output group. When you don't use this setting, S3 automatically applies the default access control list PRIVATE.
 */
@property (nonatomic, strong) AWSMediaconvertS3DestinationAccessControl * _Nullable accessControl;

/**
 Settings for how your job outputs are encrypted as they are uploaded to Amazon S3.
 */
@property (nonatomic, strong) AWSMediaconvertS3EncryptionSettings * _Nullable encryption;

@end

/**
 Settings for how your job outputs are encrypted as they are uploaded to Amazon S3.
 */
@interface AWSMediaconvertS3EncryptionSettings : AWSModel


/**
 Specify how you want your data keys managed. AWS uses data keys to encrypt your content. AWS also encrypts the data keys themselves, using a customer master key (CMK), and then stores the encrypted data keys alongside your encrypted content. Use this setting to specify which AWS service manages the CMK. For simplest set up, choose Amazon S3 (SERVER_SIDE_ENCRYPTION_S3). If you want your master key to be managed by AWS Key Management Service (KMS), choose AWS KMS (SERVER_SIDE_ENCRYPTION_KMS). By default, when you choose AWS KMS, KMS uses the AWS managed customer master key (CMK) associated with Amazon S3 to encrypt your data keys. You can optionally choose to specify a different, customer managed CMK. Do so by specifying the Amazon Resource Name (ARN) of the key for the settingKMS ARN (kmsKeyArn).
 */
@property (nonatomic, assign) AWSMediaconvertS3ServerSideEncryptionType encryptionType;

/**
 Optionally, specify the customer master key (CMK) that you want to use to encrypt the data key that AWS uses to encrypt your output content. Enter the Amazon Resource Name (ARN) of the CMK. To use this setting, you must also set Server-side encryption (S3ServerSideEncryptionType) to AWS KMS (SERVER_SIDE_ENCRYPTION_KMS). If you set Server-side encryption to AWS KMS but don't specify a CMK here, AWS uses the AWS managed CMK associated with Amazon S3.
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

@end

/**
 Settings for SCC caption output.
 */
@interface AWSMediaconvertSccDestinationSettings : AWSModel


/**
 Set Framerate (SccDestinationFramerate) to make sure that the captions and the video are synchronized in the output. Specify a frame rate that matches the frame rate of the associated video. If the video frame rate is 29.97, choose 29.97 dropframe (FRAMERATE_29_97_DROPFRAME) only if the video has video_insertion=true and drop_frame_timecode=true; otherwise, choose 29.97 non-dropframe (FRAMERATE_29_97_NON_DROPFRAME).
 */
@property (nonatomic, assign) AWSMediaconvertSccDestinationFramerate framerate;

@end

/**
 If your output group type is HLS, DASH, or Microsoft Smooth, use these settings when doing DRM encryption with a SPEKE-compliant key provider.If your output group type is CMAF, use the SpekeKeyProviderCmaf settings instead.
 */
@interface AWSMediaconvertSpekeKeyProvider : AWSModel


/**
 If you want your key provider to encrypt the content keys that it provides to MediaConvert, set up a certificate with a master key using AWS Certificate Manager. Specify the certificate's Amazon Resource Name (ARN) here.
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 Specify the resource ID that your SPEKE-compliant key provider uses to identify this content.
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 Relates to SPEKE implementation. DRM system identifiers. DASH output groups support a max of two system ids. Other group types support one system id. Seehttps://dashif.org/identifiers/content_protection/ for more details.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable systemIds;

/**
 Specify the URL to the key server that your SPEKE-compliant DRM key provider uses to provide keys for encrypting your content.
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 If your output group type is CMAF, use these settings when doing DRM encryption with a SPEKE-compliant key provider. If your output group type is HLS, DASH, or Microsoft Smooth, use the SpekeKeyProvider settings instead.
 */
@interface AWSMediaconvertSpekeKeyProviderCmaf : AWSModel


/**
 If you want your key provider to encrypt the content keys that it provides to MediaConvert, set up a certificate with a master key using AWS Certificate Manager. Specify the certificate's Amazon Resource Name (ARN) here.
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 Specify the DRM system IDs that you want signaled in the DASH manifest that MediaConvert creates as part of this CMAF package. The DASH manifest can currently signal up to three system IDs. For more information, see https://dashif.org/identifiers/content_protection/.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable dashSignaledSystemIds;

/**
 Specify the DRM system ID that you want signaled in the HLS manifest that MediaConvert creates as part of this CMAF package. The HLS manifest can currently signal only one system ID. For more information, see https://dashif.org/identifiers/content_protection/.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable hlsSignaledSystemIds;

/**
 Specify the resource ID that your SPEKE-compliant key provider uses to identify this content.
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 Specify the URL to the key server that your SPEKE-compliant DRM key provider uses to provide keys for encrypting your content.
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 Use these settings to set up encryption with a static key provider.
 */
@interface AWSMediaconvertStaticKeyProvider : AWSModel


/**
 Relates to DRM implementation. Sets the value of the KEYFORMAT attribute. Must be 'identity' or a reverse DNS string. May be omitted to indicate an implicit value of 'identity'.
 */
@property (nonatomic, strong) NSString * _Nullable keyFormat;

/**
 Relates to DRM implementation. Either a single positive integer version value or a slash delimited list of version values (1/2/3).
 */
@property (nonatomic, strong) NSString * _Nullable keyFormatVersions;

/**
 Relates to DRM implementation. Use a 32-character hexidecimal string to specify Key Value (StaticKeyValue).
 */
@property (nonatomic, strong) NSString * _Nullable staticKeyValue;

/**
 Relates to DRM implementation. The location of the license server used for protecting content.
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 
 */
@interface AWSMediaconvertTagResourceRequest : AWSRequest


/**
 The Amazon Resource Name (ARN) of the resource that you want to tag. To get the ARN, send a GET request with the resource name.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The tags that you want to add to the resource. You can tag resources with a key-value pair or with only a key.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSMediaconvertTagResourceResponse : AWSModel


@end

/**
 Settings for Teletext caption output
 */
@interface AWSMediaconvertTeletextDestinationSettings : AWSModel


/**
 Set pageNumber to the Teletext page number for the destination captions for this output. This value must be a three-digit hexadecimal string; strings ending in -FF are invalid. If you are passing through the entire set of Teletext data, do not use this field.
 */
@property (nonatomic, strong) NSString * _Nullable pageNumber;

/**
 Specify the page types for this Teletext page. If you don't specify a value here, the service sets the page type to the default value Subtitle (PAGE_TYPE_SUBTITLE). If you pass through the entire set of Teletext data, don't use this field. When you pass through a set of Teletext pages, your output has the same page types as your input.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable pageTypes;

@end

/**
 Settings specific to Teletext caption sources, including Page number.
 */
@interface AWSMediaconvertTeletextSourceSettings : AWSModel


/**
 Use Page Number (PageNumber) to specify the three-digit hexadecimal page number that will be used for Teletext captions. Do not use this setting if you are passing through teletext from the input source to output.
 */
@property (nonatomic, strong) NSString * _Nullable pageNumber;

@end

/**
 Timecode burn-in (TimecodeBurnIn)--Burns the output timecode and specified prefix into the output.
 */
@interface AWSMediaconvertTimecodeBurnin : AWSModel


/**
 Use Font Size (FontSize) to set the font size of any burned-in timecode. Valid values are 10, 16, 32, 48.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontSize;

/**
 Use Position (Position) under under Timecode burn-in (TimecodeBurnIn) to specify the location the burned-in timecode on output video.
 */
@property (nonatomic, assign) AWSMediaconvertTimecodeBurninPosition position;

/**
 Use Prefix (Prefix) to place ASCII characters before any burned-in timecode. For example, a prefix of "EZ-" will result in the timecode "EZ-00:00:00:00". Provide either the characters themselves or the ASCII code equivalents. The supported range of characters is 0x20 through 0x7e. This includes letters, numbers, and all special characters represented on a standard English keyboard.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 These settings control how the service handles timecodes throughout the job. These settings don't affect input clipping.
 */
@interface AWSMediaconvertTimecodeConfig : AWSModel


/**
 If you use an editing platform that relies on an anchor timecode, use Anchor Timecode (Anchor) to specify a timecode that will match the input video frame to the output video frame. Use 24-hour format with frame number, (HH:MM:SS:FF) or (HH:MM:SS;FF). This setting ignores frame rate conversion. System behavior for Anchor Timecode varies depending on your setting for Source (TimecodeSource). * If Source (TimecodeSource) is set to Specified Start (SPECIFIEDSTART), the first input frame is the specified value in Start Timecode (Start). Anchor Timecode (Anchor) and Start Timecode (Start) are used calculate output timecode. * If Source (TimecodeSource) is set to Start at 0 (ZEROBASED)thefirst frame is 00:00:00:00. * If Source (TimecodeSource) is set to Embedded (EMBEDDED), thefirst frame is the timecode value on the first input frame of the input.
 */
@property (nonatomic, strong) NSString * _Nullable anchor;

/**
 Use Source (TimecodeSource) to set how timecodes are handled within this job. To make sure that your video, audio, captions, and markers are synchronized and that time-based features, such as image inserter, work correctly, choose the Timecode source option that matches your assets. All timecodes are in a 24-hour format with frame number (HH:MM:SS:FF). * Embedded (EMBEDDED) - Use the timecode that is in the input video. If no embedded timecode is in the source, the service will use Start at 0 (ZEROBASED) instead. * Start at 0 (ZEROBASED) - Set the timecode of the initial frame to 00:00:00:00. * Specified Start (SPECIFIEDSTART) - Set the timecode of the initial frame to a value other than zero. You use Start timecode (Start) to provide this value.
 */
@property (nonatomic, assign) AWSMediaconvertTimecodeSource source;

/**
 Only use when you set Source (TimecodeSource) to Specified start (SPECIFIEDSTART). Use Start timecode (Start) to specify the timecode for the initial frame. Use 24-hour format with frame number, (HH:MM:SS:FF) or (HH:MM:SS;FF).
 */
@property (nonatomic, strong) NSString * _Nullable start;

/**
 Only applies to outputs that support program-date-time stamp. Use Timestamp offset (TimestampOffset) to overwrite the timecode date without affecting the time and frame number. Provide the new date as a string in the format "yyyy-mm-dd".To use Time stamp offset, you must also enable Insert program-date-time (InsertProgramDateTime) in the output settings. For example, if the date part of your timecodes is 2002-1-25 and you want to change it to one year later, set Timestamp offset (TimestampOffset) to 2003-1-25.
 */
@property (nonatomic, strong) NSString * _Nullable timestampOffset;

@end

/**
 Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3 tags in your job. To include timed metadata, you must enable it here, enable it in each output container, and specify tags and timecodes in ID3 insertion (Id3Insertion) objects.
 */
@interface AWSMediaconvertTimedMetadataInsertion : AWSModel


/**
 Id3Insertions contains the array of Id3Insertion instances.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertId3Insertion *> * _Nullable id3Insertions;

@end

/**
 Information about when jobs are submitted, started, and finished is specified in Unix epoch format in seconds.
 */
@interface AWSMediaconvertTiming : AWSModel


/**
 The time, in Unix epoch format, that the transcoding job finished
 */
@property (nonatomic, strong) NSDate * _Nullable finishTime;

/**
 The time, in Unix epoch format, that transcoding for the job began.
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 The time, in Unix epoch format, that you submitted the job.
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

@end

/**
 Settings specific to caption sources that are specified by track number. Currently, this is only IMSC captions in an IMF package. If your caption source is IMSC 1.1 in a separate xml file, use FileSourceSettings instead of TrackSourceSettings.
 */
@interface AWSMediaconvertTrackSourceSettings : AWSModel


/**
 Use this setting to select a single captions track from a source. Track numbers correspond to the order in the captions source file. For IMF sources, track numbering is based on the order that the captions appear in the CPL. For example, use 1 to select the captions asset that is listed first in the CPL. To include more than one captions track in your job outputs, create multiple input captions selectors. Specify one track per selector.
 */
@property (nonatomic, strong) NSNumber * _Nullable trackNumber;

@end

/**
 Settings specific to TTML caption outputs, including Pass style information (TtmlStylePassthrough).
 */
@interface AWSMediaconvertTtmlDestinationSettings : AWSModel


/**
 Pass through style and position information from a TTML-like input source (TTML, SMPTE-TT) to the TTML output.
 */
@property (nonatomic, assign) AWSMediaconvertTtmlStylePassthrough stylePassthrough;

@end

/**
 
 */
@interface AWSMediaconvertUntagResourceRequest : AWSRequest


/**
 The Amazon Resource Name (ARN) of the resource that you want to remove tags from. To get the ARN, send a GET request with the resource name.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The keys of the tags that you want to remove from the resource.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSMediaconvertUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSMediaconvertUpdateJobTemplateRequest : AWSRequest


/**
 Accelerated transcoding can significantly speed up jobs with long, visually complex content. Outputs that use this feature incur pro-tier pricing. For information about feature limitations, see the AWS Elemental MediaConvert User Guide.
 */
@property (nonatomic, strong) AWSMediaconvertAccelerationSettings * _Nullable accelerationSettings;

/**
 The new category for the job template, if you are changing it.
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 The new description for the job template, if you are changing it.
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 Optional list of hop destinations.
 */
@property (nonatomic, strong) NSArray<AWSMediaconvertHopDestination *> * _Nullable hopDestinations;

/**
 The name of the job template you are modifying
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Specify the relative priority for this job. In any given queue, the service begins processing the job with the highest value first. When more than one job has the same priority, the service begins processing the job that you submitted first. If you don't specify a priority, the service uses the default value 0.
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 The new queue for the job template, if you are changing it.
 */
@property (nonatomic, strong) NSString * _Nullable queue;

/**
 JobTemplateSettings contains all the transcode settings saved in the template that will be applied to jobs created from it.
 */
@property (nonatomic, strong) AWSMediaconvertJobTemplateSettings * _Nullable settings;

/**
 Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the interval, in seconds, between status updates. MediaConvert sends an update at this interval from the time the service begins processing your job to the time it completes the transcode or encounters an error.
 */
@property (nonatomic, assign) AWSMediaconvertStatusUpdateInterval statusUpdateInterval;

@end

/**
 
 */
@interface AWSMediaconvertUpdateJobTemplateResponse : AWSModel


/**
 A job template is a pre-made set of encoding instructions that you can use to quickly create a job.
 */
@property (nonatomic, strong) AWSMediaconvertJobTemplate * _Nullable jobTemplate;

@end

/**
 
 */
@interface AWSMediaconvertUpdatePresetRequest : AWSRequest


/**
 The new category for the preset, if you are changing it.
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 The new description for the preset, if you are changing it.
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 The name of the preset you are modifying.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Settings for preset
 */
@property (nonatomic, strong) AWSMediaconvertPresetSettings * _Nullable settings;

@end

/**
 
 */
@interface AWSMediaconvertUpdatePresetResponse : AWSModel


/**
 A preset is a collection of preconfigured media conversion settings that you want MediaConvert to apply to the output during the conversion process.
 */
@property (nonatomic, strong) AWSMediaconvertPreset * _Nullable preset;

@end

/**
 
 */
@interface AWSMediaconvertUpdateQueueRequest : AWSRequest


/**
 The new description for the queue, if you are changing it.
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 The name of the queue that you are modifying.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The new details of your pricing plan for your reserved queue. When you set up a new pricing plan to replace an expired one, you enter into another 12-month commitment. When you add capacity to your queue by increasing the number of RTS, you extend the term of your commitment to 12 months from when you add capacity. After you make these commitments, you can't cancel them.
 */
@property (nonatomic, strong) AWSMediaconvertReservationPlanSettings * _Nullable reservationPlanSettings;

/**
 Pause or activate a queue by changing its status between ACTIVE and PAUSED. If you pause a queue, jobs in that queue won't begin. Jobs that are running when you pause the queue continue to run until they finish or result in an error.
 */
@property (nonatomic, assign) AWSMediaconvertQueueStatus status;

@end

/**
 
 */
@interface AWSMediaconvertUpdateQueueResponse : AWSModel


/**
 You can use queues to manage the resources that are available to your AWS account for running multiple transcoding jobs at the same time. If you don't specify a queue, the service sends all jobs through the default queue. For more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
 */
@property (nonatomic, strong) AWSMediaconvertQueue * _Nullable queue;

@end

/**
 Video codec settings, (CodecSettings) under (VideoDescription), contains the group of settings related to video encoding. The settings in this group vary depending on the value that you choose for Video codec (Codec). For each codec enum that you choose, define the corresponding settings object. The following lists the codec enum, settings object pairs. * FRAME_CAPTURE, FrameCaptureSettings * AV1, Av1Settings * H_264, H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES, ProresSettings * VP8, Vp8Settings * VP9, Vp9Settings
 */
@interface AWSMediaconvertVideoCodecSettings : AWSModel


/**
 Required when you set Codec, under VideoDescription>CodecSettings to the value AV1.
 */
@property (nonatomic, strong) AWSMediaconvertAv1Settings * _Nullable av1Settings;

/**
 Specifies the video codec. This must be equal to one of the enum values defined by the objectVideoCodec.
 */
@property (nonatomic, assign) AWSMediaconvertVideoCodec codec;

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value FRAME_CAPTURE.
 */
@property (nonatomic, strong) AWSMediaconvertFrameCaptureSettings * _Nullable frameCaptureSettings;

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value H_264.
 */
@property (nonatomic, strong) AWSMediaconvertH264Settings * _Nullable h264Settings;

/**
 Settings for H265 codec
 */
@property (nonatomic, strong) AWSMediaconvertH265Settings * _Nullable h265Settings;

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value MPEG2.
 */
@property (nonatomic, strong) AWSMediaconvertMpeg2Settings * _Nullable mpeg2Settings;

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value PRORES.
 */
@property (nonatomic, strong) AWSMediaconvertProresSettings * _Nullable proresSettings;

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value VP8.
 */
@property (nonatomic, strong) AWSMediaconvertVp8Settings * _Nullable vp8Settings;

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value VP9.
 */
@property (nonatomic, strong) AWSMediaconvertVp9Settings * _Nullable vp9Settings;

@end

/**
 Settings for video outputs
 */
@interface AWSMediaconvertVideoDescription : AWSModel


/**
 This setting only applies to H.264, H.265, and MPEG2 outputs. Use Insert AFD signaling (AfdSignaling) to specify whether the service includes AFD values in the output video data and what those values are. * Choose None to remove all AFD values from this output. * Choose Fixed to ignore input AFD values and instead encode the value specified in the job. * Choose Auto to calculate output AFD values based on the input AFD scaler data.
 */
@property (nonatomic, assign) AWSMediaconvertAfdSignaling afdSignaling;

/**
 The anti-alias filter is automatically applied to all outputs. The service no longer accepts the value DISABLED for AntiAlias. If you specify that in your job, the service will ignore the setting.
 */
@property (nonatomic, assign) AWSMediaconvertAntiAlias antiAlias;

/**
 Video codec settings, (CodecSettings) under (VideoDescription), contains the group of settings related to video encoding. The settings in this group vary depending on the value that you choose for Video codec (Codec). For each codec enum that you choose, define the corresponding settings object. The following lists the codec enum, settings object pairs. * FRAME_CAPTURE, FrameCaptureSettings * AV1, Av1Settings * H_264, H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES, ProresSettings * VP8, Vp8Settings * VP9, Vp9Settings
 */
@property (nonatomic, strong) AWSMediaconvertVideoCodecSettings * _Nullable codecSettings;

/**
 Choose Insert (INSERT) for this setting to include color metadata in this output. Choose Ignore (IGNORE) to exclude color metadata from this output. If you don't specify a value, the service sets this to Insert by default.
 */
@property (nonatomic, assign) AWSMediaconvertColorMetadata colorMetadata;

/**
 Use Cropping selection (crop) to specify the video area that the service will include in the output video frame.
 */
@property (nonatomic, strong) AWSMediaconvertRectangle * _Nullable crop;

/**
 Applies only to 29.97 fps outputs. When this feature is enabled, the service will use drop-frame timecode on outputs. If it is not possible to use drop-frame timecode, the system will fall back to non-drop-frame. This setting is enabled by default when Timecode insertion (TimecodeInsertion) is enabled.
 */
@property (nonatomic, assign) AWSMediaconvertDropFrameTimecode dropFrameTimecode;

/**
 Applies only if you set AFD Signaling(AfdSignaling) to Fixed (FIXED). Use Fixed (FixedAfd) to specify a four-bit AFD value which the service will write on allframes of this video output.
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedAfd;

/**
 Use the Height (Height) setting to define the video resolution height for this output. Specify in pixels. If you don't provide a value here, the service will use the input height.
 */
@property (nonatomic, strong) NSNumber * _Nullable height;

/**
 Use Selection placement (position) to define the video area in your output frame. The area outside of the rectangle that you specify here is black.
 */
@property (nonatomic, strong) AWSMediaconvertRectangle * _Nullable position;

/**
 Use Respond to AFD (RespondToAfd) to specify how the service changes the video itself in response to AFD values in the input. * Choose Respond to clip the input video frame according to the AFD value, input display aspect ratio, and output display aspect ratio. * Choose Passthrough to include the input AFD values. Do not choose this when AfdSignaling is set to (NONE). A preferred implementation of this workflow is to set RespondToAfd to (NONE) and set AfdSignaling to (AUTO). * Choose None to remove all input AFD values from this output.
 */
@property (nonatomic, assign) AWSMediaconvertRespondToAfd respondToAfd;

/**
 Specify how the service handles outputs that have a different aspect ratio from the input aspect ratio. Choose Stretch to output (STRETCH_TO_OUTPUT) to have the service stretch your video image to fit. Keep the setting Default (DEFAULT) to have the service letterbox your video instead. This setting overrides any value that you specify for the setting Selection placement (position) in this output.
 */
@property (nonatomic, assign) AWSMediaconvertScalingBehavior scalingBehavior;

/**
 Use Sharpness (Sharpness) setting to specify the strength of anti-aliasing. This setting changes the width of the anti-alias filter kernel used for scaling. Sharpness only applies if your output resolution is different from your input resolution. 0 is the softest setting, 100 the sharpest, and 50 recommended for most content.
 */
@property (nonatomic, strong) NSNumber * _Nullable sharpness;

/**
 Applies only to H.264, H.265, MPEG2, and ProRes outputs. Only enable Timecode insertion when the input frame rate is identical to the output frame rate. To include timecodes in this output, set Timecode insertion (VideoTimecodeInsertion) to PIC_TIMING_SEI. To leave them out, set it to DISABLED. Default is DISABLED. When the service inserts timecodes in an output, by default, it uses any embedded timecodes from the input. If none are present, the service will set the timecode for the first output frame to zero. To change this default behavior, adjust the settings under Timecode configuration (TimecodeConfig). In the console, these settings are located under Job > Job settings > Timecode configuration. Note - Timecode source under input settings (InputTimecodeSource) does not affect the timecodes that are inserted in the output. Source under Job settings > Timecode configuration (TimecodeSource) does.
 */
@property (nonatomic, assign) AWSMediaconvertVideoTimecodeInsertion timecodeInsertion;

/**
 Find additional transcoding features under Preprocessors (VideoPreprocessors). Enable the features at each output individually. These features are disabled by default.
 */
@property (nonatomic, strong) AWSMediaconvertVideoPreprocessor * _Nullable videoPreprocessors;

/**
 Use Width (Width) to define the video resolution width, in pixels, for this output. If you don't provide a value here, the service will use the input width.
 */
@property (nonatomic, strong) NSNumber * _Nullable width;

@end

/**
 Contains details about the output's video stream
 */
@interface AWSMediaconvertVideoDetail : AWSModel


/**
 Height in pixels for the output
 */
@property (nonatomic, strong) NSNumber * _Nullable heightInPx;

/**
 Width in pixels for the output
 */
@property (nonatomic, strong) NSNumber * _Nullable widthInPx;

@end

/**
 Find additional transcoding features under Preprocessors (VideoPreprocessors). Enable the features at each output individually. These features are disabled by default.
 */
@interface AWSMediaconvertVideoPreprocessor : AWSModel


/**
 Enable the Color corrector (ColorCorrector) feature if necessary. Enable or disable this feature for each output individually. This setting is disabled by default.
 */
@property (nonatomic, strong) AWSMediaconvertColorCorrector * _Nullable colorCorrector;

/**
 Use Deinterlacer (Deinterlacer) to produce smoother motion and a clearer picture.
 */
@property (nonatomic, strong) AWSMediaconvertDeinterlacer * _Nullable deinterlacer;

/**
 Enable Dolby Vision feature to produce Dolby Vision compatible video output.
 */
@property (nonatomic, strong) AWSMediaconvertDolbyVision * _Nullable dolbyVision;

/**
 Enable the Image inserter (ImageInserter) feature to include a graphic overlay on your video. Enable or disable this feature for each output individually. This setting is disabled by default.
 */
@property (nonatomic, strong) AWSMediaconvertImageInserter * _Nullable imageInserter;

/**
 Enable the Noise reducer (NoiseReducer) feature to remove noise from your video output if necessary. Enable or disable this feature for each output individually. This setting is disabled by default.
 */
@property (nonatomic, strong) AWSMediaconvertNoiseReducer * _Nullable noiseReducer;

/**
 If you work with a third party video watermarking partner, use the group of settings that correspond with your watermarking partner to include watermarks in your output.
 */
@property (nonatomic, strong) AWSMediaconvertPartnerWatermarking * _Nullable partnerWatermarking;

/**
 Timecode burn-in (TimecodeBurnIn)--Burns the output timecode and specified prefix into the output.
 */
@property (nonatomic, strong) AWSMediaconvertTimecodeBurnin * _Nullable timecodeBurnin;

@end

/**
 Selector for video.
 */
@interface AWSMediaconvertVideoSelector : AWSModel


/**
 Ignore this setting unless this input is a QuickTime animation with an alpha channel. Use this setting to create separate Key and Fill outputs. In each output, specify which part of the input MediaConvert uses. Leave this setting at the default value DISCARD to delete the alpha channel and preserve the video. Set it to REMAP_TO_LUMA to delete the video and map the alpha channel to the luma channel of your outputs.
 */
@property (nonatomic, assign) AWSMediaconvertAlphaBehavior alphaBehavior;

/**
 If your input video has accurate color space metadata, or if you don't know about color space, leave this set to the default value Follow (FOLLOW). The service will automatically detect your input color space. If your input video has metadata indicating the wrong color space, specify the accurate color space here. If your input video is HDR 10 and the SMPTE ST 2086 Mastering Display Color Volume static metadata isn't present in your video stream, or if that metadata is present but not accurate, choose Force HDR 10 (FORCE_HDR10) here and specify correct values in the input HDR 10 metadata (Hdr10Metadata) settings. For more information about MediaConvert HDR jobs, see https://docs.aws.amazon.com/console/mediaconvert/hdr.
 */
@property (nonatomic, assign) AWSMediaconvertColorSpace colorSpace;

/**
 There are two sources for color metadata, the input file and the job input settings Color space (ColorSpace) and HDR master display information settings(Hdr10Metadata). The Color space usage setting determines which takes precedence. Choose Force (FORCE) to use color metadata from the input job settings. If you don't specify values for those settings, the service defaults to using metadata from your input. FALLBACK - Choose Fallback (FALLBACK) to use color metadata from the source when it is present. If there's no color metadata in your input file, the service defaults to using values you specify in the input settings.
 */
@property (nonatomic, assign) AWSMediaconvertColorSpaceUsage colorSpaceUsage;

/**
 Use these settings to provide HDR 10 metadata that is missing or inaccurate in your input video. Appropriate values vary depending on the input video and must be provided by a color grader. The color grader generates these values during the HDR 10 mastering process. The valid range for each of these settings is 0 to 50,000. Each increment represents 0.00002 in CIE1931 color coordinate. Related settings - When you specify these values, you must also set Color space (ColorSpace) to HDR 10 (HDR10). To specify whether the the values you specify here take precedence over the values in the metadata of your input file, set Color space usage (ColorSpaceUsage). To specify whether color metadata is included in an output, set Color metadata (ColorMetadata). For more information about MediaConvert HDR jobs, see https://docs.aws.amazon.com/console/mediaconvert/hdr.
 */
@property (nonatomic, strong) AWSMediaconvertHdr10Metadata * _Nullable hdr10Metadata;

/**
 Use PID (Pid) to select specific video data from an input file. Specify this value as an integer; the system automatically converts it to the hexidecimal value. For example, 257 selects PID 0x101. A PID, or packet identifier, is an identifier for a set of data in an MPEG-2 transport stream container.
 */
@property (nonatomic, strong) NSNumber * _Nullable pid;

/**
 Selects a specific program from within a multi-program transport stream. Note that Quad 4K is not currently supported.
 */
@property (nonatomic, strong) NSNumber * _Nullable programNumber;

/**
 Use Rotate (InputRotate) to specify how the service rotates your video. You can choose automatic rotation or specify a rotation. You can specify a clockwise rotation of 0, 90, 180, or 270 degrees. If your input video container is .mov or .mp4 and your input has rotation metadata, you can choose Automatic to have the service rotate your video according to the rotation specified in the metadata. The rotation must be within one degree of 90, 180, or 270 degrees. If the rotation metadata specifies any other rotation, the service will default to no rotation. By default, the service does no rotation, even if your input video has rotation metadata. The service doesn't pass through rotation metadata.
 */
@property (nonatomic, assign) AWSMediaconvertInputRotate rotate;

@end

/**
 Required when you set Codec, under AudioDescriptions>CodecSettings, to the value Vorbis.
 */
@interface AWSMediaconvertVorbisSettings : AWSModel


/**
 Optional. Specify the number of channels in this output audio track. Choosing Mono on the console gives you 1 output channel; choosing Stereo gives you 2. In the API, valid values are 1 and 2. The default value is 2.
 */
@property (nonatomic, strong) NSNumber * _Nullable channels;

/**
 Optional. Specify the audio sample rate in Hz. Valid values are 22050, 32000, 44100, and 48000. The default value is 48000.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

/**
 Optional. Specify the variable audio quality of this Vorbis output from -1 (lowest quality, ~45 kbit/s) to 10 (highest quality, ~500 kbit/s). The default value is 4 (~128 kbit/s). Values 5 and 6 are approximately 160 and 192 kbit/s, respectively.
 */
@property (nonatomic, strong) NSNumber * _Nullable vbrQuality;

@end

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value VP8.
 */
@interface AWSMediaconvertVp8Settings : AWSModel


/**
 Target bitrate in bits/second. For example, enter five megabits per second as 5000000.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 If you are using the console, use the Framerate setting to specify the frame rate for this output. If you want to keep the same frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction. If you are creating your transcoding job specification as a JSON file without the console, use FramerateControl to specify which value the service uses for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the settings FramerateNumerator and FramerateDenominator.
 */
@property (nonatomic, assign) AWSMediaconvertVp8FramerateControl framerateControl;

/**
 Optional. Specify how the transcoder performs framerate conversion. The default behavior is to use Drop duplicate (DUPLICATE_DROP) conversion. When you choose Interpolate (INTERPOLATE) instead, the conversion produces smoother motion.
 */
@property (nonatomic, assign) AWSMediaconvertVp8FramerateConversionAlgorithm framerateConversionAlgorithm;

/**
 When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a fraction. For example,24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When you use the console for transcode jobs that use frame rate conversion, provide the value as a decimal number for Framerate. In this example, specify 23.976.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a fraction. For example,24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the console for transcode jobs that use frame rate conversion, provide the value as a decimal number for Framerate. In this example, specify 23.976.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

/**
 GOP Length (keyframe interval) in frames. Must be greater than zero.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopSize;

/**
 Optional. Size of buffer (HRD buffer model) in bits. For example, enter five megabits as 5000000.
 */
@property (nonatomic, strong) NSNumber * _Nullable hrdBufferSize;

/**
 Ignore this setting unless you set qualityTuningLevel to MULTI_PASS. Optional. Specify the maximum bitrate in bits/second. For example, enter five megabits per second as 5000000. The default behavior uses twice the target bitrate as the maximum bitrate.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxBitrate;

/**
 Optional. Specify how the service determines the pixel aspect ratio (PAR) for this output. The default behavior, Follow source (INITIALIZE_FROM_SOURCE), uses the PAR from your input video for your output. To specify a different PAR in the console, choose any value other than Follow source. To specify a different PAR by editing the JSON job specification, choose SPECIFIED. When you choose SPECIFIED for this setting, you must also specify values for the parNumerator and parDenominator settings.
 */
@property (nonatomic, assign) AWSMediaconvertVp8ParControl parControl;

/**
 Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the console, this corresponds to any value other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen, you would specify the ratio 40:33. In this example, the value for parDenominator is 33.
 */
@property (nonatomic, strong) NSNumber * _Nullable parDenominator;

/**
 Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the console, this corresponds to any value other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen, you would specify the ratio 40:33. In this example, the value for parNumerator is 40.
 */
@property (nonatomic, strong) NSNumber * _Nullable parNumerator;

/**
 Optional. Use Quality tuning level (qualityTuningLevel) to choose how you want to trade off encoding speed for output video quality. The default behavior is faster, lower quality, multi-pass encoding.
 */
@property (nonatomic, assign) AWSMediaconvertVp8QualityTuningLevel qualityTuningLevel;

/**
 With the VP8 codec, you can use only the variable bitrate (VBR) rate control mode.
 */
@property (nonatomic, assign) AWSMediaconvertVp8RateControlMode rateControlMode;

@end

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value VP9.
 */
@interface AWSMediaconvertVp9Settings : AWSModel


/**
 Target bitrate in bits/second. For example, enter five megabits per second as 5000000.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 If you are using the console, use the Framerate setting to specify the frame rate for this output. If you want to keep the same frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction. If you are creating your transcoding job specification as a JSON file without the console, use FramerateControl to specify which value the service uses for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the settings FramerateNumerator and FramerateDenominator.
 */
@property (nonatomic, assign) AWSMediaconvertVp9FramerateControl framerateControl;

/**
 Optional. Specify how the transcoder performs framerate conversion. The default behavior is to use Drop duplicate (DUPLICATE_DROP) conversion. When you choose Interpolate (INTERPOLATE) instead, the conversion produces smoother motion.
 */
@property (nonatomic, assign) AWSMediaconvertVp9FramerateConversionAlgorithm framerateConversionAlgorithm;

/**
 When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a fraction. For example,24000 / 1001 = 23.976 fps. Use FramerateDenominator to specify the denominator of this fraction. In this example, use 1001 for the value of FramerateDenominator. When you use the console for transcode jobs that use frame rate conversion, provide the value as a decimal number for Framerate. In this example, specify 23.976.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 When you use the API for transcode jobs that use frame rate conversion, specify the frame rate as a fraction. For example,24000 / 1001 = 23.976 fps. Use FramerateNumerator to specify the numerator of this fraction. In this example, use 24000 for the value of FramerateNumerator. When you use the console for transcode jobs that use frame rate conversion, provide the value as a decimal number for Framerate. In this example, specify 23.976.
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

/**
 GOP Length (keyframe interval) in frames. Must be greater than zero.
 */
@property (nonatomic, strong) NSNumber * _Nullable gopSize;

/**
 Size of buffer (HRD buffer model) in bits. For example, enter five megabits as 5000000.
 */
@property (nonatomic, strong) NSNumber * _Nullable hrdBufferSize;

/**
 Ignore this setting unless you set qualityTuningLevel to MULTI_PASS. Optional. Specify the maximum bitrate in bits/second. For example, enter five megabits per second as 5000000. The default behavior uses twice the target bitrate as the maximum bitrate.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxBitrate;

/**
 Optional. Specify how the service determines the pixel aspect ratio for this output. The default behavior is to use the same pixel aspect ratio as your input video.
 */
@property (nonatomic, assign) AWSMediaconvertVp9ParControl parControl;

/**
 Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the console, this corresponds to any value other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen, you would specify the ratio 40:33. In this example, the value for parDenominator is 33.
 */
@property (nonatomic, strong) NSNumber * _Nullable parDenominator;

/**
 Required when you set Pixel aspect ratio (parControl) to SPECIFIED. On the console, this corresponds to any value other than Follow source. When you specify an output pixel aspect ratio (PAR) that is different from your input video PAR, provide your output PAR as a ratio. For example, for D1/DV NTSC widescreen, you would specify the ratio 40:33. In this example, the value for parNumerator is 40.
 */
@property (nonatomic, strong) NSNumber * _Nullable parNumerator;

/**
 Optional. Use Quality tuning level (qualityTuningLevel) to choose how you want to trade off encoding speed for output video quality. The default behavior is faster, lower quality, multi-pass encoding.
 */
@property (nonatomic, assign) AWSMediaconvertVp9QualityTuningLevel qualityTuningLevel;

/**
 With the VP9 codec, you can use only the variable bitrate (VBR) rate control mode.
 */
@property (nonatomic, assign) AWSMediaconvertVp9RateControlMode rateControlMode;

@end

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value WAV.
 */
@interface AWSMediaconvertWavSettings : AWSModel


/**
 Specify Bit depth (BitDepth), in bits per sample, to choose the encoding quality for this audio track.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitDepth;

/**
 Specify the number of channels in this output audio track. Valid values are 1 and even numbers up to 64. For example, 1, 2, 4, 6, and so on, up to 64.
 */
@property (nonatomic, strong) NSNumber * _Nullable channels;

/**
 The service defaults to using RIFF for WAV outputs. If your output audio is likely to exceed 4 GB in file size, or if you otherwise need the extended support of the RF64 format, set your output WAV file format to RF64.
 */
@property (nonatomic, assign) AWSMediaconvertWavFormat format;

/**
 Sample rate in Hz.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

@end

NS_ASSUME_NONNULL_END
