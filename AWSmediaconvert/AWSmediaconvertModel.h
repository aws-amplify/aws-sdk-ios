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

FOUNDATION_EXPORT NSString *const AWSmediaconvertErrorDomain;

typedef NS_ENUM(NSInteger, AWSmediaconvertErrorType) {
    AWSmediaconvertErrorUnknown,
    AWSmediaconvertErrorBadRequest,
    AWSmediaconvertErrorConflict,
    AWSmediaconvertErrorForbidden,
    AWSmediaconvertErrorInternalServerError,
    AWSmediaconvertErrorNotFound,
    AWSmediaconvertErrorTooManyRequests,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAacAudioDescriptionBroadcasterMix) {
    AWSmediaconvertAacAudioDescriptionBroadcasterMixUnknown,
    AWSmediaconvertAacAudioDescriptionBroadcasterMixBroadcasterMixedAd,
    AWSmediaconvertAacAudioDescriptionBroadcasterMixNormal,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAacCodecProfile) {
    AWSmediaconvertAacCodecProfileUnknown,
    AWSmediaconvertAacCodecProfileLc,
    AWSmediaconvertAacCodecProfileHev1,
    AWSmediaconvertAacCodecProfileHev2,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAacCodingMode) {
    AWSmediaconvertAacCodingModeUnknown,
    AWSmediaconvertAacCodingModeAdReceiverMix,
    AWSmediaconvertAacCodingModeCodingMode10,
    AWSmediaconvertAacCodingModeCodingMode11,
    AWSmediaconvertAacCodingModeCodingMode20,
    AWSmediaconvertAacCodingModeCodingMode51,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAacRateControlMode) {
    AWSmediaconvertAacRateControlModeUnknown,
    AWSmediaconvertAacRateControlModeCbr,
    AWSmediaconvertAacRateControlModeVbr,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAacRawFormat) {
    AWSmediaconvertAacRawFormatUnknown,
    AWSmediaconvertAacRawFormatLatmLoas,
    AWSmediaconvertAacRawFormatNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAacSpecification) {
    AWSmediaconvertAacSpecificationUnknown,
    AWSmediaconvertAacSpecificationMpeg2,
    AWSmediaconvertAacSpecificationMpeg4,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAacVbrQuality) {
    AWSmediaconvertAacVbrQualityUnknown,
    AWSmediaconvertAacVbrQualityLow,
    AWSmediaconvertAacVbrQualityMediumLow,
    AWSmediaconvertAacVbrQualityMediumHigh,
    AWSmediaconvertAacVbrQualityHigh,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAc3BitstreamMode) {
    AWSmediaconvertAc3BitstreamModeUnknown,
    AWSmediaconvertAc3BitstreamModeCompleteMain,
    AWSmediaconvertAc3BitstreamModeCommentary,
    AWSmediaconvertAc3BitstreamModeDialogue,
    AWSmediaconvertAc3BitstreamModeEmergency,
    AWSmediaconvertAc3BitstreamModeHearingImpaired,
    AWSmediaconvertAc3BitstreamModeMusicAndEffects,
    AWSmediaconvertAc3BitstreamModeVisuallyImpaired,
    AWSmediaconvertAc3BitstreamModeVoiceOver,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAc3CodingMode) {
    AWSmediaconvertAc3CodingModeUnknown,
    AWSmediaconvertAc3CodingModeCodingMode10,
    AWSmediaconvertAc3CodingModeCodingMode11,
    AWSmediaconvertAc3CodingModeCodingMode20,
    AWSmediaconvertAc3CodingModeCodingMode32Lfe,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAc3DynamicRangeCompressionProfile) {
    AWSmediaconvertAc3DynamicRangeCompressionProfileUnknown,
    AWSmediaconvertAc3DynamicRangeCompressionProfileFilmStandard,
    AWSmediaconvertAc3DynamicRangeCompressionProfileNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAc3LfeFilter) {
    AWSmediaconvertAc3LfeFilterUnknown,
    AWSmediaconvertAc3LfeFilterEnabled,
    AWSmediaconvertAc3LfeFilterDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAc3MetadataControl) {
    AWSmediaconvertAc3MetadataControlUnknown,
    AWSmediaconvertAc3MetadataControlFollowInput,
    AWSmediaconvertAc3MetadataControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAccelerationMode) {
    AWSmediaconvertAccelerationModeUnknown,
    AWSmediaconvertAccelerationModeDisabled,
    AWSmediaconvertAccelerationModeEnabled,
    AWSmediaconvertAccelerationModePreferred,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAccelerationStatus) {
    AWSmediaconvertAccelerationStatusUnknown,
    AWSmediaconvertAccelerationStatusNotApplicable,
    AWSmediaconvertAccelerationStatusInProgress,
    AWSmediaconvertAccelerationStatusAccelerated,
    AWSmediaconvertAccelerationStatusNotAccelerated,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAfdSignaling) {
    AWSmediaconvertAfdSignalingUnknown,
    AWSmediaconvertAfdSignalingNone,
    AWSmediaconvertAfdSignalingAuto,
    AWSmediaconvertAfdSignalingFixed,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAlphaBehavior) {
    AWSmediaconvertAlphaBehaviorUnknown,
    AWSmediaconvertAlphaBehaviorDiscard,
    AWSmediaconvertAlphaBehaviorRemapToLuma,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAncillaryConvert608To708) {
    AWSmediaconvertAncillaryConvert608To708Unknown,
    AWSmediaconvertAncillaryConvert608To708Upconvert,
    AWSmediaconvertAncillaryConvert608To708Disabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAncillaryTerminateCaptions) {
    AWSmediaconvertAncillaryTerminateCaptionsUnknown,
    AWSmediaconvertAncillaryTerminateCaptionsEndOfInput,
    AWSmediaconvertAncillaryTerminateCaptionsDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAntiAlias) {
    AWSmediaconvertAntiAliasUnknown,
    AWSmediaconvertAntiAliasDisabled,
    AWSmediaconvertAntiAliasEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAudioCodec) {
    AWSmediaconvertAudioCodecUnknown,
    AWSmediaconvertAudioCodecAac,
    AWSmediaconvertAudioCodecMp2,
    AWSmediaconvertAudioCodecMp3,
    AWSmediaconvertAudioCodecWav,
    AWSmediaconvertAudioCodecAiff,
    AWSmediaconvertAudioCodecAc3,
    AWSmediaconvertAudioCodecEac3,
    AWSmediaconvertAudioCodecEac3Atmos,
    AWSmediaconvertAudioCodecPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAudioDefaultSelection) {
    AWSmediaconvertAudioDefaultSelectionUnknown,
    AWSmediaconvertAudioDefaultSelectionDefault,
    AWSmediaconvertAudioDefaultSelectionNotDefault,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAudioLanguageCodeControl) {
    AWSmediaconvertAudioLanguageCodeControlUnknown,
    AWSmediaconvertAudioLanguageCodeControlFollowInput,
    AWSmediaconvertAudioLanguageCodeControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAudioNormalizationAlgorithm) {
    AWSmediaconvertAudioNormalizationAlgorithmUnknown,
    AWSmediaconvertAudioNormalizationAlgorithmItuBs17701,
    AWSmediaconvertAudioNormalizationAlgorithmItuBs17702,
    AWSmediaconvertAudioNormalizationAlgorithmItuBs17703,
    AWSmediaconvertAudioNormalizationAlgorithmItuBs17704,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAudioNormalizationAlgorithmControl) {
    AWSmediaconvertAudioNormalizationAlgorithmControlUnknown,
    AWSmediaconvertAudioNormalizationAlgorithmControlCorrectAudio,
    AWSmediaconvertAudioNormalizationAlgorithmControlMeasureOnly,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAudioNormalizationLoudnessLogging) {
    AWSmediaconvertAudioNormalizationLoudnessLoggingUnknown,
    AWSmediaconvertAudioNormalizationLoudnessLoggingLog,
    AWSmediaconvertAudioNormalizationLoudnessLoggingDontLog,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAudioNormalizationPeakCalculation) {
    AWSmediaconvertAudioNormalizationPeakCalculationUnknown,
    AWSmediaconvertAudioNormalizationPeakCalculationTruePeak,
    AWSmediaconvertAudioNormalizationPeakCalculationNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAudioSelectorType) {
    AWSmediaconvertAudioSelectorTypeUnknown,
    AWSmediaconvertAudioSelectorTypePid,
    AWSmediaconvertAudioSelectorTypeTrack,
    AWSmediaconvertAudioSelectorTypeLanguageCode,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAudioTypeControl) {
    AWSmediaconvertAudioTypeControlUnknown,
    AWSmediaconvertAudioTypeControlFollowInput,
    AWSmediaconvertAudioTypeControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAv1AdaptiveQuantization) {
    AWSmediaconvertAv1AdaptiveQuantizationUnknown,
    AWSmediaconvertAv1AdaptiveQuantizationOff,
    AWSmediaconvertAv1AdaptiveQuantizationLow,
    AWSmediaconvertAv1AdaptiveQuantizationMedium,
    AWSmediaconvertAv1AdaptiveQuantizationHigh,
    AWSmediaconvertAv1AdaptiveQuantizationHigher,
    AWSmediaconvertAv1AdaptiveQuantizationMax,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAv1FramerateControl) {
    AWSmediaconvertAv1FramerateControlUnknown,
    AWSmediaconvertAv1FramerateControlInitializeFromSource,
    AWSmediaconvertAv1FramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAv1FramerateConversionAlgorithm) {
    AWSmediaconvertAv1FramerateConversionAlgorithmUnknown,
    AWSmediaconvertAv1FramerateConversionAlgorithmDuplicateDrop,
    AWSmediaconvertAv1FramerateConversionAlgorithmInterpolate,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAv1RateControlMode) {
    AWSmediaconvertAv1RateControlModeUnknown,
    AWSmediaconvertAv1RateControlModeQvbr,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertAv1SpatialAdaptiveQuantization) {
    AWSmediaconvertAv1SpatialAdaptiveQuantizationUnknown,
    AWSmediaconvertAv1SpatialAdaptiveQuantizationDisabled,
    AWSmediaconvertAv1SpatialAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertBillingTagsSource) {
    AWSmediaconvertBillingTagsSourceUnknown,
    AWSmediaconvertBillingTagsSourceQueue,
    AWSmediaconvertBillingTagsSourcePreset,
    AWSmediaconvertBillingTagsSourceJobTemplate,
    AWSmediaconvertBillingTagsSourceJob,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertBurninSubtitleAlignment) {
    AWSmediaconvertBurninSubtitleAlignmentUnknown,
    AWSmediaconvertBurninSubtitleAlignmentCentered,
    AWSmediaconvertBurninSubtitleAlignmentLeft,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertBurninSubtitleBackgroundColor) {
    AWSmediaconvertBurninSubtitleBackgroundColorUnknown,
    AWSmediaconvertBurninSubtitleBackgroundColorNone,
    AWSmediaconvertBurninSubtitleBackgroundColorBlack,
    AWSmediaconvertBurninSubtitleBackgroundColorWhite,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertBurninSubtitleFontColor) {
    AWSmediaconvertBurninSubtitleFontColorUnknown,
    AWSmediaconvertBurninSubtitleFontColorWhite,
    AWSmediaconvertBurninSubtitleFontColorBlack,
    AWSmediaconvertBurninSubtitleFontColorYellow,
    AWSmediaconvertBurninSubtitleFontColorRed,
    AWSmediaconvertBurninSubtitleFontColorGreen,
    AWSmediaconvertBurninSubtitleFontColorBlue,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertBurninSubtitleOutlineColor) {
    AWSmediaconvertBurninSubtitleOutlineColorUnknown,
    AWSmediaconvertBurninSubtitleOutlineColorBlack,
    AWSmediaconvertBurninSubtitleOutlineColorWhite,
    AWSmediaconvertBurninSubtitleOutlineColorYellow,
    AWSmediaconvertBurninSubtitleOutlineColorRed,
    AWSmediaconvertBurninSubtitleOutlineColorGreen,
    AWSmediaconvertBurninSubtitleOutlineColorBlue,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertBurninSubtitleShadowColor) {
    AWSmediaconvertBurninSubtitleShadowColorUnknown,
    AWSmediaconvertBurninSubtitleShadowColorNone,
    AWSmediaconvertBurninSubtitleShadowColorBlack,
    AWSmediaconvertBurninSubtitleShadowColorWhite,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertBurninSubtitleTeletextSpacing) {
    AWSmediaconvertBurninSubtitleTeletextSpacingUnknown,
    AWSmediaconvertBurninSubtitleTeletextSpacingFixedGrid,
    AWSmediaconvertBurninSubtitleTeletextSpacingProportional,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCaptionDestinationType) {
    AWSmediaconvertCaptionDestinationTypeUnknown,
    AWSmediaconvertCaptionDestinationTypeBurnIn,
    AWSmediaconvertCaptionDestinationTypeDvbSub,
    AWSmediaconvertCaptionDestinationTypeEmbedded,
    AWSmediaconvertCaptionDestinationTypeEmbeddedPlusScte20,
    AWSmediaconvertCaptionDestinationTypeImsc,
    AWSmediaconvertCaptionDestinationTypeScte20PlusEmbedded,
    AWSmediaconvertCaptionDestinationTypeScc,
    AWSmediaconvertCaptionDestinationTypeSrt,
    AWSmediaconvertCaptionDestinationTypeSmi,
    AWSmediaconvertCaptionDestinationTypeTeletext,
    AWSmediaconvertCaptionDestinationTypeTtml,
    AWSmediaconvertCaptionDestinationTypeWebvtt,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCaptionSourceType) {
    AWSmediaconvertCaptionSourceTypeUnknown,
    AWSmediaconvertCaptionSourceTypeAncillary,
    AWSmediaconvertCaptionSourceTypeDvbSub,
    AWSmediaconvertCaptionSourceTypeEmbedded,
    AWSmediaconvertCaptionSourceTypeScte20,
    AWSmediaconvertCaptionSourceTypeScc,
    AWSmediaconvertCaptionSourceTypeTtml,
    AWSmediaconvertCaptionSourceTypeStl,
    AWSmediaconvertCaptionSourceTypeSrt,
    AWSmediaconvertCaptionSourceTypeSmi,
    AWSmediaconvertCaptionSourceTypeTeletext,
    AWSmediaconvertCaptionSourceTypeNullSource,
    AWSmediaconvertCaptionSourceTypeImsc,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafClientCache) {
    AWSmediaconvertCmafClientCacheUnknown,
    AWSmediaconvertCmafClientCacheDisabled,
    AWSmediaconvertCmafClientCacheEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafCodecSpecification) {
    AWSmediaconvertCmafCodecSpecificationUnknown,
    AWSmediaconvertCmafCodecSpecificationRfc6381,
    AWSmediaconvertCmafCodecSpecificationRfc4281,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafEncryptionType) {
    AWSmediaconvertCmafEncryptionTypeUnknown,
    AWSmediaconvertCmafEncryptionTypeSampleAes,
    AWSmediaconvertCmafEncryptionTypeAesCtr,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafInitializationVectorInManifest) {
    AWSmediaconvertCmafInitializationVectorInManifestUnknown,
    AWSmediaconvertCmafInitializationVectorInManifestInclude,
    AWSmediaconvertCmafInitializationVectorInManifestExclude,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafKeyProviderType) {
    AWSmediaconvertCmafKeyProviderTypeUnknown,
    AWSmediaconvertCmafKeyProviderTypeSpeke,
    AWSmediaconvertCmafKeyProviderTypeStaticKey,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafManifestCompression) {
    AWSmediaconvertCmafManifestCompressionUnknown,
    AWSmediaconvertCmafManifestCompressionGzip,
    AWSmediaconvertCmafManifestCompressionNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafManifestDurationFormat) {
    AWSmediaconvertCmafManifestDurationFormatUnknown,
    AWSmediaconvertCmafManifestDurationFormatFloatingPoint,
    AWSmediaconvertCmafManifestDurationFormatInteger,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafMpdProfile) {
    AWSmediaconvertCmafMpdProfileUnknown,
    AWSmediaconvertCmafMpdProfileMainProfile,
    AWSmediaconvertCmafMpdProfileOnDemandProfile,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafSegmentControl) {
    AWSmediaconvertCmafSegmentControlUnknown,
    AWSmediaconvertCmafSegmentControlSingleFile,
    AWSmediaconvertCmafSegmentControlSegmentedFiles,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafStreamInfResolution) {
    AWSmediaconvertCmafStreamInfResolutionUnknown,
    AWSmediaconvertCmafStreamInfResolutionInclude,
    AWSmediaconvertCmafStreamInfResolutionExclude,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafWriteDASHManifest) {
    AWSmediaconvertCmafWriteDASHManifestUnknown,
    AWSmediaconvertCmafWriteDASHManifestDisabled,
    AWSmediaconvertCmafWriteDASHManifestEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafWriteHLSManifest) {
    AWSmediaconvertCmafWriteHLSManifestUnknown,
    AWSmediaconvertCmafWriteHLSManifestDisabled,
    AWSmediaconvertCmafWriteHLSManifestEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmafWriteSegmentTimelineInRepresentation) {
    AWSmediaconvertCmafWriteSegmentTimelineInRepresentationUnknown,
    AWSmediaconvertCmafWriteSegmentTimelineInRepresentationEnabled,
    AWSmediaconvertCmafWriteSegmentTimelineInRepresentationDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmfcScte35Esam) {
    AWSmediaconvertCmfcScte35EsamUnknown,
    AWSmediaconvertCmfcScte35EsamInsert,
    AWSmediaconvertCmfcScte35EsamNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCmfcScte35Source) {
    AWSmediaconvertCmfcScte35SourceUnknown,
    AWSmediaconvertCmfcScte35SourcePassthrough,
    AWSmediaconvertCmfcScte35SourceNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertColorMetadata) {
    AWSmediaconvertColorMetadataUnknown,
    AWSmediaconvertColorMetadataIgnore,
    AWSmediaconvertColorMetadataInsert,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertColorSpace) {
    AWSmediaconvertColorSpaceUnknown,
    AWSmediaconvertColorSpaceFollow,
    AWSmediaconvertColorSpaceRec601,
    AWSmediaconvertColorSpaceRec709,
    AWSmediaconvertColorSpaceHdr10,
    AWSmediaconvertColorSpaceHlg2020,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertColorSpaceConversion) {
    AWSmediaconvertColorSpaceConversionUnknown,
    AWSmediaconvertColorSpaceConversionNone,
    AWSmediaconvertColorSpaceConversionForce601,
    AWSmediaconvertColorSpaceConversionForce709,
    AWSmediaconvertColorSpaceConversionForceHdr10,
    AWSmediaconvertColorSpaceConversionForceHlg2020,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertColorSpaceUsage) {
    AWSmediaconvertColorSpaceUsageUnknown,
    AWSmediaconvertColorSpaceUsageForce,
    AWSmediaconvertColorSpaceUsageFallback,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertCommitment) {
    AWSmediaconvertCommitmentUnknown,
    AWSmediaconvertCommitmentOneYear,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertContainerType) {
    AWSmediaconvertContainerTypeUnknown,
    AWSmediaconvertContainerTypeF4v,
    AWSmediaconvertContainerTypeIsmv,
    AWSmediaconvertContainerTypeM2ts,
    AWSmediaconvertContainerTypeM3u8,
    AWSmediaconvertContainerTypeCmfc,
    AWSmediaconvertContainerTypeMov,
    AWSmediaconvertContainerTypeMp4,
    AWSmediaconvertContainerTypeMpd,
    AWSmediaconvertContainerTypeMxf,
    AWSmediaconvertContainerTypeRAW,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDashIsoHbbtvCompliance) {
    AWSmediaconvertDashIsoHbbtvComplianceUnknown,
    AWSmediaconvertDashIsoHbbtvComplianceHbbtv15,
    AWSmediaconvertDashIsoHbbtvComplianceNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDashIsoMpdProfile) {
    AWSmediaconvertDashIsoMpdProfileUnknown,
    AWSmediaconvertDashIsoMpdProfileMainProfile,
    AWSmediaconvertDashIsoMpdProfileOnDemandProfile,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDashIsoPlaybackDeviceCompatibility) {
    AWSmediaconvertDashIsoPlaybackDeviceCompatibilityUnknown,
    AWSmediaconvertDashIsoPlaybackDeviceCompatibilityCencV1,
    AWSmediaconvertDashIsoPlaybackDeviceCompatibilityUnencryptedSei,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDashIsoSegmentControl) {
    AWSmediaconvertDashIsoSegmentControlUnknown,
    AWSmediaconvertDashIsoSegmentControlSingleFile,
    AWSmediaconvertDashIsoSegmentControlSegmentedFiles,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDashIsoWriteSegmentTimelineInRepresentation) {
    AWSmediaconvertDashIsoWriteSegmentTimelineInRepresentationUnknown,
    AWSmediaconvertDashIsoWriteSegmentTimelineInRepresentationEnabled,
    AWSmediaconvertDashIsoWriteSegmentTimelineInRepresentationDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDecryptionMode) {
    AWSmediaconvertDecryptionModeUnknown,
    AWSmediaconvertDecryptionModeAesCtr,
    AWSmediaconvertDecryptionModeAesCbc,
    AWSmediaconvertDecryptionModeAesGcm,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDeinterlaceAlgorithm) {
    AWSmediaconvertDeinterlaceAlgorithmUnknown,
    AWSmediaconvertDeinterlaceAlgorithmInterpolate,
    AWSmediaconvertDeinterlaceAlgorithmInterpolateTicker,
    AWSmediaconvertDeinterlaceAlgorithmBlend,
    AWSmediaconvertDeinterlaceAlgorithmBlendTicker,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDeinterlacerControl) {
    AWSmediaconvertDeinterlacerControlUnknown,
    AWSmediaconvertDeinterlacerControlForceAllFrames,
    AWSmediaconvertDeinterlacerControlNormal,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDeinterlacerMode) {
    AWSmediaconvertDeinterlacerModeUnknown,
    AWSmediaconvertDeinterlacerModeDeinterlace,
    AWSmediaconvertDeinterlacerModeInverseTelecine,
    AWSmediaconvertDeinterlacerModeAdaptive,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDescribeEndpointsMode) {
    AWSmediaconvertDescribeEndpointsModeUnknown,
    AWSmediaconvertDescribeEndpointsModeDefault,
    AWSmediaconvertDescribeEndpointsModeGetOnly,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDolbyVisionLevel6Mode) {
    AWSmediaconvertDolbyVisionLevel6ModeUnknown,
    AWSmediaconvertDolbyVisionLevel6ModePassthrough,
    AWSmediaconvertDolbyVisionLevel6ModeRecalculate,
    AWSmediaconvertDolbyVisionLevel6ModeSpecify,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDolbyVisionProfile) {
    AWSmediaconvertDolbyVisionProfileUnknown,
    AWSmediaconvertDolbyVisionProfileProfile5,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDropFrameTimecode) {
    AWSmediaconvertDropFrameTimecodeUnknown,
    AWSmediaconvertDropFrameTimecodeDisabled,
    AWSmediaconvertDropFrameTimecodeEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDvbSubtitleAlignment) {
    AWSmediaconvertDvbSubtitleAlignmentUnknown,
    AWSmediaconvertDvbSubtitleAlignmentCentered,
    AWSmediaconvertDvbSubtitleAlignmentLeft,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDvbSubtitleBackgroundColor) {
    AWSmediaconvertDvbSubtitleBackgroundColorUnknown,
    AWSmediaconvertDvbSubtitleBackgroundColorNone,
    AWSmediaconvertDvbSubtitleBackgroundColorBlack,
    AWSmediaconvertDvbSubtitleBackgroundColorWhite,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDvbSubtitleFontColor) {
    AWSmediaconvertDvbSubtitleFontColorUnknown,
    AWSmediaconvertDvbSubtitleFontColorWhite,
    AWSmediaconvertDvbSubtitleFontColorBlack,
    AWSmediaconvertDvbSubtitleFontColorYellow,
    AWSmediaconvertDvbSubtitleFontColorRed,
    AWSmediaconvertDvbSubtitleFontColorGreen,
    AWSmediaconvertDvbSubtitleFontColorBlue,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDvbSubtitleOutlineColor) {
    AWSmediaconvertDvbSubtitleOutlineColorUnknown,
    AWSmediaconvertDvbSubtitleOutlineColorBlack,
    AWSmediaconvertDvbSubtitleOutlineColorWhite,
    AWSmediaconvertDvbSubtitleOutlineColorYellow,
    AWSmediaconvertDvbSubtitleOutlineColorRed,
    AWSmediaconvertDvbSubtitleOutlineColorGreen,
    AWSmediaconvertDvbSubtitleOutlineColorBlue,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDvbSubtitleShadowColor) {
    AWSmediaconvertDvbSubtitleShadowColorUnknown,
    AWSmediaconvertDvbSubtitleShadowColorNone,
    AWSmediaconvertDvbSubtitleShadowColorBlack,
    AWSmediaconvertDvbSubtitleShadowColorWhite,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDvbSubtitleTeletextSpacing) {
    AWSmediaconvertDvbSubtitleTeletextSpacingUnknown,
    AWSmediaconvertDvbSubtitleTeletextSpacingFixedGrid,
    AWSmediaconvertDvbSubtitleTeletextSpacingProportional,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertDvbSubtitlingType) {
    AWSmediaconvertDvbSubtitlingTypeUnknown,
    AWSmediaconvertDvbSubtitlingTypeHearingImpaired,
    AWSmediaconvertDvbSubtitlingTypeStandard,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3AtmosBitstreamMode) {
    AWSmediaconvertEac3AtmosBitstreamModeUnknown,
    AWSmediaconvertEac3AtmosBitstreamModeCompleteMain,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3AtmosCodingMode) {
    AWSmediaconvertEac3AtmosCodingModeUnknown,
    AWSmediaconvertEac3AtmosCodingModeCodingMode916,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3AtmosDialogueIntelligence) {
    AWSmediaconvertEac3AtmosDialogueIntelligenceUnknown,
    AWSmediaconvertEac3AtmosDialogueIntelligenceEnabled,
    AWSmediaconvertEac3AtmosDialogueIntelligenceDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3AtmosDynamicRangeCompressionLine) {
    AWSmediaconvertEac3AtmosDynamicRangeCompressionLineUnknown,
    AWSmediaconvertEac3AtmosDynamicRangeCompressionLineNone,
    AWSmediaconvertEac3AtmosDynamicRangeCompressionLineFilmStandard,
    AWSmediaconvertEac3AtmosDynamicRangeCompressionLineFilmLight,
    AWSmediaconvertEac3AtmosDynamicRangeCompressionLineMusicStandard,
    AWSmediaconvertEac3AtmosDynamicRangeCompressionLineMusicLight,
    AWSmediaconvertEac3AtmosDynamicRangeCompressionLineSpeech,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3AtmosDynamicRangeCompressionRf) {
    AWSmediaconvertEac3AtmosDynamicRangeCompressionRfUnknown,
    AWSmediaconvertEac3AtmosDynamicRangeCompressionRfNone,
    AWSmediaconvertEac3AtmosDynamicRangeCompressionRfFilmStandard,
    AWSmediaconvertEac3AtmosDynamicRangeCompressionRfFilmLight,
    AWSmediaconvertEac3AtmosDynamicRangeCompressionRfMusicStandard,
    AWSmediaconvertEac3AtmosDynamicRangeCompressionRfMusicLight,
    AWSmediaconvertEac3AtmosDynamicRangeCompressionRfSpeech,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3AtmosMeteringMode) {
    AWSmediaconvertEac3AtmosMeteringModeUnknown,
    AWSmediaconvertEac3AtmosMeteringModeLeqA,
    AWSmediaconvertEac3AtmosMeteringModeItuBs17701,
    AWSmediaconvertEac3AtmosMeteringModeItuBs17702,
    AWSmediaconvertEac3AtmosMeteringModeItuBs17703,
    AWSmediaconvertEac3AtmosMeteringModeItuBs17704,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3AtmosStereoDownmix) {
    AWSmediaconvertEac3AtmosStereoDownmixUnknown,
    AWSmediaconvertEac3AtmosStereoDownmixNotIndicated,
    AWSmediaconvertEac3AtmosStereoDownmixStereo,
    AWSmediaconvertEac3AtmosStereoDownmixSurround,
    AWSmediaconvertEac3AtmosStereoDownmixDpl2,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3AtmosSurroundExMode) {
    AWSmediaconvertEac3AtmosSurroundExModeUnknown,
    AWSmediaconvertEac3AtmosSurroundExModeNotIndicated,
    AWSmediaconvertEac3AtmosSurroundExModeEnabled,
    AWSmediaconvertEac3AtmosSurroundExModeDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3AttenuationControl) {
    AWSmediaconvertEac3AttenuationControlUnknown,
    AWSmediaconvertEac3AttenuationControlAttenuate3Db,
    AWSmediaconvertEac3AttenuationControlNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3BitstreamMode) {
    AWSmediaconvertEac3BitstreamModeUnknown,
    AWSmediaconvertEac3BitstreamModeCompleteMain,
    AWSmediaconvertEac3BitstreamModeCommentary,
    AWSmediaconvertEac3BitstreamModeEmergency,
    AWSmediaconvertEac3BitstreamModeHearingImpaired,
    AWSmediaconvertEac3BitstreamModeVisuallyImpaired,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3CodingMode) {
    AWSmediaconvertEac3CodingModeUnknown,
    AWSmediaconvertEac3CodingModeCodingMode10,
    AWSmediaconvertEac3CodingModeCodingMode20,
    AWSmediaconvertEac3CodingModeCodingMode32,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3DcFilter) {
    AWSmediaconvertEac3DcFilterUnknown,
    AWSmediaconvertEac3DcFilterEnabled,
    AWSmediaconvertEac3DcFilterDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3DynamicRangeCompressionLine) {
    AWSmediaconvertEac3DynamicRangeCompressionLineUnknown,
    AWSmediaconvertEac3DynamicRangeCompressionLineNone,
    AWSmediaconvertEac3DynamicRangeCompressionLineFilmStandard,
    AWSmediaconvertEac3DynamicRangeCompressionLineFilmLight,
    AWSmediaconvertEac3DynamicRangeCompressionLineMusicStandard,
    AWSmediaconvertEac3DynamicRangeCompressionLineMusicLight,
    AWSmediaconvertEac3DynamicRangeCompressionLineSpeech,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3DynamicRangeCompressionRf) {
    AWSmediaconvertEac3DynamicRangeCompressionRfUnknown,
    AWSmediaconvertEac3DynamicRangeCompressionRfNone,
    AWSmediaconvertEac3DynamicRangeCompressionRfFilmStandard,
    AWSmediaconvertEac3DynamicRangeCompressionRfFilmLight,
    AWSmediaconvertEac3DynamicRangeCompressionRfMusicStandard,
    AWSmediaconvertEac3DynamicRangeCompressionRfMusicLight,
    AWSmediaconvertEac3DynamicRangeCompressionRfSpeech,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3LfeControl) {
    AWSmediaconvertEac3LfeControlUnknown,
    AWSmediaconvertEac3LfeControlLfe,
    AWSmediaconvertEac3LfeControlNoLfe,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3LfeFilter) {
    AWSmediaconvertEac3LfeFilterUnknown,
    AWSmediaconvertEac3LfeFilterEnabled,
    AWSmediaconvertEac3LfeFilterDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3MetadataControl) {
    AWSmediaconvertEac3MetadataControlUnknown,
    AWSmediaconvertEac3MetadataControlFollowInput,
    AWSmediaconvertEac3MetadataControlUseConfigured,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3PassthroughControl) {
    AWSmediaconvertEac3PassthroughControlUnknown,
    AWSmediaconvertEac3PassthroughControlWhenPossible,
    AWSmediaconvertEac3PassthroughControlNoPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3PhaseControl) {
    AWSmediaconvertEac3PhaseControlUnknown,
    AWSmediaconvertEac3PhaseControlShift90Degrees,
    AWSmediaconvertEac3PhaseControlNoShift,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3StereoDownmix) {
    AWSmediaconvertEac3StereoDownmixUnknown,
    AWSmediaconvertEac3StereoDownmixNotIndicated,
    AWSmediaconvertEac3StereoDownmixLoRo,
    AWSmediaconvertEac3StereoDownmixLtRt,
    AWSmediaconvertEac3StereoDownmixDpl2,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3SurroundExMode) {
    AWSmediaconvertEac3SurroundExModeUnknown,
    AWSmediaconvertEac3SurroundExModeNotIndicated,
    AWSmediaconvertEac3SurroundExModeEnabled,
    AWSmediaconvertEac3SurroundExModeDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEac3SurroundMode) {
    AWSmediaconvertEac3SurroundModeUnknown,
    AWSmediaconvertEac3SurroundModeNotIndicated,
    AWSmediaconvertEac3SurroundModeEnabled,
    AWSmediaconvertEac3SurroundModeDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEmbeddedConvert608To708) {
    AWSmediaconvertEmbeddedConvert608To708Unknown,
    AWSmediaconvertEmbeddedConvert608To708Upconvert,
    AWSmediaconvertEmbeddedConvert608To708Disabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertEmbeddedTerminateCaptions) {
    AWSmediaconvertEmbeddedTerminateCaptionsUnknown,
    AWSmediaconvertEmbeddedTerminateCaptionsEndOfInput,
    AWSmediaconvertEmbeddedTerminateCaptionsDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertF4vMoovPlacement) {
    AWSmediaconvertF4vMoovPlacementUnknown,
    AWSmediaconvertF4vMoovPlacementProgressiveDownload,
    AWSmediaconvertF4vMoovPlacementNormal,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertFileSourceConvert608To708) {
    AWSmediaconvertFileSourceConvert608To708Unknown,
    AWSmediaconvertFileSourceConvert608To708Upconvert,
    AWSmediaconvertFileSourceConvert608To708Disabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertFontScript) {
    AWSmediaconvertFontScriptUnknown,
    AWSmediaconvertFontScriptAutomatic,
    AWSmediaconvertFontScriptHans,
    AWSmediaconvertFontScriptHant,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264AdaptiveQuantization) {
    AWSmediaconvertH264AdaptiveQuantizationUnknown,
    AWSmediaconvertH264AdaptiveQuantizationOff,
    AWSmediaconvertH264AdaptiveQuantizationLow,
    AWSmediaconvertH264AdaptiveQuantizationMedium,
    AWSmediaconvertH264AdaptiveQuantizationHigh,
    AWSmediaconvertH264AdaptiveQuantizationHigher,
    AWSmediaconvertH264AdaptiveQuantizationMax,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264CodecLevel) {
    AWSmediaconvertH264CodecLevelUnknown,
    AWSmediaconvertH264CodecLevelAuto,
    AWSmediaconvertH264CodecLevelLevel1,
    AWSmediaconvertH264CodecLevelLevel11,
    AWSmediaconvertH264CodecLevelLevel12,
    AWSmediaconvertH264CodecLevelLevel13,
    AWSmediaconvertH264CodecLevelLevel2,
    AWSmediaconvertH264CodecLevelLevel21,
    AWSmediaconvertH264CodecLevelLevel22,
    AWSmediaconvertH264CodecLevelLevel3,
    AWSmediaconvertH264CodecLevelLevel31,
    AWSmediaconvertH264CodecLevelLevel32,
    AWSmediaconvertH264CodecLevelLevel4,
    AWSmediaconvertH264CodecLevelLevel41,
    AWSmediaconvertH264CodecLevelLevel42,
    AWSmediaconvertH264CodecLevelLevel5,
    AWSmediaconvertH264CodecLevelLevel51,
    AWSmediaconvertH264CodecLevelLevel52,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264CodecProfile) {
    AWSmediaconvertH264CodecProfileUnknown,
    AWSmediaconvertH264CodecProfileBaseline,
    AWSmediaconvertH264CodecProfileHigh,
    AWSmediaconvertH264CodecProfileHigh10bit,
    AWSmediaconvertH264CodecProfileHigh422,
    AWSmediaconvertH264CodecProfileHigh42210bit,
    AWSmediaconvertH264CodecProfileMain,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264DynamicSubGop) {
    AWSmediaconvertH264DynamicSubGopUnknown,
    AWSmediaconvertH264DynamicSubGopAdaptive,
    AWSmediaconvertH264DynamicSubGopStatic,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264EntropyEncoding) {
    AWSmediaconvertH264EntropyEncodingUnknown,
    AWSmediaconvertH264EntropyEncodingCabac,
    AWSmediaconvertH264EntropyEncodingCavlc,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264FieldEncoding) {
    AWSmediaconvertH264FieldEncodingUnknown,
    AWSmediaconvertH264FieldEncodingPaff,
    AWSmediaconvertH264FieldEncodingForceField,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264FlickerAdaptiveQuantization) {
    AWSmediaconvertH264FlickerAdaptiveQuantizationUnknown,
    AWSmediaconvertH264FlickerAdaptiveQuantizationDisabled,
    AWSmediaconvertH264FlickerAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264FramerateControl) {
    AWSmediaconvertH264FramerateControlUnknown,
    AWSmediaconvertH264FramerateControlInitializeFromSource,
    AWSmediaconvertH264FramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264FramerateConversionAlgorithm) {
    AWSmediaconvertH264FramerateConversionAlgorithmUnknown,
    AWSmediaconvertH264FramerateConversionAlgorithmDuplicateDrop,
    AWSmediaconvertH264FramerateConversionAlgorithmInterpolate,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264GopBReference) {
    AWSmediaconvertH264GopBReferenceUnknown,
    AWSmediaconvertH264GopBReferenceDisabled,
    AWSmediaconvertH264GopBReferenceEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264GopSizeUnits) {
    AWSmediaconvertH264GopSizeUnitsUnknown,
    AWSmediaconvertH264GopSizeUnitsFrames,
    AWSmediaconvertH264GopSizeUnitsSeconds,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264InterlaceMode) {
    AWSmediaconvertH264InterlaceModeUnknown,
    AWSmediaconvertH264InterlaceModeProgressive,
    AWSmediaconvertH264InterlaceModeTopField,
    AWSmediaconvertH264InterlaceModeBottomField,
    AWSmediaconvertH264InterlaceModeFollowTopField,
    AWSmediaconvertH264InterlaceModeFollowBottomField,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264ParControl) {
    AWSmediaconvertH264ParControlUnknown,
    AWSmediaconvertH264ParControlInitializeFromSource,
    AWSmediaconvertH264ParControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264QualityTuningLevel) {
    AWSmediaconvertH264QualityTuningLevelUnknown,
    AWSmediaconvertH264QualityTuningLevelSinglePass,
    AWSmediaconvertH264QualityTuningLevelSinglePassHq,
    AWSmediaconvertH264QualityTuningLevelMultiPassHq,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264RateControlMode) {
    AWSmediaconvertH264RateControlModeUnknown,
    AWSmediaconvertH264RateControlModeVbr,
    AWSmediaconvertH264RateControlModeCbr,
    AWSmediaconvertH264RateControlModeQvbr,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264RepeatPps) {
    AWSmediaconvertH264RepeatPpsUnknown,
    AWSmediaconvertH264RepeatPpsDisabled,
    AWSmediaconvertH264RepeatPpsEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264SceneChangeDetect) {
    AWSmediaconvertH264SceneChangeDetectUnknown,
    AWSmediaconvertH264SceneChangeDetectDisabled,
    AWSmediaconvertH264SceneChangeDetectEnabled,
    AWSmediaconvertH264SceneChangeDetectTransitionDetection,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264SlowPal) {
    AWSmediaconvertH264SlowPalUnknown,
    AWSmediaconvertH264SlowPalDisabled,
    AWSmediaconvertH264SlowPalEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264SpatialAdaptiveQuantization) {
    AWSmediaconvertH264SpatialAdaptiveQuantizationUnknown,
    AWSmediaconvertH264SpatialAdaptiveQuantizationDisabled,
    AWSmediaconvertH264SpatialAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264Syntax) {
    AWSmediaconvertH264SyntaxUnknown,
    AWSmediaconvertH264SyntaxDefault,
    AWSmediaconvertH264SyntaxRp2027,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264Telecine) {
    AWSmediaconvertH264TelecineUnknown,
    AWSmediaconvertH264TelecineNone,
    AWSmediaconvertH264TelecineSoft,
    AWSmediaconvertH264TelecineHard,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264TemporalAdaptiveQuantization) {
    AWSmediaconvertH264TemporalAdaptiveQuantizationUnknown,
    AWSmediaconvertH264TemporalAdaptiveQuantizationDisabled,
    AWSmediaconvertH264TemporalAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH264UnregisteredSeiTimecode) {
    AWSmediaconvertH264UnregisteredSeiTimecodeUnknown,
    AWSmediaconvertH264UnregisteredSeiTimecodeDisabled,
    AWSmediaconvertH264UnregisteredSeiTimecodeEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265AdaptiveQuantization) {
    AWSmediaconvertH265AdaptiveQuantizationUnknown,
    AWSmediaconvertH265AdaptiveQuantizationOff,
    AWSmediaconvertH265AdaptiveQuantizationLow,
    AWSmediaconvertH265AdaptiveQuantizationMedium,
    AWSmediaconvertH265AdaptiveQuantizationHigh,
    AWSmediaconvertH265AdaptiveQuantizationHigher,
    AWSmediaconvertH265AdaptiveQuantizationMax,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265AlternateTransferFunctionSei) {
    AWSmediaconvertH265AlternateTransferFunctionSeiUnknown,
    AWSmediaconvertH265AlternateTransferFunctionSeiDisabled,
    AWSmediaconvertH265AlternateTransferFunctionSeiEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265CodecLevel) {
    AWSmediaconvertH265CodecLevelUnknown,
    AWSmediaconvertH265CodecLevelAuto,
    AWSmediaconvertH265CodecLevelLevel1,
    AWSmediaconvertH265CodecLevelLevel2,
    AWSmediaconvertH265CodecLevelLevel21,
    AWSmediaconvertH265CodecLevelLevel3,
    AWSmediaconvertH265CodecLevelLevel31,
    AWSmediaconvertH265CodecLevelLevel4,
    AWSmediaconvertH265CodecLevelLevel41,
    AWSmediaconvertH265CodecLevelLevel5,
    AWSmediaconvertH265CodecLevelLevel51,
    AWSmediaconvertH265CodecLevelLevel52,
    AWSmediaconvertH265CodecLevelLevel6,
    AWSmediaconvertH265CodecLevelLevel61,
    AWSmediaconvertH265CodecLevelLevel62,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265CodecProfile) {
    AWSmediaconvertH265CodecProfileUnknown,
    AWSmediaconvertH265CodecProfileMainMain,
    AWSmediaconvertH265CodecProfileMainHigh,
    AWSmediaconvertH265CodecProfileMain10Main,
    AWSmediaconvertH265CodecProfileMain10High,
    AWSmediaconvertH265CodecProfileMain4228bitMain,
    AWSmediaconvertH265CodecProfileMain4228bitHigh,
    AWSmediaconvertH265CodecProfileMain42210bitMain,
    AWSmediaconvertH265CodecProfileMain42210bitHigh,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265DynamicSubGop) {
    AWSmediaconvertH265DynamicSubGopUnknown,
    AWSmediaconvertH265DynamicSubGopAdaptive,
    AWSmediaconvertH265DynamicSubGopStatic,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265FlickerAdaptiveQuantization) {
    AWSmediaconvertH265FlickerAdaptiveQuantizationUnknown,
    AWSmediaconvertH265FlickerAdaptiveQuantizationDisabled,
    AWSmediaconvertH265FlickerAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265FramerateControl) {
    AWSmediaconvertH265FramerateControlUnknown,
    AWSmediaconvertH265FramerateControlInitializeFromSource,
    AWSmediaconvertH265FramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265FramerateConversionAlgorithm) {
    AWSmediaconvertH265FramerateConversionAlgorithmUnknown,
    AWSmediaconvertH265FramerateConversionAlgorithmDuplicateDrop,
    AWSmediaconvertH265FramerateConversionAlgorithmInterpolate,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265GopBReference) {
    AWSmediaconvertH265GopBReferenceUnknown,
    AWSmediaconvertH265GopBReferenceDisabled,
    AWSmediaconvertH265GopBReferenceEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265GopSizeUnits) {
    AWSmediaconvertH265GopSizeUnitsUnknown,
    AWSmediaconvertH265GopSizeUnitsFrames,
    AWSmediaconvertH265GopSizeUnitsSeconds,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265InterlaceMode) {
    AWSmediaconvertH265InterlaceModeUnknown,
    AWSmediaconvertH265InterlaceModeProgressive,
    AWSmediaconvertH265InterlaceModeTopField,
    AWSmediaconvertH265InterlaceModeBottomField,
    AWSmediaconvertH265InterlaceModeFollowTopField,
    AWSmediaconvertH265InterlaceModeFollowBottomField,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265ParControl) {
    AWSmediaconvertH265ParControlUnknown,
    AWSmediaconvertH265ParControlInitializeFromSource,
    AWSmediaconvertH265ParControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265QualityTuningLevel) {
    AWSmediaconvertH265QualityTuningLevelUnknown,
    AWSmediaconvertH265QualityTuningLevelSinglePass,
    AWSmediaconvertH265QualityTuningLevelSinglePassHq,
    AWSmediaconvertH265QualityTuningLevelMultiPassHq,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265RateControlMode) {
    AWSmediaconvertH265RateControlModeUnknown,
    AWSmediaconvertH265RateControlModeVbr,
    AWSmediaconvertH265RateControlModeCbr,
    AWSmediaconvertH265RateControlModeQvbr,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265SampleAdaptiveOffsetFilterMode) {
    AWSmediaconvertH265SampleAdaptiveOffsetFilterModeUnknown,
    AWSmediaconvertH265SampleAdaptiveOffsetFilterModeDefault,
    AWSmediaconvertH265SampleAdaptiveOffsetFilterModeAdaptive,
    AWSmediaconvertH265SampleAdaptiveOffsetFilterModeOff,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265SceneChangeDetect) {
    AWSmediaconvertH265SceneChangeDetectUnknown,
    AWSmediaconvertH265SceneChangeDetectDisabled,
    AWSmediaconvertH265SceneChangeDetectEnabled,
    AWSmediaconvertH265SceneChangeDetectTransitionDetection,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265SlowPal) {
    AWSmediaconvertH265SlowPalUnknown,
    AWSmediaconvertH265SlowPalDisabled,
    AWSmediaconvertH265SlowPalEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265SpatialAdaptiveQuantization) {
    AWSmediaconvertH265SpatialAdaptiveQuantizationUnknown,
    AWSmediaconvertH265SpatialAdaptiveQuantizationDisabled,
    AWSmediaconvertH265SpatialAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265Telecine) {
    AWSmediaconvertH265TelecineUnknown,
    AWSmediaconvertH265TelecineNone,
    AWSmediaconvertH265TelecineSoft,
    AWSmediaconvertH265TelecineHard,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265TemporalAdaptiveQuantization) {
    AWSmediaconvertH265TemporalAdaptiveQuantizationUnknown,
    AWSmediaconvertH265TemporalAdaptiveQuantizationDisabled,
    AWSmediaconvertH265TemporalAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265TemporalIds) {
    AWSmediaconvertH265TemporalIdsUnknown,
    AWSmediaconvertH265TemporalIdsDisabled,
    AWSmediaconvertH265TemporalIdsEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265Tiles) {
    AWSmediaconvertH265TilesUnknown,
    AWSmediaconvertH265TilesDisabled,
    AWSmediaconvertH265TilesEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265UnregisteredSeiTimecode) {
    AWSmediaconvertH265UnregisteredSeiTimecodeUnknown,
    AWSmediaconvertH265UnregisteredSeiTimecodeDisabled,
    AWSmediaconvertH265UnregisteredSeiTimecodeEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertH265WriteMp4PackagingType) {
    AWSmediaconvertH265WriteMp4PackagingTypeUnknown,
    AWSmediaconvertH265WriteMp4PackagingTypeHvc1,
    AWSmediaconvertH265WriteMp4PackagingTypeHev1,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsAdMarkers) {
    AWSmediaconvertHlsAdMarkersUnknown,
    AWSmediaconvertHlsAdMarkersElemental,
    AWSmediaconvertHlsAdMarkersElementalScte35,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsAudioOnlyContainer) {
    AWSmediaconvertHlsAudioOnlyContainerUnknown,
    AWSmediaconvertHlsAudioOnlyContainerAutomatic,
    AWSmediaconvertHlsAudioOnlyContainerM2ts,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsAudioTrackType) {
    AWSmediaconvertHlsAudioTrackTypeUnknown,
    AWSmediaconvertHlsAudioTrackTypeAlternateAudioAutoSelectDefault,
    AWSmediaconvertHlsAudioTrackTypeAlternateAudioAutoSelect,
    AWSmediaconvertHlsAudioTrackTypeAlternateAudioNotAutoSelect,
    AWSmediaconvertHlsAudioTrackTypeAudioOnlyVariantStream,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsCaptionLanguageSetting) {
    AWSmediaconvertHlsCaptionLanguageSettingUnknown,
    AWSmediaconvertHlsCaptionLanguageSettingInsert,
    AWSmediaconvertHlsCaptionLanguageSettingOmit,
    AWSmediaconvertHlsCaptionLanguageSettingNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsClientCache) {
    AWSmediaconvertHlsClientCacheUnknown,
    AWSmediaconvertHlsClientCacheDisabled,
    AWSmediaconvertHlsClientCacheEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsCodecSpecification) {
    AWSmediaconvertHlsCodecSpecificationUnknown,
    AWSmediaconvertHlsCodecSpecificationRfc6381,
    AWSmediaconvertHlsCodecSpecificationRfc4281,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsDirectoryStructure) {
    AWSmediaconvertHlsDirectoryStructureUnknown,
    AWSmediaconvertHlsDirectoryStructureSingleDirectory,
    AWSmediaconvertHlsDirectoryStructureSubdirectoryPerStream,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsEncryptionType) {
    AWSmediaconvertHlsEncryptionTypeUnknown,
    AWSmediaconvertHlsEncryptionTypeAes128,
    AWSmediaconvertHlsEncryptionTypeSampleAes,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsIFrameOnlyManifest) {
    AWSmediaconvertHlsIFrameOnlyManifestUnknown,
    AWSmediaconvertHlsIFrameOnlyManifestInclude,
    AWSmediaconvertHlsIFrameOnlyManifestExclude,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsInitializationVectorInManifest) {
    AWSmediaconvertHlsInitializationVectorInManifestUnknown,
    AWSmediaconvertHlsInitializationVectorInManifestInclude,
    AWSmediaconvertHlsInitializationVectorInManifestExclude,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsKeyProviderType) {
    AWSmediaconvertHlsKeyProviderTypeUnknown,
    AWSmediaconvertHlsKeyProviderTypeSpeke,
    AWSmediaconvertHlsKeyProviderTypeStaticKey,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsManifestCompression) {
    AWSmediaconvertHlsManifestCompressionUnknown,
    AWSmediaconvertHlsManifestCompressionGzip,
    AWSmediaconvertHlsManifestCompressionNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsManifestDurationFormat) {
    AWSmediaconvertHlsManifestDurationFormatUnknown,
    AWSmediaconvertHlsManifestDurationFormatFloatingPoint,
    AWSmediaconvertHlsManifestDurationFormatInteger,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsOfflineEncrypted) {
    AWSmediaconvertHlsOfflineEncryptedUnknown,
    AWSmediaconvertHlsOfflineEncryptedEnabled,
    AWSmediaconvertHlsOfflineEncryptedDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsOutputSelection) {
    AWSmediaconvertHlsOutputSelectionUnknown,
    AWSmediaconvertHlsOutputSelectionManifestsAndSegments,
    AWSmediaconvertHlsOutputSelectionSegmentsOnly,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsProgramDateTime) {
    AWSmediaconvertHlsProgramDateTimeUnknown,
    AWSmediaconvertHlsProgramDateTimeInclude,
    AWSmediaconvertHlsProgramDateTimeExclude,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsSegmentControl) {
    AWSmediaconvertHlsSegmentControlUnknown,
    AWSmediaconvertHlsSegmentControlSingleFile,
    AWSmediaconvertHlsSegmentControlSegmentedFiles,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsStreamInfResolution) {
    AWSmediaconvertHlsStreamInfResolutionUnknown,
    AWSmediaconvertHlsStreamInfResolutionInclude,
    AWSmediaconvertHlsStreamInfResolutionExclude,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertHlsTimedMetadataId3Frame) {
    AWSmediaconvertHlsTimedMetadataId3FrameUnknown,
    AWSmediaconvertHlsTimedMetadataId3FrameNone,
    AWSmediaconvertHlsTimedMetadataId3FramePriv,
    AWSmediaconvertHlsTimedMetadataId3FrameTdrl,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertImscStylePassthrough) {
    AWSmediaconvertImscStylePassthroughUnknown,
    AWSmediaconvertImscStylePassthroughEnabled,
    AWSmediaconvertImscStylePassthroughDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertInputDeblockFilter) {
    AWSmediaconvertInputDeblockFilterUnknown,
    AWSmediaconvertInputDeblockFilterEnabled,
    AWSmediaconvertInputDeblockFilterDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertInputDenoiseFilter) {
    AWSmediaconvertInputDenoiseFilterUnknown,
    AWSmediaconvertInputDenoiseFilterEnabled,
    AWSmediaconvertInputDenoiseFilterDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertInputFilterEnable) {
    AWSmediaconvertInputFilterEnableUnknown,
    AWSmediaconvertInputFilterEnableAuto,
    AWSmediaconvertInputFilterEnableDisable,
    AWSmediaconvertInputFilterEnableForce,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertInputPsiControl) {
    AWSmediaconvertInputPsiControlUnknown,
    AWSmediaconvertInputPsiControlIgnorePsi,
    AWSmediaconvertInputPsiControlUsePsi,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertInputRotate) {
    AWSmediaconvertInputRotateUnknown,
    AWSmediaconvertInputRotateDegree0,
    AWSmediaconvertInputRotateDegrees90,
    AWSmediaconvertInputRotateDegrees180,
    AWSmediaconvertInputRotateDegrees270,
    AWSmediaconvertInputRotateAuto,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertInputTimecodeSource) {
    AWSmediaconvertInputTimecodeSourceUnknown,
    AWSmediaconvertInputTimecodeSourceEmbedded,
    AWSmediaconvertInputTimecodeSourceZerobased,
    AWSmediaconvertInputTimecodeSourceSpecifiedstart,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertJobPhase) {
    AWSmediaconvertJobPhaseUnknown,
    AWSmediaconvertJobPhaseProbing,
    AWSmediaconvertJobPhaseTranscoding,
    AWSmediaconvertJobPhaseUploading,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertJobStatus) {
    AWSmediaconvertJobStatusUnknown,
    AWSmediaconvertJobStatusSubmitted,
    AWSmediaconvertJobStatusProgressing,
    AWSmediaconvertJobStatusComplete,
    AWSmediaconvertJobStatusCanceled,
    AWSmediaconvertJobStatusError,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertJobTemplateListBy) {
    AWSmediaconvertJobTemplateListByUnknown,
    AWSmediaconvertJobTemplateListByName,
    AWSmediaconvertJobTemplateListByCreationDate,
    AWSmediaconvertJobTemplateListBySystem,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertLanguageCode) {
    AWSmediaconvertLanguageCodeUnknown,
    AWSmediaconvertLanguageCodeEng,
    AWSmediaconvertLanguageCodeSpa,
    AWSmediaconvertLanguageCodeFra,
    AWSmediaconvertLanguageCodeDeu,
    AWSmediaconvertLanguageCodeGer,
    AWSmediaconvertLanguageCodeZho,
    AWSmediaconvertLanguageCodeAra,
    AWSmediaconvertLanguageCodeHin,
    AWSmediaconvertLanguageCodeJpn,
    AWSmediaconvertLanguageCodeRus,
    AWSmediaconvertLanguageCodePor,
    AWSmediaconvertLanguageCodeIta,
    AWSmediaconvertLanguageCodeUrd,
    AWSmediaconvertLanguageCodeVie,
    AWSmediaconvertLanguageCodeKor,
    AWSmediaconvertLanguageCodePan,
    AWSmediaconvertLanguageCodeAbk,
    AWSmediaconvertLanguageCodeAar,
    AWSmediaconvertLanguageCodeAfr,
    AWSmediaconvertLanguageCodeAka,
    AWSmediaconvertLanguageCodeSqi,
    AWSmediaconvertLanguageCodeAmh,
    AWSmediaconvertLanguageCodeArg,
    AWSmediaconvertLanguageCodeHye,
    AWSmediaconvertLanguageCodeAsm,
    AWSmediaconvertLanguageCodeAva,
    AWSmediaconvertLanguageCodeAve,
    AWSmediaconvertLanguageCodeAym,
    AWSmediaconvertLanguageCodeAze,
    AWSmediaconvertLanguageCodeBam,
    AWSmediaconvertLanguageCodeBak,
    AWSmediaconvertLanguageCodeEus,
    AWSmediaconvertLanguageCodeBel,
    AWSmediaconvertLanguageCodeBen,
    AWSmediaconvertLanguageCodeBih,
    AWSmediaconvertLanguageCodeBis,
    AWSmediaconvertLanguageCodeBos,
    AWSmediaconvertLanguageCodeBre,
    AWSmediaconvertLanguageCodeBul,
    AWSmediaconvertLanguageCodeMya,
    AWSmediaconvertLanguageCodeCat,
    AWSmediaconvertLanguageCodeKhm,
    AWSmediaconvertLanguageCodeCha,
    AWSmediaconvertLanguageCodeChe,
    AWSmediaconvertLanguageCodeNya,
    AWSmediaconvertLanguageCodeChu,
    AWSmediaconvertLanguageCodeChv,
    AWSmediaconvertLanguageCodeCor,
    AWSmediaconvertLanguageCodeCos,
    AWSmediaconvertLanguageCodeCre,
    AWSmediaconvertLanguageCodeHrv,
    AWSmediaconvertLanguageCodeCes,
    AWSmediaconvertLanguageCodeDan,
    AWSmediaconvertLanguageCodeDiv,
    AWSmediaconvertLanguageCodeNld,
    AWSmediaconvertLanguageCodeDzo,
    AWSmediaconvertLanguageCodeEnm,
    AWSmediaconvertLanguageCodeEpo,
    AWSmediaconvertLanguageCodeEst,
    AWSmediaconvertLanguageCodeEwe,
    AWSmediaconvertLanguageCodeFao,
    AWSmediaconvertLanguageCodeFij,
    AWSmediaconvertLanguageCodeFin,
    AWSmediaconvertLanguageCodeFrm,
    AWSmediaconvertLanguageCodeFul,
    AWSmediaconvertLanguageCodeGla,
    AWSmediaconvertLanguageCodeGlg,
    AWSmediaconvertLanguageCodeLug,
    AWSmediaconvertLanguageCodeKat,
    AWSmediaconvertLanguageCodeEll,
    AWSmediaconvertLanguageCodeGrn,
    AWSmediaconvertLanguageCodeGuj,
    AWSmediaconvertLanguageCodeHat,
    AWSmediaconvertLanguageCodeHau,
    AWSmediaconvertLanguageCodeHeb,
    AWSmediaconvertLanguageCodeHer,
    AWSmediaconvertLanguageCodeHmo,
    AWSmediaconvertLanguageCodeHun,
    AWSmediaconvertLanguageCodeIsl,
    AWSmediaconvertLanguageCodeIdo,
    AWSmediaconvertLanguageCodeIbo,
    AWSmediaconvertLanguageCodeInd,
    AWSmediaconvertLanguageCodeIna,
    AWSmediaconvertLanguageCodeIle,
    AWSmediaconvertLanguageCodeIku,
    AWSmediaconvertLanguageCodeIpk,
    AWSmediaconvertLanguageCodeGle,
    AWSmediaconvertLanguageCodeJav,
    AWSmediaconvertLanguageCodeKal,
    AWSmediaconvertLanguageCodeKan,
    AWSmediaconvertLanguageCodeKau,
    AWSmediaconvertLanguageCodeKas,
    AWSmediaconvertLanguageCodeKaz,
    AWSmediaconvertLanguageCodeKik,
    AWSmediaconvertLanguageCodeKin,
    AWSmediaconvertLanguageCodeKir,
    AWSmediaconvertLanguageCodeKom,
    AWSmediaconvertLanguageCodeKon,
    AWSmediaconvertLanguageCodeKua,
    AWSmediaconvertLanguageCodeKur,
    AWSmediaconvertLanguageCodeLao,
    AWSmediaconvertLanguageCodeLat,
    AWSmediaconvertLanguageCodeLav,
    AWSmediaconvertLanguageCodeLim,
    AWSmediaconvertLanguageCodeLin,
    AWSmediaconvertLanguageCodeLit,
    AWSmediaconvertLanguageCodeLub,
    AWSmediaconvertLanguageCodeLtz,
    AWSmediaconvertLanguageCodeMkd,
    AWSmediaconvertLanguageCodeMlg,
    AWSmediaconvertLanguageCodeMsa,
    AWSmediaconvertLanguageCodeMal,
    AWSmediaconvertLanguageCodeMlt,
    AWSmediaconvertLanguageCodeGlv,
    AWSmediaconvertLanguageCodeMri,
    AWSmediaconvertLanguageCodeMar,
    AWSmediaconvertLanguageCodeMah,
    AWSmediaconvertLanguageCodeMon,
    AWSmediaconvertLanguageCodeNau,
    AWSmediaconvertLanguageCodeNav,
    AWSmediaconvertLanguageCodeNde,
    AWSmediaconvertLanguageCodeNbl,
    AWSmediaconvertLanguageCodeNdo,
    AWSmediaconvertLanguageCodeNep,
    AWSmediaconvertLanguageCodeSme,
    AWSmediaconvertLanguageCodeNor,
    AWSmediaconvertLanguageCodeNob,
    AWSmediaconvertLanguageCodeNno,
    AWSmediaconvertLanguageCodeOci,
    AWSmediaconvertLanguageCodeOji,
    AWSmediaconvertLanguageCodeOri,
    AWSmediaconvertLanguageCodeOrm,
    AWSmediaconvertLanguageCodeOss,
    AWSmediaconvertLanguageCodePli,
    AWSmediaconvertLanguageCodeFas,
    AWSmediaconvertLanguageCodePol,
    AWSmediaconvertLanguageCodePus,
    AWSmediaconvertLanguageCodeQue,
    AWSmediaconvertLanguageCodeQaa,
    AWSmediaconvertLanguageCodeRon,
    AWSmediaconvertLanguageCodeRoh,
    AWSmediaconvertLanguageCodeRun,
    AWSmediaconvertLanguageCodeSmo,
    AWSmediaconvertLanguageCodeSag,
    AWSmediaconvertLanguageCodeSan,
    AWSmediaconvertLanguageCodeSrd,
    AWSmediaconvertLanguageCodeSrb,
    AWSmediaconvertLanguageCodeSna,
    AWSmediaconvertLanguageCodeIii,
    AWSmediaconvertLanguageCodeSnd,
    AWSmediaconvertLanguageCodeSin,
    AWSmediaconvertLanguageCodeSlk,
    AWSmediaconvertLanguageCodeSlv,
    AWSmediaconvertLanguageCodeSom,
    AWSmediaconvertLanguageCodeSot,
    AWSmediaconvertLanguageCodeSun,
    AWSmediaconvertLanguageCodeSwa,
    AWSmediaconvertLanguageCodeSsw,
    AWSmediaconvertLanguageCodeSwe,
    AWSmediaconvertLanguageCodeTgl,
    AWSmediaconvertLanguageCodeTah,
    AWSmediaconvertLanguageCodeTgk,
    AWSmediaconvertLanguageCodeTam,
    AWSmediaconvertLanguageCodeTat,
    AWSmediaconvertLanguageCodeTel,
    AWSmediaconvertLanguageCodeTha,
    AWSmediaconvertLanguageCodeBod,
    AWSmediaconvertLanguageCodeTir,
    AWSmediaconvertLanguageCodeTon,
    AWSmediaconvertLanguageCodeTso,
    AWSmediaconvertLanguageCodeTsn,
    AWSmediaconvertLanguageCodeTur,
    AWSmediaconvertLanguageCodeTuk,
    AWSmediaconvertLanguageCodeTwi,
    AWSmediaconvertLanguageCodeUig,
    AWSmediaconvertLanguageCodeUkr,
    AWSmediaconvertLanguageCodeUzb,
    AWSmediaconvertLanguageCodeVen,
    AWSmediaconvertLanguageCodeVol,
    AWSmediaconvertLanguageCodeWln,
    AWSmediaconvertLanguageCodeCym,
    AWSmediaconvertLanguageCodeFry,
    AWSmediaconvertLanguageCodeWol,
    AWSmediaconvertLanguageCodeXho,
    AWSmediaconvertLanguageCodeYid,
    AWSmediaconvertLanguageCodeYor,
    AWSmediaconvertLanguageCodeZha,
    AWSmediaconvertLanguageCodeZul,
    AWSmediaconvertLanguageCodeOrj,
    AWSmediaconvertLanguageCodeQpc,
    AWSmediaconvertLanguageCodeTng,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM2tsAudioBufferModel) {
    AWSmediaconvertM2tsAudioBufferModelUnknown,
    AWSmediaconvertM2tsAudioBufferModelDvb,
    AWSmediaconvertM2tsAudioBufferModelAtsc,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM2tsBufferModel) {
    AWSmediaconvertM2tsBufferModelUnknown,
    AWSmediaconvertM2tsBufferModelMultiplex,
    AWSmediaconvertM2tsBufferModelNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM2tsEbpAudioInterval) {
    AWSmediaconvertM2tsEbpAudioIntervalUnknown,
    AWSmediaconvertM2tsEbpAudioIntervalVideoAndFixedIntervals,
    AWSmediaconvertM2tsEbpAudioIntervalVideoInterval,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM2tsEbpPlacement) {
    AWSmediaconvertM2tsEbpPlacementUnknown,
    AWSmediaconvertM2tsEbpPlacementVideoAndAudioPids,
    AWSmediaconvertM2tsEbpPlacementVideoPid,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM2tsEsRateInPes) {
    AWSmediaconvertM2tsEsRateInPesUnknown,
    AWSmediaconvertM2tsEsRateInPesInclude,
    AWSmediaconvertM2tsEsRateInPesExclude,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM2tsForceTsVideoEbpOrder) {
    AWSmediaconvertM2tsForceTsVideoEbpOrderUnknown,
    AWSmediaconvertM2tsForceTsVideoEbpOrderForce,
    AWSmediaconvertM2tsForceTsVideoEbpOrderDefault,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM2tsNielsenId3) {
    AWSmediaconvertM2tsNielsenId3Unknown,
    AWSmediaconvertM2tsNielsenId3Insert,
    AWSmediaconvertM2tsNielsenId3None,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM2tsPcrControl) {
    AWSmediaconvertM2tsPcrControlUnknown,
    AWSmediaconvertM2tsPcrControlPcrEveryPesPacket,
    AWSmediaconvertM2tsPcrControlConfiguredPcrPeriod,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM2tsRateMode) {
    AWSmediaconvertM2tsRateModeUnknown,
    AWSmediaconvertM2tsRateModeVbr,
    AWSmediaconvertM2tsRateModeCbr,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM2tsScte35Source) {
    AWSmediaconvertM2tsScte35SourceUnknown,
    AWSmediaconvertM2tsScte35SourcePassthrough,
    AWSmediaconvertM2tsScte35SourceNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM2tsSegmentationMarkers) {
    AWSmediaconvertM2tsSegmentationMarkersUnknown,
    AWSmediaconvertM2tsSegmentationMarkersNone,
    AWSmediaconvertM2tsSegmentationMarkersRaiSegstart,
    AWSmediaconvertM2tsSegmentationMarkersRaiAdapt,
    AWSmediaconvertM2tsSegmentationMarkersPsiSegstart,
    AWSmediaconvertM2tsSegmentationMarkersEbp,
    AWSmediaconvertM2tsSegmentationMarkersEbpLegacy,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM2tsSegmentationStyle) {
    AWSmediaconvertM2tsSegmentationStyleUnknown,
    AWSmediaconvertM2tsSegmentationStyleMaintainCadence,
    AWSmediaconvertM2tsSegmentationStyleResetCadence,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM3u8NielsenId3) {
    AWSmediaconvertM3u8NielsenId3Unknown,
    AWSmediaconvertM3u8NielsenId3Insert,
    AWSmediaconvertM3u8NielsenId3None,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM3u8PcrControl) {
    AWSmediaconvertM3u8PcrControlUnknown,
    AWSmediaconvertM3u8PcrControlPcrEveryPesPacket,
    AWSmediaconvertM3u8PcrControlConfiguredPcrPeriod,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertM3u8Scte35Source) {
    AWSmediaconvertM3u8Scte35SourceUnknown,
    AWSmediaconvertM3u8Scte35SourcePassthrough,
    AWSmediaconvertM3u8Scte35SourceNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMotionImageInsertionMode) {
    AWSmediaconvertMotionImageInsertionModeUnknown,
    AWSmediaconvertMotionImageInsertionModeMov,
    AWSmediaconvertMotionImageInsertionModePng,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMotionImagePlayback) {
    AWSmediaconvertMotionImagePlaybackUnknown,
    AWSmediaconvertMotionImagePlaybackOnce,
    AWSmediaconvertMotionImagePlaybackRepeat,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMovClapAtom) {
    AWSmediaconvertMovClapAtomUnknown,
    AWSmediaconvertMovClapAtomInclude,
    AWSmediaconvertMovClapAtomExclude,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMovCslgAtom) {
    AWSmediaconvertMovCslgAtomUnknown,
    AWSmediaconvertMovCslgAtomInclude,
    AWSmediaconvertMovCslgAtomExclude,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMovMpeg2FourCCControl) {
    AWSmediaconvertMovMpeg2FourCCControlUnknown,
    AWSmediaconvertMovMpeg2FourCCControlXdcam,
    AWSmediaconvertMovMpeg2FourCCControlMpeg,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMovPaddingControl) {
    AWSmediaconvertMovPaddingControlUnknown,
    AWSmediaconvertMovPaddingControlOmneon,
    AWSmediaconvertMovPaddingControlNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMovReference) {
    AWSmediaconvertMovReferenceUnknown,
    AWSmediaconvertMovReferenceSelfContained,
    AWSmediaconvertMovReferenceExternal,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMp3RateControlMode) {
    AWSmediaconvertMp3RateControlModeUnknown,
    AWSmediaconvertMp3RateControlModeCbr,
    AWSmediaconvertMp3RateControlModeVbr,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMp4CslgAtom) {
    AWSmediaconvertMp4CslgAtomUnknown,
    AWSmediaconvertMp4CslgAtomInclude,
    AWSmediaconvertMp4CslgAtomExclude,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMp4FreeSpaceBox) {
    AWSmediaconvertMp4FreeSpaceBoxUnknown,
    AWSmediaconvertMp4FreeSpaceBoxInclude,
    AWSmediaconvertMp4FreeSpaceBoxExclude,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMp4MoovPlacement) {
    AWSmediaconvertMp4MoovPlacementUnknown,
    AWSmediaconvertMp4MoovPlacementProgressiveDownload,
    AWSmediaconvertMp4MoovPlacementNormal,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpdCaptionContainerType) {
    AWSmediaconvertMpdCaptionContainerTypeUnknown,
    AWSmediaconvertMpdCaptionContainerTypeRAW,
    AWSmediaconvertMpdCaptionContainerTypeFragmentedMp4,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpdScte35Esam) {
    AWSmediaconvertMpdScte35EsamUnknown,
    AWSmediaconvertMpdScte35EsamInsert,
    AWSmediaconvertMpdScte35EsamNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpdScte35Source) {
    AWSmediaconvertMpdScte35SourceUnknown,
    AWSmediaconvertMpdScte35SourcePassthrough,
    AWSmediaconvertMpdScte35SourceNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2AdaptiveQuantization) {
    AWSmediaconvertMpeg2AdaptiveQuantizationUnknown,
    AWSmediaconvertMpeg2AdaptiveQuantizationOff,
    AWSmediaconvertMpeg2AdaptiveQuantizationLow,
    AWSmediaconvertMpeg2AdaptiveQuantizationMedium,
    AWSmediaconvertMpeg2AdaptiveQuantizationHigh,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2CodecLevel) {
    AWSmediaconvertMpeg2CodecLevelUnknown,
    AWSmediaconvertMpeg2CodecLevelAuto,
    AWSmediaconvertMpeg2CodecLevelLow,
    AWSmediaconvertMpeg2CodecLevelMain,
    AWSmediaconvertMpeg2CodecLevelHigh1440,
    AWSmediaconvertMpeg2CodecLevelHigh,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2CodecProfile) {
    AWSmediaconvertMpeg2CodecProfileUnknown,
    AWSmediaconvertMpeg2CodecProfileMain,
    AWSmediaconvertMpeg2CodecProfileProfile422,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2DynamicSubGop) {
    AWSmediaconvertMpeg2DynamicSubGopUnknown,
    AWSmediaconvertMpeg2DynamicSubGopAdaptive,
    AWSmediaconvertMpeg2DynamicSubGopStatic,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2FramerateControl) {
    AWSmediaconvertMpeg2FramerateControlUnknown,
    AWSmediaconvertMpeg2FramerateControlInitializeFromSource,
    AWSmediaconvertMpeg2FramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2FramerateConversionAlgorithm) {
    AWSmediaconvertMpeg2FramerateConversionAlgorithmUnknown,
    AWSmediaconvertMpeg2FramerateConversionAlgorithmDuplicateDrop,
    AWSmediaconvertMpeg2FramerateConversionAlgorithmInterpolate,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2GopSizeUnits) {
    AWSmediaconvertMpeg2GopSizeUnitsUnknown,
    AWSmediaconvertMpeg2GopSizeUnitsFrames,
    AWSmediaconvertMpeg2GopSizeUnitsSeconds,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2InterlaceMode) {
    AWSmediaconvertMpeg2InterlaceModeUnknown,
    AWSmediaconvertMpeg2InterlaceModeProgressive,
    AWSmediaconvertMpeg2InterlaceModeTopField,
    AWSmediaconvertMpeg2InterlaceModeBottomField,
    AWSmediaconvertMpeg2InterlaceModeFollowTopField,
    AWSmediaconvertMpeg2InterlaceModeFollowBottomField,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2IntraDcPrecision) {
    AWSmediaconvertMpeg2IntraDcPrecisionUnknown,
    AWSmediaconvertMpeg2IntraDcPrecisionAuto,
    AWSmediaconvertMpeg2IntraDcPrecisionIntraDcPrecision8,
    AWSmediaconvertMpeg2IntraDcPrecisionIntraDcPrecision9,
    AWSmediaconvertMpeg2IntraDcPrecisionIntraDcPrecision10,
    AWSmediaconvertMpeg2IntraDcPrecisionIntraDcPrecision11,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2ParControl) {
    AWSmediaconvertMpeg2ParControlUnknown,
    AWSmediaconvertMpeg2ParControlInitializeFromSource,
    AWSmediaconvertMpeg2ParControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2QualityTuningLevel) {
    AWSmediaconvertMpeg2QualityTuningLevelUnknown,
    AWSmediaconvertMpeg2QualityTuningLevelSinglePass,
    AWSmediaconvertMpeg2QualityTuningLevelMultiPass,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2RateControlMode) {
    AWSmediaconvertMpeg2RateControlModeUnknown,
    AWSmediaconvertMpeg2RateControlModeVbr,
    AWSmediaconvertMpeg2RateControlModeCbr,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2SceneChangeDetect) {
    AWSmediaconvertMpeg2SceneChangeDetectUnknown,
    AWSmediaconvertMpeg2SceneChangeDetectDisabled,
    AWSmediaconvertMpeg2SceneChangeDetectEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2SlowPal) {
    AWSmediaconvertMpeg2SlowPalUnknown,
    AWSmediaconvertMpeg2SlowPalDisabled,
    AWSmediaconvertMpeg2SlowPalEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2SpatialAdaptiveQuantization) {
    AWSmediaconvertMpeg2SpatialAdaptiveQuantizationUnknown,
    AWSmediaconvertMpeg2SpatialAdaptiveQuantizationDisabled,
    AWSmediaconvertMpeg2SpatialAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2Syntax) {
    AWSmediaconvertMpeg2SyntaxUnknown,
    AWSmediaconvertMpeg2SyntaxDefault,
    AWSmediaconvertMpeg2SyntaxD10,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2Telecine) {
    AWSmediaconvertMpeg2TelecineUnknown,
    AWSmediaconvertMpeg2TelecineNone,
    AWSmediaconvertMpeg2TelecineSoft,
    AWSmediaconvertMpeg2TelecineHard,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMpeg2TemporalAdaptiveQuantization) {
    AWSmediaconvertMpeg2TemporalAdaptiveQuantizationUnknown,
    AWSmediaconvertMpeg2TemporalAdaptiveQuantizationDisabled,
    AWSmediaconvertMpeg2TemporalAdaptiveQuantizationEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMsSmoothAudioDeduplication) {
    AWSmediaconvertMsSmoothAudioDeduplicationUnknown,
    AWSmediaconvertMsSmoothAudioDeduplicationCombineDuplicateStreams,
    AWSmediaconvertMsSmoothAudioDeduplicationNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertMsSmoothManifestEncoding) {
    AWSmediaconvertMsSmoothManifestEncodingUnknown,
    AWSmediaconvertMsSmoothManifestEncodingUtf8,
    AWSmediaconvertMsSmoothManifestEncodingUtf16,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertNoiseReducerFilter) {
    AWSmediaconvertNoiseReducerFilterUnknown,
    AWSmediaconvertNoiseReducerFilterBilateral,
    AWSmediaconvertNoiseReducerFilterMean,
    AWSmediaconvertNoiseReducerFilterGaussian,
    AWSmediaconvertNoiseReducerFilterLanczos,
    AWSmediaconvertNoiseReducerFilterSharpen,
    AWSmediaconvertNoiseReducerFilterConserve,
    AWSmediaconvertNoiseReducerFilterSpatial,
    AWSmediaconvertNoiseReducerFilterTemporal,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertOrder) {
    AWSmediaconvertOrderUnknown,
    AWSmediaconvertOrderAscending,
    AWSmediaconvertOrderDescending,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertOutputGroupType) {
    AWSmediaconvertOutputGroupTypeUnknown,
    AWSmediaconvertOutputGroupTypeHlsGroupSettings,
    AWSmediaconvertOutputGroupTypeDashIsoGroupSettings,
    AWSmediaconvertOutputGroupTypeFileGroupSettings,
    AWSmediaconvertOutputGroupTypeMsSmoothGroupSettings,
    AWSmediaconvertOutputGroupTypeCmafGroupSettings,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertOutputSdt) {
    AWSmediaconvertOutputSdtUnknown,
    AWSmediaconvertOutputSdtSdtFollow,
    AWSmediaconvertOutputSdtSdtFollowIfPresent,
    AWSmediaconvertOutputSdtSdtManual,
    AWSmediaconvertOutputSdtSdtNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertPresetListBy) {
    AWSmediaconvertPresetListByUnknown,
    AWSmediaconvertPresetListByName,
    AWSmediaconvertPresetListByCreationDate,
    AWSmediaconvertPresetListBySystem,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertPricingPlan) {
    AWSmediaconvertPricingPlanUnknown,
    AWSmediaconvertPricingPlanOnDemand,
    AWSmediaconvertPricingPlanReserved,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertProresCodecProfile) {
    AWSmediaconvertProresCodecProfileUnknown,
    AWSmediaconvertProresCodecProfileAppleProres422,
    AWSmediaconvertProresCodecProfileAppleProres422Hq,
    AWSmediaconvertProresCodecProfileAppleProres422Lt,
    AWSmediaconvertProresCodecProfileAppleProres422Proxy,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertProresFramerateControl) {
    AWSmediaconvertProresFramerateControlUnknown,
    AWSmediaconvertProresFramerateControlInitializeFromSource,
    AWSmediaconvertProresFramerateControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertProresFramerateConversionAlgorithm) {
    AWSmediaconvertProresFramerateConversionAlgorithmUnknown,
    AWSmediaconvertProresFramerateConversionAlgorithmDuplicateDrop,
    AWSmediaconvertProresFramerateConversionAlgorithmInterpolate,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertProresInterlaceMode) {
    AWSmediaconvertProresInterlaceModeUnknown,
    AWSmediaconvertProresInterlaceModeProgressive,
    AWSmediaconvertProresInterlaceModeTopField,
    AWSmediaconvertProresInterlaceModeBottomField,
    AWSmediaconvertProresInterlaceModeFollowTopField,
    AWSmediaconvertProresInterlaceModeFollowBottomField,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertProresParControl) {
    AWSmediaconvertProresParControlUnknown,
    AWSmediaconvertProresParControlInitializeFromSource,
    AWSmediaconvertProresParControlSpecified,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertProresSlowPal) {
    AWSmediaconvertProresSlowPalUnknown,
    AWSmediaconvertProresSlowPalDisabled,
    AWSmediaconvertProresSlowPalEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertProresTelecine) {
    AWSmediaconvertProresTelecineUnknown,
    AWSmediaconvertProresTelecineNone,
    AWSmediaconvertProresTelecineHard,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertQueueListBy) {
    AWSmediaconvertQueueListByUnknown,
    AWSmediaconvertQueueListByName,
    AWSmediaconvertQueueListByCreationDate,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertQueueStatus) {
    AWSmediaconvertQueueStatusUnknown,
    AWSmediaconvertQueueStatusActive,
    AWSmediaconvertQueueStatusPaused,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertRenewalType) {
    AWSmediaconvertRenewalTypeUnknown,
    AWSmediaconvertRenewalTypeAutoRenew,
    AWSmediaconvertRenewalTypeExpire,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertReservationPlanStatus) {
    AWSmediaconvertReservationPlanStatusUnknown,
    AWSmediaconvertReservationPlanStatusActive,
    AWSmediaconvertReservationPlanStatusExpired,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertRespondToAfd) {
    AWSmediaconvertRespondToAfdUnknown,
    AWSmediaconvertRespondToAfdNone,
    AWSmediaconvertRespondToAfdRespond,
    AWSmediaconvertRespondToAfdPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertS3ObjectCannedAcl) {
    AWSmediaconvertS3ObjectCannedAclUnknown,
    AWSmediaconvertS3ObjectCannedAclPublicRead,
    AWSmediaconvertS3ObjectCannedAclAuthenticatedRead,
    AWSmediaconvertS3ObjectCannedAclBucketOwnerRead,
    AWSmediaconvertS3ObjectCannedAclBucketOwnerFullControl,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertS3ServerSideEncryptionType) {
    AWSmediaconvertS3ServerSideEncryptionTypeUnknown,
    AWSmediaconvertS3ServerSideEncryptionTypeServerSideEncryptionS3,
    AWSmediaconvertS3ServerSideEncryptionTypeServerSideEncryptionKms,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertScalingBehavior) {
    AWSmediaconvertScalingBehaviorUnknown,
    AWSmediaconvertScalingBehaviorDefault,
    AWSmediaconvertScalingBehaviorStretchToOutput,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertSccDestinationFramerate) {
    AWSmediaconvertSccDestinationFramerateUnknown,
    AWSmediaconvertSccDestinationFramerateFramerate2397,
    AWSmediaconvertSccDestinationFramerateFramerate24,
    AWSmediaconvertSccDestinationFramerateFramerate25,
    AWSmediaconvertSccDestinationFramerateFramerate2997Dropframe,
    AWSmediaconvertSccDestinationFramerateFramerate2997NonDropframe,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertSimulateReservedQueue) {
    AWSmediaconvertSimulateReservedQueueUnknown,
    AWSmediaconvertSimulateReservedQueueDisabled,
    AWSmediaconvertSimulateReservedQueueEnabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertStatusUpdateInterval) {
    AWSmediaconvertStatusUpdateIntervalUnknown,
    AWSmediaconvertStatusUpdateIntervalSeconds10,
    AWSmediaconvertStatusUpdateIntervalSeconds12,
    AWSmediaconvertStatusUpdateIntervalSeconds15,
    AWSmediaconvertStatusUpdateIntervalSeconds20,
    AWSmediaconvertStatusUpdateIntervalSeconds30,
    AWSmediaconvertStatusUpdateIntervalSeconds60,
    AWSmediaconvertStatusUpdateIntervalSeconds120,
    AWSmediaconvertStatusUpdateIntervalSeconds180,
    AWSmediaconvertStatusUpdateIntervalSeconds240,
    AWSmediaconvertStatusUpdateIntervalSeconds300,
    AWSmediaconvertStatusUpdateIntervalSeconds360,
    AWSmediaconvertStatusUpdateIntervalSeconds420,
    AWSmediaconvertStatusUpdateIntervalSeconds480,
    AWSmediaconvertStatusUpdateIntervalSeconds540,
    AWSmediaconvertStatusUpdateIntervalSeconds600,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertTeletextPageType) {
    AWSmediaconvertTeletextPageTypeUnknown,
    AWSmediaconvertTeletextPageTypePageTypeInitial,
    AWSmediaconvertTeletextPageTypePageTypeSubtitle,
    AWSmediaconvertTeletextPageTypePageTypeAddlInfo,
    AWSmediaconvertTeletextPageTypePageTypeProgramSchedule,
    AWSmediaconvertTeletextPageTypePageTypeHearingImpairedSubtitle,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertTimecodeBurninPosition) {
    AWSmediaconvertTimecodeBurninPositionUnknown,
    AWSmediaconvertTimecodeBurninPositionTopCenter,
    AWSmediaconvertTimecodeBurninPositionTopLeft,
    AWSmediaconvertTimecodeBurninPositionTopRight,
    AWSmediaconvertTimecodeBurninPositionMiddleLeft,
    AWSmediaconvertTimecodeBurninPositionMiddleCenter,
    AWSmediaconvertTimecodeBurninPositionMiddleRight,
    AWSmediaconvertTimecodeBurninPositionBottomLeft,
    AWSmediaconvertTimecodeBurninPositionBottomCenter,
    AWSmediaconvertTimecodeBurninPositionBottomRight,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertTimecodeSource) {
    AWSmediaconvertTimecodeSourceUnknown,
    AWSmediaconvertTimecodeSourceEmbedded,
    AWSmediaconvertTimecodeSourceZerobased,
    AWSmediaconvertTimecodeSourceSpecifiedstart,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertTimedMetadata) {
    AWSmediaconvertTimedMetadataUnknown,
    AWSmediaconvertTimedMetadataPassthrough,
    AWSmediaconvertTimedMetadataNone,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertTtmlStylePassthrough) {
    AWSmediaconvertTtmlStylePassthroughUnknown,
    AWSmediaconvertTtmlStylePassthroughEnabled,
    AWSmediaconvertTtmlStylePassthroughDisabled,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertTypes) {
    AWSmediaconvertTypesUnknown,
    AWSmediaconvertTypesSystem,
    AWSmediaconvertTypesCustom,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertVideoCodec) {
    AWSmediaconvertVideoCodecUnknown,
    AWSmediaconvertVideoCodecFrameCapture,
    AWSmediaconvertVideoCodecAv1,
    AWSmediaconvertVideoCodecH264,
    AWSmediaconvertVideoCodecH265,
    AWSmediaconvertVideoCodecMpeg2,
    AWSmediaconvertVideoCodecProres,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertVideoTimecodeInsertion) {
    AWSmediaconvertVideoTimecodeInsertionUnknown,
    AWSmediaconvertVideoTimecodeInsertionDisabled,
    AWSmediaconvertVideoTimecodeInsertionPicTimingSei,
};

