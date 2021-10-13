//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSS3CreateMultipartUploadRequest+RequestHeaders.h"

@interface AWSS3CreateMultipartUploadRequest()
+ (NSValueTransformer *)ACLJSONTransformer;
+ (NSValueTransformer *)storageClassJSONTransformer;
+ (NSValueTransformer *)serverSideEncryptionJSONTransformer;
+ (NSValueTransformer *)requestPayerJSONTransformer;
+ (NSValueTransformer *)expiresJSONTransformer;
@end

@implementation AWSS3CreateMultipartUploadRequest (RequestHeaders)

+ (void)propagateHeaderInformation:(AWSS3CreateMultipartUploadRequest *)uploadRequest
                    requestHeaders:(NSDictionary<NSString *, NSString *> *)requestHeaders {
    //Propagate header info and add custom metadata
    NSMutableDictionary<NSString *, NSString *> *metadata = [NSMutableDictionary new];
    for (NSString *key in requestHeaders) {
        NSString *lKey = [key lowercaseString];
        if ([lKey hasPrefix:@"x-amz-meta"]) {
            [metadata setValue:requestHeaders[key] forKey:[key stringByReplacingOccurrencesOfString:@"x-amz-meta-" withString:@""]];
        }
        else if ([lKey isEqualToString:@"x-amz-acl"]) {
            NSValueTransformer *transformer = [AWSS3CreateMultipartUploadRequest ACLJSONTransformer];
            uploadRequest.ACL = (AWSS3ObjectCannedACL)[[transformer transformedValue:requestHeaders[key]] integerValue];
        }
        else if ([lKey isEqualToString:@"x-amz-grant-read" ]) {
            uploadRequest.grantRead = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-grant-read-acp" ]) {
            uploadRequest.grantReadACP = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-grant-read-acp" ]) {
            uploadRequest.grantReadACP = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-grant-write-acp" ]) {
            uploadRequest.grantWriteACP = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-grant-full-control" ]) {
            uploadRequest.grantFullControl = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-server-side-encryption" ]) {
            NSValueTransformer *transformer = [AWSS3CreateMultipartUploadRequest serverSideEncryptionJSONTransformer];
            uploadRequest.serverSideEncryption = (AWSS3ServerSideEncryption)[[transformer transformedValue:requestHeaders[key]] integerValue];
        }
        else if ([lKey isEqualToString:@"x-amz-server-side-encryption-aws-kms-key-id" ]) {
            uploadRequest.SSEKMSKeyId = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-server-side-encryption-customer-algorithm" ]) {
            uploadRequest.SSECustomerAlgorithm = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-server-side-encryption-customer-key" ]) {
            uploadRequest.SSECustomerKey = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-server-side-encryption-customer-key-md5" ]) {
            uploadRequest.SSECustomerKeyMD5 = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"content-encoding" ]) {
            uploadRequest.contentEncoding = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"content-type" ]) {
            uploadRequest.contentType = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"content-disposition" ]) {
            uploadRequest.contentDisposition = requestHeaders[key];
        }
        else if([lKey isEqualToString:@"cache-control"]) {
            uploadRequest.cacheControl = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-request-payer" ]) {
            NSValueTransformer *transformer = [AWSS3CreateMultipartUploadRequest requestPayerJSONTransformer];
            uploadRequest.requestPayer = (AWSS3RequestPayer)[[transformer transformedValue:requestHeaders[key]] integerValue];
        }
        else if ([lKey isEqualToString:@"expires" ]) {
            NSValueTransformer *transformer = [AWSS3CreateMultipartUploadRequest expiresJSONTransformer];
            uploadRequest.expires = [transformer transformedValue:requestHeaders[key]];
        }
        else if ([lKey isEqualToString:@"x-amz-storage-class" ]) {
            NSValueTransformer *transformer = [AWSS3CreateMultipartUploadRequest storageClassJSONTransformer];
            uploadRequest.storageClass = (AWSS3StorageClass)[[transformer transformedValue:requestHeaders[key]] integerValue];
        }
        else if ([lKey isEqualToString:@"x-amz-website-redirect-location" ]) {
            uploadRequest.websiteRedirectLocation = requestHeaders[key];
        }
        else if ([lKey isEqualToString:@"x-amz-tagging" ]) {
            uploadRequest.tagging = requestHeaders[key];
        }
    }
    uploadRequest.metadata = metadata;
}

@end
