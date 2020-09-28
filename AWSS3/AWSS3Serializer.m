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

#import <AWSCore/AWSCore.h>
#import "AWSS3Serializer.h"
#import "AWSS3.h"

@interface AWSS3RequestSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;
@property (nonatomic, strong) NSString *actionName;
@property (nonatomic, strong) id<AWSURLRequestSerializer> requestSerializer;

@end

@implementation AWSS3RequestSerializer

- (instancetype)initWithJSONDefinition:(NSDictionary *)JSONDefinition
                            actionName:(NSString *)actionName{
    if (self = [super init]) {

        _serviceDefinitionJSON = JSONDefinition;
        if (_serviceDefinitionJSON == nil) {
            AWSDDLogError(@"serviceDefinitionJSON is nil.");
            return nil;
        }
        _actionName = actionName;

        //get and put bucket policy use json, while rest use xml
        if([[_actionName lowercaseString] isEqualToString:@"putbucketpolicy"]
           || [[_actionName lowercaseString] isEqualToString:@"getbucketpolicy"]){
            _requestSerializer = [[AWSJSONRequestSerializer alloc]initWithJSONDefinition:JSONDefinition actionName:actionName];
        }else{
            _requestSerializer = [[AWSXMLRequestSerializer alloc]initWithJSONDefinition:JSONDefinition actionName:actionName];
        }
    }

    return self;
}

- (AWSTask *)validateRequest:(NSURLRequest *)request{
    return [_requestSerializer validateRequest:request];
}

- (AWSTask *)serializeRequest:(NSMutableURLRequest *)request headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters {
    return [[_requestSerializer serializeRequest:request headers:headers parameters:parameters] continueWithSuccessBlock:^id _Nullable(AWSTask * _Nonnull t) {
        [self updateRequestToUseVirtualHostURL:request];
        return nil;
    }];
}

// Virtual host logic from Boto
// https://github.com/boto/botocore/blob/08d0e5995284656895f5c8a0bddd8c386a8483c4/botocore/utils.py#L954
- (void)updateRequestToUseVirtualHostURL:(NSMutableURLRequest *)request {
    if ([self isGetBucketLocationRequest:request]) {
        AWSDDLogDebug(@"Request is for bucket location request, continuing to use path-style URL");
        return;
    }

    NSURLComponents *components = [NSURLComponents componentsWithURL:request.URL resolvingAgainstBaseURL:NO];
    NSMutableArray<NSString *> *pathParts = [self normalizedPathPartsFromComponents:components];

    NSString *bucketName = [pathParts firstObject];
    if (![bucketName aws_isVirtualHostedStyleCompliant]) {
        AWSDDLogDebug(@"Bucket name '%@' is not compatible with virtual-host URLs, continuing to use path-style URL", bucketName);
        return;
    }

    AWSDDLogDebug(@"Updating request to use virtual-host style URL");
    [self updatePathComponentForVirtualHostStyleURL:components byMutatingPathParts:pathParts];
    [self updateHostComponentForVirtualHostStyleURL:components bucketName:bucketName];

    NSURL *newURL = [components URL];

    AWSDDLogDebug(@"Rewrote request URL to: %@", newURL);
    request.URL = newURL;

    return;
}

- (NSMutableArray<NSString *> *)normalizedPathPartsFromComponents:(NSURLComponents *)components {
    NSMutableArray<NSString *> *pathParts = [[components.percentEncodedPath componentsSeparatedByString:@"/"] mutableCopy];
    // Since we separate the path by "/", any non-empty path with a leading "/" will
    // include a null first object. E.g., a path of "/foo/bar" would separate into a
    // pathParts of ["", "foo", "bar"]. It should never happen that we receive a
    // path without a leading slash, but this will defend against that circumstance
    // instead of blindly removing the first path part.
    if (pathParts.count > 0 && [pathParts[0] length] == 0) {
        [pathParts removeObjectAtIndex:0];
    }
    return pathParts;
}

