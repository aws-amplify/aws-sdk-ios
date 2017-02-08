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

#import <Foundation/Foundation.h>

@interface AWSMobileAnalytics(Testing)

@property (nonatomic, readonly) id<AWSMobileAnalyticsDeliveryClient>  deliveryClient;
+(AWSMobileAnalytics*) insightsWithContext:(id<AWSMobileAnalyticsContext>) theContext
                             withOptions:(id<AWSMobileAnalyticsOptions>) theOptions
                     withCompletionBlock:(AWSInitializationCompletionBlock)completionBlock;
+(void)removeCachedInstances;
@end


@interface AWSMobileAnalyticsDefaultDeliveryClient(Testing)

@property(nonatomic)id<AWSMobileAnalyticsEventStore> eventStore;
@property(nonatomic)NSOperationQueue* operationQueue;

@end


@interface AWSMobileAnalyticsIOSSystem(Testing)

+ (NSString *) rootFileDirectoryWithFileManager:(NSFileManager *) theFileManager;

@end


@interface AWSMobileAnalyticsHttpCachingConfiguration(Testing)

@property(nonatomic)id<AWSMobileAnalyticsFileManager> fileManager;
@property(nonatomic)AWSMobileAnalyticsFile* file;
@property(nonatomic)NSRecursiveLock *fileLock;


@end


@interface AWSMobileAnalyticsSession(Testing)

+ (NSString *) generateSessionIdWithContext:(id<AWSMobileAnalyticsContext>) context;

@end
