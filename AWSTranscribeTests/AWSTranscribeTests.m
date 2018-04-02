//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "OCMock.h"
#import "AWSTestUtility.h"
#import "AWSTranscribe.h"

static id mockNetworking = nil;

@interface AWSTranscribeTests : XCTestCase

@end

@implementation AWSTranscribeTests

- (void)setUp {
    [super setUp];
	[AWSTestUtility setupFakeCognitoCredentialsProvider];

	mockNetworking = OCMClassMock([AWSNetworking class]);
	AWSTask *errorTask = [AWSTask taskWithError:[NSError errorWithDomain:@"OCMockExpectedNetworkingError" code:8848 userInfo:nil]];
	OCMStub([mockNetworking sendRequest:[OCMArg isKindOfClass:[AWSNetworkingRequest class]]]).andReturn(errorTask);
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
	NSString *key = @"testTranscribeConstructors";
	XCTAssertNotNil([AWSTranscribe defaultTranscribe]);
	XCTAssertEqual([[AWSTranscribe defaultTranscribe] class], [AWSTranscribe class]);
	XCTAssertNil([AWSTranscribe transcribeForKey:key]);

	AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
	[AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];
	XCTAssertNotNil([AWSTranscribe transcribeForKey:key]);
	XCTAssertEqual([[AWSTranscribe transcribeForKey:key] class], [AWSTranscribe class]);
	XCTAssertEqual([AWSTranscribe transcribeForKey:key].configuration.regionType, AWSRegionSAEast1);

	[AWSTranscribe removeTranscribeForKey:key];
	XCTAssertNil([AWSTranscribe transcribeForKey:key]);
}

- (void)testGetTranscriptionJobModels {
	NSString* jobName = @"AJobName";
	NSDictionary* requestDict= @{ @"TranscriptionJobName": jobName };
	NSError* error;
	AWSTranscribeGetTranscriptionJobRequest *request = [AWSMTLJSONAdapter modelOfClass:AWSTranscribeGetTranscriptionJobRequest.class
																	fromJSONDictionary:requestDict
																				 error:&error];
	XCTAssertNil(error);
	XCTAssertNotNil(request);
	XCTAssertEqual(request.jobName, jobName);

	NSDate* now = [NSDate date];
	NSNumber* nowNumber = [NSNumber numberWithDouble:[now timeIntervalSince1970]];
	NSNumber* rate = [NSNumber numberWithInt:16000];
	NSString* mediaFile = @"AMediaFileGoesHere";
	NSString* transcriptFile = @"AMediaFileGoesHere";
	NSDictionary* outputDict = @{
		@"TranscriptionJob": @{
			@"CompletionTime": nowNumber,
			@"CreationTime": nowNumber,
			@"FailureReason": @"FailureReason",
			@"LanguageCode": @"en-US",
			@"Media": @{
				@"MediaFileUri": mediaFile
			},
			@"MediaFormat": @"mp3",
			@"MediaSampleRateHertz": rate,
			@"Transcript": @{
				@"TranscriptFileUri": transcriptFile
			},
			@"TranscriptionJobName": jobName,
			@"TranscriptionJobStatus": @"COMPLETED"
		}
	};
	
	AWSTranscribeGetTranscriptionJobOutput *output = [AWSMTLJSONAdapter modelOfClass:AWSTranscribeGetTranscriptionJobOutput.class
																	fromJSONDictionary:outputDict
																				 error:&error];
	XCTAssertNil(error);
	XCTAssertNotNil(output);
	XCTAssertNotNil(output.job);
	XCTAssertEqual(output.job.jobName, jobName);
	XCTAssertEqual([output.job.creationTime timeIntervalSince1970], [now timeIntervalSince1970]);
	XCTAssertEqual([output.job.completionTime timeIntervalSince1970], [now timeIntervalSince1970]);
	XCTAssertEqual(output.job.languageCode, AWSTranscribeLanguageCodeEn_US);
	XCTAssertEqual(output.job.media.fileUri, mediaFile);
	XCTAssertEqual(output.job.mediaFormat, AWSTranscribeMediaFormatMP3);
	XCTAssertEqual(output.job.mediaSampleRateHertz, rate);
	XCTAssertEqual(output.job.transcript.fileUri, transcriptFile);
	XCTAssertEqual(output.job.jobStatus, AWSTranscribeJobStatusCompleted);
}