- (void)updatePathComponentForVirtualHostStyleURL:(NSURLComponents *)components
                              byMutatingPathParts:(NSMutableArray<NSString *> *)pathParts {
    [pathParts removeObjectAtIndex:0];
    NSMutableString *path = [[pathParts componentsJoinedByString:@"/"] mutableCopy];
    // All paths must have leading slash
    [path insertString:@"/" atIndex:0];
    components.percentEncodedPath = path;
}

- (void)updateHostComponentForVirtualHostStyleURL:(NSURLComponents *)components
                                       bucketName:(NSString *) bucketName {
    NSString *oldHostName = components.host;
    NSString *newHostName = [NSString stringWithFormat:@"%@.%@", bucketName, oldHostName];
    components.host = newHostName;
}

- (BOOL)isGetBucketLocationRequest:(NSMutableURLRequest *)request {
    return [request.URL.query hasSuffix:@"location"];
}

@end


@interface AWSS3ResponseSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;
@property (nonatomic, strong) NSString *actionName;
@property (nonatomic, strong) id<AWSHTTPURLResponseSerializer> responseSerializer;

@end

@implementation AWSS3ResponseSerializer

- (instancetype)initWithJSONDefinition:(NSDictionary *)JSONDefinition
                            actionName:(NSString *)actionName
                           outputClass:(Class)outputClass{
    if (self = [super init]) {

        _serviceDefinitionJSON = JSONDefinition;
        if (_serviceDefinitionJSON == nil) {
            AWSDDLogError(@"serviceDefinitionJSON is nil.");
            return nil;
        }
        _actionName = actionName;

        _outputClass = outputClass;

        //get and put bucket policy use json, while rest use xml
        if([[_actionName lowercaseString] isEqualToString:@"putbucketpolicy"]
           || [[_actionName lowercaseString] isEqualToString:@"getbucketpolicy"]){
            _responseSerializer = [[AWSJSONResponseSerializer alloc]initWithJSONDefinition:JSONDefinition actionName:actionName outputClass:outputClass];
        }else{
            _responseSerializer = [[AWSXMLResponseSerializer alloc]initWithJSONDefinition:JSONDefinition actionName:actionName outputClass:outputClass];
        }
    }

    return self;
}

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BucketAlreadyExists" : @(AWSS3ErrorBucketAlreadyExists),
                            @"BucketAlreadyOwnedByYou" : @(AWSS3ErrorBucketAlreadyOwnedByYou),
                            @"NoSuchBucket" : @(AWSS3ErrorNoSuchBucket),
                            @"NoSuchKey" : @(AWSS3ErrorNoSuchKey),
                            @"NoSuchUpload" : @(AWSS3ErrorNoSuchUpload),
                            @"ObjectAlreadyInActiveTierError" : @(AWSS3ErrorObjectAlreadyInActiveTier),
                            @"ObjectNotInActiveTierError" : @(AWSS3ErrorObjectNotInActiveTier),
                            };
}

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response
                originalRequest:(NSURLRequest *)originalRequest
                 currentRequest:(NSURLRequest *)currentRequest
                           data:(id)data
                          error:(NSError *__autoreleasing *)error {

    id responseObject =  [_responseSerializer responseObjectForResponse:response
                                          originalRequest:originalRequest
                                           currentRequest:currentRequest
                                                     data:data
                                                    error:error];


    if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
        NSDictionary *errorInfo = responseObject[@"Error"];
        if (errorInfo[@"Code"] && errorCodeDictionary[errorInfo[@"Code"]]) {
            if (error) {
                *error = [NSError errorWithDomain:AWSS3ErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSS3ErrorDomain
                                             code:AWSS3ErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }
    }

    if (!*error
        && response.statusCode/100 != 2
        && response.statusCode/100 != 3) {
        *error = [NSError errorWithDomain:AWSS3ErrorDomain
                                     code:AWSS3ErrorUnknown
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

- (BOOL)validateResponse:(NSHTTPURLResponse *)response
             fromRequest:(NSURLRequest *)request
                    data:(id)data
                   error:(NSError *__autoreleasing *)error{

    return [_responseSerializer validateResponse:response
                                     fromRequest:request
                                            data:data
                                           error:error];
}

@end
