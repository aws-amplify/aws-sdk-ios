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

#import "AWSS3TransferUtility+HeaderHelper.h"
#import "AWSS3TransferUtilityTasks.h"

@interface AWSS3CreateMultipartUploadRequest()
+ (NSValueTransformer *)ACLJSONTransformer;
+ (NSValueTransformer *)storageClassJSONTransformer;
+ (NSValueTransformer *)serverSideEncryptionJSONTransformer;
+ (NSValueTransformer *)requestPayerJSONTransformer;
+ (NSValueTransformer *)expiresJSONTransformer;
@end

@interface AWSS3TransferUtilityExpression()

@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *internalRequestHeaders;

@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *internalRequestParameters;

- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;
- (void)assignRequestHeaders:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;

@end

@interface AWSS3TransferUtilityUploadExpression()

@property (copy, atomic) AWSS3TransferUtilityUploadCompletionHandlerBlock completionHandler;

@end

@interface AWSS3TransferUtilityMultiPartUploadExpression()

@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *internalRequestHeaders;
@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *internalRequestParameters;
- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;
@property (copy, atomic) AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock completionHandler;

@end

@implementation AWSS3TransferUtility (HeaderHelper)

-(void) filterAndAssignHeaders:(NSDictionary<NSString *, NSString *> *) requestHeaders
        getPresignedURLRequest:(AWSS3GetPreSignedURLRequest *) getPresignedURLRequest
                    URLRequest: (NSMutableURLRequest *) URLRequest {
    
    NSSet *disallowedHeaders = [[NSSet alloc] initWithArray:
                                @[@"x-amz-acl", @"x-amz-tagging", @"x-amz-storage-class", @"x-amz-server-side-encryption"]];
    
    for (NSString *key in requestHeaders) {
        //Do not include custom metadata or custom grants
        NSString *lKey = [key lowercaseString];
        if ([ lKey hasPrefix:@"x-amz-meta"] || [lKey hasPrefix:@"x-amz-grant"]) {
            continue;
        }
        if ([disallowedHeaders containsObject:lKey]) {
            continue;
        }
        [getPresignedURLRequest setValue:requestHeaders[key] forRequestHeader:key];
        [URLRequest setValue:requestHeaders[key] forHTTPHeaderField:key];
    }
}

@end
