//
//  AWSTranscribeSerializer.m
//  AWSTranscribe
//
//  Created by Wayne on 3/3/18.
//  Copyright © 2018 Amazon Web Services. All rights reserved.
//

#import <AWSCore/AWSCore.h>
#import "AWSTranscribeSerializer.h"
#import "AWSTranscribeModel.h"

@implementation AWSTranscribeResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
	errorCodeDictionary = @{
		@"BadRequestException" : @(AWSTranscribeErrorBadRequestException),
		@"ConflictException" : @(AWSTranscribeErrorConflictException),
		@"InternalFailureException" : @(AWSTranscribeErrorInternalFailureException),
		@"LimitExceededException" : @(AWSTranscribeErrorLimitExceededException),
		@"NotFoundException" : @(AWSTranscribeErrorNotFoundException),
		@"Unknown" : @(AWSTranscribeErrorUnknown),
	};
}

#pragma mark -

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response
				originalRequest:(NSURLRequest *)originalRequest
				 currentRequest:(NSURLRequest *)currentRequest
						   data:(id)data
						  error:(NSError *__autoreleasing *)error {
	id responseObject = [super responseObjectForResponse:response
										 originalRequest:originalRequest
										  currentRequest:currentRequest
													data:data
												   error:error];
	if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
		if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
			if ([errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]]) {
				if (error) {
					*error = [NSError errorWithDomain:AWSTranscribeErrorDomain
												 code:[[errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]] integerValue]
											 userInfo:responseObject];
				}
				return responseObject;
			} else if ([[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]) {
				if (error) {
					*error = [NSError errorWithDomain:AWSCognitoIdentityErrorDomain
												 code:AWSCognitoIdentityErrorUnknown
											 userInfo:responseObject];
				}
				return responseObject;
			}
		}
	}

	if (!*error && response.statusCode/100 != 2) {
		*error = [NSError errorWithDomain:AWSTranscribeErrorDomain
									 code:AWSTranscribeErrorUnknown
								 userInfo:nil];
	}

	if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
		if (self.outputClass) {
			responseObject = [AWSMTLJSONAdapter modelOfClass:self.outputClass
										  fromJSONDictionary:responseObject
													   error:error];
		}
	}
	return responseObject;
}

@end
