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

#import "AWSPinpointTargetingResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSPinpointTargetingResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSPinpointTargetingResources

+ (instancetype)sharedInstance {
    static AWSPinpointTargetingResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSPinpointTargetingResources new];
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
  \"metadata\" : {\
    \"apiVersion\" : \"2016-12-01\",\
    \"endpointPrefix\" : \"pinpoint\",\
    \"signingName\" : \"mobiletargeting\",\
    \"signatureVersion\":\"v4\",\
    \"serviceFullName\" : \"Amazon Pinpoint\",\
    \"protocol\" : \"rest-json\",\
    \"jsonVersion\" : \"1.1\"\
  },\
  \"operations\" : {\
    \"CreateCampaign\" : {\
      \"name\" : \"CreateCampaign\",\
      \"http\" : {\
        \"method\" : \"POST\",\
        \"requestUri\" : \"/v1/apps/{application-id}/campaigns\",\
        \"responseCode\" : 201\
      },\
      \"input\" : {\
        \"shape\" : \"CreateCampaignRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"CreateCampaignResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Creates or updates a campaign.\"\
    },\
    \"CreateImportJob\" : {\
      \"name\" : \"CreateImportJob\",\
      \"http\" : {\
        \"method\" : \"POST\",\
        \"requestUri\" : \"/v1/apps/{application-id}/jobs/import\",\
        \"responseCode\" : 201\
      },\
      \"input\" : {\
        \"shape\" : \"CreateImportJobRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"CreateImportJobResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Creates or updates an import job.\"\
    },\
    \"CreateSegment\" : {\
      \"name\" : \"CreateSegment\",\
      \"http\" : {\
        \"method\" : \"POST\",\
        \"requestUri\" : \"/v1/apps/{application-id}/segments\",\
        \"responseCode\" : 201\
      },\
      \"input\" : {\
        \"shape\" : \"CreateSegmentRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"CreateSegmentResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Used to create or update a segment.\"\
    },\
    \"DeleteApnsChannel\" : {\
      \"name\" : \"DeleteApnsChannel\",\
      \"http\" : {\
        \"method\" : \"DELETE\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/apns\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"DeleteApnsChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"DeleteApnsChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Deletes the APNs channel for an app.\"\
    },\
    \"DeleteApnsSandboxChannel\" : {\
      \"name\" : \"DeleteApnsSandboxChannel\",\
      \"http\" : {\
        \"method\" : \"DELETE\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/apns_sandbox\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"DeleteApnsSandboxChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"DeleteApnsSandboxChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Delete an APNS sandbox channel\"\
    },\
    \"DeleteCampaign\" : {\
      \"name\" : \"DeleteCampaign\",\
      \"http\" : {\
        \"method\" : \"DELETE\",\
        \"requestUri\" : \"/v1/apps/{application-id}/campaigns/{campaign-id}\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"DeleteCampaignRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"DeleteCampaignResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Deletes a campaign.\"\
    },\
    \"DeleteEmailChannel\" : {\
      \"name\" : \"DeleteEmailChannel\",\
      \"http\" : {\
        \"method\" : \"DELETE\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/email\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"DeleteEmailChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"DeleteEmailChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Delete an email channel\"\
    },\
    \"DeleteEventStream\" : {\
      \"name\" : \"DeleteEventStream\",\
      \"http\" : {\
        \"method\" : \"DELETE\",\
        \"requestUri\" : \"/v1/apps/{application-id}/eventstream\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"DeleteEventStreamRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"DeleteEventStreamResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Deletes the event stream for an app.\"\
    },\
    \"DeleteGcmChannel\" : {\
      \"name\" : \"DeleteGcmChannel\",\
      \"http\" : {\
        \"method\" : \"DELETE\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/gcm\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"DeleteGcmChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"DeleteGcmChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Deletes the GCM channel for an app.\"\
    },\
    \"DeleteSegment\" : {\
      \"name\" : \"DeleteSegment\",\
      \"http\" : {\
        \"method\" : \"DELETE\",\
        \"requestUri\" : \"/v1/apps/{application-id}/segments/{segment-id}\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"DeleteSegmentRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"DeleteSegmentResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Deletes a segment.\"\
    },\
    \"DeleteSmsChannel\" : {\
      \"name\" : \"DeleteSmsChannel\",\
      \"http\" : {\
        \"method\" : \"DELETE\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/sms\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"DeleteSmsChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"DeleteSmsChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Delete an SMS channel\"\
    },\
    \"GetApnsChannel\" : {\
      \"name\" : \"GetApnsChannel\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/apns\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetApnsChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetApnsChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about the APNs channel for an app.\"\
    },\
    \"GetApnsSandboxChannel\" : {\
      \"name\" : \"GetApnsSandboxChannel\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/apns_sandbox\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetApnsSandboxChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetApnsSandboxChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Get an APNS sandbox channel\"\
    },\
    \"GetApplicationSettings\" : {\
      \"name\" : \"GetApplicationSettings\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/settings\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetApplicationSettingsRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetApplicationSettingsResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Used to request the settings for an app.\"\
    },\
    \"GetCampaign\" : {\
      \"name\" : \"GetCampaign\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/campaigns/{campaign-id}\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetCampaignRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetCampaignResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about a campaign.\"\
    },\
    \"GetCampaignActivities\" : {\
      \"name\" : \"GetCampaignActivities\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/campaigns/{campaign-id}/activities\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetCampaignActivitiesRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetCampaignActivitiesResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about the activity performed by a campaign.\"\
    },\
    \"GetCampaignVersion\" : {\
      \"name\" : \"GetCampaignVersion\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/campaigns/{campaign-id}/versions/{version}\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetCampaignVersionRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetCampaignVersionResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about a specific version of a campaign.\"\
    },\
    \"GetCampaignVersions\" : {\
      \"name\" : \"GetCampaignVersions\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/campaigns/{campaign-id}/versions\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetCampaignVersionsRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetCampaignVersionsResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about your campaign versions.\"\
    },\
    \"GetCampaigns\" : {\
      \"name\" : \"GetCampaigns\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/campaigns\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetCampaignsRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetCampaignsResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about your campaigns.\"\
    },\
    \"GetEmailChannel\" : {\
      \"name\" : \"GetEmailChannel\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/email\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetEmailChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetEmailChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Get an email channel\"\
    },\
    \"GetEndpoint\" : {\
      \"name\" : \"GetEndpoint\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/endpoints/{endpoint-id}\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetEndpointRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetEndpointResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about an endpoint.\"\
    },\
    \"GetEventStream\" : {\
      \"name\" : \"GetEventStream\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/eventstream\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetEventStreamRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetEventStreamResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns the event stream for an app.\"\
    },\
    \"GetGcmChannel\" : {\
      \"name\" : \"GetGcmChannel\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/gcm\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetGcmChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetGcmChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about the GCM channel for an app.\"\
    },\
    \"GetImportJob\" : {\
      \"name\" : \"GetImportJob\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/jobs/import/{job-id}\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetImportJobRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetImportJobResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about an import job.\"\
    },\
    \"GetImportJobs\" : {\
      \"name\" : \"GetImportJobs\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/jobs/import\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetImportJobsRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetImportJobsResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about your import jobs.\"\
    },\
    \"GetSegment\" : {\
      \"name\" : \"GetSegment\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/segments/{segment-id}\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetSegmentRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetSegmentResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about a segment.\"\
    },\
    \"GetSegmentImportJobs\" : {\
      \"name\" : \"GetSegmentImportJobs\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/segments/{segment-id}/jobs/import\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetSegmentImportJobsRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetSegmentImportJobsResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns a list of import jobs for a specific segment.\"\
    },\
    \"GetSegmentVersion\" : {\
      \"name\" : \"GetSegmentVersion\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/segments/{segment-id}/versions/{version}\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetSegmentVersionRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetSegmentVersionResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about a segment version.\"\
    },\
    \"GetSegmentVersions\" : {\
      \"name\" : \"GetSegmentVersions\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/segments/{segment-id}/versions\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetSegmentVersionsRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetSegmentVersionsResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Returns information about your segment versions.\"\
    },\
    \"GetSegments\" : {\
      \"name\" : \"GetSegments\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/segments\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetSegmentsRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetSegmentsResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Used to get information about your segments.\"\
    },\
    \"GetSmsChannel\" : {\
      \"name\" : \"GetSmsChannel\",\
      \"http\" : {\
        \"method\" : \"GET\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/sms\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"GetSmsChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"GetSmsChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Get an SMS channel\"\
    },\
    \"PutEventStream\" : {\
      \"name\" : \"PutEventStream\",\
      \"http\" : {\
        \"method\" : \"POST\",\
        \"requestUri\" : \"/v1/apps/{application-id}/eventstream\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"PutEventStreamRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"PutEventStreamResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Use to create or update the event stream for an app.\"\
    },\
    \"SendMessages\" : {\
      \"name\" : \"SendMessages\",\
      \"http\" : {\
        \"method\" : \"POST\",\
        \"requestUri\" : \"/v1/apps/{application-id}/messages\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"SendMessagesRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"SendMessagesResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Send a batch of messages\"\
    },\
    \"UpdateApnsChannel\" : {\
      \"name\" : \"UpdateApnsChannel\",\
      \"http\" : {\
        \"method\" : \"PUT\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/apns\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"UpdateApnsChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"UpdateApnsChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Use to update the APNs channel for an app.\"\
    },\
    \"UpdateApnsSandboxChannel\" : {\
      \"name\" : \"UpdateApnsSandboxChannel\",\
      \"http\" : {\
        \"method\" : \"PUT\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/apns_sandbox\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"UpdateApnsSandboxChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"UpdateApnsSandboxChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Update an APNS sandbox channel\"\
    },\
    \"UpdateApplicationSettings\" : {\
      \"name\" : \"UpdateApplicationSettings\",\
      \"http\" : {\
        \"method\" : \"PUT\",\
        \"requestUri\" : \"/v1/apps/{application-id}/settings\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"UpdateApplicationSettingsRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"UpdateApplicationSettingsResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Used to update the settings for an app.\"\
    },\
    \"UpdateCampaign\" : {\
      \"name\" : \"UpdateCampaign\",\
      \"http\" : {\
        \"method\" : \"PUT\",\
        \"requestUri\" : \"/v1/apps/{application-id}/campaigns/{campaign-id}\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"UpdateCampaignRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"UpdateCampaignResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Use to update a campaign.\"\
    },\
    \"UpdateEmailChannel\" : {\
      \"name\" : \"UpdateEmailChannel\",\
      \"http\" : {\
        \"method\" : \"PUT\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/email\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"UpdateEmailChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"UpdateEmailChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Update an email channel\"\
    },\
    \"UpdateEndpoint\" : {\
      \"name\" : \"UpdateEndpoint\",\
      \"http\" : {\
        \"method\" : \"PUT\",\
        \"requestUri\" : \"/v1/apps/{application-id}/endpoints/{endpoint-id}\",\
        \"responseCode\" : 202\
      },\
      \"input\" : {\
        \"shape\" : \"UpdateEndpointRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"UpdateEndpointResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Use to update an endpoint.\"\
    },\
    \"UpdateEndpointsBatch\" : {\
      \"name\" : \"UpdateEndpointsBatch\",\
      \"http\" : {\
        \"method\" : \"PUT\",\
        \"requestUri\" : \"/v1/apps/{application-id}/endpoints\",\
        \"responseCode\" : 202\
      },\
      \"input\" : {\
        \"shape\" : \"UpdateEndpointsBatchRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"UpdateEndpointsBatchResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Use to update a batch of endpoints.\"\
    },\
    \"UpdateGcmChannel\" : {\
      \"name\" : \"UpdateGcmChannel\",\
      \"http\" : {\
        \"method\" : \"PUT\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/gcm\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"UpdateGcmChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"UpdateGcmChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Use to update the GCM channel for an app.\"\
    },\
    \"UpdateSegment\" : {\
      \"name\" : \"UpdateSegment\",\
      \"http\" : {\
        \"method\" : \"PUT\",\
        \"requestUri\" : \"/v1/apps/{application-id}/segments/{segment-id}\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"UpdateSegmentRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"UpdateSegmentResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Use to update a segment.\"\
    },\
    \"UpdateSmsChannel\" : {\
      \"name\" : \"UpdateSmsChannel\",\
      \"http\" : {\
        \"method\" : \"PUT\",\
        \"requestUri\" : \"/v1/apps/{application-id}/channels/sms\",\
        \"responseCode\" : 200\
      },\
      \"input\" : {\
        \"shape\" : \"UpdateSmsChannelRequest\"\
      },\
      \"output\" : {\
        \"shape\" : \"UpdateSmsChannelResponse\"\
      },\
      \"errors\" : [ {\
        \"shape\" : \"BadRequestException\"\
      }, {\
        \"shape\" : \"InternalServerErrorException\"\
      }, {\
        \"shape\" : \"ForbiddenException\"\
      }, {\
        \"shape\" : \"NotFoundException\"\
      }, {\
        \"shape\" : \"MethodNotAllowedException\"\
      }, {\
        \"shape\" : \"TooManyRequestsException\"\
      } ],\
      \"documentation\" : \"Update an SMS channel\"\
    }\
  },\
  \"shapes\" : {\
    \"APNSChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Certificate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The distribution certificate from Apple.\"\
        },\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"If the channel is enabled for sending messages.\"\
        },\
        \"PrivateKey\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The certificate private key.\"\
        }\
      },\
      \"documentation\" : \"Apple Push Notification Service channel definition.\"\
    },\
    \"APNSChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of the application to which the channel applies.\"\
        },\
        \"CreationDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"When was this segment created\"\
        },\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"If the channel is enabled for sending messages.\"\
        },\
        \"Id\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Channel ID. Not used, only for backwards compatibility.\"\
        },\
        \"IsArchived\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Is this channel archived\"\
        },\
        \"LastModifiedBy\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Who last updated this entry\"\
        },\
        \"LastModifiedDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Last date this was updated\"\
        },\
        \"Platform\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The platform type. Will be APNS.\"\
        },\
        \"Version\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"Version of channel\"\
        }\
      },\
      \"documentation\" : \"Apple Distribution Push Notification Service channel definition.\"\
    },\
    \"APNSMessage\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Action\" : {\
          \"shape\" : \"Action\",\
          \"documentation\" : \"The action that occurs if the user taps a push notification delivered by the campaign: OPEN_APP - Your app launches, or it becomes the foreground app if it has been sent to the background. This is the default action. DEEP_LINK - Uses deep linking features in iOS and Android to open your app and display a designated user interface within the app. URL - The default mobile browser on the user's device launches and opens a web page at the URL you specify. Possible values include: OPEN_APP | DEEP_LINK | URL\"\
        },\
        \"Badge\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"Include this key when you want the system to modify the badge of your app icon. If this key is not included in the dictionary, the badge is not changed. To remove the badge, set the value of this key to 0.\"\
        },\
        \"Body\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The message body of the notification, the email body or the text message.\"\
        },\
        \"Category\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Provide this key with a string value that represents the notification's type. This value corresponds to the value in the identifier property of one of your app's registered categories.\"\
        },\
        \"Data\" : {\
          \"shape\" : \"MapOf__string\",\
          \"documentation\" : \"The data payload used for a silent push. This payload is added to the notifications' data.pinpoint.jsonBody' object\"\
        },\
        \"MediaUrl\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The URL that points to a video used in the push notification.\"\
        },\
        \"RawContent\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The Raw JSON formatted string to be used as the payload. This value overrides the message.\"\
        },\
        \"SilentPush\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Indicates if the message should display on the users device. Silent pushes can be used for Remote Configuration and Phone Home use cases.\"\
        },\
        \"Sound\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Include this key when you want the system to play a sound. The value of this key is the name of a sound file in your app's main bundle or in the Library/Sounds folder of your app's data container. If the sound file cannot be found, or if you specify defaultfor the value, the system plays the default alert sound.\"\
        },\
        \"Substitutions\" : {\
          \"shape\" : \"MapOfListOf__string\",\
          \"documentation\" : \"Default message substitutions. Can be overridden by individual address substitutions.\"\
        },\
        \"ThreadId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Provide this key with a string value that represents the app-specific identifier for grouping notifications. If you provide a Notification Content app extension, you can use this value to group your notifications together.\"\
        },\
        \"Title\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The message title that displays above the message on the user's device.\"\
        },\
        \"Url\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The URL to open in the user's mobile browser. Used if the value for Action is URL.\"\
        }\
      },\
      \"documentation\" : \"APNS Message.\"\
    },\
    \"APNSSandboxChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Certificate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The distribution certificate from Apple.\"\
        },\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"If the channel is enabled for sending messages.\"\
        },\
        \"PrivateKey\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The certificate private key.\"\
        }\
      },\
      \"documentation\" : \"Apple Development Push Notification Service channel definition.\"\
    },\
    \"APNSSandboxChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Application id\"\
        },\
        \"CreationDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"When was this segment created\"\
        },\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"If the channel is enabled for sending messages.\"\
        },\
        \"Id\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Channel ID. Not used, only for backwards compatibility.\"\
        },\
        \"IsArchived\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Is this channel archived\"\
        },\
        \"LastModifiedBy\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Who last updated this entry\"\
        },\
        \"LastModifiedDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Last date this was updated\"\
        },\
        \"Platform\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The platform type. Will be APNS.\"\
        },\
        \"Version\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"Version of channel\"\
        }\
      },\
      \"documentation\" : \"Apple Development Push Notification Service channel definition.\"\
    },\
    \"Action\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"OPEN_APP\", \"DEEP_LINK\", \"URL\" ]\
    },\
    \"ActivitiesResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Item\" : {\
          \"shape\" : \"ListOfActivityResponse\",\
          \"documentation\" : \"List of campaign activities\"\
        }\
      },\
      \"documentation\" : \"Activities for campaign.\"\
    },\
    \"ActivityResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of the application to which the campaign applies.\"\
        },\
        \"CampaignId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of the campaign to which the activity applies.\"\
        },\
        \"End\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The actual time the activity was marked CANCELLED or COMPLETED. Provided in ISO 8601 format.\"\
        },\
        \"Id\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique activity ID.\"\
        },\
        \"Result\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Indicates whether the activity succeeded.\\n\\nValid values: SUCCESS, FAIL\"\
        },\
        \"ScheduledStart\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The scheduled start time for the activity in ISO 8601 format.\"\
        },\
        \"Start\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The actual start time of the activity in ISO 8601 format.\"\
        },\
        \"State\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The state of the activity.\\n\\nValid values: PENDING, INITIALIZING, RUNNING, PAUSED, CANCELLED, COMPLETED\"\
        },\
        \"SuccessfulEndpointCount\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The total number of endpoints to which the campaign successfully delivered messages.\"\
        },\
        \"TimezonesCompletedCount\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The total number of timezones completed.\"\
        },\
        \"TimezonesTotalCount\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The total number of unique timezones present in the segment.\"\
        },\
        \"TotalEndpointCount\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The total number of endpoints to which the campaign attempts to deliver messages.\"\
        },\
        \"TreatmentId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of a variation of the campaign used for A/B testing.\"\
        }\
      },\
      \"documentation\" : \"Activity definition\"\
    },\
    \"AddressConfiguration\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"BodyOverride\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Body override. If specified will override default body.\"\
        },\
        \"ChannelType\" : {\
          \"shape\" : \"ChannelType\",\
          \"documentation\" : \"Type of channel of this address\"\
        },\
        \"Context\" : {\
          \"shape\" : \"MapOf__string\",\
          \"documentation\" : \"A map of custom attributes to attributes to be attached to the message for this address. This payload is added to the push notification's 'data.pinpoint' object or added to the email/sms delivery receipt event attributes.\"\
        },\
        \"RawContent\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The Raw JSON formatted string to be used as the payload. This value overrides the message.\"\
        },\
        \"Substitutions\" : {\
          \"shape\" : \"MapOfListOf__string\",\
          \"documentation\" : \"A map of substitution values for the message to be merged with the DefaultMessage's substitutions. Substitutions on this map take precedence over the all other substitutions.\"\
        },\
        \"TitleOverride\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Title override. If specified will override default title if applicable.\"\
        }\
      },\
      \"documentation\" : \"Address configuration.\"\
    },\
    \"ApplicationSettingsResource\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique ID for the application.\"\
        },\
        \"LastModifiedDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The date that the settings were last updated in ISO 8601 format.\"\
        },\
        \"Limits\" : {\
          \"shape\" : \"CampaignLimits\",\
          \"documentation\" : \"The default campaign limits for the app. These limits apply to each campaign for the app, unless the campaign overrides the default with limits of its own.\"\
        },\
        \"QuietTime\" : {\
          \"shape\" : \"QuietTime\",\
          \"documentation\" : \"The default quiet time for the app. Each campaign for this app sends no messages during this time unless the campaign overrides the default with a quiet time of its own.\"\
        }\
      },\
      \"documentation\" : \"Application settings.\"\
    },\
    \"AttributeDimension\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"AttributeType\" : {\
          \"shape\" : \"AttributeType\",\
          \"documentation\" : \"The type of dimension:\\nINCLUSIVE - Endpoints that match the criteria are included in the segment.\\nEXCLUSIVE - Endpoints that match the criteria are excluded from the segment.\"\
        },\
        \"Values\" : {\
          \"shape\" : \"ListOf__string\",\
          \"documentation\" : \"The criteria values for the segment dimension. Endpoints with matching attribute values are included or excluded from the segment, depending on the setting for Type.\"\
        }\
      },\
      \"documentation\" : \"Custom attibute dimension\"\
    },\
    \"AttributeType\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"INCLUSIVE\", \"EXCLUSIVE\" ]\
    },\
    \"BadRequestException\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Message\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The error message returned from the API.\"\
        },\
        \"RequestID\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique message body ID.\"\
        }\
      },\
      \"documentation\" : \"Simple message object.\",\
      \"exception\" : true,\
      \"error\" : {\
        \"httpStatusCode\" : 400\
      }\
    },\
    \"CampaignEmailMessage\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Body\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The email text body.\"\
        },\
        \"HtmlBody\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The email html body.\"\
        },\
        \"Title\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The email title (Or subject).\"\
        }\
      },\
      \"documentation\" : \"The email message configuration.\"\
    },\
    \"CampaignLimits\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Daily\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The maximum number of messages that the campaign can send daily.\"\
        },\
        \"Total\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The maximum total number of messages that the campaign can send.\"\
        }\
      },\
      \"documentation\" : \"Campaign Limits are used to limit the number of messages that can be sent to a user.\"\
    },\
    \"CampaignResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"AdditionalTreatments\" : {\
          \"shape\" : \"ListOfTreatmentResource\",\
          \"documentation\" : \"Treatments that are defined in addition to the default treatment.\"\
        },\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of the application to which the campaign applies.\"\
        },\
        \"CreationDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The date the campaign was created in ISO 8601 format.\"\
        },\
        \"DefaultState\" : {\
          \"shape\" : \"CampaignState\",\
          \"documentation\" : \"The status of the campaign's default treatment. Only present for A/B test campaigns.\"\
        },\
        \"Description\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A description of the campaign.\"\
        },\
        \"HoldoutPercent\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The allocated percentage of end users who will not receive messages from this campaign.\"\
        },\
        \"Id\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique campaign ID.\"\
        },\
        \"IsPaused\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Indicates whether the campaign is paused. A paused campaign does not send messages unless you resume it by setting IsPaused to false.\"\
        },\
        \"LastModifiedDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The date the campaign was last updated in ISO 8601 format.\\t\"\
        },\
        \"Limits\" : {\
          \"shape\" : \"CampaignLimits\",\
          \"documentation\" : \"The campaign limits settings.\"\
        },\
        \"MessageConfiguration\" : {\
          \"shape\" : \"MessageConfiguration\",\
          \"documentation\" : \"The message configuration settings.\"\
        },\
        \"Name\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The custom name of the campaign.\"\
        },\
        \"Schedule\" : {\
          \"shape\" : \"Schedule\",\
          \"documentation\" : \"The campaign schedule.\"\
        },\
        \"SegmentId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of the segment to which the campaign sends messages.\"\
        },\
        \"SegmentVersion\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The version of the segment to which the campaign sends messages.\"\
        },\
        \"State\" : {\
          \"shape\" : \"CampaignState\",\
          \"documentation\" : \"The campaign status.\\n\\nAn A/B test campaign will have a status of COMPLETED only when all treatments have a status of COMPLETED.\"\
        },\
        \"TreatmentDescription\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A custom description for the treatment.\"\
        },\
        \"TreatmentName\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The custom name of a variation of the campaign used for A/B testing.\"\
        },\
        \"Version\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The campaign version number.\"\
        }\
      },\
      \"documentation\" : \"Campaign definition\"\
    },\
    \"CampaignSmsMessage\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Body\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The SMS text body.\"\
        },\
        \"MessageType\" : {\
          \"shape\" : \"MessageType\",\
          \"documentation\" : \"Is this is a transactional SMS message, otherwise a promotional message.\"\
        },\
        \"SenderId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Sender ID of sent message.\"\
        }\
      },\
      \"documentation\" : \"SMS message configuration.\"\
    },\
    \"CampaignState\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"CampaignStatus\" : {\
          \"shape\" : \"CampaignStatus\",\
          \"documentation\" : \"The status of the campaign, or the status of a treatment that belongs to an A/B test campaign.\\n\\nValid values: SCHEDULED, EXECUTING, PENDING_NEXT_RUN, COMPLETED, PAUSED\"\
        }\
      },\
      \"documentation\" : \"State of the Campaign\"\
    },\
    \"CampaignStatus\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"SCHEDULED\", \"EXECUTING\", \"PENDING_NEXT_RUN\", \"COMPLETED\", \"PAUSED\" ]\
    },\
    \"CampaignsResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Item\" : {\
          \"shape\" : \"ListOfCampaignResponse\",\
          \"documentation\" : \"A list of campaigns.\"\
        },\
        \"NextToken\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The string that you use in a subsequent request to get the next page of results in a paginated response.\"\
        }\
      },\
      \"documentation\" : \"List of available campaigns.\"\
    },\
    \"ChannelType\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"GCM\", \"APNS\", \"APNS_SANDBOX\", \"ADM\", \"SMS\", \"EMAIL\" ]\
    },\
    \"CreateCampaignRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"WriteCampaignRequest\" : {\
          \"shape\" : \"WriteCampaignRequest\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"WriteCampaignRequest\" ],\
      \"payload\" : \"WriteCampaignRequest\"\
    },\
    \"CreateCampaignResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"CampaignResponse\" : {\
          \"shape\" : \"CampaignResponse\"\
        }\
      },\
      \"required\" : [ \"CampaignResponse\" ],\
      \"payload\" : \"CampaignResponse\"\
    },\
    \"CreateImportJobRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"ImportJobRequest\" : {\
          \"shape\" : \"ImportJobRequest\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"ImportJobRequest\" ],\
      \"payload\" : \"ImportJobRequest\"\
    },\
    \"CreateImportJobResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ImportJobResponse\" : {\
          \"shape\" : \"ImportJobResponse\"\
        }\
      },\
      \"required\" : [ \"ImportJobResponse\" ],\
      \"payload\" : \"ImportJobResponse\"\
    },\
    \"CreateSegmentRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"WriteSegmentRequest\" : {\
          \"shape\" : \"WriteSegmentRequest\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"WriteSegmentRequest\" ],\
      \"payload\" : \"WriteSegmentRequest\"\
    },\
    \"CreateSegmentResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"SegmentResponse\" : {\
          \"shape\" : \"SegmentResponse\"\
        }\
      },\
      \"required\" : [ \"SegmentResponse\" ],\
      \"payload\" : \"SegmentResponse\"\
    },\
    \"DefaultMessage\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Body\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The message body of the notification, the email body or the text message.\"\
        },\
        \"Substitutions\" : {\
          \"shape\" : \"MapOfListOf__string\",\
          \"documentation\" : \"Default message substitutions. Can be overridden by individual address substitutions.\"\
        }\
      },\
      \"documentation\" : \"Default Message across push notification, email, and sms.\"\
    },\
    \"DefaultPushNotificationMessage\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Action\" : {\
          \"shape\" : \"Action\",\
          \"documentation\" : \"The action that occurs if the user taps a push notification delivered by the campaign: OPEN_APP - Your app launches, or it becomes the foreground app if it has been sent to the background. This is the default action. DEEP_LINK - Uses deep linking features in iOS and Android to open your app and display a designated user interface within the app. URL - The default mobile browser on the user's device launches and opens a web page at the URL you specify. Possible values include: OPEN_APP | DEEP_LINK | URL\"\
        },\
        \"Body\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The message body of the notification, the email body or the text message.\"\
        },\
        \"Data\" : {\
          \"shape\" : \"MapOf__string\",\
          \"documentation\" : \"The data payload used for a silent push. This payload is added to the notifications' data.pinpoint.jsonBody' object\"\
        },\
        \"SilentPush\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Indicates if the message should display on the users device. Silent pushes can be used for Remote Configuration and Phone Home use cases.\"\
        },\
        \"Substitutions\" : {\
          \"shape\" : \"MapOfListOf__string\",\
          \"documentation\" : \"Default message substitutions. Can be overridden by individual address substitutions.\"\
        },\
        \"Title\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The message title that displays above the message on the user's device.\"\
        },\
        \"Url\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The URL to open in the user's mobile browser. Used if the value for Action is URL.\"\
        }\
      },\
      \"documentation\" : \"Default Push Notification Message.\"\
    },\
    \"DeleteApnsChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"DeleteApnsChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"APNSChannelResponse\" : {\
          \"shape\" : \"APNSChannelResponse\"\
        }\
      },\
      \"required\" : [ \"APNSChannelResponse\" ],\
      \"payload\" : \"APNSChannelResponse\"\
    },\
    \"DeleteApnsSandboxChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"DeleteApnsSandboxChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"APNSSandboxChannelResponse\" : {\
          \"shape\" : \"APNSSandboxChannelResponse\"\
        }\
      },\
      \"required\" : [ \"APNSSandboxChannelResponse\" ],\
      \"payload\" : \"APNSSandboxChannelResponse\"\
    },\
    \"DeleteCampaignRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"CampaignId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"campaign-id\"\
        }\
      },\
      \"required\" : [ \"CampaignId\", \"ApplicationId\" ]\
    },\
    \"DeleteCampaignResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"CampaignResponse\" : {\
          \"shape\" : \"CampaignResponse\"\
        }\
      },\
      \"required\" : [ \"CampaignResponse\" ],\
      \"payload\" : \"CampaignResponse\"\
    },\
    \"DeleteEmailChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"DeleteEmailChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"EmailChannelResponse\" : {\
          \"shape\" : \"EmailChannelResponse\"\
        }\
      },\
      \"required\" : [ \"EmailChannelResponse\" ],\
      \"payload\" : \"EmailChannelResponse\"\
    },\
    \"DeleteEventStreamRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\",\
          \"documentation\": \"ApplicationId\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ],\
      \"documentation\": \"DeleteEventStream Request\"\
    },\
    \"DeleteEventStreamResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"EventStream\" : {\
          \"shape\" : \"EventStream\"\
        }\
      },\
      \"required\" : [ \"EventStream\" ],\
      \"payload\" : \"EventStream\",\
      \"documentation\": \"DeleteEventStream Response\"\
    },\
    \"DeleteGcmChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"DeleteGcmChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"GCMChannelResponse\" : {\
          \"shape\" : \"GCMChannelResponse\"\
        }\
      },\
      \"required\" : [ \"GCMChannelResponse\" ],\
      \"payload\" : \"GCMChannelResponse\"\
    },\
    \"DeleteSegmentRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"SegmentId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"segment-id\"\
        }\
      },\
      \"required\" : [ \"SegmentId\", \"ApplicationId\" ]\
    },\
    \"DeleteSegmentResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"SegmentResponse\" : {\
          \"shape\" : \"SegmentResponse\"\
        }\
      },\
      \"required\" : [ \"SegmentResponse\" ],\
      \"payload\" : \"SegmentResponse\"\
    },\
    \"DeleteSmsChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"DeleteSmsChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"SMSChannelResponse\" : {\
          \"shape\" : \"SMSChannelResponse\"\
        }\
      },\
      \"required\" : [ \"SMSChannelResponse\" ],\
      \"payload\" : \"SMSChannelResponse\"\
    },\
    \"DeliveryStatus\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"SUCCESSFUL\", \"THROTTLED\", \"TEMPORARY_FAILURE\", \"PERMANENT_FAILURE\" ]\
    },\
    \"DimensionType\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"INCLUSIVE\", \"EXCLUSIVE\" ]\
    },\
    \"DirectMessageConfiguration\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"APNSMessage\" : {\
          \"shape\" : \"APNSMessage\",\
          \"documentation\" : \"The message to APNS channels. Overrides the default push notification message.\"\
        },\
        \"DefaultMessage\" : {\
          \"shape\" : \"DefaultMessage\",\
          \"documentation\" : \"The default message for all channels.\"\
        },\
        \"DefaultPushNotificationMessage\" : {\
          \"shape\" : \"DefaultPushNotificationMessage\",\
          \"documentation\" : \"The default push notification message for all push channels.\"\
        },\
        \"GCMMessage\" : {\
          \"shape\" : \"GCMMessage\",\
          \"documentation\" : \"The message to GCM channels. Overrides the default push notification message.\"\
        },\
        \"SMSMessage\" : {\
          \"shape\" : \"SMSMessage\",\
          \"documentation\" : \"The message to SMS channels. Overrides the default message.\"\
        }\
      },\
      \"documentation\" : \"The message configuration.\"\
    },\
    \"Duration\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"HR_24\", \"DAY_7\", \"DAY_14\", \"DAY_30\" ]\
    },\
    \"EmailChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"If the channel is enabled for sending messages.\"\
        },\
        \"FromAddress\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The email address used to send emails from.\"\
        },\
        \"Identity\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ARN of an identity verified with SES.\"\
        },\
        \"RoleArn\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ARN of an IAM Role used to submit events to Mobile Analytics' event ingestion service\"\
        }\
      },\
      \"documentation\" : \"Email Channel Request\"\
    },\
    \"EmailChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Application id\"\
        },\
        \"CreationDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The date that the settings were last updated in ISO 8601 format.\"\
        },\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"If the channel is enabled for sending messages.\"\
        },\
        \"FromAddress\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The email address used to send emails from.\"\
        },\
        \"Id\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Channel ID. Not used, only for backwards compatibility.\"\
        },\
        \"Identity\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ARN of an identity verified with SES.\"\
        },\
        \"IsArchived\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Is this channel archived\"\
        },\
        \"LastModifiedBy\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Who last updated this entry\"\
        },\
        \"LastModifiedDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Last date this was updated\"\
        },\
        \"Platform\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Platform type. Will be \\\"EMAIL\\\"\"\
        },\
        \"RoleArn\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ARN of an IAM Role used to submit events to Mobile Analytics' event ingestion service\"\
        },\
        \"Version\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"Version of channel\"\
        }\
      },\
      \"documentation\" : \"Email Channel Response.\"\
    },\
    \"EndpointBatchItem\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Address\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The address or token of the endpoint as provided by your push provider (e.g. DeviceToken or RegistrationId).\"\
        },\
        \"Attributes\" : {\
          \"shape\" : \"MapOfListOf__string\",\
          \"documentation\" : \"Custom attributes that your app reports to Amazon Pinpoint. You can use these attributes as selection criteria when you create a segment.\"\
        },\
        \"ChannelType\" : {\
          \"shape\" : \"ChannelType\",\
          \"documentation\" : \"The channel type.\\n\\nValid values: APNS, GCM\"\
        },\
        \"Demographic\" : {\
          \"shape\" : \"EndpointDemographic\",\
          \"documentation\" : \"The endpoint demographic attributes.\"\
        },\
        \"EffectiveDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The last time the endpoint was updated. Provided in ISO 8601 format.\"\
        },\
        \"EndpointStatus\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The endpoint status. Can be either ACTIVE or INACTIVE. Will be set to INACTIVE if a delivery fails. Will be set to ACTIVE if the address is updated.\"\
        },\
        \"Id\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique Id for the Endpoint in the batch.\"\
        },\
        \"Location\" : {\
          \"shape\" : \"EndpointLocation\",\
          \"documentation\" : \"The endpoint location attributes.\"\
        },\
        \"Metrics\" : {\
          \"shape\" : \"MapOf__double\",\
          \"documentation\" : \"Custom metrics that your app reports to Amazon Pinpoint.\"\
        },\
        \"OptOut\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Indicates whether a user has opted out of receiving messages with one of the following values:\\n\\nALL Ã¢â¬â User receives all messages.\\nNONE Ã¢â¬â User receives no messages.\"\
        },\
        \"RequestId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique ID for the most recent request to update the endpoint.\"\
        },\
        \"User\" : {\
          \"shape\" : \"EndpointUser\",\
          \"documentation\" : \"Custom user-specific attributes that your app reports to Amazon Pinpoint.\"\
        }\
      },\
      \"documentation\" : \"Endpoint update request\"\
    },\
    \"EndpointBatchRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Item\" : {\
          \"shape\" : \"ListOfEndpointBatchItem\",\
          \"documentation\" : \"List of items to update. Maximum 100 items\"\
        }\
      },\
      \"documentation\" : \"Endpoint batch update request.\"\
    },\
    \"EndpointDemographic\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"AppVersion\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The version of the application associated with the endpoint.\"\
        },\
        \"Locale\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The endpoint locale in the following format: The ISO 639-1 alpha-2 code, followed by an underscore, followed by an ISO 3166-1 alpha-2 value.\\n\"\
        },\
        \"Make\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The endpoint make, such as such as Apple or Samsung.\"\
        },\
        \"Model\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The endpoint model, such as iPhone.\"\
        },\
        \"ModelVersion\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The endpoint model version.\"\
        },\
        \"Platform\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The endpoint platform, such as ios or android.\"\
        },\
        \"PlatformVersion\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The endpoint platform version.\"\
        },\
        \"Timezone\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The timezone of the endpoint. Specified as a tz database value, such as Americas/Los_Angeles.\"\
        }\
      },\
      \"documentation\" : \"Endpoint demographic data\"\
    },\
    \"EndpointLocation\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"City\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The city where the endpoint is located.\"\
        },\
        \"Country\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Country according to ISO 3166-1 Alpha-2 codes. For example, US.\"\
        },\
        \"Latitude\" : {\
          \"shape\" : \"__double\",\
          \"documentation\" : \"The latitude of the endpoint location. Rounded to one decimal (Roughly corresponding to a mile).\"\
        },\
        \"Longitude\" : {\
          \"shape\" : \"__double\",\
          \"documentation\" : \"The longitude of the endpoint location. Rounded to one decimal (Roughly corresponding to a mile).\"\
        },\
        \"PostalCode\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The postal code or zip code of the endpoint.\"\
        },\
        \"Region\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The region of the endpoint location. For example, corresponds to a state in US.\"\
        }\
      },\
      \"documentation\" : \"Endpoint location data\"\
    },\
    \"EndpointRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Address\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The address or token of the endpoint as provided by your push provider (e.g. DeviceToken or RegistrationId).\"\
        },\
        \"Attributes\" : {\
          \"shape\" : \"MapOfListOf__string\",\
          \"documentation\" : \"Custom attributes that your app reports to Amazon Pinpoint. You can use these attributes as selection criteria when you create a segment.\"\
        },\
        \"ChannelType\" : {\
          \"shape\" : \"ChannelType\",\
          \"documentation\" : \"The channel type.\\n\\nValid values: APNS, GCM\"\
        },\
        \"Demographic\" : {\
          \"shape\" : \"EndpointDemographic\",\
          \"documentation\" : \"The endpoint demographic attributes.\"\
        },\
        \"EffectiveDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The last time the endpoint was updated. Provided in ISO 8601 format.\"\
        },\
        \"EndpointStatus\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The endpoint status. Can be either ACTIVE or INACTIVE. Will be set to INACTIVE if a delivery fails. Will be set to ACTIVE if the address is updated.\"\
        },\
        \"Location\" : {\
          \"shape\" : \"EndpointLocation\",\
          \"documentation\" : \"The endpoint location attributes.\"\
        },\
        \"Metrics\" : {\
          \"shape\" : \"MapOf__double\",\
          \"documentation\" : \"Custom metrics that your app reports to Amazon Pinpoint.\"\
        },\
        \"OptOut\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Indicates whether a user has opted out of receiving messages with one of the following values:\\n\\nALL Ã¢â¬â User receives all messages.\\nNONE Ã¢â¬â User receives no messages.\"\
        },\
        \"RequestId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique ID for the most recent request to update the endpoint.\"\
        },\
        \"User\" : {\
          \"shape\" : \"EndpointUser\",\
          \"documentation\" : \"Custom user-specific attributes that your app reports to Amazon Pinpoint.\"\
        }\
      },\
      \"documentation\" : \"Endpoint update request\"\
    },\
    \"EndpointResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Address\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The address or token of the endpoint as provided by your push provider (e.g. DeviceToken or RegistrationId).\"\
        },\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of the application associated with the endpoint.\"\
        },\
        \"Attributes\" : {\
          \"shape\" : \"MapOfListOf__string\",\
          \"documentation\" : \"Custom attributes that your app reports to Amazon Pinpoint. You can use these attributes as selection criteria when you create a segment.\"\
        },\
        \"ChannelType\" : {\
          \"shape\" : \"ChannelType\",\
          \"documentation\" : \"The channel type.\\n\\nValid values: APNS, GCM\"\
        },\
        \"CohortId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A number from 0 - 99 that represents the cohort the endpoint is assigned to. Endpoints are grouped into cohorts randomly, and each cohort contains approximately 1 percent of the endpoints for an app. Amazon Pinpoint assigns cohorts to the holdout or treatment allocations for a campaign.\"\
        },\
        \"CreationDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The last time the endpoint was created. Provided in ISO 8601 format.\"\
        },\
        \"Demographic\" : {\
          \"shape\" : \"EndpointDemographic\",\
          \"documentation\" : \"The endpoint demographic attributes.\"\
        },\
        \"EffectiveDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The last time the endpoint was updated. Provided in ISO 8601 format.\"\
        },\
        \"EndpointStatus\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The endpoint status. Can be either ACTIVE or INACTIVE. Will be set to INACTIVE if a delivery fails. Will be set to ACTIVE if the address is updated.\"\
        },\
        \"Id\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique ID that you assigned to the endpoint. The ID should be a globally unique identifier (GUID) to ensure that it is unique compared to all other endpoints for the application.\"\
        },\
        \"Location\" : {\
          \"shape\" : \"EndpointLocation\",\
          \"documentation\" : \"The endpoint location attributes.\"\
        },\
        \"Metrics\" : {\
          \"shape\" : \"MapOf__double\",\
          \"documentation\" : \"Custom metrics that your app reports to Amazon Pinpoint.\"\
        },\
        \"OptOut\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Indicates whether a user has opted out of receiving messages with one of the following values:\\n\\nALL Ã¢â¬â User receives all messages.\\nNONE Ã¢â¬â User receives no messages.\"\
        },\
        \"RequestId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique ID for the most recent request to update the endpoint.\"\
        },\
        \"User\" : {\
          \"shape\" : \"EndpointUser\",\
          \"documentation\" : \"Custom user-specific attributes that your app reports to Amazon Pinpoint.\"\
        },\
        \"ShardId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ShardId of endpoint\"\
        }\
      },\
      \"documentation\" : \"Endpoint response\"\
    },\
    \"EndpointUser\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"UserAttributes\" : {\
          \"shape\" : \"MapOfListOf__string\",\
          \"documentation\" : \"Custom attributes specific to the user.\"\
        },\
        \"UserId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique ID of the user.\"\
        }\
      },\
      \"documentation\" : \"Endpoint user specific custom userAttributes\"\
    },\
    \"EventStream\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of the application from which events should be published.\"\
        },\
        \"DestinationStreamArn\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The Amazon Resource Name (ARN) of the Amazon Kinesis stream or Firehose delivery stream to which you want to publish events.\\n Firehose ARN: arn:aws:firehose:REGION:ACCOUNT_ID:deliverystream/STREAM_NAME\\n Kinesis ARN: arn:aws:kinesis:REGION:ACCOUNT_ID:stream/STREAM_NAME\"\
        },\
        \"ExternalId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The external ID assigned the IAM role that authorizes Amazon Pinpoint to publish to the stream.\"\
        },\
        \"LastModifiedDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The date the event stream was last updated in ISO 8601 format.\"\
        },\
        \"LastUpdatedBy\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The IAM user who last modified the event stream.\"\
        },\
        \"RoleArn\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The IAM role that authorizes Amazon Pinpoint to publish events to the stream in your account.\"\
        }\
      },\
      \"documentation\" : \"Model for an event publishing subscription export.\"\
    },\
    \"ForbiddenException\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Message\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The error message returned from the API.\"\
        },\
        \"RequestID\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique message body ID.\"\
        }\
      },\
      \"documentation\" : \"Simple message object.\",\
      \"exception\" : true,\
      \"error\" : {\
        \"httpStatusCode\" : 403\
      }\
    },\
    \"Format\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"CSV\", \"JSON\" ]\
    },\
    \"Frequency\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"ONCE\", \"HOURLY\", \"DAILY\", \"WEEKLY\", \"MONTHLY\" ]\
    },\
    \"GCMChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApiKey\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Platform credential API key from Google.\"\
        },\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"If the channel is enabled for sending messages.\"\
        }\
      },\
      \"documentation\" : \"Google Cloud Messaging credentials\"\
    },\
    \"GCMChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of the application to which the channel applies.\"\
        },\
        \"CreationDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"When was this segment created\"\
        },\
        \"Credential\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The GCM API key from Google.\"\
        },\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"If the channel is enabled for sending messages.\"\
        },\
        \"Id\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Channel ID. Not used, only for backwards compatibility.\"\
        },\
        \"IsArchived\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Is this channel archived\"\
        },\
        \"LastModifiedBy\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Who last updated this entry\"\
        },\
        \"LastModifiedDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Last date this was updated\"\
        },\
        \"Platform\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The platform type. Will be GCM\"\
        },\
        \"Version\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"Version of channel\"\
        }\
      },\
      \"documentation\" : \"Google Cloud Messaging channel definition\"\
    },\
    \"GCMMessage\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Action\" : {\
          \"shape\" : \"Action\",\
          \"documentation\" : \"The action that occurs if the user taps a push notification delivered by the campaign: OPEN_APP - Your app launches, or it becomes the foreground app if it has been sent to the background. This is the default action. DEEP_LINK - Uses deep linking features in iOS and Android to open your app and display a designated user interface within the app. URL - The default mobile browser on the user's device launches and opens a web page at the URL you specify. Possible values include: OPEN_APP | DEEP_LINK | URL\"\
        },\
        \"Body\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The message body of the notification, the email body or the text message.\"\
        },\
        \"CollapseKey\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"This parameter identifies a group of messages (e.g., with collapse_key: \\\"Updates Available\\\") that can be collapsed, so that only the last message gets sent when delivery can be resumed. This is intended to avoid sending too many of the same messages when the device comes back online or becomes active.\"\
        },\
        \"Data\" : {\
          \"shape\" : \"MapOf__string\",\
          \"documentation\" : \"The data payload used for a silent push. This payload is added to the notifications' data.pinpoint.jsonBody' object\"\
        },\
        \"IconReference\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The icon image name of the asset saved in your application.\"\
        },\
        \"ImageIconUrl\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The URL that points to an image used as the large icon to the notification content view.\"\
        },\
        \"ImageUrl\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The URL that points to an image used in the push notification.\"\
        },\
        \"RawContent\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The Raw JSON formatted string to be used as the payload. This value overrides the message.\"\
        },\
        \"RestrictedPackageName\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"This parameter specifies the package name of the application where the registration tokens must match in order to receive the message.\"\
        },\
        \"SilentPush\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Indicates if the message should display on the users device. Silent pushes can be used for Remote Configuration and Phone Home use cases.\"\
        },\
        \"SmallImageIconUrl\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The URL that points to an image used as the small icon for the notification which will be used to represent the notification in the status bar and content view\"\
        },\
        \"Sound\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Indicates a sound to play when the device receives the notification. Supports default, or the filename of a sound resource bundled in the app. Android sound files must reside in /res/raw/\"\
        },\
        \"Substitutions\" : {\
          \"shape\" : \"MapOfListOf__string\",\
          \"documentation\" : \"Default message substitutions. Can be overridden by individual address substitutions.\"\
        },\
        \"Title\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The message title that displays above the message on the user's device.\"\
        },\
        \"Url\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The URL to open in the user's mobile browser. Used if the value for Action is URL.\"\
        }\
      },\
      \"documentation\" : \"GCM Message.\"\
    },\
    \"GetApnsChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"GetApnsChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"APNSChannelResponse\" : {\
          \"shape\" : \"APNSChannelResponse\"\
        }\
      },\
      \"required\" : [ \"APNSChannelResponse\" ],\
      \"payload\" : \"APNSChannelResponse\"\
    },\
    \"GetApnsSandboxChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"GetApnsSandboxChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"APNSSandboxChannelResponse\" : {\
          \"shape\" : \"APNSSandboxChannelResponse\"\
        }\
      },\
      \"required\" : [ \"APNSSandboxChannelResponse\" ],\
      \"payload\" : \"APNSSandboxChannelResponse\"\
    },\
    \"GetApplicationSettingsRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"GetApplicationSettingsResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationSettingsResource\" : {\
          \"shape\" : \"ApplicationSettingsResource\"\
        }\
      },\
      \"required\" : [ \"ApplicationSettingsResource\" ],\
      \"payload\" : \"ApplicationSettingsResource\"\
    },\
    \"GetCampaignActivitiesRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"CampaignId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"campaign-id\"\
        },\
        \"PageSize\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"page-size\"\
        },\
        \"Token\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"token\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"CampaignId\" ]\
    },\
    \"GetCampaignActivitiesResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ActivitiesResponse\" : {\
          \"shape\" : \"ActivitiesResponse\"\
        }\
      },\
      \"required\" : [ \"ActivitiesResponse\" ],\
      \"payload\" : \"ActivitiesResponse\"\
    },\
    \"GetCampaignRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"CampaignId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"campaign-id\"\
        }\
      },\
      \"required\" : [ \"CampaignId\", \"ApplicationId\" ]\
    },\
    \"GetCampaignResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"CampaignResponse\" : {\
          \"shape\" : \"CampaignResponse\"\
        }\
      },\
      \"required\" : [ \"CampaignResponse\" ],\
      \"payload\" : \"CampaignResponse\"\
    },\
    \"GetCampaignVersionRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"CampaignId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"campaign-id\"\
        },\
        \"Version\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"version\"\
        }\
      },\
      \"required\" : [ \"Version\", \"ApplicationId\", \"CampaignId\" ]\
    },\
    \"GetCampaignVersionResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"CampaignResponse\" : {\
          \"shape\" : \"CampaignResponse\"\
        }\
      },\
      \"required\" : [ \"CampaignResponse\" ],\
      \"payload\" : \"CampaignResponse\"\
    },\
    \"GetCampaignVersionsRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"CampaignId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"campaign-id\"\
        },\
        \"PageSize\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"page-size\"\
        },\
        \"Token\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"token\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"CampaignId\" ]\
    },\
    \"GetCampaignVersionsResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"CampaignsResponse\" : {\
          \"shape\" : \"CampaignsResponse\"\
        }\
      },\
      \"required\" : [ \"CampaignsResponse\" ],\
      \"payload\" : \"CampaignsResponse\"\
    },\
    \"GetCampaignsRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"PageSize\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"page-size\"\
        },\
        \"Token\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"token\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"GetCampaignsResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"CampaignsResponse\" : {\
          \"shape\" : \"CampaignsResponse\"\
        }\
      },\
      \"required\" : [ \"CampaignsResponse\" ],\
      \"payload\" : \"CampaignsResponse\"\
    },\
    \"GetEmailChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"GetEmailChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"EmailChannelResponse\" : {\
          \"shape\" : \"EmailChannelResponse\"\
        }\
      },\
      \"required\" : [ \"EmailChannelResponse\" ],\
      \"payload\" : \"EmailChannelResponse\"\
    },\
    \"GetEndpointRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"EndpointId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"endpoint-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"EndpointId\" ]\
    },\
    \"GetEndpointResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"EndpointResponse\" : {\
          \"shape\" : \"EndpointResponse\"\
        }\
      },\
      \"required\" : [ \"EndpointResponse\" ],\
      \"payload\" : \"EndpointResponse\"\
    },\
    \"GetEventStreamRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\",\
          \"documentation\": \"ApplicationId\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ],\
      \"documentation\": \"GetEventStream Request\"\
    },\
    \"GetEventStreamResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"EventStream\" : {\
          \"shape\" : \"EventStream\"\
        }\
      },\
      \"required\" : [ \"EventStream\" ],\
      \"payload\" : \"EventStream\",\
      \"documentation\": \"GetEventStream Response\"\
    },\
    \"GetGcmChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"GetGcmChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"GCMChannelResponse\" : {\
          \"shape\" : \"GCMChannelResponse\"\
        }\
      },\
      \"required\" : [ \"GCMChannelResponse\" ],\
      \"payload\" : \"GCMChannelResponse\"\
    },\
    \"GetImportJobRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"JobId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"job-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"JobId\" ]\
    },\
    \"GetImportJobResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ImportJobResponse\" : {\
          \"shape\" : \"ImportJobResponse\"\
        }\
      },\
      \"required\" : [ \"ImportJobResponse\" ],\
      \"payload\" : \"ImportJobResponse\"\
    },\
    \"GetImportJobsRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"PageSize\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"page-size\"\
        },\
        \"Token\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"token\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"GetImportJobsResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ImportJobsResponse\" : {\
          \"shape\" : \"ImportJobsResponse\"\
        }\
      },\
      \"required\" : [ \"ImportJobsResponse\" ],\
      \"payload\" : \"ImportJobsResponse\"\
    },\
    \"GetSegmentImportJobsRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"PageSize\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"page-size\"\
        },\
        \"SegmentId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"segment-id\"\
        },\
        \"Token\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"token\"\
        }\
      },\
      \"required\" : [ \"SegmentId\", \"ApplicationId\" ]\
    },\
    \"GetSegmentImportJobsResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ImportJobsResponse\" : {\
          \"shape\" : \"ImportJobsResponse\"\
        }\
      },\
      \"required\" : [ \"ImportJobsResponse\" ],\
      \"payload\" : \"ImportJobsResponse\"\
    },\
    \"GetSegmentRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"SegmentId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"segment-id\"\
        }\
      },\
      \"required\" : [ \"SegmentId\", \"ApplicationId\" ]\
    },\
    \"GetSegmentResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"SegmentResponse\" : {\
          \"shape\" : \"SegmentResponse\"\
        }\
      },\
      \"required\" : [ \"SegmentResponse\" ],\
      \"payload\" : \"SegmentResponse\"\
    },\
    \"GetSegmentVersionRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"SegmentId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"segment-id\"\
        },\
        \"Version\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"version\"\
        }\
      },\
      \"required\" : [ \"SegmentId\", \"Version\", \"ApplicationId\" ]\
    },\
    \"GetSegmentVersionResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"SegmentResponse\" : {\
          \"shape\" : \"SegmentResponse\"\
        }\
      },\
      \"required\" : [ \"SegmentResponse\" ],\
      \"payload\" : \"SegmentResponse\"\
    },\
    \"GetSegmentVersionsRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"PageSize\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"page-size\"\
        },\
        \"SegmentId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"segment-id\"\
        },\
        \"Token\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"token\"\
        }\
      },\
      \"required\" : [ \"SegmentId\", \"ApplicationId\" ]\
    },\
    \"GetSegmentVersionsResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"SegmentsResponse\" : {\
          \"shape\" : \"SegmentsResponse\"\
        }\
      },\
      \"required\" : [ \"SegmentsResponse\" ],\
      \"payload\" : \"SegmentsResponse\"\
    },\
    \"GetSegmentsRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"PageSize\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"page-size\"\
        },\
        \"Token\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"querystring\",\
          \"locationName\" : \"token\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"GetSegmentsResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"SegmentsResponse\" : {\
          \"shape\" : \"SegmentsResponse\"\
        }\
      },\
      \"required\" : [ \"SegmentsResponse\" ],\
      \"payload\" : \"SegmentsResponse\"\
    },\
    \"GetSmsChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\" ]\
    },\
    \"GetSmsChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"SMSChannelResponse\" : {\
          \"shape\" : \"SMSChannelResponse\"\
        }\
      },\
      \"required\" : [ \"SMSChannelResponse\" ],\
      \"payload\" : \"SMSChannelResponse\"\
    },\
    \"ImportJobRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"DefineSegment\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Sets whether the endpoints create a segment when they are imported.\"\
        },\
        \"ExternalId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A unique, custom ID assigned to the IAM role that restricts who can assume the role.\\t\"\
        },\
        \"Format\" : {\
          \"shape\" : \"Format\",\
          \"documentation\" : \"The format of the files that contain the endpoint definitions.\\nValid values: CSV, JSON\"\
        },\
        \"RegisterEndpoints\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Sets whether the endpoints are registered with Amazon Pinpoint when they are imported.\"\
        },\
        \"RoleArn\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The Amazon Resource Name (ARN) of an IAM role that grants Amazon Pinpoint access to the Amazon S3 location that contains the endpoints to import.\"\
        },\
        \"S3Url\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A URL that points to the location within an Amazon S3 bucket that contains the endpoints to import. The location can be a folder or a single file.\\nThe URL should follow this format: s3://bucket-name/folder-name/file-name\\n\\nAmazon Pinpoint will import endpoints from this location and any subfolders it contains.\"\
        },\
        \"SegmentId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of the segment to update if the import job is meant to update an existing segment.\"\
        },\
        \"SegmentName\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A custom name for the segment created by the import job. Use if DefineSegment is true.\"\
        }\
      }\
    },\
    \"ImportJobResource\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"DefineSegment\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Sets whether the endpoints create a segment when they are imported.\"\
        },\
        \"ExternalId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A unique, custom ID assigned to the IAM role that restricts who can assume the role.\\t\"\
        },\
        \"Format\" : {\
          \"shape\" : \"Format\",\
          \"documentation\" : \"The format of the files that contain the endpoint definitions.\\nValid values: CSV, JSON\"\
        },\
        \"RegisterEndpoints\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Sets whether the endpoints are registered with Amazon Pinpoint when they are imported.\"\
        },\
        \"RoleArn\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The Amazon Resource Name (ARN) of an IAM role that grants Amazon Pinpoint access to the Amazon S3 location that contains the endpoints to import.\"\
        },\
        \"S3Url\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A URL that points to the location within an Amazon S3 bucket that contains the endpoints to import. The location can be a folder or a single file.\\nThe URL should follow this format: s3://bucket-name/folder-name/file-name\\n\\nAmazon Pinpoint will import endpoints from this location and any subfolders it contains.\"\
        },\
        \"SegmentId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of the segment to update if the import job is meant to update an existing segment.\"\
        },\
        \"SegmentName\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A custom name for the segment created by the import job. Use if DefineSegment is true.\"\
        }\
      }\
    },\
    \"ImportJobResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique ID of the application to which the import job applies.\"\
        },\
        \"CompletedPieces\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The number of pieces that have successfully imported as of the time of the request.\"\
        },\
        \"CompletionDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The date the import job completed in ISO 8601 format.\"\
        },\
        \"CreationDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The date the import job was created in ISO 8601 format.\"\
        },\
        \"Definition\" : {\
          \"shape\" : \"ImportJobResource\",\
          \"documentation\" : \"The import job settings.\"\
        },\
        \"FailedPieces\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The number of pieces that have failed to import as of the time of the request.\"\
        },\
        \"Failures\" : {\
          \"shape\" : \"ListOf__string\",\
          \"documentation\" : \"Provides up to 100 of the first failed entries for the job, if any exist.\"\
        },\
        \"Id\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique ID of the import job.\"\
        },\
        \"JobStatus\" : {\
          \"shape\" : \"JobStatus\",\
          \"documentation\" : \"The status of the import job.\\nValid values: CREATED, INITIALIZING, PROCESSING, COMPLETING, COMPLETED, FAILING, FAILED\\n\\nThe job status is FAILED if one or more pieces failed to import.\"\
        },\
        \"TotalFailures\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The number of endpoints that failed to import; for example, because of syntax errors.\"\
        },\
        \"TotalPieces\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The total number of pieces that must be imported to finish the job. Each piece is an approximately equal portion of the endpoints to import.\"\
        },\
        \"TotalProcessed\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The number of endpoints that were processed by the import job.\"\
        },\
        \"Type\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The job type. Will be Import.\"\
        }\
      }\
    },\
    \"ImportJobsResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Item\" : {\
          \"shape\" : \"ListOfImportJobResponse\",\
          \"documentation\" : \"A list of import jobs for the application.\"\
        },\
        \"NextToken\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The string that you use in a subsequent request to get the next page of results in a paginated response.\"\
        }\
      },\
      \"documentation\" : \"Import job list.\"\
    },\
    \"InternalServerErrorException\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Message\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The error message returned from the API.\"\
        },\
        \"RequestID\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique message body ID.\"\
        }\
      },\
      \"documentation\" : \"Simple message object.\",\
      \"exception\" : true,\
      \"error\" : {\
        \"httpStatusCode\" : 500\
      }\
    },\
    \"JobStatus\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"CREATED\", \"INITIALIZING\", \"PROCESSING\", \"COMPLETING\", \"COMPLETED\", \"FAILING\", \"FAILED\" ]\
    },\
    \"ListOfActivityResponse\" : {\
      \"type\" : \"list\",\
      \"member\" : {\
        \"shape\" : \"ActivityResponse\"\
      }\
    },\
    \"ListOfCampaignResponse\" : {\
      \"type\" : \"list\",\
      \"member\" : {\
        \"shape\" : \"CampaignResponse\"\
      }\
    },\
    \"ListOfEndpointBatchItem\" : {\
      \"type\" : \"list\",\
      \"member\" : {\
        \"shape\" : \"EndpointBatchItem\"\
      }\
    },\
    \"ListOfImportJobResponse\" : {\
      \"type\" : \"list\",\
      \"member\" : {\
        \"shape\" : \"ImportJobResponse\"\
      }\
    },\
    \"ListOfSegmentResponse\" : {\
      \"type\" : \"list\",\
      \"member\" : {\
        \"shape\" : \"SegmentResponse\"\
      }\
    },\
    \"ListOfTreatmentResource\" : {\
      \"type\" : \"list\",\
      \"member\" : {\
        \"shape\" : \"TreatmentResource\"\
      }\
    },\
    \"ListOfWriteTreatmentResource\" : {\
      \"type\" : \"list\",\
      \"member\" : {\
        \"shape\" : \"WriteTreatmentResource\"\
      }\
    },\
    \"ListOf__string\" : {\
      \"type\" : \"list\",\
      \"member\" : {\
        \"shape\" : \"__string\"\
      }\
    },\
    \"MapOfAddressConfiguration\" : {\
      \"type\" : \"map\",\
      \"key\" : {\
        \"shape\" : \"__string\"\
      },\
      \"value\" : {\
        \"shape\" : \"AddressConfiguration\"\
      }\
    },\
    \"MapOfAttributeDimension\" : {\
      \"type\" : \"map\",\
      \"key\" : {\
        \"shape\" : \"__string\"\
      },\
      \"value\" : {\
        \"shape\" : \"AttributeDimension\"\
      }\
    },\
    \"MapOfListOf__string\" : {\
      \"type\" : \"map\",\
      \"key\" : {\
        \"shape\" : \"__string\"\
      },\
      \"value\" : {\
        \"shape\" : \"ListOf__string\"\
      }\
    },\
    \"MapOfMessageResult\" : {\
      \"type\" : \"map\",\
      \"key\" : {\
        \"shape\" : \"__string\"\
      },\
      \"value\" : {\
        \"shape\" : \"MessageResult\"\
      }\
    },\
    \"MapOf__double\" : {\
      \"type\" : \"map\",\
      \"key\" : {\
        \"shape\" : \"__string\"\
      },\
      \"value\" : {\
        \"shape\" : \"__double\"\
      }\
    },\
    \"MapOf__integer\" : {\
      \"type\" : \"map\",\
      \"key\" : {\
        \"shape\" : \"__string\"\
      },\
      \"value\" : {\
        \"shape\" : \"__integer\"\
      }\
    },\
    \"MapOf__string\" : {\
      \"type\" : \"map\",\
      \"key\" : {\
        \"shape\" : \"__string\"\
      },\
      \"value\" : {\
        \"shape\" : \"__string\"\
      }\
    },\
    \"Message\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Action\" : {\
          \"shape\" : \"Action\",\
          \"documentation\" : \"The action that occurs if the user taps a push notification delivered by the campaign:\\nOPEN_APP - Your app launches, or it becomes the foreground app if it has been sent to the background. This is the default action.\\n\\nDEEP_LINK - Uses deep linking features in iOS and Android to open your app and display a designated user interface within the app.\\n\\nURL - The default mobile browser on the user's device launches and opens a web page at the URL you specify.\"\
        },\
        \"Body\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The message body. Can include up to 140 characters.\"\
        },\
        \"ImageIconUrl\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The URL that points to the icon image for the push notification icon, for example, the app icon.\"\
        },\
        \"ImageSmallIconUrl\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The URL that points to the small icon image for the push notification icon, for example, the app icon.\"\
        },\
        \"ImageUrl\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The URL that points to an image used in the push notification.\"\
        },\
        \"JsonBody\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The JSON payload used for a silent push.\"\
        },\
        \"MediaUrl\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The URL that points to the media resource, for example a .mp4 or .gif file.\"\
        },\
        \"SilentPush\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Indicates if the message should display on the users device.\\n\\nSilent pushes can be used for Remote Configuration and Phone Home use cases. \"\
        },\
        \"Title\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The message title that displays above the message on the user's device.\"\
        },\
        \"Url\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The URL to open in the user's mobile browser. Used if the value for Action is URL.\"\
        }\
      }\
    },\
    \"MessageBody\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Message\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The error message returned from the API.\"\
        },\
        \"RequestID\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique message body ID.\"\
        }\
      },\
      \"documentation\" : \"Simple message object.\"\
    },\
    \"MessageConfiguration\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"APNSMessage\" : {\
          \"shape\" : \"Message\",\
          \"documentation\" : \"The message that the campaign delivers to APNS channels. Overrides the default message.\"\
        },\
        \"DefaultMessage\" : {\
          \"shape\" : \"Message\",\
          \"documentation\" : \"The default message for all channels.\"\
        },\
        \"EmailMessage\" : {\
          \"shape\" : \"CampaignEmailMessage\",\
          \"documentation\" : \"The email message configuration.\"\
        },\
        \"GCMMessage\" : {\
          \"shape\" : \"Message\",\
          \"documentation\" : \"The message that the campaign delivers to GCM channels. Overrides the default message.\"\
        },\
        \"SMSMessage\" : {\
          \"shape\" : \"CampaignSmsMessage\",\
          \"documentation\" : \"The SMS message configuration.\"\
        }\
      },\
      \"documentation\" : \"Message configuration for a campaign.\"\
    },\
    \"MessageRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Addresses\" : {\
          \"shape\" : \"MapOfAddressConfiguration\",\
          \"documentation\" : \"A map of destination addresses, with the address as the key(Email address, phone number or push token) and the Address Configuration as the value.\"\
        },\
        \"Context\" : {\
          \"shape\" : \"MapOf__string\",\
          \"documentation\" : \"A map of custom attributes to attributes to be attached to the message. This payload is added to the push notification's 'data.pinpoint' object or added to the email/sms delivery receipt event attributes.\"\
        },\
        \"MessageConfiguration\" : {\
          \"shape\" : \"DirectMessageConfiguration\",\
          \"documentation\" : \"Message configuration.\"\
        }\
      },\
      \"documentation\" : \"Send message request.\"\
    },\
    \"MessageResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Application id of the message.\"\
        },\
        \"RequestId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Original request Id for which this message was delivered.\"\
        },\
        \"Result\" : {\
          \"shape\" : \"MapOfMessageResult\",\
          \"documentation\" : \"A map containing a multi part response for each address, with the address as the key(Email address, phone number or push token) and the result as the value.\"\
        }\
      },\
      \"documentation\" : \"Send message response.\"\
    },\
    \"MessageResult\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"DeliveryStatus\" : {\
          \"shape\" : \"DeliveryStatus\",\
          \"documentation\" : \"Delivery status of message.\"\
        },\
        \"StatusCode\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"Downstream service status code.\"\
        },\
        \"StatusMessage\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Status message for message delivery.\"\
        },\
        \"UpdatedToken\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"If token was updated as part of delivery. (This is GCM Specific)\"\
        }\
      },\
      \"documentation\" : \"The result from sending a message to an address.\"\
    },\
    \"MessageType\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"TRANSACTIONAL\", \"PROMOTIONAL\" ]\
    },\
    \"MethodNotAllowedException\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Message\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The error message returned from the API.\"\
        },\
        \"RequestID\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique message body ID.\"\
        }\
      },\
      \"documentation\" : \"Simple message object.\",\
      \"exception\" : true,\
      \"error\" : {\
        \"httpStatusCode\" : 405\
      }\
    },\
    \"NotFoundException\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Message\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The error message returned from the API.\"\
        },\
        \"RequestID\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique message body ID.\"\
        }\
      },\
      \"documentation\" : \"Simple message object.\",\
      \"exception\" : true,\
      \"error\" : {\
        \"httpStatusCode\" : 404\
      }\
    },\
    \"PutEventStreamRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\",\
          \"documentation\": \"ApplicationId\"\
        },\
        \"WriteEventStream\" : {\
          \"shape\" : \"WriteEventStream\",\
          \"documentation\": \"EventStream to write.\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"WriteEventStream\" ],\
      \"payload\" : \"WriteEventStream\",\
      \"documentation\": \"PutEventStream Request\"\
    },\
    \"PutEventStreamResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"EventStream\" : {\
          \"shape\" : \"EventStream\"\
        }\
      },\
      \"required\" : [ \"EventStream\" ],\
      \"payload\" : \"EventStream\",\
      \"documentation\": \"PutEventStream Response\"\
    },\
    \"QuietTime\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"End\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The default end time for quiet time in ISO 8601 format.\"\
        },\
        \"Start\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The default start time for quiet time in ISO 8601 format.\"\
        }\
      },\
      \"documentation\" : \"Quiet Time\"\
    },\
    \"RecencyDimension\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Duration\" : {\
          \"shape\" : \"Duration\",\
          \"documentation\" : \"The length of time during which users have been active or inactive with your app.\\nValid values: HR_24, DAY_7, DAY_14, DAY_30\"\
        },\
        \"RecencyType\" : {\
          \"shape\" : \"RecencyType\",\
          \"documentation\" : \"The recency dimension type:\\nACTIVE - Users who have used your app within the specified duration are included in the segment.\\nINACTIVE - Users who have not used your app within the specified duration are included in the segment.\"\
        }\
      },\
      \"documentation\" : \"Define how a segment based on recency of use.\"\
    },\
    \"RecencyType\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"ACTIVE\", \"INACTIVE\" ]\
    },\
    \"SMSChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"If the channel is enabled for sending messages.\"\
        },\
        \"SenderId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Sender identifier of your messages.\"\
        }\
      },\
      \"documentation\" : \"SMS Channel Request\"\
    },\
    \"SMSChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Application id\"\
        },\
        \"CreationDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The date that the settings were last updated in ISO 8601 format.\"\
        },\
        \"Enabled\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"If the channel is enabled for sending messages.\"\
        },\
        \"Id\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Channel ID. Not used, only for backwards compatibility.\"\
        },\
        \"IsArchived\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Is this channel archived\"\
        },\
        \"LastModifiedBy\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Who last updated this entry\"\
        },\
        \"LastModifiedDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Last date this was updated\"\
        },\
        \"Platform\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Platform type. Will be \\\"SMS\\\"\"\
        },\
        \"SenderId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Sender identifier of your messages.\"\
        },\
        \"ShortCode\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The short code registered with the phone provider.\"\
        },\
        \"Version\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"Version of channel\"\
        }\
      },\
      \"documentation\" : \"SMS Channel Response.\"\
    },\
    \"SMSMessage\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Body\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The message body of the notification, the email body or the text message.\"\
        },\
        \"MessageType\" : {\
          \"shape\" : \"MessageType\",\
          \"documentation\" : \"Is this a transaction priority message or lower priority.\"\
        },\
        \"SenderId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"Sender ID of sent message.\"\
        },\
        \"Substitutions\" : {\
          \"shape\" : \"MapOfListOf__string\",\
          \"documentation\" : \"Default message substitutions. Can be overridden by individual address substitutions.\"\
        }\
      },\
      \"documentation\" : \"SMS Message.\"\
    },\
    \"Schedule\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"EndTime\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The scheduled time that the campaign ends in ISO 8601 format.\"\
        },\
        \"Frequency\" : {\
          \"shape\" : \"Frequency\",\
          \"documentation\" : \"How often the campaign delivers messages.\\n\\nValid values: ONCE, HOURLY, DAILY, WEEKLY, MONTHLY\"\
        },\
        \"IsLocalTime\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Indicates whether the campaign schedule takes effect according to each user's local time.\"\
        },\
        \"QuietTime\" : {\
          \"shape\" : \"QuietTime\",\
          \"documentation\" : \"The time during which the campaign sends no messages.\"\
        },\
        \"StartTime\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The scheduled time that the campaign begins in ISO 8601 format.\"\
        },\
        \"Timezone\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The starting UTC offset for the schedule if the value for isLocalTime is true\\n\\nValid values: \\nUTC\\nUTC+01\\nUTC+02\\nUTC+03\\nUTC+03:30\\nUTC+04\\nUTC+04:30\\nUTC+05\\nUTC+05:30\\nUTC+05:45\\nUTC+06\\nUTC+06:30\\nUTC+07\\nUTC+08\\nUTC+09\\nUTC+09:30\\nUTC+10\\nUTC+10:30\\nUTC+11\\nUTC+12\\nUTC+13\\nUTC-02\\nUTC-03\\nUTC-04\\nUTC-05\\nUTC-06\\nUTC-07\\nUTC-08\\nUTC-09\\nUTC-10\\nUTC-11\"\
        }\
      },\
      \"documentation\" : \"Shcedule that defines when a campaign is run.\"\
    },\
    \"SegmentBehaviors\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Recency\" : {\
          \"shape\" : \"RecencyDimension\",\
          \"documentation\" : \"The recency of use.\"\
        }\
      },\
      \"documentation\" : \"Segment behavior dimensions\"\
    },\
    \"SegmentDemographics\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"AppVersion\" : {\
          \"shape\" : \"SetDimension\",\
          \"documentation\" : \"The app version criteria for the segment.\"\
        },\
        \"Channel\" : {\
          \"shape\" : \"SetDimension\",\
          \"documentation\" : \"The channel criteria for the segment.\"\
        },\
        \"DeviceType\" : {\
          \"shape\" : \"SetDimension\",\
          \"documentation\" : \"The device type criteria for the segment.\"\
        },\
        \"Make\" : {\
          \"shape\" : \"SetDimension\",\
          \"documentation\" : \"The device make criteria for the segment.\"\
        },\
        \"Model\" : {\
          \"shape\" : \"SetDimension\",\
          \"documentation\" : \"The device model criteria for the segment.\"\
        },\
        \"Platform\" : {\
          \"shape\" : \"SetDimension\",\
          \"documentation\" : \"The device platform criteria for the segment.\"\
        }\
      },\
      \"documentation\" : \"Segment demographic dimensions\"\
    },\
    \"SegmentDimensions\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Attributes\" : {\
          \"shape\" : \"MapOfAttributeDimension\",\
          \"documentation\" : \"Custom segment attributes.\"\
        },\
        \"Behavior\" : {\
          \"shape\" : \"SegmentBehaviors\",\
          \"documentation\" : \"The segment behaviors attributes.\"\
        },\
        \"Demographic\" : {\
          \"shape\" : \"SegmentDemographics\",\
          \"documentation\" : \"The segment demographics attributes.\"\
        },\
        \"Location\" : {\
          \"shape\" : \"SegmentLocation\",\
          \"documentation\" : \"The segment location attributes.\"\
        },\
        \"UserAttributes\" : {\
          \"shape\" : \"MapOfAttributeDimension\",\
          \"documentation\" : \"Custom segment user attributes.\"\
        }\
      },\
      \"documentation\" : \"Segment dimensions\"\
    },\
    \"SegmentImportResource\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ChannelCounts\" : {\
          \"shape\" : \"MapOf__integer\",\
          \"documentation\" : \"Channel type counts\"\
        },\
        \"ExternalId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A unique, custom ID assigned to the IAM role that restricts who can assume the role.\"\
        },\
        \"Format\" : {\
          \"shape\" : \"Format\",\
          \"documentation\" : \"The format of the endpoint files that were imported to create this segment.\\nValid values: CSV, JSON\"\
        },\
        \"RoleArn\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The Amazon Resource Name (ARN) of an IAM role that grants Amazon Pinpoint access to the endpoints in Amazon S3.\"\
        },\
        \"S3Url\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A URL that points to the Amazon S3 location from which the endpoints for this segment were imported.\"\
        },\
        \"Size\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The number of endpoints that were successfully imported to create this segment.\"\
        }\
      },\
      \"documentation\" : \"Segment import definition.\"\
    },\
    \"SegmentLocation\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Country\" : {\
          \"shape\" : \"SetDimension\",\
          \"documentation\" : \"The country filter according to ISO 3166-1 Alpha-2 codes.\"\
        }\
      },\
      \"documentation\" : \"Segment location dimensions\"\
    },\
    \"SegmentResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of the application to which the segment applies.\"\
        },\
        \"CreationDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The date the segment was created in ISO 8601 format.\"\
        },\
        \"Dimensions\" : {\
          \"shape\" : \"SegmentDimensions\",\
          \"documentation\" : \"The segment dimensions attributes.\"\
        },\
        \"Id\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique segment ID.\"\
        },\
        \"ImportDefinition\" : {\
          \"shape\" : \"SegmentImportResource\",\
          \"documentation\" : \"The import job settings.\"\
        },\
        \"LastModifiedDate\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The date the segment was last updated in ISO 8601 format.\"\
        },\
        \"Name\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The name of segment\"\
        },\
        \"SegmentType\" : {\
          \"shape\" : \"SegmentType\",\
          \"documentation\" : \"The segment type:\\nDIMENSIONAL - A dynamic segment built from selection criteria based on endpoint data reported by your app. You create this type of segment by using the segment builder in the Amazon Pinpoint console or by making a POST request to the segments resource.\\nIMPORT - A static segment built from an imported set of endpoint definitions. You create this type of segment by importing a segment in the Amazon Pinpoint console or by making a POST request to the jobs/import resource.\"\
        },\
        \"Version\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The segment version number.\"\
        }\
      },\
      \"documentation\" : \"Segment definition.\"\
    },\
    \"SegmentType\" : {\
      \"type\" : \"string\",\
      \"enum\" : [ \"DIMENSIONAL\", \"IMPORT\" ]\
    },\
    \"SegmentsResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Item\" : {\
          \"shape\" : \"ListOfSegmentResponse\",\
          \"documentation\" : \"The list of segments.\"\
        },\
        \"NextToken\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"An identifier used to retrieve the next page of results. The token is null if no additional pages exist.\"\
        }\
      },\
      \"documentation\" : \"Segments in your account.\"\
    },\
    \"SendMessagesRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"MessageRequest\" : {\
          \"shape\" : \"MessageRequest\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"MessageRequest\" ],\
      \"payload\" : \"MessageRequest\"\
    },\
    \"SendMessagesResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"MessageResponse\" : {\
          \"shape\" : \"MessageResponse\"\
        }\
      },\
      \"required\" : [ \"MessageResponse\" ],\
      \"payload\" : \"MessageResponse\"\
    },\
    \"SetDimension\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"DimensionType\" : {\
          \"shape\" : \"DimensionType\",\
          \"documentation\" : \"The type of dimension:\\nINCLUSIVE - Endpoints that match the criteria are included in the segment.\\nEXCLUSIVE - Endpoints that match the criteria are excluded from the segment.\"\
        },\
        \"Values\" : {\
          \"shape\" : \"ListOf__string\",\
          \"documentation\" : \"The criteria values for the segment dimension. Endpoints with matching attribute values are included or excluded from the segment, depending on the setting for Type.\"\
        }\
      },\
      \"documentation\" : \"Dimension specification of a segment.\"\
    },\
    \"TooManyRequestsException\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Message\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The error message returned from the API.\"\
        },\
        \"RequestID\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique message body ID.\"\
        }\
      },\
      \"documentation\" : \"Simple message object.\",\
      \"exception\" : true,\
      \"error\" : {\
        \"httpStatusCode\" : 429\
      }\
    },\
    \"TreatmentResource\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Id\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The unique treatment ID.\"\
        },\
        \"MessageConfiguration\" : {\
          \"shape\" : \"MessageConfiguration\",\
          \"documentation\" : \"The message configuration settings.\"\
        },\
        \"Schedule\" : {\
          \"shape\" : \"Schedule\",\
          \"documentation\" : \"The campaign schedule.\"\
        },\
        \"SizePercent\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The allocated percentage of users for this treatment.\"\
        },\
        \"State\" : {\
          \"shape\" : \"CampaignState\",\
          \"documentation\" : \"The treatment status.\"\
        },\
        \"TreatmentDescription\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A custom description for the treatment.\"\
        },\
        \"TreatmentName\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The custom name of a variation of the campaign used for A/B testing.\"\
        }\
      },\
      \"documentation\" : \"Treatment resource\"\
    },\
    \"UpdateApnsChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"APNSChannelRequest\" : {\
          \"shape\" : \"APNSChannelRequest\"\
        },\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"APNSChannelRequest\" ],\
      \"payload\" : \"APNSChannelRequest\"\
    },\
    \"UpdateApnsChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"APNSChannelResponse\" : {\
          \"shape\" : \"APNSChannelResponse\"\
        }\
      },\
      \"required\" : [ \"APNSChannelResponse\" ],\
      \"payload\" : \"APNSChannelResponse\"\
    },\
    \"UpdateApnsSandboxChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"APNSSandboxChannelRequest\" : {\
          \"shape\" : \"APNSSandboxChannelRequest\"\
        },\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"APNSSandboxChannelRequest\" ],\
      \"payload\" : \"APNSSandboxChannelRequest\"\
    },\
    \"UpdateApnsSandboxChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"APNSSandboxChannelResponse\" : {\
          \"shape\" : \"APNSSandboxChannelResponse\"\
        }\
      },\
      \"required\" : [ \"APNSSandboxChannelResponse\" ],\
      \"payload\" : \"APNSSandboxChannelResponse\"\
    },\
    \"UpdateApplicationSettingsRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"WriteApplicationSettingsRequest\" : {\
          \"shape\" : \"WriteApplicationSettingsRequest\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"WriteApplicationSettingsRequest\" ],\
      \"payload\" : \"WriteApplicationSettingsRequest\"\
    },\
    \"UpdateApplicationSettingsResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationSettingsResource\" : {\
          \"shape\" : \"ApplicationSettingsResource\"\
        }\
      },\
      \"required\" : [ \"ApplicationSettingsResource\" ],\
      \"payload\" : \"ApplicationSettingsResource\"\
    },\
    \"UpdateCampaignRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"CampaignId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"campaign-id\"\
        },\
        \"WriteCampaignRequest\" : {\
          \"shape\" : \"WriteCampaignRequest\"\
        }\
      },\
      \"required\" : [ \"CampaignId\", \"ApplicationId\", \"WriteCampaignRequest\" ],\
      \"payload\" : \"WriteCampaignRequest\"\
    },\
    \"UpdateCampaignResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"CampaignResponse\" : {\
          \"shape\" : \"CampaignResponse\"\
        }\
      },\
      \"required\" : [ \"CampaignResponse\" ],\
      \"payload\" : \"CampaignResponse\"\
    },\
    \"UpdateEmailChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"EmailChannelRequest\" : {\
          \"shape\" : \"EmailChannelRequest\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"EmailChannelRequest\" ],\
      \"payload\" : \"EmailChannelRequest\"\
    },\
    \"UpdateEmailChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"EmailChannelResponse\" : {\
          \"shape\" : \"EmailChannelResponse\"\
        }\
      },\
      \"required\" : [ \"EmailChannelResponse\" ],\
      \"payload\" : \"EmailChannelResponse\"\
    },\
    \"UpdateEndpointRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"EndpointId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"endpoint-id\"\
        },\
        \"EndpointRequest\" : {\
          \"shape\" : \"EndpointRequest\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"EndpointId\", \"EndpointRequest\" ],\
      \"payload\" : \"EndpointRequest\"\
    },\
    \"UpdateEndpointResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"MessageBody\" : {\
          \"shape\" : \"MessageBody\"\
        }\
      },\
      \"required\" : [ \"MessageBody\" ],\
      \"payload\" : \"MessageBody\"\
    },\
    \"UpdateEndpointsBatchRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"EndpointBatchRequest\" : {\
          \"shape\" : \"EndpointBatchRequest\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"EndpointBatchRequest\" ],\
      \"payload\" : \"EndpointBatchRequest\"\
    },\
    \"UpdateEndpointsBatchResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"MessageBody\" : {\
          \"shape\" : \"MessageBody\"\
        }\
      },\
      \"required\" : [ \"MessageBody\" ],\
      \"payload\" : \"MessageBody\"\
    },\
    \"UpdateGcmChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"GCMChannelRequest\" : {\
          \"shape\" : \"GCMChannelRequest\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"GCMChannelRequest\" ],\
      \"payload\" : \"GCMChannelRequest\"\
    },\
    \"UpdateGcmChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"GCMChannelResponse\" : {\
          \"shape\" : \"GCMChannelResponse\"\
        }\
      },\
      \"required\" : [ \"GCMChannelResponse\" ],\
      \"payload\" : \"GCMChannelResponse\"\
    },\
    \"UpdateSegmentRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"SegmentId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"segment-id\"\
        },\
        \"WriteSegmentRequest\" : {\
          \"shape\" : \"WriteSegmentRequest\"\
        }\
      },\
      \"required\" : [ \"SegmentId\", \"ApplicationId\", \"WriteSegmentRequest\" ],\
      \"payload\" : \"WriteSegmentRequest\"\
    },\
    \"UpdateSegmentResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"SegmentResponse\" : {\
          \"shape\" : \"SegmentResponse\"\
        }\
      },\
      \"required\" : [ \"SegmentResponse\" ],\
      \"payload\" : \"SegmentResponse\"\
    },\
    \"UpdateSmsChannelRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"ApplicationId\" : {\
          \"shape\" : \"__string\",\
          \"location\" : \"uri\",\
          \"locationName\" : \"application-id\"\
        },\
        \"SMSChannelRequest\" : {\
          \"shape\" : \"SMSChannelRequest\"\
        }\
      },\
      \"required\" : [ \"ApplicationId\", \"SMSChannelRequest\" ],\
      \"payload\" : \"SMSChannelRequest\"\
    },\
    \"UpdateSmsChannelResponse\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"SMSChannelResponse\" : {\
          \"shape\" : \"SMSChannelResponse\"\
        }\
      },\
      \"required\" : [ \"SMSChannelResponse\" ],\
      \"payload\" : \"SMSChannelResponse\"\
    },\
    \"WriteApplicationSettingsRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Limits\" : {\
          \"shape\" : \"CampaignLimits\",\
          \"documentation\" : \"The default campaign limits for the app. These limits apply to each campaign for the app, unless the campaign overrides the default with limits of its own.\"\
        },\
        \"QuietTime\" : {\
          \"shape\" : \"QuietTime\",\
          \"documentation\" : \"The default quiet time for the app. Each campaign for this app sends no messages during this time unless the campaign overrides the default with a quiet time of its own.\"\
        }\
      },\
      \"documentation\" : \"Creating application setting request\"\
    },\
    \"WriteCampaignRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"AdditionalTreatments\" : {\
          \"shape\" : \"ListOfWriteTreatmentResource\",\
          \"documentation\" : \"Treatments that are defined in addition to the default treatment.\"\
        },\
        \"Description\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A description of the campaign.\"\
        },\
        \"HoldoutPercent\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The allocated percentage of end users who will not receive messages from this campaign.\"\
        },\
        \"IsPaused\" : {\
          \"shape\" : \"__boolean\",\
          \"documentation\" : \"Indicates whether the campaign is paused. A paused campaign does not send messages unless you resume it by setting IsPaused to false.\"\
        },\
        \"Limits\" : {\
          \"shape\" : \"CampaignLimits\",\
          \"documentation\" : \"The campaign limits settings.\"\
        },\
        \"MessageConfiguration\" : {\
          \"shape\" : \"MessageConfiguration\",\
          \"documentation\" : \"The message configuration settings.\"\
        },\
        \"Name\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The custom name of the campaign.\"\
        },\
        \"Schedule\" : {\
          \"shape\" : \"Schedule\",\
          \"documentation\" : \"The campaign schedule.\"\
        },\
        \"SegmentId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The ID of the segment to which the campaign sends messages.\"\
        },\
        \"SegmentVersion\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The version of the segment to which the campaign sends messages.\"\
        },\
        \"TreatmentDescription\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A custom description for the treatment.\"\
        },\
        \"TreatmentName\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The custom name of a variation of the campaign used for A/B testing.\"\
        }\
      },\
      \"documentation\" : \"Used to create a campaign.\"\
    },\
    \"WriteEventStream\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"DestinationStreamArn\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The Amazon Resource Name (ARN) of the Amazon Kinesis stream or Firehose delivery stream to which you want to publish events.\\n Firehose ARN: arn:aws:firehose:REGION:ACCOUNT_ID:deliverystream/STREAM_NAME\\n Kinesis ARN: arn:aws:kinesis:REGION:ACCOUNT_ID:stream/STREAM_NAME\"\
        },\
        \"ExternalId\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The external ID assigned the IAM role that authorizes Amazon Pinpoint to publish to the stream.\"\
        },\
        \"RoleArn\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The IAM role that authorizes Amazon Pinpoint to publish events to the stream in your account.\"\
        }\
      },\
      \"documentation\" : \"Request to save an EventStream.\"\
    },\
    \"WriteSegmentRequest\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"Dimensions\" : {\
          \"shape\" : \"SegmentDimensions\",\
          \"documentation\" : \"The segment dimensions attributes.\"\
        },\
        \"Name\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The name of segment\"\
        }\
      },\
      \"documentation\" : \"Segment definition.\"\
    },\
    \"WriteTreatmentResource\" : {\
      \"type\" : \"structure\",\
      \"members\" : {\
        \"MessageConfiguration\" : {\
          \"shape\" : \"MessageConfiguration\",\
          \"documentation\" : \"The message configuration settings.\"\
        },\
        \"Schedule\" : {\
          \"shape\" : \"Schedule\",\
          \"documentation\" : \"The campaign schedule.\"\
        },\
        \"SizePercent\" : {\
          \"shape\" : \"__integer\",\
          \"documentation\" : \"The allocated percentage of users for this treatment.\"\
        },\
        \"TreatmentDescription\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"A custom description for the treatment.\"\
        },\
        \"TreatmentName\" : {\
          \"shape\" : \"__string\",\
          \"documentation\" : \"The custom name of a variation of the campaign used for A/B testing.\"\
        }\
      },\
      \"documentation\" : \"Used to create a campaign treatment.\"\
    },\
    \"__boolean\" : {\
      \"type\" : \"boolean\"\
    },\
    \"__double\" : {\
      \"type\" : \"double\"\
    },\
    \"__integer\" : {\
      \"type\" : \"integer\"\
    },\
    \"__string\" : {\
      \"type\" : \"string\"\
    },\
    \"__timestamp\" : {\
      \"type\" : \"timestamp\"\
    }\
  }\
}";
}

@end