- (void)testListTranscriptionJobModels {
	AWSTranscribeListTranscriptionJobsRequest* request = [AWSTranscribeListTranscriptionJobsRequest new];
	XCTAssertNotNil(request);
	request.maxResults = [NSNumber numberWithInt:100];
	request.nextToken = @"ANextToken";
	request.status = AWSTranscribeJobStatusCompleted;
	XCTAssertEqual(request.maxResults, [NSNumber numberWithInt:100]);
	XCTAssertEqual(request.nextToken, @"ANextToken");
	XCTAssertEqual(request.status, AWSTranscribeJobStatusCompleted);

	AWSTranscribeListTranscriptionJobsOutput* output = [AWSTranscribeListTranscriptionJobsOutput new];
	XCTAssertNotNil(output);
}

- (void)testTranscribeTranscript {
	NSString* jobName = @"job0001";
	NSString* accountId = @"accountId0001";
	NSString* aTranscript = @"Transcript goes here.";
	NSArray* transcriptWords = [aTranscript componentsSeparatedByString:@" "];
	NSDictionary* outputDict = @{
		@"jobName": jobName,
		@"accountId": accountId,
		@"results": @{
			@"transcripts": @[
				@{
					@"transcript": aTranscript
				}
			],
			@"items": @[
				 @ {
					  @"start_time": @"0.000",
					  @"end_time": @"0.190",
					  @"alternatives": @[
							   @{
								   @"confidence": @"0.9961",
								   @"content": @"Transcript"
							   }
					   ],
					  @"type": @"pronunciation"
				},
				@{
					@"start_time": @"0.190",
					@"end_time": @"0.360",
					@"alternatives": @[
						@{
							@"confidence": @"1.0000",
							@"content": @"goes"
						}
					],
					@"type": @"pronunciation"
				},
				@{
					@"start_time": @"0.360",
					@"end_time": @"0.550",
					@"alternatives": @[
						@{
							@"confidence": @"1.0000",
							@"content": @"here"
						}
					],
					@"type": @"pronunciation"
				}
			]
		},
		@"status": @"COMPLETED"
	};
	AWSTranscribeTranscriptResultsItem* item0 = [AWSTranscribeTranscriptResultsItem new];
	item0.startTime = [NSNumber numberWithFloat:0.0];
	item0.endTime = [NSNumber numberWithFloat:0.190];

	NSError* error;
	AWSTranscribeTranscript *output = [AWSMTLJSONAdapter modelOfClass:AWSTranscribeTranscript.class
																  fromJSONDictionary:outputDict
																			   error:&error];
	XCTAssertNil(error);
	XCTAssertNotNil(output);
	XCTAssertEqual(output.jobName, jobName);
	XCTAssertEqual(output.accountId, accountId);
	XCTAssertEqual(output.results.transcripts.count, 1);
	XCTAssertEqual(output.results.items.count, 3);
	XCTAssertEqual(output.status, AWSTranscribeJobStatusCompleted);

	AWSTranscribeTranscriptResultsTranscript* outTranscript = output.results.transcripts[0];
	XCTAssertEqual(outTranscript.transcript, aTranscript);

	AWSTranscribeTranscriptResultsItem* outItem0 = output.results.items[0];
	XCTAssertEqual(outItem0.type, AWSTranscribeTranscriptItemTypePronunciation);
	XCTAssertTrue([outItem0.startTime isEqualToNumber:item0.startTime]);
	XCTAssertTrue([outItem0.endTime isEqualToNumber:item0.endTime]);
	XCTAssertEqual(outItem0.alternatives.count, 1);
	AWSTranscribeTranscriptResultsItemAlternative* alt0 = outItem0.alternatives[0];
	XCTAssertTrue([alt0.content isEqualToString:transcriptWords[0]]);
}

@end