typedef NS_ENUM(NSInteger, AWSmediaconvertWavFormat) {
    AWSmediaconvertWavFormatUnknown,
    AWSmediaconvertWavFormatRiff,
    AWSmediaconvertWavFormatRf64,
};

@class AWSmediaconvertAacSettings;
@class AWSmediaconvertAc3Settings;
@class AWSmediaconvertAccelerationSettings;
@class AWSmediaconvertAiffSettings;
@class AWSmediaconvertAncillarySourceSettings;
@class AWSmediaconvertAssociateCertificateRequest;
@class AWSmediaconvertAssociateCertificateResponse;
@class AWSmediaconvertAudioCodecSettings;
@class AWSmediaconvertAudioDescription;
@class AWSmediaconvertAudioNormalizationSettings;
@class AWSmediaconvertAudioSelector;
@class AWSmediaconvertAudioSelectorGroup;
@class AWSmediaconvertAv1QvbrSettings;
@class AWSmediaconvertAv1Settings;
@class AWSmediaconvertAvailBlanking;
@class AWSmediaconvertBurninDestinationSettings;
@class AWSmediaconvertCancelJobRequest;
@class AWSmediaconvertCancelJobResponse;
@class AWSmediaconvertCaptionDescription;
@class AWSmediaconvertCaptionDescriptionPreset;
@class AWSmediaconvertCaptionDestinationSettings;
@class AWSmediaconvertCaptionSelector;
@class AWSmediaconvertCaptionSourceFramerate;
@class AWSmediaconvertCaptionSourceSettings;
@class AWSmediaconvertChannelMapping;
@class AWSmediaconvertCmafAdditionalManifest;
@class AWSmediaconvertCmafEncryptionSettings;
@class AWSmediaconvertCmafGroupSettings;
@class AWSmediaconvertCmfcSettings;
@class AWSmediaconvertColorCorrector;
@class AWSmediaconvertContainerSettings;
@class AWSmediaconvertCreateJobRequest;
@class AWSmediaconvertCreateJobResponse;
@class AWSmediaconvertCreateJobTemplateRequest;
@class AWSmediaconvertCreateJobTemplateResponse;
@class AWSmediaconvertCreatePresetRequest;
@class AWSmediaconvertCreatePresetResponse;
@class AWSmediaconvertCreateQueueRequest;
@class AWSmediaconvertCreateQueueResponse;
@class AWSmediaconvertDashAdditionalManifest;
@class AWSmediaconvertDashIsoEncryptionSettings;
@class AWSmediaconvertDashIsoGroupSettings;
@class AWSmediaconvertDeinterlacer;
@class AWSmediaconvertDeleteJobTemplateRequest;
@class AWSmediaconvertDeleteJobTemplateResponse;
@class AWSmediaconvertDeletePresetRequest;
@class AWSmediaconvertDeletePresetResponse;
@class AWSmediaconvertDeleteQueueRequest;
@class AWSmediaconvertDeleteQueueResponse;
@class AWSmediaconvertDescribeEndpointsRequest;
@class AWSmediaconvertDescribeEndpointsResponse;
@class AWSmediaconvertDestinationSettings;
@class AWSmediaconvertDisassociateCertificateRequest;
@class AWSmediaconvertDisassociateCertificateResponse;
@class AWSmediaconvertDolbyVision;
@class AWSmediaconvertDolbyVisionLevel6Metadata;
@class AWSmediaconvertDvbNitSettings;
@class AWSmediaconvertDvbSdtSettings;
@class AWSmediaconvertDvbSubDestinationSettings;
@class AWSmediaconvertDvbSubSourceSettings;
@class AWSmediaconvertDvbTdtSettings;
@class AWSmediaconvertEac3AtmosSettings;
@class AWSmediaconvertEac3Settings;
@class AWSmediaconvertEmbeddedDestinationSettings;
@class AWSmediaconvertEmbeddedSourceSettings;
@class AWSmediaconvertEndpoint;
@class AWSmediaconvertEsamManifestConfirmConditionNotification;
@class AWSmediaconvertEsamSettings;
@class AWSmediaconvertEsamSignalProcessingNotification;
@class AWSmediaconvertExceptionBody;
@class AWSmediaconvertF4vSettings;
@class AWSmediaconvertFileGroupSettings;
@class AWSmediaconvertFileSourceSettings;
@class AWSmediaconvertFrameCaptureSettings;
@class AWSmediaconvertGetJobRequest;
@class AWSmediaconvertGetJobResponse;
@class AWSmediaconvertGetJobTemplateRequest;
@class AWSmediaconvertGetJobTemplateResponse;
@class AWSmediaconvertGetPresetRequest;
@class AWSmediaconvertGetPresetResponse;
@class AWSmediaconvertGetQueueRequest;
@class AWSmediaconvertGetQueueResponse;
@class AWSmediaconvertH264QvbrSettings;
@class AWSmediaconvertH264Settings;
@class AWSmediaconvertH265QvbrSettings;
@class AWSmediaconvertH265Settings;
@class AWSmediaconvertHdr10Metadata;
@class AWSmediaconvertHlsAdditionalManifest;
@class AWSmediaconvertHlsCaptionLanguageMapping;
@class AWSmediaconvertHlsEncryptionSettings;
@class AWSmediaconvertHlsGroupSettings;
@class AWSmediaconvertHlsSettings;
@class AWSmediaconvertHopDestination;
@class AWSmediaconvertId3Insertion;
@class AWSmediaconvertImageInserter;
@class AWSmediaconvertImscDestinationSettings;
@class AWSmediaconvertInput;
@class AWSmediaconvertInputClipping;
@class AWSmediaconvertInputDecryptionSettings;
@class AWSmediaconvertInputTemplate;
@class AWSmediaconvertInsertableImage;
@class AWSmediaconvertJob;
@class AWSmediaconvertJobMessages;
@class AWSmediaconvertJobSettings;
@class AWSmediaconvertJobTemplate;
@class AWSmediaconvertJobTemplateSettings;
@class AWSmediaconvertListJobTemplatesRequest;
@class AWSmediaconvertListJobTemplatesResponse;
@class AWSmediaconvertListJobsRequest;
@class AWSmediaconvertListJobsResponse;
@class AWSmediaconvertListPresetsRequest;
@class AWSmediaconvertListPresetsResponse;
@class AWSmediaconvertListQueuesRequest;
@class AWSmediaconvertListQueuesResponse;
@class AWSmediaconvertListTagsForResourceRequest;
@class AWSmediaconvertListTagsForResourceResponse;
@class AWSmediaconvertM2tsScte35Esam;
@class AWSmediaconvertM2tsSettings;
@class AWSmediaconvertM3u8Settings;
@class AWSmediaconvertMotionImageInserter;
@class AWSmediaconvertMotionImageInsertionFramerate;
@class AWSmediaconvertMotionImageInsertionOffset;
@class AWSmediaconvertMovSettings;
@class AWSmediaconvertMp2Settings;
@class AWSmediaconvertMp3Settings;
@class AWSmediaconvertMp4Settings;
@class AWSmediaconvertMpdSettings;
@class AWSmediaconvertMpeg2Settings;
@class AWSmediaconvertMsSmoothAdditionalManifest;
@class AWSmediaconvertMsSmoothEncryptionSettings;
@class AWSmediaconvertMsSmoothGroupSettings;
@class AWSmediaconvertNielsenConfiguration;
@class AWSmediaconvertNoiseReducer;
@class AWSmediaconvertNoiseReducerFilterSettings;
@class AWSmediaconvertNoiseReducerSpatialFilterSettings;
@class AWSmediaconvertNoiseReducerTemporalFilterSettings;
@class AWSmediaconvertOutput;
@class AWSmediaconvertOutputChannelMapping;
@class AWSmediaconvertOutputDetail;
@class AWSmediaconvertOutputGroup;
@class AWSmediaconvertOutputGroupDetail;
@class AWSmediaconvertOutputGroupSettings;
@class AWSmediaconvertOutputSettings;
@class AWSmediaconvertPreset;
@class AWSmediaconvertPresetSettings;
@class AWSmediaconvertProresSettings;
@class AWSmediaconvertQueue;
@class AWSmediaconvertQueueTransition;
@class AWSmediaconvertRectangle;
@class AWSmediaconvertRemixSettings;
@class AWSmediaconvertReservationPlan;
@class AWSmediaconvertReservationPlanSettings;
@class AWSmediaconvertResourceTags;
@class AWSmediaconvertS3DestinationAccessControl;
@class AWSmediaconvertS3DestinationSettings;
@class AWSmediaconvertS3EncryptionSettings;
@class AWSmediaconvertSccDestinationSettings;
@class AWSmediaconvertSpekeKeyProvider;
@class AWSmediaconvertSpekeKeyProviderCmaf;
@class AWSmediaconvertStaticKeyProvider;
@class AWSmediaconvertTagResourceRequest;
@class AWSmediaconvertTagResourceResponse;
@class AWSmediaconvertTeletextDestinationSettings;
@class AWSmediaconvertTeletextSourceSettings;
@class AWSmediaconvertTimecodeBurnin;
@class AWSmediaconvertTimecodeConfig;
@class AWSmediaconvertTimedMetadataInsertion;
@class AWSmediaconvertTiming;
@class AWSmediaconvertTrackSourceSettings;
@class AWSmediaconvertTtmlDestinationSettings;
@class AWSmediaconvertUntagResourceRequest;
@class AWSmediaconvertUntagResourceResponse;
@class AWSmediaconvertUpdateJobTemplateRequest;
@class AWSmediaconvertUpdateJobTemplateResponse;
@class AWSmediaconvertUpdatePresetRequest;
@class AWSmediaconvertUpdatePresetResponse;
@class AWSmediaconvertUpdateQueueRequest;
@class AWSmediaconvertUpdateQueueResponse;
@class AWSmediaconvertVideoCodecSettings;
@class AWSmediaconvertVideoDescription;
@class AWSmediaconvertVideoDetail;
@class AWSmediaconvertVideoPreprocessor;
@class AWSmediaconvertVideoSelector;
@class AWSmediaconvertWavSettings;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value AAC. The service accepts one of two mutually exclusive groups of AAC settings--VBR and CBR. To select one of these modes, set the value of Bitrate control mode (rateControlMode) to "VBR" or "CBR".In VBR mode, you control the audio quality with the setting VBR quality (vbrQuality). In CBR mode, you use the setting Bitrate (bitrate). Defaults and valid values depend on the rate control mode.
 */
