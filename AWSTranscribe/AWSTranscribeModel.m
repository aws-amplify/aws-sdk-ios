//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSTranscribeModel.h"

NSString *const AWSTranscribeErrorDomain = @"com.amazonaws.AWSTranscribeErrorDomain";

//------------------------------------------------------------------------------

@implementation AWSModel(AWSTransaction)

+ (NSArray*)jobStatusStrings {
	return @[@"COMPLETED", @"FAILED", @"IN_PROGRESS"];
}

+ (NSArray*)languageCodeStrings {
	return @[@"en-US", @"es-US"];
}

+ (NSArray *)mediaFormatStrings {
	return @[@"flac", @"mp3", @"mp4", @"wav"];
}

+ (NSArray*)transcriptItemTypeStrings {
	return @[@"pronunciation", @"punctuation"];
}

+ (NSValueTransformer *)transformDate {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
		return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
	} reverseBlock:^id(NSDate *date) {
		return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
	}];
}

+ (NSValueTransformer*)transformWith:(NSArray*)strings {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
		NSUInteger index = [strings indexOfObject:value];
		if (index != NSNotFound) {
			return @(index);
		}
		return @(strings.count);
	} reverseBlock:^NSString *(NSNumber *value) {
		if (value.unsignedIntegerValue < strings.count) {
			return strings[value.unsignedIntegerValue];
		}
		return nil;
	}];
}

@end

//------------------------------------------------------------------------------
#pragma mark GetTranscriptionJobRequest
//------------------------------------------------------------------------------

@implementation AWSTranscribeGetTranscriptionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"jobName" : @"TranscriptionJobName",
	};
}

@end

//------------------------------------------------------------------------------

@implementation AWSTranscribeGetTranscriptionJobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		 @"job" : @"TranscriptionJob",
	};
}

+ (NSValueTransformer *)jobJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeJob class]];
}

@end

//------------------------------------------------------------------------------
#pragma mark ListTranscriptionJobsRequest
//------------------------------------------------------------------------------

@implementation AWSTranscribeListTranscriptionJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"status" : @"Status",
		@"maxResults" : @"MaxResults",
		@"nextToken" : @"NextToken",
	};
}

+ (NSValueTransformer *)statusJSONTransformer {
	return [AWSModel transformWith:[AWSModel jobStatusStrings]];
}

@end

//------------------------------------------------------------------------------

@implementation AWSTranscribeListTranscriptionJobsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"jobSummaries" : @"TranscriptionJobSummaries",
		@"nextToken" : @"NextToken",
		@"status" : @"Status",
	};
}

+ (NSValueTransformer *)jobSummariesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeJobSummary class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
	return [AWSModel transformWith:[AWSModel jobStatusStrings]];
}

@end

//------------------------------------------------------------------------------
#pragma mark StartTranscriptionJobRequest
//------------------------------------------------------------------------------

@implementation AWSTranscribeStartTranscriptionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"jobName" : @"TranscriptionJobName",
		@"languageCode" : @"LanguageCode",
		@"media" : @"Media",
		@"mediaFormat" : @"MediaFormat",
		@"mediaSampleRateHertz" : @"MediaSampleRateHertz",
	};
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
	return [AWSModel transformWith:[AWSModel languageCodeStrings]];
}

+ (NSValueTransformer *)mediaJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeMedia class]];
}

+ (NSValueTransformer *)mediaFormatJSONTransformer {
	return [AWSModel transformWith:[AWSModel mediaFormatStrings]];
}

@end

//------------------------------------------------------------------------------

@implementation AWSTranscribeStartTranscriptionJobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"job" : @"TranscriptionJob",
	};
}

+ (NSValueTransformer *)jobJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeJob class]];
}

@end

//------------------------------------------------------------------------------
#pragma mark Utility Models
//------------------------------------------------------------------------------

@implementation AWSTranscribeJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"completionTime" : @"CompletionTime",
		@"creationTime" : @"CreationTime",
		@"failureReason" : @"FailureReason",
		@"jobName" : @"TranscriptionJobName",
		@"jobStatus" : @"TranscriptionJobStatus",
		@"languageCode" : @"LanguageCode",
	 };
}

+ (NSValueTransformer *)completionTimeJSONTransformer {
	return [AWSModel transformDate];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
	return [AWSModel transformDate];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
	return [AWSModel transformWith:[AWSModel jobStatusStrings]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
	return [AWSModel transformWith:[AWSModel languageCodeStrings]];
}

@end

//------------------------------------------------------------------------------

@implementation AWSTranscribeJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	NSMutableDictionary* retVal = [NSMutableDictionary dictionaryWithDictionary:[super JSONKeyPathsByPropertyKey]];
	NSDictionary* local = @{
		@"media" : @"Media",
		@"mediaFormat" : @"MediaFormat",
		@"mediaSampleRateHertz" : @"MediaSampleRateHertz",
		@"transcript" : @"Transcript",
	};

	[retVal addEntriesFromDictionary:local];
	return retVal;
}

+ (NSValueTransformer *)mediaJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeMedia class]];
}

+ (NSValueTransformer *)mediaFormatJSONTransformer {
	return [AWSModel transformWith:[AWSModel mediaFormatStrings]];
}

+ (NSValueTransformer *)transcriptJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeTranscriptFile class]];
}

@end

//------------------------------------------------------------------------------

@implementation AWSTranscribeMedia

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"fileUri" : @"MediaFileUri",
	};
}

@end

//------------------------------------------------------------------------------

@implementation AWSTranscribeTranscriptFile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"fileUri" : @"TranscriptFileUri",
	};
}

@end

//------------------------------------------------------------------------------

@implementation AWSTranscribeTranscript

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"accountId" : @"accountId",
		@"jobName" : @"jobName",
		@"results" : @"results",
		@"status" : @"status",
	};
}

+ (NSValueTransformer *)resultJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeTranscriptResults class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
	return [AWSModel transformWith:[AWSModel jobStatusStrings]];
}

@end

//------------------------------------------------------------------------------

@implementation AWSTranscribeTranscriptResults

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"items" : @"items",
		@"transcripts" : @"transcripts",
	};
}

+ (NSValueTransformer *)itemsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeTranscriptResultsItem class]];
}

+ (NSValueTransformer *)transcriptsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeTranscriptResultsTranscripts class]];
}

@end

//------------------------------------------------------------------------------

@implementation AWSTranscribeTranscriptResultsItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"alternatives" : @"alternatives",
		@"startTime" : @"startTime",
		@"endTime" : @"endTime",
		@"type" : @"type",
	};
}

+ (NSValueTransformer *)alternativesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeTranscriptResultsItemAlternative class]];
}

+ (NSValueTransformer *)typeJSONTransformer {
	return [AWSModel transformWith:[AWSModel transcriptItemTypeStrings]];
}

@end

//------------------------------------------------------------------------------

@implementation AWSTranscribeTranscriptResultsItemAlternative

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"confidence" : @"confidence",
		@"content" : @"content",
	};
}

@end

//------------------------------------------------------------------------------

@implementation AWSTranscribeTranscriptResultsTranscripts

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
		@"transcript" : @"transcript",
	};
}

@end



