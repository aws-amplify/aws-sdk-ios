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

#import "AWSTranscribeResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSTranscribeResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSTranscribeResources

+ (instancetype)sharedInstance {
	static AWSTranscribeResources *_sharedResources = nil;
	static dispatch_once_t once_token;

	dispatch_once(&once_token, ^{
		_sharedResources = [AWSTranscribeResources new];
	});

	return _sharedResources;
}

- (NSDictionary *)JSONObject {
	return self.definitionDictionary;
}

- (instancetype)init {
	if (self = [super init]) {
		//init method
		NSError *error = nil;
		_definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
																options:kNilOptions
																  error:&error];
		if (_definitionDictionary == nil) {
			if (error) {
				AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
			}
		}
	}
	return self;
}

- (NSString *)definitionString {
	return @"{\
	\"version\":\"2.0\",\
	\"metadata\":{\
		\"apiVersion\":\"2015-03-31\",\
		\"endpointPrefix\":\"transcribe\",\
		\"jsonVersion\":\"1.1\",\
		\"serviceFullName\":\"Amazone Transcribe\",\
		\"signatureVersion\":\"v4\",\
		\"targetPrefix\":\"Transcribe\",\
		\"protocol\":\"json\"\
	},\
	\"operations\":{\
		\"GetTranscriptionJob\":{\
			\"name\":\"GetTranscriptionJob\",\
			\"http\":{\
				\"method\":\"POST\",\
				\"requestUri\":\"/\"\
			},\
			\"input\":{\"shape\":\"GetTranscriptionJobRequest\"},\
			\"output\":{\"shape\":\"GetTranscriptionJobOutput\"},\
		},\
		\"ListTranscriptionJobs\":{\
			\"name\":\"ListTranscriptionJobs\",\
			\"http\":{\
				\"method\":\"POST\",\
				\"requestUri\":\"/\"\
			},\
			\"input\":{\"shape\":\"ListTranscriptionJobsRequest\"},\
			\"output\":{\"shape\":\"ListTranscriptionJobsOutput\"},\
		},\
		\"StartTranscriptionJob\":{\
			\"name\":\"StartTranscriptionJob\",\
			\"http\":{\
			\"method\":\"POST\",\
			\"requestUri\":\"/\"\
			},\
			\"input\":{\"shape\":\"StartTranscriptionJobRequest\"},\
			\"output\":{\"shape\":\"StartTranscriptionJobOutput\"},\
		},\
	},\
	\"shapes\":{\
		\"GetTranscriptionJobRequest\":{\
		},\
		\"GetTranscriptionJobOutput\":{\
		},\
		\"ListTranscriptionJobsRequest\":{\
			\"type\":\"structure\",\
			\"required\":[\"Status\"],\
			\"members\":{\
				\"MaxEntries\":{\
					\"shape\":\"MaxResults\",\
				},\
				\"NextToken\":{\
					\"shape\":\"NextToken\",\
				},\
				\"Status\":{\
					\"shape\":\"JobStatus\",\
				},\
			}\
		},\
		\"ListTranscriptionJobsOutput\":{\
		},\
		\"JobStatus\":{\
			\"type\":\"string\",\
			\"enum\":[\
				\"COMPLETED\",\
				\"FAILED\",\
				\"IN_PROGRESS\"\
			],\
		},\
		\"EntityId\":{\
			\"type\":\"string\",\
			\"min\":1,\
			\"max\":64,\
			\"pattern\":\"[a-zA-Z0-9_.-]+\"\
		},\
	},\
}\
";
}

@end