@interface AWSmediaconvertAacSettings : AWSModel


/**
 Choose BROADCASTER_MIXED_AD when the input contains pre-mixed main audio + audio description (AD) as a stereo pair. The value for AudioType will be set to 3, which signals to downstream systems that this stream contains "broadcaster mixed AD". Note that the input received by the encoder must contain pre-mixed audio; the encoder does not perform the mixing. When you choose BROADCASTER_MIXED_AD, the encoder ignores any values you provide in AudioType andFollowInputAudioType. Choose NORMAL when the input does not contain pre-mixed audio + audio description (AD). In this case, the encoder will use any values you provide for AudioType and FollowInputAudioType.
 */
@property (nonatomic, assign) AWSmediaconvertAacAudioDescriptionBroadcasterMix audioDescriptionBroadcasterMix;

/**
 Specify the average bitrate in bits per second. The set of valid values for this setting is: 6000, 8000, 10000, 12000, 14000, 16000, 20000, 24000, 28000, 32000, 40000, 48000, 56000, 64000, 80000, 96000, 112000, 128000, 160000, 192000, 224000, 256000, 288000, 320000, 384000, 448000, 512000, 576000, 640000, 768000, 896000, 1024000. The value you set is also constrained by the values that you choose for Profile (codecProfile), Bitrate control mode (codingMode), and Sample rate (sampleRate). Default values depend on Bitrate control mode and Profile.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 AAC Profile.
 */
@property (nonatomic, assign) AWSmediaconvertAacCodecProfile codecProfile;

/**
 Mono (Audio Description), Mono, Stereo, or 5.1 channel layout. Valid values depend on rate control mode and profile. "1.0 - Audio Description (Receiver Mix)" setting receives a stereo description plus control track and emits a mono AAC encode of the description track, with control data emitted in the PES header as per ETSI TS 101 154 Annex E.
 */
@property (nonatomic, assign) AWSmediaconvertAacCodingMode codingMode;

/**
 Rate Control Mode.
 */
@property (nonatomic, assign) AWSmediaconvertAacRateControlMode rateControlMode;

/**
 Enables LATM/LOAS AAC output. Note that if you use LATM/LOAS AAC in an output, you must choose "No container" for the output container.
 */
@property (nonatomic, assign) AWSmediaconvertAacRawFormat rawFormat;

/**
 Sample rate in Hz. Valid values depend on rate control mode and profile.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

/**
 Use MPEG-2 AAC instead of MPEG-4 AAC audio for raw or MPEG-2 Transport Stream containers.
 */
@property (nonatomic, assign) AWSmediaconvertAacSpecification specification;

/**
 VBR Quality Level - Only used if rate_control_mode is VBR.
 */
@property (nonatomic, assign) AWSmediaconvertAacVbrQuality vbrQuality;

@end

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value AC3.
 */
@interface AWSmediaconvertAc3Settings : AWSModel


/**
 Specify the average bitrate in bits per second. Valid bitrates depend on the coding mode.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specify the bitstream mode for the AC-3 stream that the encoder emits. For more information about the AC3 bitstream mode, see ATSC A/52-2012 (Annex E).
 */
@property (nonatomic, assign) AWSmediaconvertAc3BitstreamMode bitstreamMode;

/**
 Dolby Digital coding mode. Determines number of channels.
 */
@property (nonatomic, assign) AWSmediaconvertAc3CodingMode codingMode;

/**
 Sets the dialnorm for the output. If blank and input audio is Dolby Digital, dialnorm will be passed through.
 */
@property (nonatomic, strong) NSNumber * _Nullable dialnorm;

/**
 If set to FILM_STANDARD, adds dynamic range compression signaling to the output bitstream as defined in the Dolby Digital specification.
 */
@property (nonatomic, assign) AWSmediaconvertAc3DynamicRangeCompressionProfile dynamicRangeCompressionProfile;

/**
 Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid with 3_2_LFE coding mode.
 */
@property (nonatomic, assign) AWSmediaconvertAc3LfeFilter lfeFilter;

