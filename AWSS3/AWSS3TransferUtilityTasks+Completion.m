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

#import "AWSS3TransferUtilityTasks+Completion.h"

@implementation AWSS3TransferUtilityTask (Completion)

- (void)complete {
    if ([self isKindOfClass:[AWSS3TransferUtilityUploadTask class]]) {
        AWSS3TransferUtilityUploadTask *task = (AWSS3TransferUtilityUploadTask *)self;
        [task complete];
    } else if ([self isKindOfClass:[AWSS3TransferUtilityDownloadTask class]]) {
        AWSS3TransferUtilityDownloadTask *task = (AWSS3TransferUtilityDownloadTask *)self;
        [task complete];
    } else if ([self isKindOfClass:[AWSS3TransferUtilityMultiPartUploadTask class]]) {
        AWSS3TransferUtilityMultiPartUploadTask *task = (AWSS3TransferUtilityMultiPartUploadTask *)self;
        [task complete];
    }
}

@end


@interface AWSS3TransferUtilityUploadTask()
@property (strong, nonatomic) NSError *error;
@property (strong, nonatomic) AWSS3TransferUtilityUploadExpression *expression;
@end

@interface AWSS3TransferUtilityUploadExpression ()
@property (copy, atomic) AWSS3TransferUtilityUploadCompletionHandlerBlock completionHandler;
@end

@implementation AWSS3TransferUtilityUploadTask (Completion)

- (void)complete {
    [self completeWithError:self.error];
}

- (void)completeWithError:(NSError * _Nullable)error {
    if (self.expression.completionHandler) {
        self.expression.completionHandler(self, error);
        // release expression
        self.expression = nil;
    }
}

@end

@interface AWSS3TransferUtilityDownloadTask ()
@property (strong, nonatomic) NSURL *location;
@property (strong, nonatomic) NSData *data;
@property (strong, nonatomic) NSError *error;
@property (strong, nonatomic) AWSS3TransferUtilityDownloadExpression *expression;
@end

@interface AWSS3TransferUtilityDownloadExpression ()
@property (copy, atomic) AWSS3TransferUtilityDownloadCompletionHandlerBlock completionHandler;
@end

@implementation AWSS3TransferUtilityDownloadTask (Completion)

- (void)complete {
    [self completeWithLocation:self.location data:self.data error:self.error];
}

- (void)completeWithLocation:(NSURL * _Nullable)location
                        data:(NSData * _Nullable)data
                       error:(NSError * _Nullable)error {
    if (self.expression.completionHandler) {
        self.expression.completionHandler(self, location, data, error);
        // release expression
        self.expression = nil;
    }
}

@end

@interface AWSS3TransferUtilityMultiPartUploadTask ()
@property (strong, nonatomic) NSError *error;
@property (strong, nonatomic) AWSS3TransferUtilityMultiPartUploadExpression *expression;
@end

@interface AWSS3TransferUtilityMultiPartUploadExpression ()
@property (copy, atomic) AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock completionHandler;
@end

@implementation AWSS3TransferUtilityMultiPartUploadTask (Completion)

- (void)complete {
    [self completeWithError:self.error];
}

- (void)completeWithError:(NSError * _Nullable)error {
    if (self.expression.completionHandler) {
        self.expression.completionHandler(self, error);
        // release expression
        self.expression = nil;
    }
}

@end
