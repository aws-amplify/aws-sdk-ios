//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import "AWSS3TransferUtility.h"


@interface AWSS3TransferUtility (UnitTests)

@property (strong, nonatomic) AWSSynchronizedMutableDictionary *taskDictionary;
@property (strong, nonatomic) AWSSynchronizedMutableDictionary *completedTaskDictionary;

NS_ASSUME_NONNULL_BEGIN

- (nullable NSURL *)createPartialFile:(NSURL *)fileURL
                               offset:(NSUInteger)offset
                               length:(NSUInteger)length
                              baseURL:(NSURL *)baseURL
                                error:(NSError * _Nullable *)error;

NS_ASSUME_NONNULL_END

@end

@interface AWSS3TransferUtilityUploadTask (UnitTests)

@property (strong, nonatomic) AWSS3TransferUtilityUploadExpression *expression;

@end

@interface AWSS3TransferUtilityMultiPartUploadTask (UnitTests)

@property (strong, nonatomic) AWSS3TransferUtilityMultiPartUploadExpression *expression;

@end

@interface AWSS3TransferUtilityDownloadTask (UnitTests)

@property (strong, nonatomic) AWSS3TransferUtilityDownloadExpression *expression;

@end

@interface AWSS3TransferUtilityUploadExpression (UnitTests)

@property (copy, atomic) AWSS3TransferUtilityUploadCompletionHandlerBlock completionHandler;

@end

@interface AWSS3TransferUtilityMultiPartUploadExpression (UnitTests)

@property (copy, atomic) AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock completionHandler;

@end

@interface AWSS3TransferUtilityDownloadExpression (UnitTests)

@property (copy, atomic) AWSS3TransferUtilityDownloadCompletionHandlerBlock completionHandler;

@end