/**
 When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD, DD+, or DolbyE decoder that supplied this audio data. If audio was not supplied from one of these streams, then the static metadata settings will be used.
 */
@property (nonatomic, assign) AWSmediaconvertAc3MetadataControl metadataControl;

/**
 This value is always 48000. It represents the sample rate in Hz.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

@end

/**
 Accelerated transcoding can significantly speed up jobs with long, visually complex content.
 Required parameters: [Mode]
 */
@interface AWSmediaconvertAccelerationSettings : AWSModel


/**
 Specify the conditions when the service will run your job with accelerated transcoding.
 */
@property (nonatomic, assign) AWSmediaconvertAccelerationMode mode;

@end

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value AIFF.
 */
@interface AWSmediaconvertAiffSettings : AWSModel


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
@interface AWSmediaconvertAncillarySourceSettings : AWSModel


/**
 Specify whether this set of input captions appears in your outputs in both 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert includes the captions data in two ways: it passes the 608 data through using the 608 compatibility bytes fields of the 708 wrapper, and it also translates the 608 data into 708.
 */
@property (nonatomic, assign) AWSmediaconvertAncillaryConvert608To708 convert608To708;

/**
 Specifies the 608 channel number in the ancillary data track from which to extract captions. Unused for passthrough.
 */
@property (nonatomic, strong) NSNumber * _Nullable sourceAncillaryChannelNumber;

/**
 By default, the service terminates any unterminated captions at the end of each input. If you want the caption to continue onto your next input, disable this setting.
 */
@property (nonatomic, assign) AWSmediaconvertAncillaryTerminateCaptions terminateCaptions;

@end

/**
 
 */
@interface AWSmediaconvertAssociateCertificateRequest : AWSRequest


/**
 The ARN of the ACM certificate that you want to associate with your MediaConvert resource.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSmediaconvertAssociateCertificateResponse : AWSModel


@end

/**
 Audio codec settings (CodecSettings) under (AudioDescriptions) contains the group of settings related to audio encoding. The settings in this group vary depending on the value that you choose for Audio codec (Codec). For each codec enum that you choose, define the corresponding settings object. The following lists the codec enum, settings object pairs. * AAC, AacSettings * MP2, Mp2Settings * MP3, Mp3Settings * WAV, WavSettings * AIFF, AiffSettings * AC3, Ac3Settings * EAC3, Eac3Settings * EAC3_ATMOS, Eac3AtmosSettings
 */
@interface AWSmediaconvertAudioCodecSettings : AWSModel


/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value AAC. The service accepts one of two mutually exclusive groups of AAC settings--VBR and CBR. To select one of these modes, set the value of Bitrate control mode (rateControlMode) to "VBR" or "CBR".In VBR mode, you control the audio quality with the setting VBR quality (vbrQuality). In CBR mode, you use the setting Bitrate (bitrate). Defaults and valid values depend on the rate control mode.
 */
@property (nonatomic, strong) AWSmediaconvertAacSettings * _Nullable aacSettings;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value AC3.
 */
@property (nonatomic, strong) AWSmediaconvertAc3Settings * _Nullable ac3Settings;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value AIFF.
 */
@property (nonatomic, strong) AWSmediaconvertAiffSettings * _Nullable aiffSettings;

/**
 Type of Audio codec.
 */
@property (nonatomic, assign) AWSmediaconvertAudioCodec codec;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value EAC3_ATMOS.
 */
@property (nonatomic, strong) AWSmediaconvertEac3AtmosSettings * _Nullable eac3AtmosSettings;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value EAC3.
 */
@property (nonatomic, strong) AWSmediaconvertEac3Settings * _Nullable eac3Settings;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value MP2.
 */
@property (nonatomic, strong) AWSmediaconvertMp2Settings * _Nullable mp2Settings;

/**
 Required when you set Codec, under AudioDescriptions>CodecSettings, to the value MP3.
 */
@property (nonatomic, strong) AWSmediaconvertMp3Settings * _Nullable mp3Settings;

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value WAV.
 */
@property (nonatomic, strong) AWSmediaconvertWavSettings * _Nullable wavSettings;

@end

/**
 Description of audio output
 */
@interface AWSmediaconvertAudioDescription : AWSModel


/**
 Advanced audio normalization settings. Ignore these settings unless you need to comply with a loudness standard.
 */
@property (nonatomic, strong) AWSmediaconvertAudioNormalizationSettings * _Nullable audioNormalizationSettings;

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
@property (nonatomic, assign) AWSmediaconvertAudioTypeControl audioTypeControl;

/**
 Audio codec settings (CodecSettings) under (AudioDescriptions) contains the group of settings related to audio encoding. The settings in this group vary depending on the value that you choose for Audio codec (Codec). For each codec enum that you choose, define the corresponding settings object. The following lists the codec enum, settings object pairs. * AAC, AacSettings * MP2, Mp2Settings * MP3, Mp3Settings * WAV, WavSettings * AIFF, AiffSettings * AC3, Ac3Settings * EAC3, Eac3Settings * EAC3_ATMOS, Eac3AtmosSettings
 */
@property (nonatomic, strong) AWSmediaconvertAudioCodecSettings * _Nullable codecSettings;

/**
 Specify the language for this audio output track. The service puts this language code into your output audio track when you set Language code control (AudioLanguageCodeControl) to Use configured (USE_CONFIGURED). The service also uses your specified custom language code when you set Language code control (AudioLanguageCodeControl) to Follow input (FOLLOW_INPUT), but your input file doesn't specify a language code. For all outputs, you can use an ISO 639-2 or ISO 639-3 code. For streaming outputs, you can also use any other code in the full RFC-5646 specification. Streaming outputs are those that are in one of the following output groups: CMAF, DASH ISO, Apple HLS, or Microsoft Smooth Streaming.
 */
@property (nonatomic, strong) NSString * _Nullable customLanguageCode;

/**
 Indicates the language of the audio output track. The ISO 639 language specified in the 'Language Code' drop down will be used when 'Follow Input Language Code' is not selected or when 'Follow Input Language Code' is selected but there is no ISO 639 language code specified by the input.
 */
@property (nonatomic, assign) AWSmediaconvertLanguageCode languageCode;

/**
 Specify which source for language code takes precedence for this audio track. When you choose Follow input (FOLLOW_INPUT), the service uses the language code from the input track if it's present. If there's no languge code on the input track, the service uses the code that you specify in the setting Language code (languageCode or customLanguageCode). When you choose Use configured (USE_CONFIGURED), the service uses the language code that you specify.
 */
@property (nonatomic, assign) AWSmediaconvertAudioLanguageCodeControl languageCodeControl;

/**
 Advanced audio remixing settings.
 */
@property (nonatomic, strong) AWSmediaconvertRemixSettings * _Nullable remixSettings;

/**
 Specify a label for this output audio stream. For example, "English", "Director commentary", or "track_2". For streaming outputs, MediaConvert passes this information into destination manifests for display on the end-viewer's player device. For outputs in other output groups, the service ignores this setting.
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 Advanced audio normalization settings. Ignore these settings unless you need to comply with a loudness standard.
 */
@interface AWSmediaconvertAudioNormalizationSettings : AWSModel


/**
 Choose one of the following audio normalization algorithms: ITU-R BS.1770-1: Ungated loudness. A measurement of ungated average loudness for an entire piece of content, suitable for measurement of short-form content under ATSC recommendation A/85. Supports up to 5.1 audio channels. ITU-R BS.1770-2: Gated loudness. A measurement of gated average loudness compliant with the requirements of EBU-R128. Supports up to 5.1 audio channels. ITU-R BS.1770-3: Modified peak. The same loudness measurement algorithm as 1770-2, with an updated true peak measurement. ITU-R BS.1770-4: Higher channel count. Allows for more audio channels than the other algorithms, including configurations such as 7.1.
 */
@property (nonatomic, assign) AWSmediaconvertAudioNormalizationAlgorithm algorithm;

/**
 When enabled the output audio is corrected using the chosen algorithm. If disabled, the audio will be measured but not adjusted.
 */
@property (nonatomic, assign) AWSmediaconvertAudioNormalizationAlgorithmControl algorithmControl;

/**
 Content measuring above this level will be corrected to the target level. Content measuring below this level will not be corrected.
 */
@property (nonatomic, strong) NSNumber * _Nullable correctionGateLevel;

/**
 If set to LOG, log each output's audio track loudness to a CSV file.
 */
@property (nonatomic, assign) AWSmediaconvertAudioNormalizationLoudnessLogging loudnessLogging;

/**
 If set to TRUE_PEAK, calculate and log the TruePeak for each output's audio track loudness.
 */
@property (nonatomic, assign) AWSmediaconvertAudioNormalizationPeakCalculation peakCalculation;

/**
 When you use Audio normalization (AudioNormalizationSettings), optionally use this setting to specify a target loudness. If you don't specify a value here, the encoder chooses a value for you, based on the algorithm that you choose for Algorithm (algorithm). If you choose algorithm 1770-1, the encoder will choose -24 LKFS; otherwise, the encoder will choose -23 LKFS.
 */
@property (nonatomic, strong) NSNumber * _Nullable targetLkfs;

@end

/**
 Selector for Audio
 */
@interface AWSmediaconvertAudioSelector : AWSModel


/**
 Selects a specific language code from within an audio source, using the ISO 639-2 or ISO 639-3 three-letter language code
 */
@property (nonatomic, strong) NSString * _Nullable customLanguageCode;

/**
 Enable this setting on one audio selector to set it as the default for the job. The service uses this default for outputs where it can't find the specified input audio. If you don't set a default, those outputs have no audio.
 */
@property (nonatomic, assign) AWSmediaconvertAudioDefaultSelection defaultSelection;

/**
 Specifies audio data from an external file source.
 */
@property (nonatomic, strong) NSString * _Nullable externalAudioFileInput;

/**
 Selects a specific language code from within an audio source.
 */
@property (nonatomic, assign) AWSmediaconvertLanguageCode languageCode;

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
@property (nonatomic, strong) AWSmediaconvertRemixSettings * _Nullable remixSettings;

/**
 Specifies the type of the audio selector.
 */
@property (nonatomic, assign) AWSmediaconvertAudioSelectorType selectorType;

/**
 Identify a track from the input audio to include in this selector by entering the track index number. To include several tracks in a single audio selector, specify multiple tracks as follows. Using the console, enter a comma-separated list. For examle, type "1,2,3" to include tracks 1 through 3. Specifying directly in your JSON job file, provide the track numbers in an array. For example, "tracks": [1,2,3].
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable tracks;

@end

/**
 Group of Audio Selectors
 */
@interface AWSmediaconvertAudioSelectorGroup : AWSModel


/**
 Name of an Audio Selector within the same input to include in the group.Audio selector names are standardized, based on their order within the input (e.g., "Audio Selector 1"). The audio selector name parameter can be repeated to add any number of audio selectors to the group.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable audioSelectorNames;

@end

/**
 Settings for quality-defined variable bitrate encoding with the AV1 codec. Required when you set Rate control mode to QVBR. Not valid when you set Rate control mode to a value other than QVBR, or when you don't define Rate control mode.
 */
@interface AWSmediaconvertAv1QvbrSettings : AWSModel


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
@interface AWSmediaconvertAv1Settings : AWSModel


/**
 Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.
 */
@property (nonatomic, assign) AWSmediaconvertAv1AdaptiveQuantization adaptiveQuantization;

/**
 If you are using the console, use the Framerate setting to specify the frame rate for this output. If you want to keep the same frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction. If you are creating your transcoding job specification as a JSON file without the console, use FramerateControl to specify which value the service uses for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the settings FramerateNumerator and FramerateDenominator.
 */
@property (nonatomic, assign) AWSmediaconvertAv1FramerateControl framerateControl;

/**
 When set to INTERPOLATE, produces smoother motion during frame rate conversion.
 */
@property (nonatomic, assign) AWSmediaconvertAv1FramerateConversionAlgorithm framerateConversionAlgorithm;

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
@property (nonatomic, strong) AWSmediaconvertAv1QvbrSettings * _Nullable qvbrSettings;

/**
 'With AV1 outputs, for rate control mode, MediaConvert supports only quality-defined variable bitrate (QVBR). You can''t use CBR or VBR.'
 */
@property (nonatomic, assign) AWSmediaconvertAv1RateControlMode rateControlMode;

/**
 Specify the number of slices per picture. This value must be 1, 2, 4, 8, 16, or 32. For progressive pictures, this value must be less than or equal to the number of macroblock rows. For interlaced pictures, this value must be less than or equal to half the number of macroblock rows.
 */
@property (nonatomic, strong) NSNumber * _Nullable slices;

/**
 Adjust quantization within each frame based on spatial variation of content complexity.
 */
@property (nonatomic, assign) AWSmediaconvertAv1SpatialAdaptiveQuantization spatialAdaptiveQuantization;

@end

/**
 Settings for Avail Blanking
 */
@interface AWSmediaconvertAvailBlanking : AWSModel


/**
 Blanking image to be used. Leave empty for solid black. Only bmp and png images are supported.
 */
@property (nonatomic, strong) NSString * _Nullable availBlankingImage;

@end

/**
 Burn-In Destination Settings.
 */
@interface AWSmediaconvertBurninDestinationSettings : AWSModel


/**
 If no explicit x_position or y_position is provided, setting alignment to centered will place the captions at the bottom center of the output. Similarly, setting a left alignment will align captions to the bottom left of the output. If x and y positions are given in conjunction with the alignment parameter, the font will be justified (either left or centered) relative to those coordinates. This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmediaconvertBurninSubtitleAlignment alignment;

/**
 Specifies the color of the rectangle behind the captions. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmediaconvertBurninSubtitleBackgroundColor backgroundColor;

/**
 Specifies the opacity of the background rectangle. 255 is opaque; 0 is transparent. Leaving this parameter blank is equivalent to setting it to 0 (transparent). All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable backgroundOpacity;

/**
 Specifies the color of the burned-in captions. This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmediaconvertBurninSubtitleFontColor fontColor;

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
@property (nonatomic, assign) AWSmediaconvertFontScript fontScript;

/**
 A positive integer indicates the exact font size in points. Set to 0 for automatic font size selection. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontSize;

/**
 Specifies font outline color. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmediaconvertBurninSubtitleOutlineColor outlineColor;

/**
 Specifies font outline size in pixels. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable outlineSize;

/**
 Specifies the color of the shadow cast by the captions. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmediaconvertBurninSubtitleShadowColor shadowColor;

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
@property (nonatomic, assign) AWSmediaconvertBurninSubtitleTeletextSpacing teletextSpacing;

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
@interface AWSmediaconvertCancelJobRequest : AWSRequest


/**
 The Job ID of the job to be cancelled.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSmediaconvertCancelJobResponse : AWSModel


@end

/**
 Description of Caption output
 */
@interface AWSmediaconvertCaptionDescription : AWSModel


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
@property (nonatomic, strong) AWSmediaconvertCaptionDestinationSettings * _Nullable destinationSettings;

/**
 Specify the language of this captions output track. For most captions output formats, the encoder puts this language information in the output captions metadata. If your output captions format is DVB-Sub or Burn in, the encoder uses this language information to choose the font language for rendering the captions text.
 */
@property (nonatomic, assign) AWSmediaconvertLanguageCode languageCode;

/**
 Specify a label for this set of output captions. For example, "English", "Director commentary", or "track_2". For streaming outputs, MediaConvert passes this information into destination manifests for display on the end-viewer's player device. For outputs in other output groups, the service ignores this setting.
 */
@property (nonatomic, strong) NSString * _Nullable languageDescription;

@end

/**
 Caption Description for preset
 */
@interface AWSmediaconvertCaptionDescriptionPreset : AWSModel


/**
 Specify the language for this captions output track. For most captions output formats, the encoder puts this language information in the output captions metadata. If your output captions format is DVB-Sub or Burn in, the encoder uses this language information when automatically selecting the font script for rendering the captions text. For all outputs, you can use an ISO 639-2 or ISO 639-3 code. For streaming outputs, you can also use any other code in the full RFC-5646 specification. Streaming outputs are those that are in one of the following output groups: CMAF, DASH ISO, Apple HLS, or Microsoft Smooth Streaming.
 */
@property (nonatomic, strong) NSString * _Nullable customLanguageCode;

/**
 Specific settings required by destination type. Note that burnin_destination_settings are not available if the source of the caption data is Embedded or Teletext.
 */
@property (nonatomic, strong) AWSmediaconvertCaptionDestinationSettings * _Nullable destinationSettings;

/**
 Specify the language of this captions output track. For most captions output formats, the encoder puts this language information in the output captions metadata. If your output captions format is DVB-Sub or Burn in, the encoder uses this language information to choose the font language for rendering the captions text.
 */
@property (nonatomic, assign) AWSmediaconvertLanguageCode languageCode;

/**
 Specify a label for this set of output captions. For example, "English", "Director commentary", or "track_2". For streaming outputs, MediaConvert passes this information into destination manifests for display on the end-viewer's player device. For outputs in other output groups, the service ignores this setting.
 */
@property (nonatomic, strong) NSString * _Nullable languageDescription;

@end

/**
 Specific settings required by destination type. Note that burnin_destination_settings are not available if the source of the caption data is Embedded or Teletext.
 */
@interface AWSmediaconvertCaptionDestinationSettings : AWSModel


/**
 Burn-In Destination Settings.
 */
@property (nonatomic, strong) AWSmediaconvertBurninDestinationSettings * _Nullable burninDestinationSettings;

/**
 Specify the format for this set of captions on this output. The default format is embedded without SCTE-20. Other options are embedded with SCTE-20, burn-in, DVB-sub, IMSC, SCC, SRT, teletext, TTML, and web-VTT. If you are using SCTE-20, choose SCTE-20 plus embedded (SCTE20_PLUS_EMBEDDED) to create an output that complies with the SCTE-43 spec. To create a non-compliant output where the embedded captions come first, choose Embedded plus SCTE-20 (EMBEDDED_PLUS_SCTE20).
 */
@property (nonatomic, assign) AWSmediaconvertCaptionDestinationType destinationType;

/**
 DVB-Sub Destination Settings
 */
@property (nonatomic, strong) AWSmediaconvertDvbSubDestinationSettings * _Nullable dvbSubDestinationSettings;

/**
 Settings specific to embedded/ancillary caption outputs, including 608/708 Channel destination number.
 */
@property (nonatomic, strong) AWSmediaconvertEmbeddedDestinationSettings * _Nullable embeddedDestinationSettings;

/**
 Settings specific to IMSC caption outputs.
 */
@property (nonatomic, strong) AWSmediaconvertImscDestinationSettings * _Nullable imscDestinationSettings;

/**
 Settings for SCC caption output.
 */
@property (nonatomic, strong) AWSmediaconvertSccDestinationSettings * _Nullable sccDestinationSettings;

/**
 Settings for Teletext caption output
 */
@property (nonatomic, strong) AWSmediaconvertTeletextDestinationSettings * _Nullable teletextDestinationSettings;

/**
 Settings specific to TTML caption outputs, including Pass style information (TtmlStylePassthrough).
 */
@property (nonatomic, strong) AWSmediaconvertTtmlDestinationSettings * _Nullable ttmlDestinationSettings;

@end

/**
 Set up captions in your outputs by first selecting them from your input here.
 */
@interface AWSmediaconvertCaptionSelector : AWSModel


/**
 The specific language to extract from source, using the ISO 639-2 or ISO 639-3 three-letter language code. If input is SCTE-27, complete this field and/or PID to select the caption language to extract. If input is DVB-Sub and output is Burn-in or SMPTE-TT, complete this field and/or PID to select the caption language to extract. If input is DVB-Sub that is being passed through, omit this field (and PID field); there is no way to extract a specific language with pass-through captions.
 */
@property (nonatomic, strong) NSString * _Nullable customLanguageCode;

/**
 The specific language to extract from source. If input is SCTE-27, complete this field and/or PID to select the caption language to extract. If input is DVB-Sub and output is Burn-in or SMPTE-TT, complete this field and/or PID to select the caption language to extract. If input is DVB-Sub that is being passed through, omit this field (and PID field); there is no way to extract a specific language with pass-through captions.
 */
@property (nonatomic, assign) AWSmediaconvertLanguageCode languageCode;

/**
 If your input captions are SCC, TTML, STL, SMI, SRT, or IMSC in an xml file, specify the URI of the input captions source file. If your input captions are IMSC in an IMF package, use TrackSourceSettings instead of FileSoureSettings.
 */
@property (nonatomic, strong) AWSmediaconvertCaptionSourceSettings * _Nullable sourceSettings;

@end

/**
 Ignore this setting unless your input captions format is SCC. To have the service compensate for differing framerates between your input captions and input video, specify the framerate of the captions file. Specify this value as a fraction, using the settings Framerate numerator (framerateNumerator) and Framerate denominator (framerateDenominator). For example, you might specify 24 / 1 for 24 fps, 25 / 1 for 25 fps, 24000 / 1001 for 23.976 fps, or 30000 / 1001 for 29.97 fps.
 */
@interface AWSmediaconvertCaptionSourceFramerate : AWSModel


/**
 Specify the denominator of the fraction that represents the framerate for the setting Caption source framerate (CaptionSourceFramerate). Use this setting along with the setting Framerate numerator (framerateNumerator).
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateDenominator;

/**
 Specify the numerator of the fraction that represents the framerate for the setting Caption source framerate (CaptionSourceFramerate). Use this setting along with the setting Framerate denominator (framerateDenominator).
 */
@property (nonatomic, strong) NSNumber * _Nullable framerateNumerator;

@end

/**
 If your input captions are SCC, TTML, STL, SMI, SRT, or IMSC in an xml file, specify the URI of the input captions source file. If your input captions are IMSC in an IMF package, use TrackSourceSettings instead of FileSoureSettings.
 */
@interface AWSmediaconvertCaptionSourceSettings : AWSModel


/**
 Settings for ancillary captions source.
 */
@property (nonatomic, strong) AWSmediaconvertAncillarySourceSettings * _Nullable ancillarySourceSettings;

/**
 DVB Sub Source Settings
 */
@property (nonatomic, strong) AWSmediaconvertDvbSubSourceSettings * _Nullable dvbSubSourceSettings;

/**
 Settings for embedded captions Source
 */
@property (nonatomic, strong) AWSmediaconvertEmbeddedSourceSettings * _Nullable embeddedSourceSettings;

/**
 If your input captions are SCC, SMI, SRT, STL, TTML, or IMSC 1.1 in an xml file, specify the URI of the input caption source file. If your caption source is IMSC in an IMF package, use TrackSourceSettings instead of FileSoureSettings.
 */
@property (nonatomic, strong) AWSmediaconvertFileSourceSettings * _Nullable fileSourceSettings;

/**
 Use Source (SourceType) to identify the format of your input captions.The service cannot auto-detect caption format.
 */
@property (nonatomic, assign) AWSmediaconvertCaptionSourceType sourceType;

/**
 Settings specific to Teletext caption sources, including Page number.
 */
@property (nonatomic, strong) AWSmediaconvertTeletextSourceSettings * _Nullable teletextSourceSettings;

/**
 Settings specific to caption sources that are specified by track number. Currently, this is only IMSC captions in an IMF package. If your caption source is IMSC 1.1 in a separate xml file, use FileSourceSettings instead of TrackSourceSettings.
 */
@property (nonatomic, strong) AWSmediaconvertTrackSourceSettings * _Nullable trackSourceSettings;

@end

/**
 Channel mapping (ChannelMapping) contains the group of fields that hold the remixing value for each channel. Units are in dB. Acceptable values are within the range from -60 (mute) through 6. A setting of 0 passes the input channel unchanged to the output channel (no attenuation or amplification).
 */
@interface AWSmediaconvertChannelMapping : AWSModel


/**
 List of output channels
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertOutputChannelMapping *> * _Nullable outputChannels;

@end

/**
 Specify the details for each pair of HLS and DASH additional manifests that you want the service to generate for this CMAF output group. Each pair of manifests can reference a different subset of outputs in the group.
 */
@interface AWSmediaconvertCmafAdditionalManifest : AWSModel


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
@interface AWSmediaconvertCmafEncryptionSettings : AWSModel


/**
 This is a 128-bit, 16-byte hex value represented by a 32-character text string. If this parameter is not set then the Initialization Vector will follow the segment number by default.
 */
@property (nonatomic, strong) NSString * _Nullable constantInitializationVector;

/**
 Specify the encryption scheme that you want the service to use when encrypting your CMAF segments. Choose AES-CBC subsample (SAMPLE-AES) or AES_CTR (AES-CTR).
 */
@property (nonatomic, assign) AWSmediaconvertCmafEncryptionType encryptionMethod;

/**
 When you use DRM with CMAF outputs, choose whether the service writes the 128-bit encryption initialization vector in the HLS and DASH manifests.
 */
@property (nonatomic, assign) AWSmediaconvertCmafInitializationVectorInManifest initializationVectorInManifest;

/**
 If your output group type is CMAF, use these settings when doing DRM encryption with a SPEKE-compliant key provider. If your output group type is HLS, DASH, or Microsoft Smooth, use the SpekeKeyProvider settings instead.
 */
@property (nonatomic, strong) AWSmediaconvertSpekeKeyProviderCmaf * _Nullable spekeKeyProvider;

/**
 Use these settings to set up encryption with a static key provider.
 */
@property (nonatomic, strong) AWSmediaconvertStaticKeyProvider * _Nullable staticKeyProvider;

/**
 Specify whether your DRM encryption key is static or from a key provider that follows the SPEKE standard. For more information about SPEKE, see https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
 */
@property (nonatomic, assign) AWSmediaconvertCmafKeyProviderType types;

@end

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to CMAF_GROUP_SETTINGS. Each output in a CMAF Output Group may only contain a single video, audio, or caption output.
 */
@interface AWSmediaconvertCmafGroupSettings : AWSModel


/**
 By default, the service creates one top-level .m3u8 HLS manifest and one top -level .mpd DASH manifest for each CMAF output group in your job. These default manifests reference every output in the output group. To create additional top-level manifests that reference a subset of the outputs in the output group, specify a list of them here. For each additional manifest that you specify, the service creates one HLS manifest and one DASH manifest.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertCmafAdditionalManifest *> * _Nullable additionalManifests;

/**
 A partial URI prefix that will be put in the manifest file at the top level BaseURL element. Can be used if streams are delivered from a different URL than the manifest file.
 */
@property (nonatomic, strong) NSString * _Nullable baseUrl;

/**
 When set to ENABLED, sets #EXT-X-ALLOW-CACHE:no tag, which prevents client from saving media segments for later replay.
 */
@property (nonatomic, assign) AWSmediaconvertCmafClientCache clientCache;

/**
 Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist generation.
 */
@property (nonatomic, assign) AWSmediaconvertCmafCodecSpecification codecSpecification;

/**
 Use Destination (Destination) to specify the S3 output location and the output filename base. Destination accepts format identifiers. If you do not specify the base filename in the URI, the service will use the filename of the input file. If your job has multiple inputs, the service uses the filename of the first input file.
 */
@property (nonatomic, strong) NSString * _Nullable destination;

/**
 Settings associated with the destination. Will vary based on the type of destination
 */
@property (nonatomic, strong) AWSmediaconvertDestinationSettings * _Nullable destinationSettings;

/**
 DRM settings.
 */
@property (nonatomic, strong) AWSmediaconvertCmafEncryptionSettings * _Nullable encryption;

/**
 Length of fragments to generate (in seconds). Fragment length must be compatible with GOP size and Framerate. Note that fragments will end on the next keyframe after this number of seconds, so actual fragment length may be longer. When Emit Single File is checked, the fragmentation is internal to a single output file and it does not cause the creation of many output files as in other output types.
 */
@property (nonatomic, strong) NSNumber * _Nullable fragmentLength;

/**
 When set to GZIP, compresses HLS playlist.
 */
@property (nonatomic, assign) AWSmediaconvertCmafManifestCompression manifestCompression;

/**
 Indicates whether the output manifest should use floating point values for segment duration.
 */
@property (nonatomic, assign) AWSmediaconvertCmafManifestDurationFormat manifestDurationFormat;

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
@property (nonatomic, assign) AWSmediaconvertCmafMpdProfile mpdProfile;

/**
 When set to SINGLE_FILE, a single output file is generated, which is internally segmented using the Fragment Length and Segment Length. When set to SEGMENTED_FILES, separate segment files will be created.
 */
@property (nonatomic, assign) AWSmediaconvertCmafSegmentControl segmentControl;

/**
 Use this setting to specify the length, in seconds, of each individual CMAF segment. This value applies to the whole package; that is, to every output in the output group. Note that segments end on the first keyframe after this number of seconds, so the actual segment length might be slightly longer. If you set Segment control (CmafSegmentControl) to single file, the service puts the content of each output in a single file that has metadata that marks these segments. If you set it to segmented files, the service creates multiple files for each output, each with the content of one segment.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentLength;

/**
 Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of variant manifest.
 */
@property (nonatomic, assign) AWSmediaconvertCmafStreamInfResolution streamInfResolution;

/**
 When set to ENABLED, a DASH MPD manifest will be generated for this output.
 */
@property (nonatomic, assign) AWSmediaconvertCmafWriteDASHManifest writeDashManifest;

/**
 When set to ENABLED, an Apple HLS manifest will be generated for this output.
 */
@property (nonatomic, assign) AWSmediaconvertCmafWriteHLSManifest writeHlsManifest;

/**
 When you enable Precise segment duration in DASH manifests (writeSegmentTimelineInRepresentation), your DASH manifest shows precise segment durations. The segment duration information appears inside the SegmentTimeline element, inside SegmentTemplate at the Representation level. When this feature isn't enabled, the segment durations in your DASH manifest are approximate. The segment duration information appears in the duration attribute of the SegmentTemplate element.
 */
@property (nonatomic, assign) AWSmediaconvertCmafWriteSegmentTimelineInRepresentation writeSegmentTimelineInRepresentation;

@end

/**
 Settings for MP4 segments in CMAF
 */
@interface AWSmediaconvertCmfcSettings : AWSModel


/**
 Use this setting only when you specify SCTE-35 markers from ESAM. Choose INSERT to put SCTE-35 markers in this output at the insertion points that you specify in an ESAM XML document. Provide the document in the setting SCC XML (sccXml).
 */
@property (nonatomic, assign) AWSmediaconvertCmfcScte35Esam scte35Esam;

/**
 Ignore this setting unless you have SCTE-35 markers in your input video file. Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that appear in your input to also appear in this output. Choose None (NONE) if you don't want those SCTE-35 markers in this output.
 */
@property (nonatomic, assign) AWSmediaconvertCmfcScte35Source scte35Source;

@end

/**
 Settings for color correction.
 */
@interface AWSmediaconvertColorCorrector : AWSModel


/**
 Brightness level.
 */
@property (nonatomic, strong) NSNumber * _Nullable brightness;

/**
 Specify the color space you want for this output. The service supports conversion between HDR formats, between SDR formats, from SDR to HDR, and from HDR to SDR. SDR to HDR conversion doesn't upgrade the dynamic range. The converted video has an HDR format, but visually appears the same as an unconverted output. HDR to SDR conversion uses Elemental tone mapping technology to approximate the outcome of manually regrading from HDR to SDR.
 */
@property (nonatomic, assign) AWSmediaconvertColorSpaceConversion colorSpaceConversion;

/**
 Contrast level.
 */
@property (nonatomic, strong) NSNumber * _Nullable contrast;

/**
 Use these settings when you convert to the HDR 10 color space. Specify the SMPTE ST 2086 Mastering Display Color Volume static metadata that you want signaled in the output. These values don't affect the pixel values that are encoded in the video stream. They are intended to help the downstream video player display content in a way that reflects the intentions of the the content creator. When you set Color space conversion (ColorSpaceConversion) to HDR 10 (FORCE_HDR10), these settings are required. You must set values for Max frame average light level (maxFrameAverageLightLevel) and Max content light level (maxContentLightLevel); these settings don't have a default value. The default values for the other HDR 10 metadata settings are defined by the P3D65 color space. For more information about MediaConvert HDR jobs, see https://docs.aws.amazon.com/console/mediaconvert/hdr.
 */
@property (nonatomic, strong) AWSmediaconvertHdr10Metadata * _Nullable hdr10Metadata;

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
@interface AWSmediaconvertContainerSettings : AWSModel


/**
 Settings for MP4 segments in CMAF
 */
@property (nonatomic, strong) AWSmediaconvertCmfcSettings * _Nullable cmfcSettings;

/**
 Container for this output. Some containers require a container settings object. If not specified, the default object will be created.
 */
@property (nonatomic, assign) AWSmediaconvertContainerType container;

/**
 Settings for F4v container
 */
@property (nonatomic, strong) AWSmediaconvertF4vSettings * _Nullable f4vSettings;

/**
 MPEG-2 TS container settings. These apply to outputs in a File output group when the output's container (ContainerType) is MPEG-2 Transport Stream (M2TS). In these assets, data is organized by the program map table (PMT). Each transport stream program contains subsets of data, including audio, video, and metadata. Each of these subsets of data has a numerical label called a packet identifier (PID). Each transport stream program corresponds to one MediaConvert output. The PMT lists the types of data in a program along with their PID. Downstream systems and players use the program map table to look up the PID for each type of data it accesses and then uses the PIDs to locate specific data within the asset.
 */
@property (nonatomic, strong) AWSmediaconvertM2tsSettings * _Nullable m2tsSettings;

/**
 Settings for TS segments in HLS
 */
@property (nonatomic, strong) AWSmediaconvertM3u8Settings * _Nullable m3u8Settings;

/**
 Settings for MOV Container.
 */
@property (nonatomic, strong) AWSmediaconvertMovSettings * _Nullable movSettings;

/**
 Settings for MP4 container. You can create audio-only AAC outputs with this container.
 */
@property (nonatomic, strong) AWSmediaconvertMp4Settings * _Nullable mp4Settings;

/**
 Settings for MP4 segments in DASH
 */
@property (nonatomic, strong) AWSmediaconvertMpdSettings * _Nullable mpdSettings;

@end

/**
 
 */
