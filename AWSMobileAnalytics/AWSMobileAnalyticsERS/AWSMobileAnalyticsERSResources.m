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

#import "AWSMobileAnalyticsERSResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSMobileAnalyticsERSResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSMobileAnalyticsERSResources

+ (instancetype)sharedInstance {
    static AWSMobileAnalyticsERSResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSMobileAnalyticsERSResources new];
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
  \"metadata\":{\
    \"apiVersion\":\"2014-06-30\",\
    \"endpointPrefix\":\"mobileanalytics\",\
    \"jsonVersion\":\"1.1\",\
    \"serviceFullName\":\"AWS Event Recorder Service\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"AmazonMobileAnalytics\",\
    \"type\":\"json\"\
  },\
  \"documentation\":\"A service which is used to record Amazon Mobile Analytics events\",\
  \"operations\":{\
    \"PutEvents\":{\
      \"name\":\"PutEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2014-06-05/events\",\
        \"responseCode\":202\
      },\
      \"input\":{\
        \"shape\":\"PutEventsInput\",\
        \"documentation\":\"Describes a set of events\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"BadRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true\
        }\
      ],\
      \"documentation\":\"Record a batch of events\"\
    }\
  },\
  \"shapes\":{\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"Double\":{\"type\":\"double\"},\
    \"Event\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"eventType\",\
        \"timestamp\",\
        \"session\"\
      ],\
      \"members\":{\
        \"eventType\":{\"shape\":\"String50Chars\"},\
        \"timestamp\":{\"shape\":\"ISO8601Timestamp\"},\
        \"session\":{\"shape\":\"Session\"},\
        \"version\":{\"shape\":\"String10Chars\"},\
        \"attributes\":{\"shape\":\"MapOfStringToString\"},\
        \"metrics\":{\"shape\":\"MapOfStringToNumber\"}\
      },\
      \"documentation\":\"Represents a single event that happened on a client device. Attributes and metrics are optional.\"\
    },\
    \"EventListDefinition\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Event\"}\
    },\
    \"ISO8601Timestamp\":{\"type\":\"string\"},\
    \"Long\":{\"type\":\"long\"},\
    \"MapOfStringToNumber\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"String50Chars\"},\
      \"value\":{\"shape\":\"Double\"},\
      \"min\":0,\
      \"max\":50\
    },\
    \"MapOfStringToString\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"String50Chars\"},\
      \"value\":{\"shape\":\"String0to1000Chars\"},\
      \"min\":0,\
      \"max\":50\
    },\
    \"PutEventsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"events\",\
        \"clientContext\"\
      ],\
      \"members\":{\
        \"events\":{\"shape\":\"EventListDefinition\"},\
        \"clientContext\":{\
          \"shape\":\"String\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-Client-Context\"\
        }\
      },\
      \"documentation\":\"Describes a set of events\"\
    },\
    \"Session\":{\
      \"type\":\"structure\",\
      \"required\":[\"id\"],\
      \"members\":{\
        \"id\":{\"shape\":\"String50Chars\"},\
        \"duration\":{\"shape\":\"Long\"},\
        \"startTimestamp\":{\"shape\":\"ISO8601Timestamp\"},\
        \"stopTimestamp\":{\"shape\":\"ISO8601Timestamp\"}\
      }\
    },\
    \"String\":{\"type\":\"string\"},\
    \"String0to1000Chars\":{\
      \"type\":\"string\",\
      \"min\":0,\
      \"max\":1000\
    },\
    \"String10Chars\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":10\
    },\
    \"String50Chars\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":50\
    }\
  }\
}\
";
}

@end
