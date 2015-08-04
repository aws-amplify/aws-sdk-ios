//
//  AWSMockFileManager.m
//  AWSMobileAnalytics
//
//  Created by Zhu, Yi on 7/30/15.
//  Copyright (c) 2015 Amazon Web Services. All rights reserved.
//

#import "AWSMockFileManager.h"
#import <OCMock/OCMock.h>

@implementation NSFileManager (AWSMobileAnalyticsLegacyTests)

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(URLsForDirectory:inDomains:)), class_getInstanceMethod(self, @selector(BogusURLsForDirectory:inDomains:)));
}

- (NSArray *)BogusURLsForDirectory:(NSSearchPathDirectory)directory inDomains:(NSSearchPathDomainMask)domainMask {
    
    NSArray *urlArray = [self BogusURLsForDirectory:directory inDomains:domainMask];
    
    NSMutableArray *urlsMutableArray = [urlArray mutableCopy];
    
    for (int i=0;i<[urlsMutableArray count];i++) {
        NSURL *url = urlsMutableArray[i];
        NSString *path = [url path];
        NSString *modifiedPath = [NSString stringWithFormat:@"/tmp%@",path];
        NSURL *modifiedURL = [NSURL fileURLWithPath:modifiedPath];
        urlsMutableArray[i] = modifiedURL;
    }
    
    return urlsMutableArray;
}

@end

@implementation AWSMobileAnalyticsERS (AWSMobileAnalyticsLegacyTests)

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(BogusputEvents:)), class_getInstanceMethod(self, @selector(putEvents:)));
}

- (AWSTask *)BogusputEvents:(AWSMobileAnalyticsERSPutEventsInput *)request {

    NSDictionary *mockResultDic = \
    @{
      @"responseDataSize" : @0,
      @"responseHeaders" :     @{
              @"Title" : @"OCMockResponse",
              @"Connection" : @"Keep-alive",
              @"Content-Length" : @"0",
              @"Content-Type" : @"application/json",
              @"Date" : @"Tue, 28 Jul 2015 23:52:42 GMT",
              @"Server" : @"Server",
              @"Vary" : @"User-Agent",
              @"x-amzn-RequestId" : @"bcbbcc24-3583-11e5-87c2-3d7ba8a9e330"
              },
      @"responseStatusCode" : @202
      };
    
    return [AWSTask taskWithResult:mockResultDic];

}

@end