@interface AWSmediaconvertCreateJobRequest : AWSRequest


/**
 Optional. Accelerated transcoding can significantly speed up jobs with long, visually complex content. Outputs that use this feature incur pro-tier pricing. For information about feature limitations, see the AWS Elemental MediaConvert User Guide.
 */
@property (nonatomic, strong) AWSmediaconvertAccelerationSettings * _Nullable accelerationSettings;

/**
 Optional. Choose a tag type that AWS Billing and Cost Management will use to sort your AWS Elemental MediaConvert costs on any billing report that you set up. Any transcoding outputs that don't have an associated tag will appear in your billing report unsorted. If you don't choose a valid value for this field, your job outputs will appear on the billing report unsorted.
 */
@property (nonatomic, assign) AWSmediaconvertBillingTagsSource billingTagsSource;

/**
 Optional. Idempotency token for CreateJob operation.
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 Optional. Use queue hopping to avoid overly long waits in the backlog of the queue that you submit your job to. Specify an alternate queue and the maximum time that your job will wait in the initial queue before hopping. For more information about this feature, see the AWS Elemental MediaConvert User Guide.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertHopDestination *> * _Nullable hopDestinations;

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
@property (nonatomic, strong) AWSmediaconvertJobSettings * _Nullable settings;

/**
 Optional. Enable this setting when you run a test job to estimate how many reserved transcoding slots (RTS) you need. When this is enabled, MediaConvert runs your job from an on-demand queue with similar performance to what you will see with one RTS in a reserved queue. This setting is disabled by default.
 */
@property (nonatomic, assign) AWSmediaconvertSimulateReservedQueue simulateReservedQueue;

/**
 Optional. Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the interval, in seconds, between status updates. MediaConvert sends an update at this interval from the time the service begins processing your job to the time it completes the transcode or encounters an error.
 */
@property (nonatomic, assign) AWSmediaconvertStatusUpdateInterval statusUpdateInterval;

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
@interface AWSmediaconvertCreateJobResponse : AWSModel


/**
 Each job converts an input file into an output file or files. For more information, see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 */
@property (nonatomic, strong) AWSmediaconvertJob * _Nullable job;

@end

/**
 
 */
@interface AWSmediaconvertCreateJobTemplateRequest : AWSRequest


/**
 Accelerated transcoding can significantly speed up jobs with long, visually complex content. Outputs that use this feature incur pro-tier pricing. For information about feature limitations, see the AWS Elemental MediaConvert User Guide.
 */
@property (nonatomic, strong) AWSmediaconvertAccelerationSettings * _Nullable accelerationSettings;

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
@property (nonatomic, strong) NSArray<AWSmediaconvertHopDestination *> * _Nullable hopDestinations;

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
@property (nonatomic, strong) AWSmediaconvertJobTemplateSettings * _Nullable settings;

/**
 Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the interval, in seconds, between status updates. MediaConvert sends an update at this interval from the time the service begins processing your job to the time it completes the transcode or encounters an error.
 */
@property (nonatomic, assign) AWSmediaconvertStatusUpdateInterval statusUpdateInterval;

/**
 The tags that you want to add to the resource. You can tag resources with a key-value pair or with only a key.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSmediaconvertCreateJobTemplateResponse : AWSModel


/**
 A job template is a pre-made set of encoding instructions that you can use to quickly create a job.
 */
@property (nonatomic, strong) AWSmediaconvertJobTemplate * _Nullable jobTemplate;

@end

/**
 
 */
@interface AWSmediaconvertCreatePresetRequest : AWSRequest


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
@property (nonatomic, strong) AWSmediaconvertPresetSettings * _Nullable settings;

/**
 The tags that you want to add to the resource. You can tag resources with a key-value pair or with only a key.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSmediaconvertCreatePresetResponse : AWSModel


/**
 A preset is a collection of preconfigured media conversion settings that you want MediaConvert to apply to the output during the conversion process.
 */
@property (nonatomic, strong) AWSmediaconvertPreset * _Nullable preset;

@end

/**
 
 */
@interface AWSmediaconvertCreateQueueRequest : AWSRequest


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
@property (nonatomic, assign) AWSmediaconvertPricingPlan pricingPlan;

/**
 Details about the pricing plan for your reserved queue. Required for reserved queues and not applicable to on-demand queues.
 */
@property (nonatomic, strong) AWSmediaconvertReservationPlanSettings * _Nullable reservationPlanSettings;

/**
 Initial state of the queue. If you create a paused queue, then jobs in that queue won't begin.
 */
@property (nonatomic, assign) AWSmediaconvertQueueStatus status;

/**
 The tags that you want to add to the resource. You can tag resources with a key-value pair or with only a key.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSmediaconvertCreateQueueResponse : AWSModel


/**
 You can use queues to manage the resources that are available to your AWS account for running multiple transcoding jobs at the same time. If you don't specify a queue, the service sends all jobs through the default queue. For more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
 */
@property (nonatomic, strong) AWSmediaconvertQueue * _Nullable queue;

@end

/**
 Specify the details for each additional DASH manifest that you want the service to generate for this output group. Each manifest can reference a different subset of outputs in the group.
 */
@interface AWSmediaconvertDashAdditionalManifest : AWSModel


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
@interface AWSmediaconvertDashIsoEncryptionSettings : AWSModel


/**
 This setting can improve the compatibility of your output with video players on obsolete devices. It applies only to DASH H.264 outputs with DRM encryption. Choose Unencrypted SEI (UNENCRYPTED_SEI) only to correct problems with playback on older devices. Otherwise, keep the default setting CENC v1 (CENC_V1). If you choose Unencrypted SEI, for that output, the service will exclude the access unit delimiter and will leave the SEI NAL units unencrypted.
 */
@property (nonatomic, assign) AWSmediaconvertDashIsoPlaybackDeviceCompatibility playbackDeviceCompatibility;

/**
 If your output group type is HLS, DASH, or Microsoft Smooth, use these settings when doing DRM encryption with a SPEKE-compliant key provider.If your output group type is CMAF, use the SpekeKeyProviderCmaf settings instead.
 */
@property (nonatomic, strong) AWSmediaconvertSpekeKeyProvider * _Nullable spekeKeyProvider;

@end

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to DASH_ISO_GROUP_SETTINGS.
 */
@interface AWSmediaconvertDashIsoGroupSettings : AWSModel


/**
 By default, the service creates one .mpd DASH manifest for each DASH ISO output group in your job. This default manifest references every output in the output group. To create additional DASH manifests that reference a subset of the outputs in the output group, specify a list of them here.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertDashAdditionalManifest *> * _Nullable additionalManifests;

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
@property (nonatomic, strong) AWSmediaconvertDestinationSettings * _Nullable destinationSettings;

/**
 DRM settings.
 */
@property (nonatomic, strong) AWSmediaconvertDashIsoEncryptionSettings * _Nullable encryption;

/**
 Length of fragments to generate (in seconds). Fragment length must be compatible with GOP size and Framerate. Note that fragments will end on the next keyframe after this number of seconds, so actual fragment length may be longer. When Emit Single File is checked, the fragmentation is internal to a single output file and it does not cause the creation of many output files as in other output types.
 */
@property (nonatomic, strong) NSNumber * _Nullable fragmentLength;

/**
 Supports HbbTV specification as indicated
 */
@property (nonatomic, assign) AWSmediaconvertDashIsoHbbtvCompliance hbbtvCompliance;

/**
 Minimum time of initially buffered media that is needed to ensure smooth playout.
 */
@property (nonatomic, strong) NSNumber * _Nullable minBufferTime;

/**
 Specify whether your DASH profile is on-demand or main. When you choose Main profile (MAIN_PROFILE), the service signalsurn:mpeg:dash:profile:isoff-main:2011 in your .mpd DASH manifest. When you choose On-demand (ON_DEMAND_PROFILE), the service signals urn:mpeg:dash:profile:isoff-on-demand:2011 in your .mpd. When you choose On-demand, you must also set the output group setting Segment control (SegmentControl) to Single file (SINGLE_FILE).
 */
@property (nonatomic, assign) AWSmediaconvertDashIsoMpdProfile mpdProfile;

/**
 When set to SINGLE_FILE, a single output file is generated, which is internally segmented using the Fragment Length and Segment Length. When set to SEGMENTED_FILES, separate segment files will be created.
 */
@property (nonatomic, assign) AWSmediaconvertDashIsoSegmentControl segmentControl;

/**
 Length of mpd segments to create (in seconds). Note that segments will end on the next keyframe after this number of seconds, so actual segment length may be longer. When Emit Single File is checked, the segmentation is internal to a single output file and it does not cause the creation of many output files as in other output types.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentLength;

/**
 If you get an HTTP error in the 400 range when you play back your DASH output, enable this setting and run your transcoding job again. When you enable this setting, the service writes precise segment durations in the DASH manifest. The segment duration information appears inside the SegmentTimeline element, inside SegmentTemplate at the Representation level. When you don't enable this setting, the service writes approximate segment durations in your DASH manifest.
 */
@property (nonatomic, assign) AWSmediaconvertDashIsoWriteSegmentTimelineInRepresentation writeSegmentTimelineInRepresentation;

@end

/**
 Settings for deinterlacer
 */
@interface AWSmediaconvertDeinterlacer : AWSModel


/**
 Only applies when you set Deinterlacer (DeinterlaceMode) to Deinterlace (DEINTERLACE) or Adaptive (ADAPTIVE). Motion adaptive interpolate (INTERPOLATE) produces sharper pictures, while blend (BLEND) produces smoother motion. Use (INTERPOLATE_TICKER) OR (BLEND_TICKER) if your source file includes a ticker, such as a scrolling headline at the bottom of the frame.
 */
@property (nonatomic, assign) AWSmediaconvertDeinterlaceAlgorithm algorithm;

/**
 - When set to NORMAL (default), the deinterlacer does not convert frames that are taggedin metadata as progressive. It will only convert those that are tagged as some other type. - When set to FORCE_ALL_FRAMES, the deinterlacer converts every frame to progressive - even those that are already tagged as progressive. Turn Force mode on only if there isa good chance that the metadata has tagged frames as progressive when they are notprogressive. Do not turn on otherwise; processing frames that are already progressiveinto progressive will probably result in lower quality video.
 */
@property (nonatomic, assign) AWSmediaconvertDeinterlacerControl control;

/**
 Use Deinterlacer (DeinterlaceMode) to choose how the service will do deinterlacing. Default is Deinterlace. - Deinterlace converts interlaced to progressive. - Inverse telecine converts Hard Telecine 29.97i to progressive 23.976p. - Adaptive auto-detects and converts to progressive.
 */
@property (nonatomic, assign) AWSmediaconvertDeinterlacerMode mode;

@end

/**
 
 */
@interface AWSmediaconvertDeleteJobTemplateRequest : AWSRequest


/**
 The name of the job template to be deleted.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSmediaconvertDeleteJobTemplateResponse : AWSModel


@end

/**
 
 */
@interface AWSmediaconvertDeletePresetRequest : AWSRequest


/**
 The name of the preset to be deleted.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSmediaconvertDeletePresetResponse : AWSModel


@end

/**
 
 */
@interface AWSmediaconvertDeleteQueueRequest : AWSRequest


/**
 The name of the queue that you want to delete.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSmediaconvertDeleteQueueResponse : AWSModel


@end

/**
 DescribeEndpointsRequest
 */
@interface AWSmediaconvertDescribeEndpointsRequest : AWSRequest


/**
 Optional. Max number of endpoints, up to twenty, that will be returned at one time.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 Optional field, defaults to DEFAULT. Specify DEFAULT for this operation to return your endpoints if any exist, or to create an endpoint for you and return it if one doesn't already exist. Specify GET_ONLY to return your endpoints if any exist, or an empty list if none exist.
 */
@property (nonatomic, assign) AWSmediaconvertDescribeEndpointsMode mode;

/**
 Use this string, provided with the response to a previous request, to request the next batch of endpoints.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSmediaconvertDescribeEndpointsResponse : AWSModel


/**
 List of endpoints
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertEndpoint *> * _Nullable endpoints;

/**
 Use this string to request the next batch of endpoints.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Settings associated with the destination. Will vary based on the type of destination
 */
@interface AWSmediaconvertDestinationSettings : AWSModel


/**
 Settings associated with S3 destination
 */
@property (nonatomic, strong) AWSmediaconvertS3DestinationSettings * _Nullable s3Settings;

@end

/**
 
 */
@interface AWSmediaconvertDisassociateCertificateRequest : AWSRequest


/**
 The ARN of the ACM certificate that you want to disassociate from your MediaConvert resource.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSmediaconvertDisassociateCertificateResponse : AWSModel


@end

/**
 Settings for Dolby Vision
 */
@interface AWSmediaconvertDolbyVision : AWSModel


/**
 Use these settings when you set DolbyVisionLevel6Mode to SPECIFY to override the MaxCLL and MaxFALL values in your input with new values.
 */
@property (nonatomic, strong) AWSmediaconvertDolbyVisionLevel6Metadata * _Nullable l6Metadata;

/**
 Use Dolby Vision Mode to choose how the service will handle Dolby Vision MaxCLL and MaxFALL properies.
 */
@property (nonatomic, assign) AWSmediaconvertDolbyVisionLevel6Mode l6Mode;

/**
 In the current MediaConvert implementation, the Dolby Vision profile is always 5 (PROFILE_5). Therefore, all of your inputs must contain Dolby Vision frame interleaved data.
 */
@property (nonatomic, assign) AWSmediaconvertDolbyVisionProfile profile;

@end

/**
 Use these settings when you set DolbyVisionLevel6Mode to SPECIFY to override the MaxCLL and MaxFALL values in your input with new values.
 */
@interface AWSmediaconvertDolbyVisionLevel6Metadata : AWSModel


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
@interface AWSmediaconvertDvbNitSettings : AWSModel


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
@interface AWSmediaconvertDvbSdtSettings : AWSModel


/**
 Selects method of inserting SDT information into output stream."Follow input SDT" copies SDT information from input stream tooutput stream. "Follow input SDT if present" copies SDT information frominput stream to output stream if SDT information is present in the input, otherwise it will fall back on the user-defined values. Enter "SDTManually" means user will enter the SDT information. "No SDT" means outputstream will not contain SDT information.
 */
@property (nonatomic, assign) AWSmediaconvertOutputSdt outputSdt;

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
@interface AWSmediaconvertDvbSubDestinationSettings : AWSModel


/**
 If no explicit x_position or y_position is provided, setting alignment to centered will place the captions at the bottom center of the output. Similarly, setting a left alignment will align captions to the bottom left of the output. If x and y positions are given in conjunction with the alignment parameter, the font will be justified (either left or centered) relative to those coordinates. This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmediaconvertDvbSubtitleAlignment alignment;

/**
 Specifies the color of the rectangle behind the captions. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmediaconvertDvbSubtitleBackgroundColor backgroundColor;

/**
 Specifies the opacity of the background rectangle. 255 is opaque; 0 is transparent. Leaving this parameter blank is equivalent to setting it to 0 (transparent). All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable backgroundOpacity;

/**
 Specifies the color of the burned-in captions. This option is not valid for source captions that are STL, 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmediaconvertDvbSubtitleFontColor fontColor;

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
@property (nonatomic, assign) AWSmediaconvertFontScript fontScript;

/**
 A positive integer indicates the exact font size in points. Set to 0 for automatic font size selection. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontSize;

/**
 Specifies font outline color. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmediaconvertDvbSubtitleOutlineColor outlineColor;

/**
 Specifies font outline size in pixels. This option is not valid for source captions that are either 608/embedded or teletext. These source settings are already pre-defined by the caption stream. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, strong) NSNumber * _Nullable outlineSize;

/**
 Specifies the color of the shadow cast by the captions. All burn-in and DVB-Sub font settings must match.
 */
@property (nonatomic, assign) AWSmediaconvertDvbSubtitleShadowColor shadowColor;

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
@property (nonatomic, assign) AWSmediaconvertDvbSubtitlingType subtitlingType;

/**
 Only applies to jobs with input captions in Teletext or STL formats. Specify whether the spacing between letters in your captions is set by the captions grid or varies depending on letter width. Choose fixed grid to conform to the spacing specified in the captions file more accurately. Choose proportional to make the text easier to read if the captions are closed caption.
 */
@property (nonatomic, assign) AWSmediaconvertDvbSubtitleTeletextSpacing teletextSpacing;

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
@interface AWSmediaconvertDvbSubSourceSettings : AWSModel


/**
 When using DVB-Sub with Burn-In or SMPTE-TT, use this PID for the source content. Unused for DVB-Sub passthrough. All DVB-Sub content is passed through, regardless of selectors.
 */
@property (nonatomic, strong) NSNumber * _Nullable pid;

@end

/**
 Inserts DVB Time and Date Table (TDT) at the specified table repetition interval.
 */
@interface AWSmediaconvertDvbTdtSettings : AWSModel


/**
 The number of milliseconds between instances of this table in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable tdtInterval;

@end

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value EAC3_ATMOS.
 */
@interface AWSmediaconvertEac3AtmosSettings : AWSModel


/**
 Specify the average bitrate in bits per second. Valid values: 384k, 448k, 640k, 768k
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For more information about the EAC3 bitstream mode, see ATSC A/52-2012 (Annex E).
 */
@property (nonatomic, assign) AWSmediaconvertEac3AtmosBitstreamMode bitstreamMode;

/**
 The coding mode for Dolby Digital Plus JOC (Atmos) is always 9.1.6 (CODING_MODE_9_1_6).
 */
@property (nonatomic, assign) AWSmediaconvertEac3AtmosCodingMode codingMode;

/**
 Enable Dolby Dialogue Intelligence to adjust loudness based on dialogue analysis.
 */
@property (nonatomic, assign) AWSmediaconvertEac3AtmosDialogueIntelligence dialogueIntelligence;

/**
 Specify the absolute peak level for a signal with dynamic range compression.
 */
@property (nonatomic, assign) AWSmediaconvertEac3AtmosDynamicRangeCompressionLine dynamicRangeCompressionLine;

/**
 Specify how the service limits the audio dynamic range when compressing the audio.
 */
@property (nonatomic, assign) AWSmediaconvertEac3AtmosDynamicRangeCompressionRf dynamicRangeCompressionRf;

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
@property (nonatomic, assign) AWSmediaconvertEac3AtmosMeteringMode meteringMode;

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
@property (nonatomic, assign) AWSmediaconvertEac3AtmosStereoDownmix stereoDownmix;

/**
 Specify whether your input audio has an additional center rear surround channel matrix encoded into your left and right surround channels.
 */
@property (nonatomic, assign) AWSmediaconvertEac3AtmosSurroundExMode surroundExMode;

@end

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value EAC3.
 */
@interface AWSmediaconvertEac3Settings : AWSModel


/**
 If set to ATTENUATE_3_DB, applies a 3 dB attenuation to the surround channels. Only used for 3/2 coding mode.
 */
@property (nonatomic, assign) AWSmediaconvertEac3AttenuationControl attenuationControl;

/**
 Specify the average bitrate in bits per second. Valid bitrates depend on the coding mode.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specify the bitstream mode for the E-AC-3 stream that the encoder emits. For more information about the EAC3 bitstream mode, see ATSC A/52-2012 (Annex E).
 */
@property (nonatomic, assign) AWSmediaconvertEac3BitstreamMode bitstreamMode;

/**
 Dolby Digital Plus coding mode. Determines number of channels.
 */
@property (nonatomic, assign) AWSmediaconvertEac3CodingMode codingMode;

/**
 Activates a DC highpass filter for all input channels.
 */
@property (nonatomic, assign) AWSmediaconvertEac3DcFilter dcFilter;

/**
 Sets the dialnorm for the output. If blank and input audio is Dolby Digital Plus, dialnorm will be passed through.
 */
@property (nonatomic, strong) NSNumber * _Nullable dialnorm;

/**
 Specify the absolute peak level for a signal with dynamic range compression.
 */
@property (nonatomic, assign) AWSmediaconvertEac3DynamicRangeCompressionLine dynamicRangeCompressionLine;

/**
 Specify how the service limits the audio dynamic range when compressing the audio.
 */
@property (nonatomic, assign) AWSmediaconvertEac3DynamicRangeCompressionRf dynamicRangeCompressionRf;

/**
 When encoding 3/2 audio, controls whether the LFE channel is enabled
 */
@property (nonatomic, assign) AWSmediaconvertEac3LfeControl lfeControl;

/**
 Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only valid with 3_2_LFE coding mode.
 */
@property (nonatomic, assign) AWSmediaconvertEac3LfeFilter lfeFilter;

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
@property (nonatomic, assign) AWSmediaconvertEac3MetadataControl metadataControl;

/**
 When set to WHEN_POSSIBLE, input DD+ audio will be passed through if it is present on the input. this detection is dynamic over the life of the transcode. Inputs that alternate between DD+ and non-DD+ content will have a consistent DD+ output as the system alternates between passthrough and encoding.
 */
@property (nonatomic, assign) AWSmediaconvertEac3PassthroughControl passthroughControl;

/**
 Controls the amount of phase-shift applied to the surround channels. Only used for 3/2 coding mode.
 */
@property (nonatomic, assign) AWSmediaconvertEac3PhaseControl phaseControl;

/**
 This value is always 48000. It represents the sample rate in Hz.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

/**
 Choose how the service does stereo downmixing. This setting only applies if you keep the default value of 3/2 - L, R, C, Ls, Rs (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you choose a different value for Coding mode, the service ignores Stereo downmix (Eac3StereoDownmix).
 */
@property (nonatomic, assign) AWSmediaconvertEac3StereoDownmix stereoDownmix;

/**
 When encoding 3/2 audio, sets whether an extra center back surround channel is matrix encoded into the left and right surround channels.
 */
@property (nonatomic, assign) AWSmediaconvertEac3SurroundExMode surroundExMode;

/**
 When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded into the two channels.
 */
@property (nonatomic, assign) AWSmediaconvertEac3SurroundMode surroundMode;

@end

/**
 Settings specific to embedded/ancillary caption outputs, including 608/708 Channel destination number.
 */
@interface AWSmediaconvertEmbeddedDestinationSettings : AWSModel


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
@interface AWSmediaconvertEmbeddedSourceSettings : AWSModel


/**
 Specify whether this set of input captions appears in your outputs in both 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert includes the captions data in two ways: it passes the 608 data through using the 608 compatibility bytes fields of the 708 wrapper, and it also translates the 608 data into 708.
 */
@property (nonatomic, assign) AWSmediaconvertEmbeddedConvert608To708 convert608To708;

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
@property (nonatomic, assign) AWSmediaconvertEmbeddedTerminateCaptions terminateCaptions;

@end

/**
 Describes an account-specific API endpoint.
 */
@interface AWSmediaconvertEndpoint : AWSModel


/**
 URL of endpoint
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 ESAM ManifestConfirmConditionNotification defined by OC-SP-ESAM-API-I03-131025.
 */
@interface AWSmediaconvertEsamManifestConfirmConditionNotification : AWSModel


/**
 Provide your ESAM ManifestConfirmConditionNotification XML document inside your JSON job settings. Form the XML document as per OC-SP-ESAM-API-I03-131025. The transcoder will use the Manifest Conditioning instructions in the message that you supply.
 */
@property (nonatomic, strong) NSString * _Nullable mccXml;

@end

/**
 Settings for Event Signaling And Messaging (ESAM). If you don't do ad insertion, you can ignore these settings.
 */
@interface AWSmediaconvertEsamSettings : AWSModel


/**
 Specifies an ESAM ManifestConfirmConditionNotification XML as per OC-SP-ESAM-API-I03-131025. The transcoder uses the manifest conditioning instructions that you provide in the setting MCC XML (mccXml).
 */
@property (nonatomic, strong) AWSmediaconvertEsamManifestConfirmConditionNotification * _Nullable manifestConfirmConditionNotification;

/**
 Specifies the stream distance, in milliseconds, between the SCTE 35 messages that the transcoder places and the splice points that they refer to. If the time between the start of the asset and the SCTE-35 message is less than this value, then the transcoder places the SCTE-35 marker at the beginning of the stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable responseSignalPreroll;

/**
 Specifies an ESAM SignalProcessingNotification XML as per OC-SP-ESAM-API-I03-131025. The transcoder uses the signal processing instructions that you provide in the setting SCC XML (sccXml).
 */
@property (nonatomic, strong) AWSmediaconvertEsamSignalProcessingNotification * _Nullable signalProcessingNotification;

@end

/**
 ESAM SignalProcessingNotification data defined by OC-SP-ESAM-API-I03-131025.
 */
@interface AWSmediaconvertEsamSignalProcessingNotification : AWSModel


/**
 Provide your ESAM SignalProcessingNotification XML document inside your JSON job settings. Form the XML document as per OC-SP-ESAM-API-I03-131025. The transcoder will use the signal processing instructions in the message that you supply. Provide your ESAM SignalProcessingNotification XML document inside your JSON job settings. For your MPEG2-TS file outputs, if you want the service to place SCTE-35 markers at the insertion points you specify in the XML document, you must also enable SCTE-35 ESAM (scte35Esam). Note that you can either specify an ESAM XML document or enable SCTE-35 passthrough. You can't do both.
 */
@property (nonatomic, strong) NSString * _Nullable sccXml;

@end

/**
 
 */
@interface AWSmediaconvertExceptionBody : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 Settings for F4v container
 */
@interface AWSmediaconvertF4vSettings : AWSModel


/**
 If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the beginning of the archive as required for progressive downloading. Otherwise it is placed normally at the end.
 */
@property (nonatomic, assign) AWSmediaconvertF4vMoovPlacement moovPlacement;

@end

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to FILE_GROUP_SETTINGS.
 */
@interface AWSmediaconvertFileGroupSettings : AWSModel


/**
 Use Destination (Destination) to specify the S3 output location and the output filename base. Destination accepts format identifiers. If you do not specify the base filename in the URI, the service will use the filename of the input file. If your job has multiple inputs, the service uses the filename of the first input file.
 */
@property (nonatomic, strong) NSString * _Nullable destination;

/**
 Settings associated with the destination. Will vary based on the type of destination
 */
@property (nonatomic, strong) AWSmediaconvertDestinationSettings * _Nullable destinationSettings;

@end

/**
 If your input captions are SCC, SMI, SRT, STL, TTML, or IMSC 1.1 in an xml file, specify the URI of the input caption source file. If your caption source is IMSC in an IMF package, use TrackSourceSettings instead of FileSoureSettings.
 */
@interface AWSmediaconvertFileSourceSettings : AWSModel


/**
 Specify whether this set of input captions appears in your outputs in both 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert includes the captions data in two ways: it passes the 608 data through using the 608 compatibility bytes fields of the 708 wrapper, and it also translates the 608 data into 708.
 */
@property (nonatomic, assign) AWSmediaconvertFileSourceConvert608To708 convert608To708;

/**
 Ignore this setting unless your input captions format is SCC. To have the service compensate for differing framerates between your input captions and input video, specify the framerate of the captions file. Specify this value as a fraction, using the settings Framerate numerator (framerateNumerator) and Framerate denominator (framerateDenominator). For example, you might specify 24 / 1 for 24 fps, 25 / 1 for 25 fps, 24000 / 1001 for 23.976 fps, or 30000 / 1001 for 29.97 fps.
 */
@property (nonatomic, strong) AWSmediaconvertCaptionSourceFramerate * _Nullable framerate;

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
@interface AWSmediaconvertFrameCaptureSettings : AWSModel


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
@interface AWSmediaconvertGetJobRequest : AWSRequest


/**
 the job ID of the job.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSmediaconvertGetJobResponse : AWSModel


/**
 Each job converts an input file into an output file or files. For more information, see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 */
@property (nonatomic, strong) AWSmediaconvertJob * _Nullable job;

@end

/**
 
 */
@interface AWSmediaconvertGetJobTemplateRequest : AWSRequest


/**
 The name of the job template.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSmediaconvertGetJobTemplateResponse : AWSModel


/**
 A job template is a pre-made set of encoding instructions that you can use to quickly create a job.
 */
@property (nonatomic, strong) AWSmediaconvertJobTemplate * _Nullable jobTemplate;

@end

/**
 
 */
@interface AWSmediaconvertGetPresetRequest : AWSRequest


/**
 The name of the preset.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSmediaconvertGetPresetResponse : AWSModel


/**
 A preset is a collection of preconfigured media conversion settings that you want MediaConvert to apply to the output during the conversion process.
 */
@property (nonatomic, strong) AWSmediaconvertPreset * _Nullable preset;

@end

/**
 
 */
@interface AWSmediaconvertGetQueueRequest : AWSRequest


/**
 The name of the queue that you want information about.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSmediaconvertGetQueueResponse : AWSModel


/**
 You can use queues to manage the resources that are available to your AWS account for running multiple transcoding jobs at the same time. If you don't specify a queue, the service sends all jobs through the default queue. For more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
 */
@property (nonatomic, strong) AWSmediaconvertQueue * _Nullable queue;

@end

/**
 Settings for quality-defined variable bitrate encoding with the H.264 codec. Required when you set Rate control mode to QVBR. Not valid when you set Rate control mode to a value other than QVBR, or when you don't define Rate control mode.
 */
@interface AWSmediaconvertH264QvbrSettings : AWSModel


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
@interface AWSmediaconvertH264Settings : AWSModel


/**
 Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.
 */
@property (nonatomic, assign) AWSmediaconvertH264AdaptiveQuantization adaptiveQuantization;

/**
 Specify the average bitrate in bits per second. Required for VBR and CBR. For MS Smooth outputs, bitrates must be unique when rounded down to the nearest multiple of 1000.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Specify an H.264 level that is consistent with your output video settings. If you aren't sure what level to specify, choose Auto (AUTO).
 */
@property (nonatomic, assign) AWSmediaconvertH264CodecLevel codecLevel;

/**
 H.264 Profile. High 4:2:2 and 10-bit profiles are only available with the AVC-I License.
 */
@property (nonatomic, assign) AWSmediaconvertH264CodecProfile codecProfile;

/**
 Choose Adaptive to improve subjective video quality for high-motion content. This will cause the service to use fewer B-frames (which infer information based on other frames) for high-motion portions of the video and more B-frames for low-motion portions. The maximum number of B-frames is limited by the value you provide for the setting B frames between reference frames (numberBFramesBetweenReferenceFrames).
 */
@property (nonatomic, assign) AWSmediaconvertH264DynamicSubGop dynamicSubGop;

/**
 Entropy encoding mode. Use CABAC (must be in Main or High profile) or CAVLC.
 */
@property (nonatomic, assign) AWSmediaconvertH264EntropyEncoding entropyEncoding;

/**
 Choosing FORCE_FIELD disables PAFF encoding for interlaced outputs.
 */
@property (nonatomic, assign) AWSmediaconvertH264FieldEncoding fieldEncoding;

/**
 Adjust quantization within each frame to reduce flicker or 'pop' on I-frames.
 */
@property (nonatomic, assign) AWSmediaconvertH264FlickerAdaptiveQuantization flickerAdaptiveQuantization;

/**
 If you are using the console, use the Framerate setting to specify the frame rate for this output. If you want to keep the same frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction. If you are creating your transcoding job specification as a JSON file without the console, use FramerateControl to specify which value the service uses for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the settings FramerateNumerator and FramerateDenominator.
 */
@property (nonatomic, assign) AWSmediaconvertH264FramerateControl framerateControl;

/**
 When set to INTERPOLATE, produces smoother motion during frame rate conversion.
 */
@property (nonatomic, assign) AWSmediaconvertH264FramerateConversionAlgorithm framerateConversionAlgorithm;

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
@property (nonatomic, assign) AWSmediaconvertH264GopBReference gopBReference;

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
@property (nonatomic, assign) AWSmediaconvertH264GopSizeUnits gopSizeUnits;

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
@property (nonatomic, assign) AWSmediaconvertH264InterlaceMode interlaceMode;

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
 Using the API, enable ParFollowSource if you want the service to use the pixel aspect ratio from the input. Using the console, do this by choosing Follow source for Pixel aspect ratio.
 */
@property (nonatomic, assign) AWSmediaconvertH264ParControl parControl;

/**
 Pixel Aspect Ratio denominator.
 */
@property (nonatomic, strong) NSNumber * _Nullable parDenominator;

/**
 Pixel Aspect Ratio numerator.
 */
@property (nonatomic, strong) NSNumber * _Nullable parNumerator;

/**
 Use Quality tuning level (H264QualityTuningLevel) to specifiy whether to use fast single-pass, high-quality singlepass, or high-quality multipass video encoding.
 */
@property (nonatomic, assign) AWSmediaconvertH264QualityTuningLevel qualityTuningLevel;

/**
 Settings for quality-defined variable bitrate encoding with the H.264 codec. Required when you set Rate control mode to QVBR. Not valid when you set Rate control mode to a value other than QVBR, or when you don't define Rate control mode.
 */
@property (nonatomic, strong) AWSmediaconvertH264QvbrSettings * _Nullable qvbrSettings;

/**
 Use this setting to specify whether this output has a variable bitrate (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
 */
@property (nonatomic, assign) AWSmediaconvertH264RateControlMode rateControlMode;

/**
 Places a PPS header on each encoded picture, even if repeated.
 */
@property (nonatomic, assign) AWSmediaconvertH264RepeatPps repeatPps;

/**
 Enable this setting to insert I-frames at scene changes that the service automatically detects. This improves video quality and is enabled by default. If this output uses QVBR, choose Transition detection (TRANSITION_DETECTION) for further video quality improvement. For more information about QVBR, see https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
 */
@property (nonatomic, assign) AWSmediaconvertH264SceneChangeDetect sceneChangeDetect;

/**
 Number of slices per picture. Must be less than or equal to the number of macroblock rows for progressive pictures, and less than or equal to half the number of macroblock rows for interlaced pictures.
 */
@property (nonatomic, strong) NSNumber * _Nullable slices;

/**
 Enables Slow PAL rate conversion. 23.976fps and 24fps input is relabeled as 25fps, and audio is sped up correspondingly.
 */
@property (nonatomic, assign) AWSmediaconvertH264SlowPal slowPal;

/**
 Softness. Selects quantizer matrix, larger values reduce high-frequency content in the encoded image.
 */
@property (nonatomic, strong) NSNumber * _Nullable softness;

/**
 Adjust quantization within each frame based on spatial variation of content complexity.
 */
@property (nonatomic, assign) AWSmediaconvertH264SpatialAdaptiveQuantization spatialAdaptiveQuantization;

/**
 Produces a bitstream compliant with SMPTE RP-2027.
 */
@property (nonatomic, assign) AWSmediaconvertH264Syntax syntax;

/**
 This field applies only if the Streams > Advanced > Framerate (framerate) fieldis set to 29.970. This field works with the Streams > Advanced > Preprocessors > Deinterlacerfield (deinterlace_mode) and the Streams > Advanced > Interlaced Mode field (interlace_mode)to identify the scan type for the output: Progressive, Interlaced, Hard Telecine or Soft Telecine. - Hard: produces 29.97i output from 23.976 input. - Soft: produces 23.976; the player converts this output to 29.97i.
 */
@property (nonatomic, assign) AWSmediaconvertH264Telecine telecine;

/**
 Adjust quantization within each frame based on temporal variation of content complexity.
 */
@property (nonatomic, assign) AWSmediaconvertH264TemporalAdaptiveQuantization temporalAdaptiveQuantization;

/**
 Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
 */
@property (nonatomic, assign) AWSmediaconvertH264UnregisteredSeiTimecode unregisteredSeiTimecode;

@end

/**
 Settings for quality-defined variable bitrate encoding with the H.265 codec. Required when you set Rate control mode to QVBR. Not valid when you set Rate control mode to a value other than QVBR, or when you don't define Rate control mode.
 */
@interface AWSmediaconvertH265QvbrSettings : AWSModel


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
@interface AWSmediaconvertH265Settings : AWSModel


/**
 Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.
 */
@property (nonatomic, assign) AWSmediaconvertH265AdaptiveQuantization adaptiveQuantization;

/**
 Enables Alternate Transfer Function SEI message for outputs using Hybrid Log Gamma (HLG) Electro-Optical Transfer Function (EOTF).
 */
@property (nonatomic, assign) AWSmediaconvertH265AlternateTransferFunctionSei alternateTransferFunctionSei;

/**
 Specify the average bitrate in bits per second. Required for VBR and CBR. For MS Smooth outputs, bitrates must be unique when rounded down to the nearest multiple of 1000.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 H.265 Level.
 */
@property (nonatomic, assign) AWSmediaconvertH265CodecLevel codecLevel;

/**
 Represents the Profile and Tier, per the HEVC (H.265) specification. Selections are grouped as [Profile] / [Tier], so "Main/High" represents Main Profile with High Tier. 4:2:2 profiles are only available with the HEVC 4:2:2 License.
 */
@property (nonatomic, assign) AWSmediaconvertH265CodecProfile codecProfile;

/**
 Choose Adaptive to improve subjective video quality for high-motion content. This will cause the service to use fewer B-frames (which infer information based on other frames) for high-motion portions of the video and more B-frames for low-motion portions. The maximum number of B-frames is limited by the value you provide for the setting B frames between reference frames (numberBFramesBetweenReferenceFrames).
 */
@property (nonatomic, assign) AWSmediaconvertH265DynamicSubGop dynamicSubGop;

/**
 Adjust quantization within each frame to reduce flicker or 'pop' on I-frames.
 */
@property (nonatomic, assign) AWSmediaconvertH265FlickerAdaptiveQuantization flickerAdaptiveQuantization;

/**
 If you are using the console, use the Framerate setting to specify the frame rate for this output. If you want to keep the same frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction. If you are creating your transcoding job sepecification as a JSON file without the console, use FramerateControl to specify which value the service uses for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the settings FramerateNumerator and FramerateDenominator.
 */
@property (nonatomic, assign) AWSmediaconvertH265FramerateControl framerateControl;

/**
 When set to INTERPOLATE, produces smoother motion during frame rate conversion.
 */
@property (nonatomic, assign) AWSmediaconvertH265FramerateConversionAlgorithm framerateConversionAlgorithm;

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
@property (nonatomic, assign) AWSmediaconvertH265GopBReference gopBReference;

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
@property (nonatomic, assign) AWSmediaconvertH265GopSizeUnits gopSizeUnits;

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
@property (nonatomic, assign) AWSmediaconvertH265InterlaceMode interlaceMode;

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
 Using the API, enable ParFollowSource if you want the service to use the pixel aspect ratio from the input. Using the console, do this by choosing Follow source for Pixel aspect ratio.
 */
@property (nonatomic, assign) AWSmediaconvertH265ParControl parControl;

/**
 Pixel Aspect Ratio denominator.
 */
@property (nonatomic, strong) NSNumber * _Nullable parDenominator;

/**
 Pixel Aspect Ratio numerator.
 */
@property (nonatomic, strong) NSNumber * _Nullable parNumerator;

/**
 Use Quality tuning level (H265QualityTuningLevel) to specifiy whether to use fast single-pass, high-quality singlepass, or high-quality multipass video encoding.
 */
@property (nonatomic, assign) AWSmediaconvertH265QualityTuningLevel qualityTuningLevel;

/**
 Settings for quality-defined variable bitrate encoding with the H.265 codec. Required when you set Rate control mode to QVBR. Not valid when you set Rate control mode to a value other than QVBR, or when you don't define Rate control mode.
 */
@property (nonatomic, strong) AWSmediaconvertH265QvbrSettings * _Nullable qvbrSettings;

/**
 Use this setting to specify whether this output has a variable bitrate (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
 */
@property (nonatomic, assign) AWSmediaconvertH265RateControlMode rateControlMode;

/**
 Specify Sample Adaptive Offset (SAO) filter strength.Adaptive mode dynamically selects best strength based on content
 */
@property (nonatomic, assign) AWSmediaconvertH265SampleAdaptiveOffsetFilterMode sampleAdaptiveOffsetFilterMode;

/**
 Enable this setting to insert I-frames at scene changes that the service automatically detects. This improves video quality and is enabled by default. If this output uses QVBR, choose Transition detection (TRANSITION_DETECTION) for further video quality improvement. For more information about QVBR, see https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
 */
@property (nonatomic, assign) AWSmediaconvertH265SceneChangeDetect sceneChangeDetect;

/**
 Number of slices per picture. Must be less than or equal to the number of macroblock rows for progressive pictures, and less than or equal to half the number of macroblock rows for interlaced pictures.
 */
@property (nonatomic, strong) NSNumber * _Nullable slices;

/**
 Enables Slow PAL rate conversion. 23.976fps and 24fps input is relabeled as 25fps, and audio is sped up correspondingly.
 */
@property (nonatomic, assign) AWSmediaconvertH265SlowPal slowPal;

/**
 Adjust quantization within each frame based on spatial variation of content complexity.
 */
@property (nonatomic, assign) AWSmediaconvertH265SpatialAdaptiveQuantization spatialAdaptiveQuantization;

/**
 This field applies only if the Streams > Advanced > Framerate (framerate) fieldis set to 29.970. This field works with the Streams > Advanced > Preprocessors > Deinterlacerfield (deinterlace_mode) and the Streams > Advanced > Interlaced Mode field (interlace_mode)to identify the scan type for the output: Progressive, Interlaced, Hard Telecine or Soft Telecine. - Hard: produces 29.97i output from 23.976 input. - Soft: produces 23.976; the player converts this output to 29.97i.
 */
@property (nonatomic, assign) AWSmediaconvertH265Telecine telecine;

/**
 Adjust quantization within each frame based on temporal variation of content complexity.
 */
@property (nonatomic, assign) AWSmediaconvertH265TemporalAdaptiveQuantization temporalAdaptiveQuantization;

/**
 Enables temporal layer identifiers in the encoded bitstream. Up to 3 layers are supported depending on GOP structure: I- and P-frames form one layer, reference B-frames can form a second layer and non-reference b-frames can form a third layer. Decoders can optionally decode only the lower temporal layers to generate a lower frame rate output. For example, given a bitstream with temporal IDs and with b-frames = 1 (i.e. IbPbPb display order), a decoder could decode all the frames for full frame rate output or only the I and P frames (lowest temporal layer) for a half frame rate output.
 */
@property (nonatomic, assign) AWSmediaconvertH265TemporalIds temporalIds;

/**
 Enable use of tiles, allowing horizontal as well as vertical subdivision of the encoded pictures.
 */
@property (nonatomic, assign) AWSmediaconvertH265Tiles tiles;

/**
 Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
 */
@property (nonatomic, assign) AWSmediaconvertH265UnregisteredSeiTimecode unregisteredSeiTimecode;

/**
 If the location of parameter set NAL units doesn't matter in your workflow, ignore this setting. Use this setting only with CMAF or DASH outputs, or with standalone file outputs in an MPEG-4 container (MP4 outputs). Choose HVC1 to mark your output as HVC1. This makes your output compliant with the following specification: ISO IECJTC1 SC29 N13798 Text ISO/IEC FDIS 14496-15 3rd Edition. For these outputs, the service stores parameter set NAL units in the sample headers but not in the samples directly. For MP4 outputs, when you choose HVC1, your output video might not work properly with some downstream systems and video players. The service defaults to marking your output as HEV1. For these outputs, the service writes parameter set NAL units directly into the samples.
 */
@property (nonatomic, assign) AWSmediaconvertH265WriteMp4PackagingType writeMp4PackagingType;

@end

/**
 Use these settings to specify static color calibration metadata, as defined by SMPTE ST 2086. These values don't affect the pixel values that are encoded in the video stream. They are intended to help the downstream video player display content in a way that reflects the intentions of the the content creator.
 */
@interface AWSmediaconvertHdr10Metadata : AWSModel


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
@interface AWSmediaconvertHlsAdditionalManifest : AWSModel


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
@interface AWSmediaconvertHlsCaptionLanguageMapping : AWSModel


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
@property (nonatomic, assign) AWSmediaconvertLanguageCode languageCode;

/**
 Caption language description.
 */
@property (nonatomic, strong) NSString * _Nullable languageDescription;

@end

/**
 Settings for HLS encryption
 */
@interface AWSmediaconvertHlsEncryptionSettings : AWSModel


/**
 This is a 128-bit, 16-byte hex value represented by a 32-character text string. If this parameter is not set then the Initialization Vector will follow the segment number by default.
 */
@property (nonatomic, strong) NSString * _Nullable constantInitializationVector;

/**
 Encrypts the segments with the given encryption scheme. Leave blank to disable. Selecting 'Disabled' in the web interface also disables encryption.
 */
@property (nonatomic, assign) AWSmediaconvertHlsEncryptionType encryptionMethod;

/**
 The Initialization Vector is a 128-bit number used in conjunction with the key for encrypting blocks. If set to INCLUDE, Initialization Vector is listed in the manifest. Otherwise Initialization Vector is not in the manifest.
 */
@property (nonatomic, assign) AWSmediaconvertHlsInitializationVectorInManifest initializationVectorInManifest;

/**
 Enable this setting to insert the EXT-X-SESSION-KEY element into the master playlist. This allows for offline Apple HLS FairPlay content protection.
 */
@property (nonatomic, assign) AWSmediaconvertHlsOfflineEncrypted offlineEncrypted;

/**
 If your output group type is HLS, DASH, or Microsoft Smooth, use these settings when doing DRM encryption with a SPEKE-compliant key provider.If your output group type is CMAF, use the SpekeKeyProviderCmaf settings instead.
 */
@property (nonatomic, strong) AWSmediaconvertSpekeKeyProvider * _Nullable spekeKeyProvider;

/**
 Use these settings to set up encryption with a static key provider.
 */
@property (nonatomic, strong) AWSmediaconvertStaticKeyProvider * _Nullable staticKeyProvider;

/**
 Specify whether your DRM encryption key is static or from a key provider that follows the SPEKE standard. For more information about SPEKE, see https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
 */
@property (nonatomic, assign) AWSmediaconvertHlsKeyProviderType types;

@end

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to HLS_GROUP_SETTINGS.
 */
@interface AWSmediaconvertHlsGroupSettings : AWSModel


/**
 Choose one or more ad marker types to decorate your Apple HLS manifest. This setting does not determine whether SCTE-35 markers appear in the outputs themselves.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable adMarkers;

/**
 By default, the service creates one top-level .m3u8 HLS manifest for each HLS output group in your job. This default manifest references every output in the output group. To create additional top-level manifests that reference a subset of the outputs in the output group, specify a list of them here.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertHlsAdditionalManifest *> * _Nullable additionalManifests;

/**
 A partial URI prefix that will be prepended to each output in the media .m3u8 file. Can be used if base manifest is delivered from a different URL than the main .m3u8 file.
 */
@property (nonatomic, strong) NSString * _Nullable baseUrl;

/**
 Language to be used on Caption outputs
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertHlsCaptionLanguageMapping *> * _Nullable captionLanguageMappings;

/**
 Applies only to 608 Embedded output captions. Insert: Include CLOSED-CAPTIONS lines in the manifest. Specify at least one language in the CC1 Language Code field. One CLOSED-CAPTION line is added for each Language Code you specify. Make sure to specify the languages in the order in which they appear in the original source (if the source is embedded format) or the order of the caption selectors (if the source is other than embedded). Otherwise, languages in the manifest will not match up properly with the output captions. None: Include CLOSED-CAPTIONS=NONE line in the manifest. Omit: Omit any CLOSED-CAPTIONS line from the manifest.
 */
@property (nonatomic, assign) AWSmediaconvertHlsCaptionLanguageSetting captionLanguageSetting;

/**
 When set to ENABLED, sets #EXT-X-ALLOW-CACHE:no tag, which prevents client from saving media segments for later replay.
 */
@property (nonatomic, assign) AWSmediaconvertHlsClientCache clientCache;

/**
 Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist generation.
 */
@property (nonatomic, assign) AWSmediaconvertHlsCodecSpecification codecSpecification;

/**
 Use Destination (Destination) to specify the S3 output location and the output filename base. Destination accepts format identifiers. If you do not specify the base filename in the URI, the service will use the filename of the input file. If your job has multiple inputs, the service uses the filename of the first input file.
 */
@property (nonatomic, strong) NSString * _Nullable destination;

/**
 Settings associated with the destination. Will vary based on the type of destination
 */
@property (nonatomic, strong) AWSmediaconvertDestinationSettings * _Nullable destinationSettings;

/**
 Indicates whether segments should be placed in subdirectories.
 */
@property (nonatomic, assign) AWSmediaconvertHlsDirectoryStructure directoryStructure;

/**
 DRM settings.
 */
@property (nonatomic, strong) AWSmediaconvertHlsEncryptionSettings * _Nullable encryption;

/**
 When set to GZIP, compresses HLS playlist.
 */
@property (nonatomic, assign) AWSmediaconvertHlsManifestCompression manifestCompression;

/**
 Indicates whether the output manifest should use floating point values for segment duration.
 */
@property (nonatomic, assign) AWSmediaconvertHlsManifestDurationFormat manifestDurationFormat;

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
@property (nonatomic, assign) AWSmediaconvertHlsOutputSelection outputSelection;

/**
 Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files. The value is calculated as follows: either the program date and time are initialized using the input timecode source, or the time is initialized using the input timecode source and the date is initialized using the timestamp_offset.
 */
@property (nonatomic, assign) AWSmediaconvertHlsProgramDateTime programDateTime;

/**
 Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable programDateTimePeriod;

/**
 When set to SINGLE_FILE, emits program as a single media resource (.ts) file, uses #EXT-X-BYTERANGE tags to index segment for playback.
 */
@property (nonatomic, assign) AWSmediaconvertHlsSegmentControl segmentControl;

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
@property (nonatomic, assign) AWSmediaconvertHlsStreamInfResolution streamInfResolution;

/**
 Indicates ID3 frame that has the timecode.
 */
@property (nonatomic, assign) AWSmediaconvertHlsTimedMetadataId3Frame timedMetadataId3Frame;

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
@interface AWSmediaconvertHlsSettings : AWSModel


/**
 Specifies the group to which the audio Rendition belongs.
 */
@property (nonatomic, strong) NSString * _Nullable audioGroupId;

/**
 Use this setting only in audio-only outputs. Choose MPEG-2 Transport Stream (M2TS) to create a file in an MPEG2-TS container. Keep the default value Automatic (AUTOMATIC) to create an audio-only file in a raw container. Regardless of the value that you specify here, if this output has video, the service will place the output into an MPEG2-TS container.
 */
@property (nonatomic, assign) AWSmediaconvertHlsAudioOnlyContainer audioOnlyContainer;

/**
 List all the audio groups that are used with the video output stream. Input all the audio GROUP-IDs that are associated to the video, separate by ','.
 */
@property (nonatomic, strong) NSString * _Nullable audioRenditionSets;

/**
 Four types of audio-only tracks are supported: Audio-Only Variant Stream The client can play back this audio-only stream instead of video in low-bandwidth scenarios. Represented as an EXT-X-STREAM-INF in the HLS manifest. Alternate Audio, Auto Select, Default Alternate rendition that the client should try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=YES, AUTOSELECT=YES Alternate Audio, Auto Select, Not Default Alternate rendition that the client may try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO, AUTOSELECT=YES Alternate Audio, not Auto Select Alternate rendition that the client will not try to play back by default. Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO, AUTOSELECT=NO
 */
@property (nonatomic, assign) AWSmediaconvertHlsAudioTrackType audioTrackType;

/**
 When set to INCLUDE, writes I-Frame Only Manifest in addition to the HLS manifest
 */
@property (nonatomic, assign) AWSmediaconvertHlsIFrameOnlyManifest IFrameOnlyManifest;

/**
 Use this setting to add an identifying string to the filename of each segment. The service adds this string between the name modifier and segment index number. You can use format identifiers in the string. For more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/using-variables-in-your-job-settings.html
 */
@property (nonatomic, strong) NSString * _Nullable segmentModifier;

@end

/**
 Optional. Configuration for a destination queue to which the job can hop once a customer-defined minimum wait time has passed.
 */
@interface AWSmediaconvertHopDestination : AWSModel


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
@interface AWSmediaconvertId3Insertion : AWSModel


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
@interface AWSmediaconvertImageInserter : AWSModel


/**
 Specify the images that you want to overlay on your video. The images must be PNG or TGA files.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertInsertableImage *> * _Nullable insertableImages;

@end

/**
 Settings specific to IMSC caption outputs.
 */
@interface AWSmediaconvertImscDestinationSettings : AWSModel


/**
 Keep this setting enabled to have MediaConvert use the font style and position information from the captions source in the output. This option is available only when your input captions are CFF-TT, IMSC, SMPTE-TT, or TTML. Disable this setting for simplified output captions.
 */
@property (nonatomic, assign) AWSmediaconvertImscStylePassthrough stylePassthrough;

@end

/**
 Specifies media input
 */
@interface AWSmediaconvertInput : AWSModel


/**
 Specifies set of audio selectors within an input to combine. An input may have multiple audio selector groups. See "Audio Selector Group":#inputs-audio_selector_group for more information.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSmediaconvertAudioSelectorGroup *> * _Nullable audioSelectorGroups;

/**
 Use Audio selectors (AudioSelectors) to specify a track or set of tracks from the input that you will use in your outputs. You can use mutiple Audio selectors per input.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSmediaconvertAudioSelector *> * _Nullable audioSelectors;

/**
 Use Captions selectors (CaptionSelectors) to specify the captions data from the input that you will use in your outputs. You can use mutiple captions selectors per input.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSmediaconvertCaptionSelector *> * _Nullable captionSelectors;

/**
 Use Cropping selection (crop) to specify the video area that the service will include in the output video frame. If you specify a value here, it will override any value that you specify in the output setting Cropping selection (crop).
 */
@property (nonatomic, strong) AWSmediaconvertRectangle * _Nullable crop;

/**
 Enable Deblock (InputDeblockFilter) to produce smoother motion in the output. Default is disabled. Only manaully controllable for MPEG2 and uncompressed video inputs.
 */
@property (nonatomic, assign) AWSmediaconvertInputDeblockFilter deblockFilter;

/**
 Settings for decrypting any input files that you encrypt before you upload them to Amazon S3. MediaConvert can decrypt files only when you use AWS Key Management Service (KMS) to encrypt the data key that you use to encrypt your content.
 */
@property (nonatomic, strong) AWSmediaconvertInputDecryptionSettings * _Nullable decryptionSettings;

/**
 Enable Denoise (InputDenoiseFilter) to filter noise from the input.Default is disabled. Only applicable to MPEG2, H.264, H.265, and uncompressed video inputs.
 */
@property (nonatomic, assign) AWSmediaconvertInputDenoiseFilter denoiseFilter;

/**
 Specify the source file for your transcoding job. You can use multiple inputs in a single job. The service concatenates these inputs, in the order that you specify them in the job, to create the outputs. If your input format is IMF, specify your input by providing the path to your CPL. For example, "s3://bucket/vf/cpl.xml". If the CPL is in an incomplete IMP, make sure to use *Supplemental IMPs* (SupplementalImps) to specify any supplemental IMPs that contain assets referenced by the CPL.
 */
@property (nonatomic, strong) NSString * _Nullable fileInput;

/**
 Use Filter enable (InputFilterEnable) to specify how the transcoding service applies the denoise and deblock filters. You must also enable the filters separately, with Denoise (InputDenoiseFilter) and Deblock (InputDeblockFilter). * Auto - The transcoding service determines whether to apply filtering, depending on input type and quality. * Disable - The input is not filtered. This is true even if you use the API to enable them in (InputDeblockFilter) and (InputDeblockFilter). * Force - The in put is filtered regardless of input type.
 */
@property (nonatomic, assign) AWSmediaconvertInputFilterEnable filterEnable;

/**
 Use Filter strength (FilterStrength) to adjust the magnitude the input filter settings (Deblock and Denoise). The range is -5 to 5. Default is 0.
 */
@property (nonatomic, strong) NSNumber * _Nullable filterStrength;

/**
 Enable the image inserter feature to include a graphic overlay on your video. Enable or disable this feature for each input individually. This setting is disabled by default.
 */
@property (nonatomic, strong) AWSmediaconvertImageInserter * _Nullable imageInserter;

/**
 (InputClippings) contains sets of start and end times that together specify a portion of the input to be used in the outputs. If you provide only a start time, the clip will be the entire input from that point to the end. If you provide only an end time, it will be the entire input up to that point. When you specify more than one input clip, the transcoding service creates the job outputs by stringing the clips together in the order you specify them.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertInputClipping *> * _Nullable inputClippings;

/**
 Use Selection placement (position) to define the video area in your output frame. The area outside of the rectangle that you specify here is black. If you specify a value here, it will override any value that you specify in the output setting Selection placement (position). If you specify a value here, this will override any AFD values in your input, even if you set Respond to AFD (RespondToAfd) to Respond (RESPOND). If you specify a value here, this will ignore anything that you specify for the setting Scaling Behavior (scalingBehavior).
 */
@property (nonatomic, strong) AWSmediaconvertRectangle * _Nullable position;

/**
 Use Program (programNumber) to select a specific program from within a multi-program transport stream. Note that Quad 4K is not currently supported. Default is the first program within the transport stream. If the program you specify doesn't exist, the transcoding service will use this default.
 */
@property (nonatomic, strong) NSNumber * _Nullable programNumber;

/**
 Set PSI control (InputPsiControl) for transport stream inputs to specify which data the demux process to scans. * Ignore PSI - Scan all PIDs for audio and video. * Use PSI - Scan only PSI data.
 */
@property (nonatomic, assign) AWSmediaconvertInputPsiControl psiControl;

/**
 Provide a list of any necessary supplemental IMPs. You need supplemental IMPs if the CPL that you're using for your input is in an incomplete IMP. Specify either the supplemental IMP directories with a trailing slash or the ASSETMAP.xml files. For example ["s3://bucket/ov/", "s3://bucket/vf2/ASSETMAP.xml"]. You don't need to specify the IMP that contains your input CPL, because the service automatically detects it.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supplementalImps;

/**
 Use this Timecode source setting, located under the input settings (InputTimecodeSource), to specify how the service counts input video frames. This input frame count affects only the behavior of features that apply to a single input at a time, such as input clipping and synchronizing some captions formats. Choose Embedded (EMBEDDED) to use the timecodes in your input video. Choose Start at zero (ZEROBASED) to start the first frame at zero. Choose Specified start (SPECIFIEDSTART) to start the first frame at the timecode that you specify in the setting Start timecode (timecodeStart). If you don't specify a value for Timecode source, the service will use Embedded by default. For more information about timecodes, see https://docs.aws.amazon.com/console/mediaconvert/timecode.
 */
@property (nonatomic, assign) AWSmediaconvertInputTimecodeSource timecodeSource;

/**
 Specify the timecode that you want the service to use for this input's initial frame. To use this setting, you must set the Timecode source setting, located under the input settings (InputTimecodeSource), to Specified start (SPECIFIEDSTART). For more information about timecodes, see https://docs.aws.amazon.com/console/mediaconvert/timecode.
 */
@property (nonatomic, strong) NSString * _Nullable timecodeStart;

/**
 Selector for video.
 */
@property (nonatomic, strong) AWSmediaconvertVideoSelector * _Nullable videoSelector;

@end

/**
 To transcode only portions of your input (clips), include one Input clipping (one instance of InputClipping in the JSON job file) for each input clip. All input clips you specify will be included in every output of the job.
 */
@interface AWSmediaconvertInputClipping : AWSModel


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
@interface AWSmediaconvertInputDecryptionSettings : AWSModel


/**
 Specify the encryption mode that you used to encrypt your input files.
 */
@property (nonatomic, assign) AWSmediaconvertDecryptionMode decryptionMode;

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
@interface AWSmediaconvertInputTemplate : AWSModel


/**
 Specifies set of audio selectors within an input to combine. An input may have multiple audio selector groups. See "Audio Selector Group":#inputs-audio_selector_group for more information.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSmediaconvertAudioSelectorGroup *> * _Nullable audioSelectorGroups;

/**
 Use Audio selectors (AudioSelectors) to specify a track or set of tracks from the input that you will use in your outputs. You can use mutiple Audio selectors per input.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSmediaconvertAudioSelector *> * _Nullable audioSelectors;

/**
 Use Captions selectors (CaptionSelectors) to specify the captions data from the input that you will use in your outputs. You can use mutiple captions selectors per input.
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSmediaconvertCaptionSelector *> * _Nullable captionSelectors;

/**
 Use Cropping selection (crop) to specify the video area that the service will include in the output video frame. If you specify a value here, it will override any value that you specify in the output setting Cropping selection (crop).
 */
@property (nonatomic, strong) AWSmediaconvertRectangle * _Nullable crop;

/**
 Enable Deblock (InputDeblockFilter) to produce smoother motion in the output. Default is disabled. Only manaully controllable for MPEG2 and uncompressed video inputs.
 */
@property (nonatomic, assign) AWSmediaconvertInputDeblockFilter deblockFilter;

/**
 Enable Denoise (InputDenoiseFilter) to filter noise from the input.Default is disabled. Only applicable to MPEG2, H.264, H.265, and uncompressed video inputs.
 */
@property (nonatomic, assign) AWSmediaconvertInputDenoiseFilter denoiseFilter;

/**
 Use Filter enable (InputFilterEnable) to specify how the transcoding service applies the denoise and deblock filters. You must also enable the filters separately, with Denoise (InputDenoiseFilter) and Deblock (InputDeblockFilter). * Auto - The transcoding service determines whether to apply filtering, depending on input type and quality. * Disable - The input is not filtered. This is true even if you use the API to enable them in (InputDeblockFilter) and (InputDeblockFilter). * Force - The in put is filtered regardless of input type.
 */
@property (nonatomic, assign) AWSmediaconvertInputFilterEnable filterEnable;

/**
 Use Filter strength (FilterStrength) to adjust the magnitude the input filter settings (Deblock and Denoise). The range is -5 to 5. Default is 0.
 */
@property (nonatomic, strong) NSNumber * _Nullable filterStrength;

/**
 Enable the image inserter feature to include a graphic overlay on your video. Enable or disable this feature for each input individually. This setting is disabled by default.
 */
@property (nonatomic, strong) AWSmediaconvertImageInserter * _Nullable imageInserter;

/**
 (InputClippings) contains sets of start and end times that together specify a portion of the input to be used in the outputs. If you provide only a start time, the clip will be the entire input from that point to the end. If you provide only an end time, it will be the entire input up to that point. When you specify more than one input clip, the transcoding service creates the job outputs by stringing the clips together in the order you specify them.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertInputClipping *> * _Nullable inputClippings;

/**
 Use Selection placement (position) to define the video area in your output frame. The area outside of the rectangle that you specify here is black. If you specify a value here, it will override any value that you specify in the output setting Selection placement (position). If you specify a value here, this will override any AFD values in your input, even if you set Respond to AFD (RespondToAfd) to Respond (RESPOND). If you specify a value here, this will ignore anything that you specify for the setting Scaling Behavior (scalingBehavior).
 */
@property (nonatomic, strong) AWSmediaconvertRectangle * _Nullable position;

/**
 Use Program (programNumber) to select a specific program from within a multi-program transport stream. Note that Quad 4K is not currently supported. Default is the first program within the transport stream. If the program you specify doesn't exist, the transcoding service will use this default.
 */
@property (nonatomic, strong) NSNumber * _Nullable programNumber;

/**
 Set PSI control (InputPsiControl) for transport stream inputs to specify which data the demux process to scans. * Ignore PSI - Scan all PIDs for audio and video. * Use PSI - Scan only PSI data.
 */
@property (nonatomic, assign) AWSmediaconvertInputPsiControl psiControl;

/**
 Use this Timecode source setting, located under the input settings (InputTimecodeSource), to specify how the service counts input video frames. This input frame count affects only the behavior of features that apply to a single input at a time, such as input clipping and synchronizing some captions formats. Choose Embedded (EMBEDDED) to use the timecodes in your input video. Choose Start at zero (ZEROBASED) to start the first frame at zero. Choose Specified start (SPECIFIEDSTART) to start the first frame at the timecode that you specify in the setting Start timecode (timecodeStart). If you don't specify a value for Timecode source, the service will use Embedded by default. For more information about timecodes, see https://docs.aws.amazon.com/console/mediaconvert/timecode.
 */
@property (nonatomic, assign) AWSmediaconvertInputTimecodeSource timecodeSource;

/**
 Specify the timecode that you want the service to use for this input's initial frame. To use this setting, you must set the Timecode source setting, located under the input settings (InputTimecodeSource), to Specified start (SPECIFIEDSTART). For more information about timecodes, see https://docs.aws.amazon.com/console/mediaconvert/timecode.
 */
@property (nonatomic, strong) NSString * _Nullable timecodeStart;

/**
 Selector for video.
 */
@property (nonatomic, strong) AWSmediaconvertVideoSelector * _Nullable videoSelector;

@end

/**
 Settings that specify how your still graphic overlay appears.
 */
@interface AWSmediaconvertInsertableImage : AWSModel


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
@interface AWSmediaconvertJob : AWSModel


/**
 Accelerated transcoding can significantly speed up jobs with long, visually complex content.
 */
@property (nonatomic, strong) AWSmediaconvertAccelerationSettings * _Nullable accelerationSettings;

/**
 Describes whether the current job is running with accelerated transcoding. For jobs that have Acceleration (AccelerationMode) set to DISABLED, AccelerationStatus is always NOT_APPLICABLE. For jobs that have Acceleration (AccelerationMode) set to ENABLED or PREFERRED, AccelerationStatus is one of the other states. AccelerationStatus is IN_PROGRESS initially, while the service determines whether the input files and job settings are compatible with accelerated transcoding. If they are, AcclerationStatus is ACCELERATED. If your input files and job settings aren't compatible with accelerated transcoding, the service either fails your job or runs it without accelerated transcoding, depending on how you set Acceleration (AccelerationMode). When the service runs your job without accelerated transcoding, AccelerationStatus is NOT_ACCELERATED.
 */
@property (nonatomic, assign) AWSmediaconvertAccelerationStatus accelerationStatus;

/**
 An identifier for this resource that is unique within all of AWS.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The tag type that AWS Billing and Cost Management will use to sort your AWS Elemental MediaConvert costs on any billing report that you set up.
 */
@property (nonatomic, assign) AWSmediaconvertBillingTagsSource billingTagsSource;

/**
 The time, in Unix epoch format in seconds, when the job got created.
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 A job's phase can be PROBING, TRANSCODING OR UPLOADING
 */
@property (nonatomic, assign) AWSmediaconvertJobPhase currentPhase;

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
@property (nonatomic, strong) NSArray<AWSmediaconvertHopDestination *> * _Nullable hopDestinations;

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
@property (nonatomic, strong) AWSmediaconvertJobMessages * _Nullable messages;

/**
 List of output group details
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertOutputGroupDetail *> * _Nullable outputGroupDetails;

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
@property (nonatomic, strong) NSArray<AWSmediaconvertQueueTransition *> * _Nullable queueTransitions;

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
@property (nonatomic, strong) AWSmediaconvertJobSettings * _Nullable settings;

/**
 Enable this setting when you run a test job to estimate how many reserved transcoding slots (RTS) you need. When this is enabled, MediaConvert runs your job from an on-demand queue with similar performance to what you will see with one RTS in a reserved queue. This setting is disabled by default.
 */
@property (nonatomic, assign) AWSmediaconvertSimulateReservedQueue simulateReservedQueue;

/**
 A job's status can be SUBMITTED, PROGRESSING, COMPLETE, CANCELED, or ERROR.
 */
@property (nonatomic, assign) AWSmediaconvertJobStatus status;

/**
 Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the interval, in seconds, between status updates. MediaConvert sends an update at this interval from the time the service begins processing your job to the time it completes the transcode or encounters an error.
 */
@property (nonatomic, assign) AWSmediaconvertStatusUpdateInterval statusUpdateInterval;

/**
 Information about when jobs are submitted, started, and finished is specified in Unix epoch format in seconds.
 */
@property (nonatomic, strong) AWSmediaconvertTiming * _Nullable timing;

/**
 User-defined metadata that you want to associate with an MediaConvert job. You specify metadata in key/value pairs.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable userMetadata;

@end

/**
 Provides messages from the service about jobs that you have already successfully submitted.
 */
@interface AWSmediaconvertJobMessages : AWSModel


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
@interface AWSmediaconvertJobSettings : AWSModel


/**
 When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time.
 */
@property (nonatomic, strong) NSNumber * _Nullable adAvailOffset;

/**
 Settings for ad avail blanking.Video can be blanked or overlaid with an image, and audio muted during SCTE-35 triggered ad avails.
 */
@property (nonatomic, strong) AWSmediaconvertAvailBlanking * _Nullable availBlanking;

/**
 Settings for Event Signaling And Messaging (ESAM).
 */
@property (nonatomic, strong) AWSmediaconvertEsamSettings * _Nullable esam;

/**
 Use Inputs (inputs) to define source file used in the transcode job. There can be multiple inputs add in a job. These inputs will be concantenated together to create the output.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertInput *> * _Nullable inputs;

/**
 Overlay motion graphics on top of your video. The motion graphics that you specify here appear on all outputs in all output groups.
 */
@property (nonatomic, strong) AWSmediaconvertMotionImageInserter * _Nullable motionImageInserter;

/**
 Settings for your Nielsen configuration. If you don't do Nielsen measurement and analytics, ignore these settings. When you enable Nielsen configuration (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all outputs in the job. To enable Nielsen configuration programmatically, include an instance of nielsenConfiguration in your JSON job specification. Even if you don't include any children of nielsenConfiguration, you still enable the setting.
 */
@property (nonatomic, strong) AWSmediaconvertNielsenConfiguration * _Nullable nielsenConfiguration;

/**
 (OutputGroups) contains one group of settings for each set of outputs that share a common package type. All unpackaged files (MPEG-4, MPEG-2 TS, Quicktime, MXF, and no container) are grouped in a single output group as well. Required in (OutputGroups) is a group of settings that apply to the whole group. This required object depends on the value you set for (Type) under (OutputGroups)>(OutputGroupSettings). Type, settings object pairs are as follows. * FILE_GROUP_SETTINGS, FileGroupSettings * HLS_GROUP_SETTINGS, HlsGroupSettings * DASH_ISO_GROUP_SETTINGS, DashIsoGroupSettings * MS_SMOOTH_GROUP_SETTINGS, MsSmoothGroupSettings * CMAF_GROUP_SETTINGS, CmafGroupSettings
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertOutputGroup *> * _Nullable outputGroups;

/**
 Contains settings used to acquire and adjust timecode information from inputs.
 */
@property (nonatomic, strong) AWSmediaconvertTimecodeConfig * _Nullable timecodeConfig;

/**
 Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3 tags in your job. To include timed metadata, you must enable it here, enable it in each output container, and specify tags and timecodes in ID3 insertion (Id3Insertion) objects.
 */
@property (nonatomic, strong) AWSmediaconvertTimedMetadataInsertion * _Nullable timedMetadataInsertion;

@end

/**
 A job template is a pre-made set of encoding instructions that you can use to quickly create a job.
 Required parameters: [Settings, Name]
 */
@interface AWSmediaconvertJobTemplate : AWSModel


/**
 Accelerated transcoding can significantly speed up jobs with long, visually complex content.
 */
@property (nonatomic, strong) AWSmediaconvertAccelerationSettings * _Nullable accelerationSettings;

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
@property (nonatomic, strong) NSArray<AWSmediaconvertHopDestination *> * _Nullable hopDestinations;

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
@property (nonatomic, strong) AWSmediaconvertJobTemplateSettings * _Nullable settings;

/**
 Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the interval, in seconds, between status updates. MediaConvert sends an update at this interval from the time the service begins processing your job to the time it completes the transcode or encounters an error.
 */
@property (nonatomic, assign) AWSmediaconvertStatusUpdateInterval statusUpdateInterval;

/**
 A job template can be of two types: system or custom. System or built-in job templates can't be modified or deleted by the user.
 */
@property (nonatomic, assign) AWSmediaconvertTypes types;

@end

/**
 JobTemplateSettings contains all the transcode settings saved in the template that will be applied to jobs created from it.
 */
@interface AWSmediaconvertJobTemplateSettings : AWSModel


/**
 When specified, this offset (in milliseconds) is added to the input Ad Avail PTS time.
 */
@property (nonatomic, strong) NSNumber * _Nullable adAvailOffset;

/**
 Settings for ad avail blanking.Video can be blanked or overlaid with an image, and audio muted during SCTE-35 triggered ad avails.
 */
@property (nonatomic, strong) AWSmediaconvertAvailBlanking * _Nullable availBlanking;

/**
 Settings for Event Signaling And Messaging (ESAM).
 */
@property (nonatomic, strong) AWSmediaconvertEsamSettings * _Nullable esam;

/**
 Use Inputs (inputs) to define the source file used in the transcode job. There can only be one input in a job template.Using the API, you can include multiple inputs when referencing a job template.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertInputTemplate *> * _Nullable inputs;

/**
 Overlay motion graphics on top of your video. The motion graphics that you specify here appear on all outputs in all output groups.
 */
@property (nonatomic, strong) AWSmediaconvertMotionImageInserter * _Nullable motionImageInserter;

/**
 Settings for your Nielsen configuration. If you don't do Nielsen measurement and analytics, ignore these settings. When you enable Nielsen configuration (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all outputs in the job. To enable Nielsen configuration programmatically, include an instance of nielsenConfiguration in your JSON job specification. Even if you don't include any children of nielsenConfiguration, you still enable the setting.
 */
@property (nonatomic, strong) AWSmediaconvertNielsenConfiguration * _Nullable nielsenConfiguration;

/**
 (OutputGroups) contains one group of settings for each set of outputs that share a common package type. All unpackaged files (MPEG-4, MPEG-2 TS, Quicktime, MXF, and no container) are grouped in a single output group as well. Required in (OutputGroups) is a group of settings that apply to the whole group. This required object depends on the value you set for (Type) under (OutputGroups)>(OutputGroupSettings). Type, settings object pairs are as follows. * FILE_GROUP_SETTINGS, FileGroupSettings * HLS_GROUP_SETTINGS, HlsGroupSettings * DASH_ISO_GROUP_SETTINGS, DashIsoGroupSettings * MS_SMOOTH_GROUP_SETTINGS, MsSmoothGroupSettings * CMAF_GROUP_SETTINGS, CmafGroupSettings
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertOutputGroup *> * _Nullable outputGroups;

/**
 Contains settings used to acquire and adjust timecode information from inputs.
 */
@property (nonatomic, strong) AWSmediaconvertTimecodeConfig * _Nullable timecodeConfig;

/**
 Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3 tags in your job. To include timed metadata, you must enable it here, enable it in each output container, and specify tags and timecodes in ID3 insertion (Id3Insertion) objects.
 */
@property (nonatomic, strong) AWSmediaconvertTimedMetadataInsertion * _Nullable timedMetadataInsertion;

@end

/**
 
 */
@interface AWSmediaconvertListJobTemplatesRequest : AWSRequest


/**
 Optionally, specify a job template category to limit responses to only job templates from that category.
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 Optional. When you request a list of job templates, you can choose to list them alphabetically by NAME or chronologically by CREATION_DATE. If you don't specify, the service will list them by name.
 */
@property (nonatomic, assign) AWSmediaconvertJobTemplateListBy listBy;

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
@property (nonatomic, assign) AWSmediaconvertOrder order;

@end

/**
 
 */
@interface AWSmediaconvertListJobTemplatesResponse : AWSModel


/**
 List of Job templates.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertJobTemplate *> * _Nullable jobTemplates;

/**
 Use this string to request the next batch of job templates.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSmediaconvertListJobsRequest : AWSRequest


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
@property (nonatomic, assign) AWSmediaconvertOrder order;

/**
 Optional. Provide a queue name to get back only jobs from that queue.
 */
@property (nonatomic, strong) NSString * _Nullable queue;

/**
 Optional. A job's status can be SUBMITTED, PROGRESSING, COMPLETE, CANCELED, or ERROR.
 */
@property (nonatomic, assign) AWSmediaconvertJobStatus status;

@end

/**
 
 */
@interface AWSmediaconvertListJobsResponse : AWSModel


/**
 List of jobs
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertJob *> * _Nullable jobs;

/**
 Use this string to request the next batch of jobs.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSmediaconvertListPresetsRequest : AWSRequest


/**
 Optionally, specify a preset category to limit responses to only presets from that category.
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 Optional. When you request a list of presets, you can choose to list them alphabetically by NAME or chronologically by CREATION_DATE. If you don't specify, the service will list them by name.
 */
@property (nonatomic, assign) AWSmediaconvertPresetListBy listBy;

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
@property (nonatomic, assign) AWSmediaconvertOrder order;

@end

/**
 
 */
@interface AWSmediaconvertListPresetsResponse : AWSModel


/**
 Use this string to request the next batch of presets.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 List of presets
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertPreset *> * _Nullable presets;

@end

/**
 
 */
@interface AWSmediaconvertListQueuesRequest : AWSRequest


/**
 Optional. When you request a list of queues, you can choose to list them alphabetically by NAME or chronologically by CREATION_DATE. If you don't specify, the service will list them by creation date.
 */
@property (nonatomic, assign) AWSmediaconvertQueueListBy listBy;

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
@property (nonatomic, assign) AWSmediaconvertOrder order;

@end

/**
 
 */
@interface AWSmediaconvertListQueuesResponse : AWSModel


/**
 Use this string to request the next batch of queues.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 List of queues.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertQueue *> * _Nullable queues;

@end

/**
 
 */
@interface AWSmediaconvertListTagsForResourceRequest : AWSRequest


/**
 The Amazon Resource Name (ARN) of the resource that you want to list tags for. To get the ARN, send a GET request with the resource name.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSmediaconvertListTagsForResourceResponse : AWSModel


/**
 The Amazon Resource Name (ARN) and tags for an AWS Elemental MediaConvert resource.
 */
@property (nonatomic, strong) AWSmediaconvertResourceTags * _Nullable resourceTags;

@end

/**
 Settings for SCTE-35 signals from ESAM. Include this in your job settings to put SCTE-35 markers in your HLS and transport stream outputs at the insertion points that you specify in an ESAM XML document. Provide the document in the setting SCC XML (sccXml).
 */
@interface AWSmediaconvertM2tsScte35Esam : AWSModel


/**
 Packet Identifier (PID) of the SCTE-35 stream in the transport stream generated by ESAM.
 */
@property (nonatomic, strong) NSNumber * _Nullable scte35EsamPid;

@end

/**
 MPEG-2 TS container settings. These apply to outputs in a File output group when the output's container (ContainerType) is MPEG-2 Transport Stream (M2TS). In these assets, data is organized by the program map table (PMT). Each transport stream program contains subsets of data, including audio, video, and metadata. Each of these subsets of data has a numerical label called a packet identifier (PID). Each transport stream program corresponds to one MediaConvert output. The PMT lists the types of data in a program along with their PID. Downstream systems and players use the program map table to look up the PID for each type of data it accesses and then uses the PIDs to locate specific data within the asset.
 */
@interface AWSmediaconvertM2tsSettings : AWSModel


/**
 Selects between the DVB and ATSC buffer models for Dolby Digital audio.
 */
@property (nonatomic, assign) AWSmediaconvertM2tsAudioBufferModel audioBufferModel;

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
@property (nonatomic, assign) AWSmediaconvertM2tsBufferModel bufferModel;

/**
 Inserts DVB Network Information Table (NIT) at the specified table repetition interval.
 */
@property (nonatomic, strong) AWSmediaconvertDvbNitSettings * _Nullable dvbNitSettings;

/**
 Inserts DVB Service Description Table (NIT) at the specified table repetition interval.
 */
@property (nonatomic, strong) AWSmediaconvertDvbSdtSettings * _Nullable dvbSdtSettings;

/**
 Specify the packet identifiers (PIDs) for DVB subtitle data included in this output. Specify multiple PIDs as a JSON array. Default is the range 460-479.
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable dvbSubPids;

/**
 Inserts DVB Time and Date Table (TDT) at the specified table repetition interval.
 */
@property (nonatomic, strong) AWSmediaconvertDvbTdtSettings * _Nullable dvbTdtSettings;

/**
 Specify the packet identifier (PID) for DVB teletext data you include in this output. Default is 499.
 */
@property (nonatomic, strong) NSNumber * _Nullable dvbTeletextPid;

/**
 When set to VIDEO_AND_FIXED_INTERVALS, audio EBP markers will be added to partitions 3 and 4. The interval between these additional markers will be fixed, and will be slightly shorter than the video EBP marker interval. When set to VIDEO_INTERVAL, these additional markers will not be inserted. Only applicable when EBP segmentation markers are is selected (segmentationMarkers is EBP or EBP_LEGACY).
 */
@property (nonatomic, assign) AWSmediaconvertM2tsEbpAudioInterval ebpAudioInterval;

/**
 Selects which PIDs to place EBP markers on. They can either be placed only on the video PID, or on both the video PID and all audio PIDs. Only applicable when EBP segmentation markers are is selected (segmentationMarkers is EBP or EBP_LEGACY).
 */
@property (nonatomic, assign) AWSmediaconvertM2tsEbpPlacement ebpPlacement;

/**
 Controls whether to include the ES Rate field in the PES header.
 */
@property (nonatomic, assign) AWSmediaconvertM2tsEsRateInPes esRateInPes;

/**
 Keep the default value (DEFAULT) unless you know that your audio EBP markers are incorrectly appearing before your video EBP markers. To correct this problem, set this value to Force (FORCE).
 */
@property (nonatomic, assign) AWSmediaconvertM2tsForceTsVideoEbpOrder forceTsVideoEbpOrder;

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
@property (nonatomic, assign) AWSmediaconvertM2tsNielsenId3 nielsenId3;

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
@property (nonatomic, assign) AWSmediaconvertM2tsPcrControl pcrControl;

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
@property (nonatomic, assign) AWSmediaconvertM2tsRateMode rateMode;

/**
 Include this in your job settings to put SCTE-35 markers in your HLS and transport stream outputs at the insertion points that you specify in an ESAM XML document. Provide the document in the setting SCC XML (sccXml).
 */
@property (nonatomic, strong) AWSmediaconvertM2tsScte35Esam * _Nullable scte35Esam;

/**
 Specify the packet identifier (PID) of the SCTE-35 stream in the transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable scte35Pid;

/**
 For SCTE-35 markers from your input-- Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that appear in your input to also appear in this output. Choose None (NONE) if you don't want SCTE-35 markers in this output. For SCTE-35 markers from an ESAM XML document-- Choose None (NONE). Also provide the ESAM XML as a string in the setting Signal processing notification XML (sccXml). Also enable ESAM SCTE-35 (include the property scte35Esam).
 */
@property (nonatomic, assign) AWSmediaconvertM2tsScte35Source scte35Source;

/**
 Inserts segmentation markers at each segmentation_time period. rai_segstart sets the Random Access Indicator bit in the adaptation field. rai_adapt sets the RAI bit and adds the current timecode in the private data bytes. psi_segstart inserts PAT and PMT tables at the start of segments. ebp adds Encoder Boundary Point information to the adaptation field as per OpenCable specification OC-SP-EBP-I01-130118. ebp_legacy adds Encoder Boundary Point information to the adaptation field using a legacy proprietary format.
 */
@property (nonatomic, assign) AWSmediaconvertM2tsSegmentationMarkers segmentationMarkers;

/**
 The segmentation style parameter controls how segmentation markers are inserted into the transport stream. With avails, it is possible that segments may be truncated, which can influence where future segmentation markers are inserted. When a segmentation style of "reset_cadence" is selected and a segment is truncated due to an avail, we will reset the segmentation cadence. This means the subsequent segment will have a duration of of $segmentation_time seconds. When a segmentation style of "maintain_cadence" is selected and a segment is truncated due to an avail, we will not reset the segmentation cadence. This means the subsequent segment will likely be truncated as well. However, all segments after that will have a duration of $segmentation_time seconds. Note that EBP lookahead is a slight exception to this rule.
 */
@property (nonatomic, assign) AWSmediaconvertM2tsSegmentationStyle segmentationStyle;

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
@interface AWSmediaconvertM3u8Settings : AWSModel


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
@property (nonatomic, assign) AWSmediaconvertM3u8NielsenId3 nielsenId3;

/**
 The number of milliseconds between instances of this table in the output transport stream.
 */
@property (nonatomic, strong) NSNumber * _Nullable patInterval;

/**
 When set to PCR_EVERY_PES_PACKET a Program Clock Reference value is inserted for every Packetized Elementary Stream (PES) header. This parameter is effective only when the PCR PID is the same as the video or audio elementary stream.
 */
@property (nonatomic, assign) AWSmediaconvertM3u8PcrControl pcrControl;

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
@property (nonatomic, assign) AWSmediaconvertM3u8Scte35Source scte35Source;

/**
 Applies only to HLS outputs. Use this setting to specify whether the service inserts the ID3 timed metadata from the input in this output.
 */
@property (nonatomic, assign) AWSmediaconvertTimedMetadata timedMetadata;

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
@interface AWSmediaconvertMotionImageInserter : AWSModel


/**
 If your motion graphic asset is a .mov file, keep this setting unspecified. If your motion graphic asset is a series of .png files, specify the frame rate of the overlay in frames per second, as a fraction. For example, specify 24 fps as 24/1. Make sure that the number of images in your series matches the frame rate and your intended overlay duration. For example, if you want a 30-second overlay at 30 fps, you should have 900 .png images. This overlay frame rate doesn't need to match the frame rate of the underlying video.
 */
@property (nonatomic, strong) AWSmediaconvertMotionImageInsertionFramerate * _Nullable framerate;

/**
 Specify the .mov file or series of .png files that you want to overlay on your video. For .png files, provide the file name of the first file in the series. Make sure that the names of the .png files end with sequential numbers that specify the order that they are played in. For example, overlay_000.png, overlay_001.png, overlay_002.png, and so on. The sequence must start at zero, and each image file name must have the same number of digits. Pad your initial file names with enough zeros to complete the sequence. For example, if the first image is overlay_0.png, there can be only 10 images in the sequence, with the last image being overlay_9.png. But if the first image is overlay_00.png, there can be 100 images in the sequence.
 */
@property (nonatomic, strong) NSString * _Nullable input;

/**
 Choose the type of motion graphic asset that you are providing for your overlay. You can choose either a .mov file or a series of .png files.
 */
@property (nonatomic, assign) AWSmediaconvertMotionImageInsertionMode insertionMode;

/**
 Use Offset to specify the placement of your motion graphic overlay on the video frame. Specify in pixels, from the upper-left corner of the frame. If you don't specify an offset, the service scales your overlay to the full size of the frame. Otherwise, the service inserts the overlay at its native resolution and scales the size up or down with any video scaling.
 */
@property (nonatomic, strong) AWSmediaconvertMotionImageInsertionOffset * _Nullable offset;

/**
 Specify whether your motion graphic overlay repeats on a loop or plays only once.
 */
@property (nonatomic, assign) AWSmediaconvertMotionImagePlayback playback;

/**
 Specify when the motion overlay begins. Use timecode format (HH:MM:SS:FF or HH:MM:SS;FF). Make sure that the timecode you provide here takes into account how you have set up your timecode configuration under both job settings and input settings. The simplest way to do that is to set both to start at 0. If you need to set up your job to follow timecodes embedded in your source that don't start at zero, make sure that you specify a start time that is after the first embedded timecode. For more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/setting-up-timecode.html Find job-wide and input timecode configuration settings in your JSON job settings specification at settings>timecodeConfig>source and settings>inputs>timecodeSource.
 */
@property (nonatomic, strong) NSString * _Nullable startTime;

@end

/**
 For motion overlays that don't have a built-in frame rate, specify the frame rate of the overlay in frames per second, as a fraction. For example, specify 24 fps as 24/1. The overlay frame rate doesn't need to match the frame rate of the underlying video.
 */
@interface AWSmediaconvertMotionImageInsertionFramerate : AWSModel


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
@interface AWSmediaconvertMotionImageInsertionOffset : AWSModel


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
@interface AWSmediaconvertMovSettings : AWSModel


/**
 When enabled, include 'clap' atom if appropriate for the video output settings.
 */
@property (nonatomic, assign) AWSmediaconvertMovClapAtom clapAtom;

/**
 When enabled, file composition times will start at zero, composition times in the 'ctts' (composition time to sample) box for B-frames will be negative, and a 'cslg' (composition shift least greatest) box will be included per 14496-1 amendment 1. This improves compatibility with Apple players and tools.
 */
@property (nonatomic, assign) AWSmediaconvertMovCslgAtom cslgAtom;

/**
 When set to XDCAM, writes MPEG2 video streams into the QuickTime file using XDCAM fourcc codes. This increases compatibility with Apple editors and players, but may decrease compatibility with other players. Only applicable when the video codec is MPEG2.
 */
@property (nonatomic, assign) AWSmediaconvertMovMpeg2FourCCControl mpeg2FourCCControl;

/**
 If set to OMNEON, inserts Omneon-compatible padding
 */
@property (nonatomic, assign) AWSmediaconvertMovPaddingControl paddingControl;

/**
 Always keep the default value (SELF_CONTAINED) for this setting.
 */
@property (nonatomic, assign) AWSmediaconvertMovReference reference;

@end

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value MP2.
 */
@interface AWSmediaconvertMp2Settings : AWSModel


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
@interface AWSmediaconvertMp3Settings : AWSModel


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
@property (nonatomic, assign) AWSmediaconvertMp3RateControlMode rateControlMode;

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
@interface AWSmediaconvertMp4Settings : AWSModel


/**
 When enabled, file composition times will start at zero, composition times in the 'ctts' (composition time to sample) box for B-frames will be negative, and a 'cslg' (composition shift least greatest) box will be included per 14496-1 amendment 1. This improves compatibility with Apple players and tools.
 */
@property (nonatomic, assign) AWSmediaconvertMp4CslgAtom cslgAtom;

/**
 Ignore this setting unless compliance to the CTTS box version specification matters in your workflow. Specify a value of 1 to set your CTTS box version to 1 and make your output compliant with the specification. When you specify a value of 1, you must also set CSLG atom (cslgAtom) to the value INCLUDE. Keep the default value 0 to set your CTTS box version to 0. This can provide backward compatibility for some players and packagers.
 */
@property (nonatomic, strong) NSNumber * _Nullable cttsVersion;

/**
 Inserts a free-space box immediately after the moov box.
 */
@property (nonatomic, assign) AWSmediaconvertMp4FreeSpaceBox freeSpaceBox;

/**
 If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the beginning of the archive as required for progressive downloading. Otherwise it is placed normally at the end.
 */
@property (nonatomic, assign) AWSmediaconvertMp4MoovPlacement moovPlacement;

/**
 Overrides the "Major Brand" field in the output file. Usually not necessary to specify.
 */
@property (nonatomic, strong) NSString * _Nullable mp4MajorBrand;

@end

/**
 Settings for MP4 segments in DASH
 */
@interface AWSmediaconvertMpdSettings : AWSModel


/**
 Use this setting only in DASH output groups that include sidecar TTML or IMSC captions.You specify sidecar captions in a separate output from your audio and video. Choose Raw (RAW) for captions in a single XML file in a raw container. Choose Fragmented MPEG-4 (FRAGMENTED_MP4) for captions in XML format contained within fragmented MP4 files. This set of fragmented MP4 files is separate from your video and audio fragmented MP4 files.
 */
@property (nonatomic, assign) AWSmediaconvertMpdCaptionContainerType captionContainerType;

/**
 Use this setting only when you specify SCTE-35 markers from ESAM. Choose INSERT to put SCTE-35 markers in this output at the insertion points that you specify in an ESAM XML document. Provide the document in the setting SCC XML (sccXml).
 */
@property (nonatomic, assign) AWSmediaconvertMpdScte35Esam scte35Esam;

/**
 Ignore this setting unless you have SCTE-35 markers in your input video file. Choose Passthrough (PASSTHROUGH) if you want SCTE-35 markers that appear in your input to also appear in this output. Choose None (NONE) if you don't want those SCTE-35 markers in this output.
 */
@property (nonatomic, assign) AWSmediaconvertMpdScte35Source scte35Source;

@end

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value MPEG2.
 */
@interface AWSmediaconvertMpeg2Settings : AWSModel


/**
 Adaptive quantization. Allows intra-frame quantizers to vary to improve visual quality.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2AdaptiveQuantization adaptiveQuantization;

/**
 Specify the average bitrate in bits per second. Required for VBR and CBR. For MS Smooth outputs, bitrates must be unique when rounded down to the nearest multiple of 1000.
 */
@property (nonatomic, strong) NSNumber * _Nullable bitrate;

/**
 Use Level (Mpeg2CodecLevel) to set the MPEG-2 level for the video output.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2CodecLevel codecLevel;

/**
 Use Profile (Mpeg2CodecProfile) to set the MPEG-2 profile for the video output.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2CodecProfile codecProfile;

/**
 Choose Adaptive to improve subjective video quality for high-motion content. This will cause the service to use fewer B-frames (which infer information based on other frames) for high-motion portions of the video and more B-frames for low-motion portions. The maximum number of B-frames is limited by the value you provide for the setting B frames between reference frames (numberBFramesBetweenReferenceFrames).
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2DynamicSubGop dynamicSubGop;

/**
 If you are using the console, use the Framerate setting to specify the frame rate for this output. If you want to keep the same frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction. If you are creating your transcoding job sepecification as a JSON file without the console, use FramerateControl to specify which value the service uses for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the settings FramerateNumerator and FramerateDenominator.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2FramerateControl framerateControl;

/**
 When set to INTERPOLATE, produces smoother motion during frame rate conversion.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2FramerateConversionAlgorithm framerateConversionAlgorithm;

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
@property (nonatomic, assign) AWSmediaconvertMpeg2GopSizeUnits gopSizeUnits;

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
@property (nonatomic, assign) AWSmediaconvertMpeg2InterlaceMode interlaceMode;

/**
 Use Intra DC precision (Mpeg2IntraDcPrecision) to set quantization precision for intra-block DC coefficients. If you choose the value auto, the service will automatically select the precision based on the per-frame compression ratio.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2IntraDcPrecision intraDcPrecision;

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
 Using the API, enable ParFollowSource if you want the service to use the pixel aspect ratio from the input. Using the console, do this by choosing Follow source for Pixel aspect ratio.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2ParControl parControl;

/**
 Pixel Aspect Ratio denominator.
 */
@property (nonatomic, strong) NSNumber * _Nullable parDenominator;

/**
 Pixel Aspect Ratio numerator.
 */
@property (nonatomic, strong) NSNumber * _Nullable parNumerator;

/**
 Use Quality tuning level (Mpeg2QualityTuningLevel) to specifiy whether to use single-pass or multipass video encoding.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2QualityTuningLevel qualityTuningLevel;

/**
 Use Rate control mode (Mpeg2RateControlMode) to specifiy whether the bitrate is variable (vbr) or constant (cbr).
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2RateControlMode rateControlMode;

/**
 Enable this setting to insert I-frames at scene changes that the service automatically detects. This improves video quality and is enabled by default.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2SceneChangeDetect sceneChangeDetect;

/**
 Enables Slow PAL rate conversion. 23.976fps and 24fps input is relabeled as 25fps, and audio is sped up correspondingly.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2SlowPal slowPal;

/**
 Softness. Selects quantizer matrix, larger values reduce high-frequency content in the encoded image.
 */
@property (nonatomic, strong) NSNumber * _Nullable softness;

/**
 Adjust quantization within each frame based on spatial variation of content complexity.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2SpatialAdaptiveQuantization spatialAdaptiveQuantization;

/**
 Produces a Type D-10 compatible bitstream (SMPTE 356M-2001).
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2Syntax syntax;

/**
 Only use Telecine (Mpeg2Telecine) when you set Framerate (Framerate) to 29.970. Set Telecine (Mpeg2Telecine) to Hard (hard) to produce a 29.97i output from a 23.976 input. Set it to Soft (soft) to produce 23.976 output and leave converstion to the player.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2Telecine telecine;

/**
 Adjust quantization within each frame based on temporal variation of content complexity.
 */
@property (nonatomic, assign) AWSmediaconvertMpeg2TemporalAdaptiveQuantization temporalAdaptiveQuantization;

@end

/**
 Specify the details for each additional Microsoft Smooth Streaming manifest that you want the service to generate for this output group. Each manifest can reference a different subset of outputs in the group.
 */
@interface AWSmediaconvertMsSmoothAdditionalManifest : AWSModel


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
@interface AWSmediaconvertMsSmoothEncryptionSettings : AWSModel


/**
 If your output group type is HLS, DASH, or Microsoft Smooth, use these settings when doing DRM encryption with a SPEKE-compliant key provider.If your output group type is CMAF, use the SpekeKeyProviderCmaf settings instead.
 */
@property (nonatomic, strong) AWSmediaconvertSpekeKeyProvider * _Nullable spekeKeyProvider;

@end

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to MS_SMOOTH_GROUP_SETTINGS.
 */
@interface AWSmediaconvertMsSmoothGroupSettings : AWSModel


/**
 By default, the service creates one .ism Microsoft Smooth Streaming manifest for each Microsoft Smooth Streaming output group in your job. This default manifest references every output in the output group. To create additional manifests that reference a subset of the outputs in the output group, specify a list of them here.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertMsSmoothAdditionalManifest *> * _Nullable additionalManifests;

/**
 COMBINE_DUPLICATE_STREAMS combines identical audio encoding settings across a Microsoft Smooth output group into a single audio stream.
 */
@property (nonatomic, assign) AWSmediaconvertMsSmoothAudioDeduplication audioDeduplication;

/**
 Use Destination (Destination) to specify the S3 output location and the output filename base. Destination accepts format identifiers. If you do not specify the base filename in the URI, the service will use the filename of the input file. If your job has multiple inputs, the service uses the filename of the first input file.
 */
@property (nonatomic, strong) NSString * _Nullable destination;

/**
 Settings associated with the destination. Will vary based on the type of destination
 */
@property (nonatomic, strong) AWSmediaconvertDestinationSettings * _Nullable destinationSettings;

/**
 If you are using DRM, set DRM System (MsSmoothEncryptionSettings) to specify the value SpekeKeyProvider.
 */
@property (nonatomic, strong) AWSmediaconvertMsSmoothEncryptionSettings * _Nullable encryption;

/**
 Use Fragment length (FragmentLength) to specify the mp4 fragment sizes in seconds. Fragment length must be compatible with GOP size and frame rate.
 */
@property (nonatomic, strong) NSNumber * _Nullable fragmentLength;

/**
 Use Manifest encoding (MsSmoothManifestEncoding) to specify the encoding format for the server and client manifest. Valid options are utf8 and utf16.
 */
@property (nonatomic, assign) AWSmediaconvertMsSmoothManifestEncoding manifestEncoding;

@end

/**
 Settings for your Nielsen configuration. If you don't do Nielsen measurement and analytics, ignore these settings. When you enable Nielsen configuration (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all outputs in the job. To enable Nielsen configuration programmatically, include an instance of nielsenConfiguration in your JSON job specification. Even if you don't include any children of nielsenConfiguration, you still enable the setting.
 */
@interface AWSmediaconvertNielsenConfiguration : AWSModel


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
@interface AWSmediaconvertNoiseReducer : AWSModel


/**
 Use Noise reducer filter (NoiseReducerFilter) to select one of the following spatial image filtering functions. To use this setting, you must also enable Noise reducer (NoiseReducer). * Bilateral preserves edges while reducing noise. * Mean (softest), Gaussian, Lanczos, and Sharpen (sharpest) do convolution filtering. * Conserve does min/max noise reduction. * Spatial does frequency-domain filtering based on JND principles. * Temporal optimizes video quality for complex motion.
 */
@property (nonatomic, assign) AWSmediaconvertNoiseReducerFilter filter;

/**
 Settings for a noise reducer filter
 */
@property (nonatomic, strong) AWSmediaconvertNoiseReducerFilterSettings * _Nullable filterSettings;

/**
 Noise reducer filter settings for spatial filter.
 */
@property (nonatomic, strong) AWSmediaconvertNoiseReducerSpatialFilterSettings * _Nullable spatialFilterSettings;

/**
 Noise reducer filter settings for temporal filter.
 */
@property (nonatomic, strong) AWSmediaconvertNoiseReducerTemporalFilterSettings * _Nullable temporalFilterSettings;

@end

/**
 Settings for a noise reducer filter
 */
@interface AWSmediaconvertNoiseReducerFilterSettings : AWSModel


/**
 Relative strength of noise reducing filter. Higher values produce stronger filtering.
 */
@property (nonatomic, strong) NSNumber * _Nullable strength;

@end

/**
 Noise reducer filter settings for spatial filter.
 */
@interface AWSmediaconvertNoiseReducerSpatialFilterSettings : AWSModel


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
@interface AWSmediaconvertNoiseReducerTemporalFilterSettings : AWSModel


/**
 Use Aggressive mode for content that has complex motion. Higher values produce stronger temporal filtering. This filters highly complex scenes more aggressively and creates better VQ for low bitrate outputs.
 */
@property (nonatomic, strong) NSNumber * _Nullable aggressiveMode;

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
 An output object describes the settings for a single output file or stream in an output group.
 */
@interface AWSmediaconvertOutput : AWSModel


/**
 (AudioDescriptions) contains groups of audio encoding settings organized by audio codec. Include one instance of (AudioDescriptions) per output. (AudioDescriptions) can contain multiple groups of encoding settings.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertAudioDescription *> * _Nullable audioDescriptions;

/**
 (CaptionDescriptions) contains groups of captions settings. For each output that has captions, include one instance of (CaptionDescriptions). (CaptionDescriptions) can contain multiple groups of captions settings.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertCaptionDescription *> * _Nullable captionDescriptions;

/**
 Container specific settings.
 */
@property (nonatomic, strong) AWSmediaconvertContainerSettings * _Nullable containerSettings;

/**
 Use Extension (Extension) to specify the file extension for outputs in File output groups. If you do not specify a value, the service will use default extensions by container type as follows * MPEG-2 transport stream, m2ts * Quicktime, mov * MXF container, mxf * MPEG-4 container, mp4 * No Container, the service will use codec extensions (e.g. AAC, H265, H265, AC3)
 */
@property (nonatomic, strong) NSString * _Nullable extension;

/**
 Use Name modifier (NameModifier) to have the service add a string to the end of each output filename. You specify the base filename as part of your destination URI. When you create multiple outputs in the same output group, Name modifier (NameModifier) is required. Name modifier also accepts format identifiers. For DASH ISO outputs, if you use the format identifiers $Number$ or $Time$ in one output, you must use them in the same way in all outputs of the output group.
 */
@property (nonatomic, strong) NSString * _Nullable nameModifier;

/**
 Specific settings for this type of output.
 */
@property (nonatomic, strong) AWSmediaconvertOutputSettings * _Nullable outputSettings;

/**
 Use Preset (Preset) to specifiy a preset for your transcoding settings. Provide the system or custom preset name. You can specify either Preset (Preset) or Container settings (ContainerSettings), but not both.
 */
@property (nonatomic, strong) NSString * _Nullable preset;

/**
 (VideoDescription) contains a group of video encoding settings. The specific video settings depend on the video codec that you choose when you specify a value for Video codec (codec). Include one instance of (VideoDescription) per output.
 */
@property (nonatomic, strong) AWSmediaconvertVideoDescription * _Nullable videoDescription;

@end

/**
 OutputChannel mapping settings.
 */
@interface AWSmediaconvertOutputChannelMapping : AWSModel


/**
 List of input channels
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable inputChannels;

@end

/**
 Details regarding output
 */
@interface AWSmediaconvertOutputDetail : AWSModel


/**
 Duration in milliseconds
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInMs;

/**
 Contains details about the output's video stream
 */
@property (nonatomic, strong) AWSmediaconvertVideoDetail * _Nullable videoDetails;

@end

/**
 Group of outputs
 */
@interface AWSmediaconvertOutputGroup : AWSModel


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
@property (nonatomic, strong) AWSmediaconvertOutputGroupSettings * _Nullable outputGroupSettings;

/**
 This object holds groups of encoding settings, one group of settings per output.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertOutput *> * _Nullable outputs;

@end

/**
 Contains details about the output groups specified in the job settings.
 */
@interface AWSmediaconvertOutputGroupDetail : AWSModel


/**
 Details about the output
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertOutputDetail *> * _Nullable outputDetails;

@end

/**
 Output Group settings, including type
 */
@interface AWSmediaconvertOutputGroupSettings : AWSModel


/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to CMAF_GROUP_SETTINGS. Each output in a CMAF Output Group may only contain a single video, audio, or caption output.
 */
@property (nonatomic, strong) AWSmediaconvertCmafGroupSettings * _Nullable cmafGroupSettings;

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to DASH_ISO_GROUP_SETTINGS.
 */
@property (nonatomic, strong) AWSmediaconvertDashIsoGroupSettings * _Nullable dashIsoGroupSettings;

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to FILE_GROUP_SETTINGS.
 */
@property (nonatomic, strong) AWSmediaconvertFileGroupSettings * _Nullable fileGroupSettings;

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to HLS_GROUP_SETTINGS.
 */
@property (nonatomic, strong) AWSmediaconvertHlsGroupSettings * _Nullable hlsGroupSettings;

/**
 Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to MS_SMOOTH_GROUP_SETTINGS.
 */
@property (nonatomic, strong) AWSmediaconvertMsSmoothGroupSettings * _Nullable msSmoothGroupSettings;

/**
 Type of output group (File group, Apple HLS, DASH ISO, Microsoft Smooth Streaming, CMAF)
 */
@property (nonatomic, assign) AWSmediaconvertOutputGroupType types;

@end

/**
 Specific settings for this type of output.
 */
@interface AWSmediaconvertOutputSettings : AWSModel


/**
 Settings for HLS output groups
 */
@property (nonatomic, strong) AWSmediaconvertHlsSettings * _Nullable hlsSettings;

@end

/**
 A preset is a collection of preconfigured media conversion settings that you want MediaConvert to apply to the output during the conversion process.
 Required parameters: [Settings, Name]
 */
@interface AWSmediaconvertPreset : AWSModel


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
@property (nonatomic, strong) AWSmediaconvertPresetSettings * _Nullable settings;

/**
 A preset can be of two types: system or custom. System or built-in preset can't be modified or deleted by the user.
 */
@property (nonatomic, assign) AWSmediaconvertTypes types;

@end

/**
 Settings for preset
 */
@interface AWSmediaconvertPresetSettings : AWSModel


/**
 (AudioDescriptions) contains groups of audio encoding settings organized by audio codec. Include one instance of (AudioDescriptions) per output. (AudioDescriptions) can contain multiple groups of encoding settings.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertAudioDescription *> * _Nullable audioDescriptions;

/**
 Caption settings for this preset. There can be multiple caption settings in a single output.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertCaptionDescriptionPreset *> * _Nullable captionDescriptions;

/**
 Container specific settings.
 */
@property (nonatomic, strong) AWSmediaconvertContainerSettings * _Nullable containerSettings;

/**
 (VideoDescription) contains a group of video encoding settings. The specific video settings depend on the video codec that you choose when you specify a value for Video codec (codec). Include one instance of (VideoDescription) per output.
 */
@property (nonatomic, strong) AWSmediaconvertVideoDescription * _Nullable videoDescription;

@end

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value PRORES.
 */
@interface AWSmediaconvertProresSettings : AWSModel


/**
 Use Profile (ProResCodecProfile) to specifiy the type of Apple ProRes codec to use for this output.
 */
@property (nonatomic, assign) AWSmediaconvertProresCodecProfile codecProfile;

/**
 If you are using the console, use the Framerate setting to specify the frame rate for this output. If you want to keep the same frame rate as the input video, choose Follow source. If you want to do frame rate conversion, choose a frame rate from the dropdown list or choose Custom. The framerates shown in the dropdown list are decimal approximations of fractions. If you choose Custom, specify your frame rate as a fraction. If you are creating your transcoding job sepecification as a JSON file without the console, use FramerateControl to specify which value the service uses for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from the input. Choose SPECIFIED if you want the service to use the frame rate you specify in the settings FramerateNumerator and FramerateDenominator.
 */
@property (nonatomic, assign) AWSmediaconvertProresFramerateControl framerateControl;

/**
 When set to INTERPOLATE, produces smoother motion during frame rate conversion.
 */
@property (nonatomic, assign) AWSmediaconvertProresFramerateConversionAlgorithm framerateConversionAlgorithm;

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
@property (nonatomic, assign) AWSmediaconvertProresInterlaceMode interlaceMode;

/**
 Use (ProresParControl) to specify how the service determines the pixel aspect ratio. Set to Follow source (INITIALIZE_FROM_SOURCE) to use the pixel aspect ratio from the input.To specify a different pixel aspect ratio: Using the console, choose it from the dropdown menu. Using the API, set ProresParControl to (SPECIFIED) and providefor (ParNumerator) and (ParDenominator).
 */
@property (nonatomic, assign) AWSmediaconvertProresParControl parControl;

/**
 Pixel Aspect Ratio denominator.
 */
@property (nonatomic, strong) NSNumber * _Nullable parDenominator;

/**
 Pixel Aspect Ratio numerator.
 */
@property (nonatomic, strong) NSNumber * _Nullable parNumerator;

/**
 Enables Slow PAL rate conversion. 23.976fps and 24fps input is relabeled as 25fps, and audio is sped up correspondingly.
 */
@property (nonatomic, assign) AWSmediaconvertProresSlowPal slowPal;

/**
 Only use Telecine (ProresTelecine) when you set Framerate (Framerate) to 29.970. Set Telecine (ProresTelecine) to Hard (hard) to produce a 29.97i output from a 23.976 input. Set it to Soft (soft) to produce 23.976 output and leave converstion to the player.
 */
@property (nonatomic, assign) AWSmediaconvertProresTelecine telecine;

@end

/**
 You can use queues to manage the resources that are available to your AWS account for running multiple transcoding jobs at the same time. If you don't specify a queue, the service sends all jobs through the default queue. For more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
 Required parameters: [Name]
 */
@interface AWSmediaconvertQueue : AWSModel


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
@property (nonatomic, assign) AWSmediaconvertPricingPlan pricingPlan;

/**
 The estimated number of jobs with a PROGRESSING status.
 */
@property (nonatomic, strong) NSNumber * _Nullable progressingJobsCount;

/**
 Details about the pricing plan for your reserved queue. Required for reserved queues and not applicable to on-demand queues.
 */
@property (nonatomic, strong) AWSmediaconvertReservationPlan * _Nullable reservationPlan;

/**
 Queues can be ACTIVE or PAUSED. If you pause a queue, the service won't begin processing jobs in that queue. Jobs that are running when you pause the queue continue to run until they finish or result in an error.
 */
@property (nonatomic, assign) AWSmediaconvertQueueStatus status;

/**
 The estimated number of jobs with a SUBMITTED status.
 */
@property (nonatomic, strong) NSNumber * _Nullable submittedJobsCount;

/**
 Specifies whether this on-demand queue is system or custom. System queues are built in. You can't modify or delete system queues. You can create and modify custom queues.
 */
@property (nonatomic, assign) AWSmediaconvertTypes types;

@end

/**
 Description of the source and destination queues between which the job has moved, along with the timestamp of the move
 */
@interface AWSmediaconvertQueueTransition : AWSModel


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
@interface AWSmediaconvertRectangle : AWSModel


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
@interface AWSmediaconvertRemixSettings : AWSModel


/**
 Channel mapping (ChannelMapping) contains the group of fields that hold the remixing value for each channel. Units are in dB. Acceptable values are within the range from -60 (mute) through 6. A setting of 0 passes the input channel unchanged to the output channel (no attenuation or amplification).
 */
@property (nonatomic, strong) AWSmediaconvertChannelMapping * _Nullable channelMapping;

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
@interface AWSmediaconvertReservationPlan : AWSModel


/**
 The length of the term of your reserved queue pricing plan commitment.
 */
@property (nonatomic, assign) AWSmediaconvertCommitment commitment;

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
@property (nonatomic, assign) AWSmediaconvertRenewalType renewalType;

/**
 Specifies the number of reserved transcode slots (RTS) for this queue. The number of RTS determines how many jobs the queue can process in parallel; each RTS can process one job at a time. When you increase this number, you extend your existing commitment with a new 12-month commitment for a larger number of RTS. The new commitment begins when you purchase the additional capacity. You can't decrease the number of RTS in your reserved queue.
 */
@property (nonatomic, strong) NSNumber * _Nullable reservedSlots;

/**
 Specifies whether the pricing plan for your reserved queue is ACTIVE or EXPIRED.
 */
@property (nonatomic, assign) AWSmediaconvertReservationPlanStatus status;

@end

/**
 Details about the pricing plan for your reserved queue. Required for reserved queues and not applicable to on-demand queues.
 Required parameters: [Commitment, ReservedSlots, RenewalType]
 */
@interface AWSmediaconvertReservationPlanSettings : AWSModel


/**
 The length of the term of your reserved queue pricing plan commitment.
 */
@property (nonatomic, assign) AWSmediaconvertCommitment commitment;

/**
 Specifies whether the term of your reserved queue pricing plan is automatically extended (AUTO_RENEW) or expires (EXPIRE) at the end of the term. When your term is auto renewed, you extend your commitment by 12 months from the auto renew date. You can cancel this commitment.
 */
@property (nonatomic, assign) AWSmediaconvertRenewalType renewalType;

/**
 Specifies the number of reserved transcode slots (RTS) for this queue. The number of RTS determines how many jobs the queue can process in parallel; each RTS can process one job at a time. You can't decrease the number of RTS in your reserved queue. You can increase the number of RTS by extending your existing commitment with a new 12-month commitment for the larger number. The new commitment begins when you purchase the additional capacity. You can't cancel your commitment or revert to your original commitment after you increase the capacity.
 */
@property (nonatomic, strong) NSNumber * _Nullable reservedSlots;

@end

/**
 The Amazon Resource Name (ARN) and tags for an AWS Elemental MediaConvert resource.
 */
@interface AWSmediaconvertResourceTags : AWSModel


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
@interface AWSmediaconvertS3DestinationAccessControl : AWSModel


/**
 Choose an Amazon S3 canned ACL for MediaConvert to apply to this output.
 */
@property (nonatomic, assign) AWSmediaconvertS3ObjectCannedAcl cannedAcl;

@end

/**
 Settings associated with S3 destination
 */
@interface AWSmediaconvertS3DestinationSettings : AWSModel


/**
 Optional. Have MediaConvert automatically apply Amazon S3 access control for the outputs in this output group. When you don't use this setting, S3 automatically applies the default access control list PRIVATE.
 */
@property (nonatomic, strong) AWSmediaconvertS3DestinationAccessControl * _Nullable accessControl;

/**
 Settings for how your job outputs are encrypted as they are uploaded to Amazon S3.
 */
@property (nonatomic, strong) AWSmediaconvertS3EncryptionSettings * _Nullable encryption;

@end

/**
 Settings for how your job outputs are encrypted as they are uploaded to Amazon S3.
 */
@interface AWSmediaconvertS3EncryptionSettings : AWSModel


/**
 Specify how you want your data keys managed. AWS uses data keys to encrypt your content. AWS also encrypts the data keys themselves, using a customer master key (CMK), and then stores the encrypted data keys alongside your encrypted content. Use this setting to specify which AWS service manages the CMK. For simplest set up, choose Amazon S3 (SERVER_SIDE_ENCRYPTION_S3). If you want your master key to be managed by AWS Key Management Service (KMS), choose AWS KMS (SERVER_SIDE_ENCRYPTION_KMS). By default, when you choose AWS KMS, KMS uses the AWS managed customer master key (CMK) associated with Amazon S3 to encrypt your data keys. You can optionally choose to specify a different, customer managed CMK. Do so by specifying the Amazon Resource Name (ARN) of the key for the settingKMS ARN (kmsKeyArn).
 */
@property (nonatomic, assign) AWSmediaconvertS3ServerSideEncryptionType encryptionType;

/**
 Optionally, specify the customer master key (CMK) that you want to use to encrypt the data key that AWS uses to encrypt your output content. Enter the Amazon Resource Name (ARN) of the CMK. To use this setting, you must also set Server-side encryption (S3ServerSideEncryptionType) to AWS KMS (SERVER_SIDE_ENCRYPTION_KMS). If you set Server-side encryption to AWS KMS but don't specify a CMK here, AWS uses the AWS managed CMK associated with Amazon S3.
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

@end

/**
 Settings for SCC caption output.
 */
@interface AWSmediaconvertSccDestinationSettings : AWSModel


/**
 Set Framerate (SccDestinationFramerate) to make sure that the captions and the video are synchronized in the output. Specify a frame rate that matches the frame rate of the associated video. If the video frame rate is 29.97, choose 29.97 dropframe (FRAMERATE_29_97_DROPFRAME) only if the video has video_insertion=true and drop_frame_timecode=true; otherwise, choose 29.97 non-dropframe (FRAMERATE_29_97_NON_DROPFRAME).
 */
@property (nonatomic, assign) AWSmediaconvertSccDestinationFramerate framerate;

@end

/**
 If your output group type is HLS, DASH, or Microsoft Smooth, use these settings when doing DRM encryption with a SPEKE-compliant key provider.If your output group type is CMAF, use the SpekeKeyProviderCmaf settings instead.
 */
@interface AWSmediaconvertSpekeKeyProvider : AWSModel


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
@interface AWSmediaconvertSpekeKeyProviderCmaf : AWSModel


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
@interface AWSmediaconvertStaticKeyProvider : AWSModel


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
@interface AWSmediaconvertTagResourceRequest : AWSRequest


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
@interface AWSmediaconvertTagResourceResponse : AWSModel


@end

/**
 Settings for Teletext caption output
 */
@interface AWSmediaconvertTeletextDestinationSettings : AWSModel


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
@interface AWSmediaconvertTeletextSourceSettings : AWSModel


/**
 Use Page Number (PageNumber) to specify the three-digit hexadecimal page number that will be used for Teletext captions. Do not use this setting if you are passing through teletext from the input source to output.
 */
@property (nonatomic, strong) NSString * _Nullable pageNumber;

@end

/**
 Timecode burn-in (TimecodeBurnIn)--Burns the output timecode and specified prefix into the output.
 */
@interface AWSmediaconvertTimecodeBurnin : AWSModel


/**
 Use Font Size (FontSize) to set the font size of any burned-in timecode. Valid values are 10, 16, 32, 48.
 */
@property (nonatomic, strong) NSNumber * _Nullable fontSize;

/**
 Use Position (Position) under under Timecode burn-in (TimecodeBurnIn) to specify the location the burned-in timecode on output video.
 */
@property (nonatomic, assign) AWSmediaconvertTimecodeBurninPosition position;

/**
 Use Prefix (Prefix) to place ASCII characters before any burned-in timecode. For example, a prefix of "EZ-" will result in the timecode "EZ-00:00:00:00". Provide either the characters themselves or the ASCII code equivalents. The supported range of characters is 0x20 through 0x7e. This includes letters, numbers, and all special characters represented on a standard English keyboard.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 These settings control how the service handles timecodes throughout the job. These settings don't affect input clipping.
 */
@interface AWSmediaconvertTimecodeConfig : AWSModel


/**
 If you use an editing platform that relies on an anchor timecode, use Anchor Timecode (Anchor) to specify a timecode that will match the input video frame to the output video frame. Use 24-hour format with frame number, (HH:MM:SS:FF) or (HH:MM:SS;FF). This setting ignores frame rate conversion. System behavior for Anchor Timecode varies depending on your setting for Source (TimecodeSource). * If Source (TimecodeSource) is set to Specified Start (SPECIFIEDSTART), the first input frame is the specified value in Start Timecode (Start). Anchor Timecode (Anchor) and Start Timecode (Start) are used calculate output timecode. * If Source (TimecodeSource) is set to Start at 0 (ZEROBASED)thefirst frame is 00:00:00:00. * If Source (TimecodeSource) is set to Embedded (EMBEDDED), thefirst frame is the timecode value on the first input frame of the input.
 */
@property (nonatomic, strong) NSString * _Nullable anchor;

/**
 Use Source (TimecodeSource) to set how timecodes are handled within this job. To make sure that your video, audio, captions, and markers are synchronized and that time-based features, such as image inserter, work correctly, choose the Timecode source option that matches your assets. All timecodes are in a 24-hour format with frame number (HH:MM:SS:FF). * Embedded (EMBEDDED) - Use the timecode that is in the input video. If no embedded timecode is in the source, the service will use Start at 0 (ZEROBASED) instead. * Start at 0 (ZEROBASED) - Set the timecode of the initial frame to 00:00:00:00. * Specified Start (SPECIFIEDSTART) - Set the timecode of the initial frame to a value other than zero. You use Start timecode (Start) to provide this value.
 */
@property (nonatomic, assign) AWSmediaconvertTimecodeSource source;

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
@interface AWSmediaconvertTimedMetadataInsertion : AWSModel


/**
 Id3Insertions contains the array of Id3Insertion instances.
 */
@property (nonatomic, strong) NSArray<AWSmediaconvertId3Insertion *> * _Nullable id3Insertions;

@end

/**
 Information about when jobs are submitted, started, and finished is specified in Unix epoch format in seconds.
 */
@interface AWSmediaconvertTiming : AWSModel


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
@interface AWSmediaconvertTrackSourceSettings : AWSModel


/**
 Use this setting to select a single captions track from a source. Track numbers correspond to the order in the captions source file. For IMF sources, track numbering is based on the order that the captions appear in the CPL. For example, use 1 to select the captions asset that is listed first in the CPL. To include more than one captions track in your job outputs, create multiple input captions selectors. Specify one track per selector.
 */
@property (nonatomic, strong) NSNumber * _Nullable trackNumber;

@end

/**
 Settings specific to TTML caption outputs, including Pass style information (TtmlStylePassthrough).
 */
@interface AWSmediaconvertTtmlDestinationSettings : AWSModel


/**
 Pass through style and position information from a TTML-like input source (TTML, SMPTE-TT, CFF-TT) to the CFF-TT output or TTML output.
 */
@property (nonatomic, assign) AWSmediaconvertTtmlStylePassthrough stylePassthrough;

@end

/**
 
 */
@interface AWSmediaconvertUntagResourceRequest : AWSRequest


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
@interface AWSmediaconvertUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSmediaconvertUpdateJobTemplateRequest : AWSRequest


/**
 Accelerated transcoding can significantly speed up jobs with long, visually complex content. Outputs that use this feature incur pro-tier pricing. For information about feature limitations, see the AWS Elemental MediaConvert User Guide.
 */
@property (nonatomic, strong) AWSmediaconvertAccelerationSettings * _Nullable accelerationSettings;

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
@property (nonatomic, strong) NSArray<AWSmediaconvertHopDestination *> * _Nullable hopDestinations;

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
@property (nonatomic, strong) AWSmediaconvertJobTemplateSettings * _Nullable settings;

/**
 Specify how often MediaConvert sends STATUS_UPDATE events to Amazon CloudWatch Events. Set the interval, in seconds, between status updates. MediaConvert sends an update at this interval from the time the service begins processing your job to the time it completes the transcode or encounters an error.
 */
@property (nonatomic, assign) AWSmediaconvertStatusUpdateInterval statusUpdateInterval;

@end

/**
 
 */
@interface AWSmediaconvertUpdateJobTemplateResponse : AWSModel


/**
 A job template is a pre-made set of encoding instructions that you can use to quickly create a job.
 */
@property (nonatomic, strong) AWSmediaconvertJobTemplate * _Nullable jobTemplate;

@end

/**
 
 */
@interface AWSmediaconvertUpdatePresetRequest : AWSRequest


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
@property (nonatomic, strong) AWSmediaconvertPresetSettings * _Nullable settings;

@end

/**
 
 */
@interface AWSmediaconvertUpdatePresetResponse : AWSModel


/**
 A preset is a collection of preconfigured media conversion settings that you want MediaConvert to apply to the output during the conversion process.
 */
@property (nonatomic, strong) AWSmediaconvertPreset * _Nullable preset;

@end

/**
 
 */
@interface AWSmediaconvertUpdateQueueRequest : AWSRequest


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
@property (nonatomic, strong) AWSmediaconvertReservationPlanSettings * _Nullable reservationPlanSettings;

/**
 Pause or activate a queue by changing its status between ACTIVE and PAUSED. If you pause a queue, jobs in that queue won't begin. Jobs that are running when you pause the queue continue to run until they finish or result in an error.
 */
@property (nonatomic, assign) AWSmediaconvertQueueStatus status;

@end

/**
 
 */
@interface AWSmediaconvertUpdateQueueResponse : AWSModel


/**
 You can use queues to manage the resources that are available to your AWS account for running multiple transcoding jobs at the same time. If you don't specify a queue, the service sends all jobs through the default queue. For more information, see https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
 */
@property (nonatomic, strong) AWSmediaconvertQueue * _Nullable queue;

@end

/**
 Video codec settings, (CodecSettings) under (VideoDescription), contains the group of settings related to video encoding. The settings in this group vary depending on the value that you choose for Video codec (Codec). For each codec enum that you choose, define the corresponding settings object. The following lists the codec enum, settings object pairs. * FRAME_CAPTURE, FrameCaptureSettings * AV1, Av1Settings * H_264, H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES, ProresSettings
 */
@interface AWSmediaconvertVideoCodecSettings : AWSModel


/**
 Required when you set Codec, under VideoDescription>CodecSettings to the value AV1.
 */
@property (nonatomic, strong) AWSmediaconvertAv1Settings * _Nullable av1Settings;

/**
 Specifies the video codec. This must be equal to one of the enum values defined by the objectVideoCodec.
 */
@property (nonatomic, assign) AWSmediaconvertVideoCodec codec;

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value FRAME_CAPTURE.
 */
@property (nonatomic, strong) AWSmediaconvertFrameCaptureSettings * _Nullable frameCaptureSettings;

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value H_264.
 */
@property (nonatomic, strong) AWSmediaconvertH264Settings * _Nullable h264Settings;

/**
 Settings for H265 codec
 */
@property (nonatomic, strong) AWSmediaconvertH265Settings * _Nullable h265Settings;

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value MPEG2.
 */
@property (nonatomic, strong) AWSmediaconvertMpeg2Settings * _Nullable mpeg2Settings;

/**
 Required when you set (Codec) under (VideoDescription)>(CodecSettings) to the value PRORES.
 */
@property (nonatomic, strong) AWSmediaconvertProresSettings * _Nullable proresSettings;

@end

/**
 Settings for video outputs
 */
@interface AWSmediaconvertVideoDescription : AWSModel


/**
 This setting only applies to H.264, H.265, and MPEG2 outputs. Use Insert AFD signaling (AfdSignaling) to specify whether the service includes AFD values in the output video data and what those values are. * Choose None to remove all AFD values from this output. * Choose Fixed to ignore input AFD values and instead encode the value specified in the job. * Choose Auto to calculate output AFD values based on the input AFD scaler data.
 */
@property (nonatomic, assign) AWSmediaconvertAfdSignaling afdSignaling;

/**
 The anti-alias filter is automatically applied to all outputs. The service no longer accepts the value DISABLED for AntiAlias. If you specify that in your job, the service will ignore the setting.
 */
@property (nonatomic, assign) AWSmediaconvertAntiAlias antiAlias;

/**
 Video codec settings, (CodecSettings) under (VideoDescription), contains the group of settings related to video encoding. The settings in this group vary depending on the value that you choose for Video codec (Codec). For each codec enum that you choose, define the corresponding settings object. The following lists the codec enum, settings object pairs. * FRAME_CAPTURE, FrameCaptureSettings * AV1, Av1Settings * H_264, H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES, ProresSettings
 */
@property (nonatomic, strong) AWSmediaconvertVideoCodecSettings * _Nullable codecSettings;

/**
 Choose Insert (INSERT) for this setting to include color metadata in this output. Choose Ignore (IGNORE) to exclude color metadata from this output. If you don't specify a value, the service sets this to Insert by default.
 */
@property (nonatomic, assign) AWSmediaconvertColorMetadata colorMetadata;

/**
 Use Cropping selection (crop) to specify the video area that the service will include in the output video frame.
 */
@property (nonatomic, strong) AWSmediaconvertRectangle * _Nullable crop;

/**
 Applies only to 29.97 fps outputs. When this feature is enabled, the service will use drop-frame timecode on outputs. If it is not possible to use drop-frame timecode, the system will fall back to non-drop-frame. This setting is enabled by default when Timecode insertion (TimecodeInsertion) is enabled.
 */
@property (nonatomic, assign) AWSmediaconvertDropFrameTimecode dropFrameTimecode;

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
@property (nonatomic, strong) AWSmediaconvertRectangle * _Nullable position;

/**
 Use Respond to AFD (RespondToAfd) to specify how the service changes the video itself in response to AFD values in the input. * Choose Respond to clip the input video frame according to the AFD value, input display aspect ratio, and output display aspect ratio. * Choose Passthrough to include the input AFD values. Do not choose this when AfdSignaling is set to (NONE). A preferred implementation of this workflow is to set RespondToAfd to (NONE) and set AfdSignaling to (AUTO). * Choose None to remove all input AFD values from this output.
 */
@property (nonatomic, assign) AWSmediaconvertRespondToAfd respondToAfd;

/**
 Specify how the service handles outputs that have a different aspect ratio from the input aspect ratio. Choose Stretch to output (STRETCH_TO_OUTPUT) to have the service stretch your video image to fit. Keep the setting Default (DEFAULT) to have the service letterbox your video instead. This setting overrides any value that you specify for the setting Selection placement (position) in this output.
 */
@property (nonatomic, assign) AWSmediaconvertScalingBehavior scalingBehavior;

/**
 Use Sharpness (Sharpness) setting to specify the strength of anti-aliasing. This setting changes the width of the anti-alias filter kernel used for scaling. Sharpness only applies if your output resolution is different from your input resolution. 0 is the softest setting, 100 the sharpest, and 50 recommended for most content.
 */
@property (nonatomic, strong) NSNumber * _Nullable sharpness;

/**
 Applies only to H.264, H.265, MPEG2, and ProRes outputs. Only enable Timecode insertion when the input frame rate is identical to the output frame rate. To include timecodes in this output, set Timecode insertion (VideoTimecodeInsertion) to PIC_TIMING_SEI. To leave them out, set it to DISABLED. Default is DISABLED. When the service inserts timecodes in an output, by default, it uses any embedded timecodes from the input. If none are present, the service will set the timecode for the first output frame to zero. To change this default behavior, adjust the settings under Timecode configuration (TimecodeConfig). In the console, these settings are located under Job > Job settings > Timecode configuration. Note - Timecode source under input settings (InputTimecodeSource) does not affect the timecodes that are inserted in the output. Source under Job settings > Timecode configuration (TimecodeSource) does.
 */
@property (nonatomic, assign) AWSmediaconvertVideoTimecodeInsertion timecodeInsertion;

/**
 Find additional transcoding features under Preprocessors (VideoPreprocessors). Enable the features at each output individually. These features are disabled by default.
 */
@property (nonatomic, strong) AWSmediaconvertVideoPreprocessor * _Nullable videoPreprocessors;

/**
 Use Width (Width) to define the video resolution width, in pixels, for this output. If you don't provide a value here, the service will use the input width.
 */
@property (nonatomic, strong) NSNumber * _Nullable width;

@end

/**
 Contains details about the output's video stream
 */
@interface AWSmediaconvertVideoDetail : AWSModel


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
@interface AWSmediaconvertVideoPreprocessor : AWSModel


/**
 Enable the Color corrector (ColorCorrector) feature if necessary. Enable or disable this feature for each output individually. This setting is disabled by default.
 */
@property (nonatomic, strong) AWSmediaconvertColorCorrector * _Nullable colorCorrector;

/**
 Use Deinterlacer (Deinterlacer) to produce smoother motion and a clearer picture.
 */
@property (nonatomic, strong) AWSmediaconvertDeinterlacer * _Nullable deinterlacer;

/**
 Enable Dolby Vision feature to produce Dolby Vision compatible video output.
 */
@property (nonatomic, strong) AWSmediaconvertDolbyVision * _Nullable dolbyVision;

/**
 Enable the Image inserter (ImageInserter) feature to include a graphic overlay on your video. Enable or disable this feature for each output individually. This setting is disabled by default.
 */
@property (nonatomic, strong) AWSmediaconvertImageInserter * _Nullable imageInserter;

/**
 Enable the Noise reducer (NoiseReducer) feature to remove noise from your video output if necessary. Enable or disable this feature for each output individually. This setting is disabled by default.
 */
@property (nonatomic, strong) AWSmediaconvertNoiseReducer * _Nullable noiseReducer;

/**
 Timecode burn-in (TimecodeBurnIn)--Burns the output timecode and specified prefix into the output.
 */
@property (nonatomic, strong) AWSmediaconvertTimecodeBurnin * _Nullable timecodeBurnin;

@end

/**
 Selector for video.
 */
@interface AWSmediaconvertVideoSelector : AWSModel


/**
 Ignore this setting unless this input is a QuickTime animation with an alpha channel. Use this setting to create separate Key and Fill outputs. In each output, specify which part of the input MediaConvert uses. Leave this setting at the default value DISCARD to delete the alpha channel and preserve the video. Set it to REMAP_TO_LUMA to delete the video and map the alpha channel to the luma channel of your outputs.
 */
@property (nonatomic, assign) AWSmediaconvertAlphaBehavior alphaBehavior;

/**
 If your input video has accurate color space metadata, or if you don't know about color space, leave this set to the default value Follow (FOLLOW). The service will automatically detect your input color space. If your input video has metadata indicating the wrong color space, specify the accurate color space here. If your input video is HDR 10 and the SMPTE ST 2086 Mastering Display Color Volume static metadata isn't present in your video stream, or if that metadata is present but not accurate, choose Force HDR 10 (FORCE_HDR10) here and specify correct values in the input HDR 10 metadata (Hdr10Metadata) settings. For more information about MediaConvert HDR jobs, see https://docs.aws.amazon.com/console/mediaconvert/hdr.
 */
@property (nonatomic, assign) AWSmediaconvertColorSpace colorSpace;

/**
 There are two sources for color metadata, the input file and the job input settings Color space (ColorSpace) and HDR master display information settings(Hdr10Metadata). The Color space usage setting determines which takes precedence. Choose Force (FORCE) to use color metadata from the input job settings. If you don't specify values for those settings, the service defaults to using metadata from your input. FALLBACK - Choose Fallback (FALLBACK) to use color metadata from the source when it is present. If there's no color metadata in your input file, the service defaults to using values you specify in the input settings.
 */
@property (nonatomic, assign) AWSmediaconvertColorSpaceUsage colorSpaceUsage;

/**
 Use these settings to provide HDR 10 metadata that is missing or inaccurate in your input video. Appropriate values vary depending on the input video and must be provided by a color grader. The color grader generates these values during the HDR 10 mastering process. The valid range for each of these settings is 0 to 50,000. Each increment represents 0.00002 in CIE1931 color coordinate. Related settings - When you specify these values, you must also set Color space (ColorSpace) to HDR 10 (HDR10). To specify whether the the values you specify here take precedence over the values in the metadata of your input file, set Color space usage (ColorSpaceUsage). To specify whether color metadata is included in an output, set Color metadata (ColorMetadata). For more information about MediaConvert HDR jobs, see https://docs.aws.amazon.com/console/mediaconvert/hdr.
 */
@property (nonatomic, strong) AWSmediaconvertHdr10Metadata * _Nullable hdr10Metadata;

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
@property (nonatomic, assign) AWSmediaconvertInputRotate rotate;

@end

/**
 Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to the value WAV.
 */
@interface AWSmediaconvertWavSettings : AWSModel


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
@property (nonatomic, assign) AWSmediaconvertWavFormat format;

/**
 Sample rate in Hz.
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

@end

NS_ASSUME_NONNULL_END
